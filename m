Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFC50A501
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:06:39 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZKI-0007ld-69
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZQ-0007MG-6C
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZM-0006I8-Nz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id bx5so5230025pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWYIA+ZPja/ASXfObfSVoW3kDH0rTYrrqx2UWkBH5EA=;
 b=QutF7KyZLwox158/IHVvTdcjQHvHOv78xJzevawmgCYd/EuKFL8vb27L5pndsO6kAX
 hP3g9XE++b1VQTcYDBzJj0TP+PHlstVqdJipOnV3/PDUWmd6QZf1B1WaDjVmkBJ4nYtT
 6UWCm+/zECQFZMAaWBuCptpmyT5mq1Ikak/IeKQC6IFP5n/P7CQB1byOsHaAEqLE8nJW
 RM+XhGtxdhe+E4uJaTNH+ONAWtoB4JV+HgcLtLDVkB7yWUOz0dLMmqmWx76n2csN/uJo
 g/5XekUOyZU7vIxofAFXpozycZvP5E8E3FvCSBVekW1n2smTVEoGcQwwrbi8tFUBSeeb
 mDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWYIA+ZPja/ASXfObfSVoW3kDH0rTYrrqx2UWkBH5EA=;
 b=qoDqpyIW9WZ7xZTfiwLbSgVA+NHqdMY6T9FbRrFKeir7bdoGSTPIAPWEpLb/fNcun3
 2QfQU8EXeoZkip0D73TNBoCHZ9THduKDAkDabHTbToV/gARgKsGMakFLbefJzwKcIU0q
 4xmyhkqgHyZpH9781lo5cyBXnks+P8aHt1DLjdNMbGzzFvoLMRWVAAIg6Zxw5RsYOHUe
 FoBluVbZcxzfmqf7hN3dygvstRzq9TmsX5WhkrCy9qrm7PipITNuLJR3No5IPkN3wvXD
 GvGkp+Qx2nIkqFUp+L0Ts6dBHNfNkNyVB6zFQP8wea2xyOHbOGu+OdbOl0kghCpYXBYl
 SUsQ==
X-Gm-Message-State: AOAM533Sti/EO6eIh5tIi1o9PpXmJ2qzOv/OG4RIjJls+u+JrqV7rznO
 wTFxBGgNPtSyNx5nwY6uPp9rK9JTHRZTzw==
X-Google-Smtp-Source: ABdhPJzA0Od41ykrSkfpSOlnA9c3wM6PcJg+TyR7rj4fEyIykv/Spa2BuALvnD6k7pSxUwTmnrEqEw==
X-Received: by 2002:a17:902:d2c5:b0:158:f839:4d8a with SMTP id
 n5-20020a170902d2c500b00158f8394d8amr40761plc.108.1650554287444; 
 Thu, 21 Apr 2022 08:18:07 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/64] target/nios2: Do not create TCGv for control
 registers
Date: Thu, 21 Apr 2022 08:16:50 -0700
Message-Id: <20220421151735.31996-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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
index 3694f2503b..6c739bfa5e 100644
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
@@ -910,7 +929,7 @@ void nios2_tcg_init(void)
 {
     int i;
 
-    for (i = 0; i < NUM_CORE_REGS; i++) {
+    for (i = 0; i < NUM_GP_REGS; i++) {
         cpu_R[i] = tcg_global_mem_new(cpu_env,
                                       offsetof(CPUNios2State, regs[i]),
                                       regnames[i]);
-- 
2.34.1


