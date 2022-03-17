Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89F4DBE5E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:29:17 +0100 (CET)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUihJ-0004G2-2U
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:29:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKc-0000WF-O3
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:50 -0400
Received: from [2607:f8b0:4864:20::62c] (port=45052
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKb-0002DJ-1k
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q11so3535032pln.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PuQXs01EVc8/4vklrwlVd1dwEAykk2bEYyKpnLalt08=;
 b=NlDtwI6aWx+FV0LsnjRSnRrmCxqZXyQPTPtyY/3PAWjAHICL/BqEuNFacb7Mt97SD2
 VoSd/tW0bwoWMhi93FDGNRVNy/KIbnQfVwnmo9lkXcMJITasfJh6kJzfDotXpNtamxTX
 XyC7ONrJHVJqBFHYMRsd0/x/g46ZjQ80AlqTXKVXLuFzeAtqLPSQn9Uw6Pbilubo3qnb
 I8cSzrtbMVmGcGiHF0zp6l+Y7m6rQyeARd04HIVl7F23RBKau0hbedu5F8ezeOT0bZh0
 JjW1u0Ab6fa07CIX61HvjVIZH6vtHi1sISL5q2PW6tNXpxjPshYd99RrIiPXiQRWiKkw
 /CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PuQXs01EVc8/4vklrwlVd1dwEAykk2bEYyKpnLalt08=;
 b=WReY/zMI38dblVmLa2P0hp5dYCP4EzIxbMHDqQglOtjM12xDjhqcWsLsHfoIc8WTVy
 Zq5GArT/fzdb3jGQOv8NGjNbU5FPTyk3B6HY32/MOFqgvmA4/0p04gUHUWWOWsoLJkyG
 qyJdOCGJtNPofm2QXobAqJGsq77+qU3aB3XVQdFGp8qjIRcp+G2sIOZJVWmdAXyktS0i
 xoFlyE4+D6ks0AZWnn7JyBLuA/tVDyIRsmdj2wGcuv6Xj7xwwTx4vpKcgMDVmRqHyGeY
 kpMIeaXEQls0wq8/ai0oyWCHlKbkDQ3LEXyjzTjJlQrrrgzaGqC8meVhD6uqyupksiK1
 n+cA==
X-Gm-Message-State: AOAM533oFSUTOiDNT1vOYIgejcnlxg+hUwhPyznd4ou/8Tpc2xB2gPt2
 s1qYuMRuAJDt8iTOLW+jUu2EIuUfUugspw==
X-Google-Smtp-Source: ABdhPJyib8evnnc2xcT31IclFizSOH005cKGzV7VJctLN4GeW2izhLE6W77iVJkU7NhHdqOsao32jw==
X-Received: by 2002:a17:90a:de96:b0:1be:e427:8745 with SMTP id
 n22-20020a17090ade9600b001bee4278745mr3316205pjv.175.1647493547752; 
 Wed, 16 Mar 2022 22:05:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 08/51] target/nios2: Do not create TCGv for control
 registers
Date: Wed, 16 Mar 2022 22:04:55 -0700
Message-Id: <20220317050538.924111-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to reference them often, and when we do it
is just as easy to load/store from cpu_env directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 3f7bbd6d7b..e6e9a5ac6f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -103,7 +103,7 @@ typedef struct DisasContext {
     int               mem_idx;
 } DisasContext;
 
-static TCGv cpu_R[NUM_CORE_REGS];
+static TCGv cpu_R[NUM_GP_REGS];
 static TCGv cpu_pc;
 
 typedef struct Nios2Instruction {
@@ -394,7 +394,11 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    TCGv tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_ESTATUS]));
+    gen_helper_eret(cpu_env, tmp, cpu_R[R_EA]);
+    tcg_temp_free(tmp);
+
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -420,7 +424,11 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    TCGv tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_BSTATUS]));
+    gen_helper_eret(cpu_env, tmp, cpu_R[R_BA]);
+    tcg_temp_free(tmp);
+
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -463,6 +471,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
+    TCGv t1, t2;
 
     if (!gen_check_supervisor(dc)) {
         return;
@@ -482,10 +491,19 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
          * must perform the AND here, and anywhere else we need the
          * guest value of ipending.
          */
-        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
+        t1 = tcg_temp_new();
+        t2 = tcg_temp_new();
+        tcg_gen_ld_tl(t1, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IPENDING]));
+        tcg_gen_ld_tl(t2, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IENABLE]));
+        tcg_gen_and_tl(cpu_R[instr.c], t1, t2);
+        tcg_temp_free(t1);
+        tcg_temp_free(t2);
         break;
     default:
-        tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
+        tcg_gen_ld_tl(cpu_R[instr.c], cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 }
@@ -522,7 +540,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
         dc->base.is_jmp = DISAS_UPDATE;
         /* fall through */
     default:
-        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
+        tcg_gen_st_tl(v, cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 #endif
@@ -909,7 +928,7 @@ void nios2_tcg_init(void)
 {
     int i;
 
-    for (i = 0; i < NUM_CORE_REGS; i++) {
+    for (i = 0; i < NUM_GP_REGS; i++) {
         cpu_R[i] = tcg_global_mem_new(cpu_env,
                                       offsetof(CPUNios2State, regs[i]),
                                       regnames[i]);
-- 
2.25.1


