Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E284D4D45CE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:36:35 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSH5u-0005LS-Uy
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxG-00053Y-00
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:38 -0500
Received: from [2607:f8b0:4864:20::536] (port=39935
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxE-0007vj-Al
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:37 -0500
Received: by mail-pg1-x536.google.com with SMTP id q19so4486294pgm.6
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PuQXs01EVc8/4vklrwlVd1dwEAykk2bEYyKpnLalt08=;
 b=TkAxNSGWlcC4O+XeqHAAQORvajDnfsn9h9ABW/3rbu19TooNxCvdFk7XP6LxydKBaz
 Gv774xRENsWsoOdg+uOXWLy8cuOcO0EsDOpLNl/qlR+r74JmgYZzcNvjtPSg9YerfZ1R
 GgvkKn3cR64ElkMnQpj0qcqm5qj4pIB0I2uwwyJHdYpP5ChZ0q3uU9Zimx17KGYFwb7K
 /vAPt6wbJGDoayfvrUsMAZJHyXX/YCBUX+LWtv5vrP8GQ9dHzajwC82fDv0i5dvhdhvY
 fu4Zgd+Nmh3PaeXg34U/tqnPi2oQIe+GGmpyzXocmbI4UzJTqlHNl1EmFvTyRKGDPiPC
 xtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PuQXs01EVc8/4vklrwlVd1dwEAykk2bEYyKpnLalt08=;
 b=HtDtCED3gXFfhR/7f4juCMlotiv6Gcu3Y3Z34Vehz7VLYzffvM2CfqhqiC+8rTpRTn
 DE48PM0kwIgIc5GSc75/Ao2hOEofYi+Xg2ApwTYGEufZDI3tvjGgUCVWWE4ENFoJzPjE
 AhsMLJu/vwSisxKWTMegPKtApL2cF60vqXJIQ38sT+W1iC5N2hrtWeTaPP5nzsCy/GtT
 pGjrZpyhEeTehliBEmDy9LTCzKX36SVw+oNC2LXz6b4POOSCqSrtM6RFG7cvDIHjCTJa
 9SJd4Tzl5hmaLcOlWWz7WJSnvN6OSDAjL4K8wnnN8yT//Z/F7e1wHjUoxAK6UpM0JZhf
 UYyQ==
X-Gm-Message-State: AOAM5334XmxDTINMDGKbfRFiM0RlTo6Py3X86p0gpeSv+DVfKJSheVUv
 n+3HKMNJkbMZNrIF1U6GuXWbvhOeOGo/Tg==
X-Google-Smtp-Source: ABdhPJwIUL4aytlA3/+Srn2+o88SnHwHco+wDmsi3yBlnoV6MwlZKNwCTFYLTTrUt9a/9366gxjNfQ==
X-Received: by 2002:a63:515:0:b0:379:460f:7bda with SMTP id
 21-20020a630515000000b00379460f7bdamr3713022pgf.534.1646911655070; 
 Thu, 10 Mar 2022 03:27:35 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/48] target/nios2: Do not create TCGv for control
 registers
Date: Thu, 10 Mar 2022 03:26:44 -0800
Message-Id: <20220310112725.570053-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
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


