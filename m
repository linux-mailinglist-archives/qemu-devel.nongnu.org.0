Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4361E8B1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 03:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ors9e-0004iO-1x; Sun, 06 Nov 2022 21:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1ors9Z-0004hE-O5
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 21:46:26 -0500
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1ors9U-0003hV-F1
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 21:46:21 -0500
Received: by mail-pf1-f178.google.com with SMTP id d10so9374510pfh.6
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 18:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLJKCEJhiL8hQ4opiIZT0QPhb2wmfhEtcFMPUuAIAEk=;
 b=GbYukm9+31d+/OBd7rd66DifY8gde/uDP99rZ89utNxkDAY6zvQJKIOWMsrr9sRY+p
 H9vAIXNwhqV2XkMoxwQhv1RvMJRh9k2Dpv1UZW7sOnDY2eI1vsnyKk46k1We1lIIDFS/
 V6iZ0sKWluvhsN+lc99iUL3TXxFudEOomK6U6Zgrd3nR3zqQ8HjRfkuE9PvGiuCVSord
 t3s8LWjGwTihUsESiWdaJzVInqsbksrz3KrFPNrKUheeruOqFfcVddnalgr6AZBk3q0k
 D03pQI6sglPcSiksXl0OaOH+lpNdMCECWy6JOXVxM1yHMPqWT1byn3uIikRBiRwnRtCR
 Uxeg==
X-Gm-Message-State: ACrzQf3rp0liVBCRJ6KHQdTn2x4VlwfZ8gcjOQ+R7YFopKJlnIIYVS+8
 oaJfcQDnVIFvOjqxItTRgogs7TB9JderGlu5
X-Google-Smtp-Source: AMsMyM5qJ5vIZxjr1DdvBKCs/LpHHsXHoRRj/8uwtYUWr9RwnReZnCFu0ZfInzdlj4sttIJWulmwoQ==
X-Received: by 2002:a63:eb0c:0:b0:464:8d6:8dc7 with SMTP id
 t12-20020a63eb0c000000b0046408d68dc7mr752550pgh.594.1667789178816; 
 Sun, 06 Nov 2022 18:46:18 -0800 (PST)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170902cec100b001887e30b9ddsm1284192plg.257.2022.11.06.18.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 18:46:18 -0800 (PST)
From: Rui Wang <wangrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, hev <qemu@hev.cc>,
 Rui Wang <wangrui@loongson.cn>
Subject: [PATCH 1/2] target/loongarch: Separate the hardware flags into MMU
 index and PLV
Date: Mon,  7 Nov 2022 10:45:25 +0800
Message-Id: <20221107024526.702297-2-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107024526.702297-1-wangrui@loongson.cn>
References: <20221107024526.702297-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.178; envelope-from=r@hev.cc;
 helo=mail-pf1-f178.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Regarding the patchset v3 has been merged into main line, and not
approved, this patch updates to patchset v4.

Fixes: b4bda200 ("target/loongarch: Adjust the layout of hardware flags bit fields")
Link: https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00808.html
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 target/loongarch/cpu.h                         | 18 +++++++++---------
 .../insn_trans/trans_privileged.c.inc          |  4 ++--
 target/loongarch/tlb_helper.c                  |  4 ++--
 target/loongarch/translate.c                   |  5 +++--
 target/loongarch/translate.h                   |  3 ++-
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 08c1f6baa1..e15c633b0b 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -374,21 +374,21 @@ struct LoongArchCPUClass {
  * 0 for kernel mode, 3 for user mode.
  * Define an extra index for DA(direct addressing) mode.
  */
-#define MMU_KERNEL_IDX   0
-#define MMU_USER_IDX     3
-#define MMU_DA_IDX       4
+#define MMU_PLV_KERNEL   0
+#define MMU_PLV_USER     3
+#define MMU_IDX_KERNEL   MMU_PLV_KERNEL
+#define MMU_IDX_USER     MMU_PLV_USER
+#define MMU_IDX_DA       4
 
 static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
-    return MMU_USER_IDX;
+    return MMU_IDX_USER;
 #else
-    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
-
-    if (!pg) {
-        return MMU_DA_IDX;
+    if (FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG)) {
+        return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
     }
-    return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+    return MMU_IDX_DA;
 #endif
 }
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index ff3a6d95ae..40f82becb0 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -159,7 +159,7 @@ static const CSRInfo csr_info[] = {
 
 static bool check_plv(DisasContext *ctx)
 {
-    if (ctx->mem_idx == MMU_USER_IDX) {
+    if (ctx->plv == MMU_PLV_USER) {
         generate_exception(ctx, EXCCODE_IPE);
         return true;
     }
@@ -335,7 +335,7 @@ TRANS(iocsrwr_d, gen_iocsrwr, gen_helper_iocsrwr_d)
 
 static void check_mmu_idx(DisasContext *ctx)
 {
-    if (ctx->mem_idx != MMU_DA_IDX) {
+    if (ctx->mem_idx != MMU_IDX_DA) {
         tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
         ctx->base.is_jmp = DISAS_EXIT;
     }
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index d2f8fb0c60..c6d1de50fe 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -170,8 +170,8 @@ static int get_physical_address(CPULoongArchState *env, hwaddr *physical,
                                 int *prot, target_ulong address,
                                 MMUAccessType access_type, int mmu_idx)
 {
-    int user_mode = mmu_idx == MMU_USER_IDX;
-    int kernel_mode = mmu_idx == MMU_KERNEL_IDX;
+    int user_mode = mmu_idx == MMU_IDX_USER;
+    int kernel_mode = mmu_idx == MMU_IDX_KERNEL;
     uint32_t plv, base_c, base_v;
     int64_t addr_high;
     uint8_t da = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, DA);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 31462b2b61..38ced69803 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -75,10 +75,11 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->plv = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
     if (ctx->base.tb->flags & HW_FLAGS_CRMD_PG) {
-        ctx->mem_idx = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
+        ctx->mem_idx = ctx->plv;
     } else {
-        ctx->mem_idx = MMU_DA_IDX;
+        ctx->mem_idx = MMU_IDX_DA;
     }
 
     /* Bound the number of insns to execute to those left on the page.  */
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 9cc12512d1..6d2e382e8b 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -29,7 +29,8 @@ typedef struct DisasContext {
     DisasContextBase base;
     target_ulong page_start;
     uint32_t opcode;
-    int mem_idx;
+    uint16_t mem_idx;
+    uint16_t plv;
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
-- 
2.38.1


