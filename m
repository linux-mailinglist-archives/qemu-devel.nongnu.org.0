Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E4618F66
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 05:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqnyA-0002Lw-NO; Fri, 04 Nov 2022 00:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1oqny9-0002Ln-BB
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:06:13 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1oqny7-00028J-8a
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:06:13 -0400
Received: by mail-pj1-f54.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so3662729pji.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 21:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GWm1DlIpBL5xElCHBcs2JxWO2ad+yASsfnjQCKmB0kg=;
 b=ogd88EDnZSpXxHodAn+VePCanEAYizey/duRfW9SUpSWewr9e1k1RDpwNIdDq7+AGi
 EXU6UDSNdzt23vamXlqd0beinC5doHHaygI0P2Pyp6xiXZrMbCk7B/AjTgdbknhNPo5i
 7zIYRkOgwOlaL6/trVjRqPMAknFlQFhStucN1m1cUrow6mk5eRA9MkEXaNq2G0zF5BNi
 zhHhLTw6PXbqFLeXImEF+JWp8PqSCMb0CGE5iaUZ6DwAx9Pz6Qf/GTCL9Ld7I4rGAnQU
 9Z7iKgXLY7cVZeBHNLJ1u4OvvtsFbM+em72HiifmN97Qtw1J9uiCwMfQUmya+Xtwl4lf
 J0rg==
X-Gm-Message-State: ACrzQf3+tMAoyLcMKUEyMqPtpAyUAGdANYRER0KrYVrp3XFkf9UH7PH3
 urs55RWwp+I1UQqxDhZ0ZWSJ87e2Fp6lg17p
X-Google-Smtp-Source: AMsMyM6hjVJungSJ0f5hMHxkIIZdeWsx5fC5Gfur8skHT2xMcgVjvne55CVSdOf1o5Z/tRpjDDpmsQ==
X-Received: by 2002:a17:902:690a:b0:17a:32d:7acc with SMTP id
 j10-20020a170902690a00b0017a032d7accmr33872871plk.18.1667534769853; 
 Thu, 03 Nov 2022 21:06:09 -0700 (PDT)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79991000000b005636326fdbfsm1562308pfh.78.2022.11.03.21.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 21:06:09 -0700 (PDT)
From: Rui Wang <wangrui@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org, hev <qemu@hev.cc>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH v3 1/2] target/loongarch: Adjust the layout of hardware flags
 bit fields
Date: Fri,  4 Nov 2022 12:05:16 +0800
Message-Id: <20221104040517.222059-2-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104040517.222059-1-wangrui@loongson.cn>
References: <20221104040517.222059-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.54; envelope-from=r@hev.cc;
 helo=mail-pj1-f54.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 target/loongarch/cpu.h                             | 9 ++++++++-
 target/loongarch/insn_trans/trans_privileged.c.inc | 2 +-
 target/loongarch/translate.c                       | 6 +++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dbce176564..f482ad94fe 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -14,6 +14,7 @@
 #include "qemu/timer.h"
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
@@ -391,6 +392,12 @@ static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 #endif
 }
 
+/*
+ * LoongArch CPUs hardware flags.
+ */
+#define HW_FLAGS_PLV_MASK   R_CSR_CRMD_PLV_MASK  /* 0x03 */
+#define HW_FLAGS_CRMD_PG    R_CSR_CRMD_PG_MASK   /* 0x10 */
+
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
                                         target_ulong *pc,
                                         target_ulong *cs_base,
@@ -398,7 +405,7 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = cpu_mmu_index(env, false);
+    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
 }
 
 void loongarch_cpu_list(void);
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 9c4dcbfcfb..ff3a6d95ae 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -159,7 +159,7 @@ static const CSRInfo csr_info[] = {
 
 static bool check_plv(DisasContext *ctx)
 {
-    if (ctx->base.tb->flags == MMU_USER_IDX) {
+    if (ctx->mem_idx == MMU_USER_IDX) {
         generate_exception(ctx, EXCCODE_IPE);
         return true;
     }
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 6091772349..31462b2b61 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -75,7 +75,11 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
-    ctx->mem_idx = ctx->base.tb->flags;
+    if (ctx->base.tb->flags & HW_FLAGS_CRMD_PG) {
+        ctx->mem_idx = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
+    } else {
+        ctx->mem_idx = MMU_DA_IDX;
+    }
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-- 
2.38.1


