Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F16FF594
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:11:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7w0-0005Xj-Nl; Thu, 11 May 2023 11:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vt-000555-Mv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vm-00027T-4D
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so33644825e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817805; x=1686409805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+OT6i+7tCi6iezpIwGJmcpXv13tSv9fa3ejqVOJNCoI=;
 b=HzWSmtiB32/w4dfIwsO/+Bx3f6HnM40kTgM8WWVueVgTMq36OncOrlQUJoE4eCLXOi
 0M8rM8eMNvflDT8Qcyr/1TXWsgSMZfCmHguXckv3f6lhSXOzKgBDszEAIzQv6d701kiE
 lvy13N77pGY1sPlqn1p8wxK+OXTciGVfylj+9W0YS1p801feVTRG3QFhmmkd2o07hT/q
 dEgAz/dBdcohMIjivypIEGtd5rtHO/fLag2wOnGmMclHUnMES+3Xj8b/TNjtksdK21fd
 pkoiuhyZrjTQ25nYC9WW3KACCeI7o+Zk2e5PnJ8VIQvKJScEvCg+t3dQH0g1ZnzA6diC
 GGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817805; x=1686409805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+OT6i+7tCi6iezpIwGJmcpXv13tSv9fa3ejqVOJNCoI=;
 b=bVmdPqdz+vBbLzVUeTZhpUt1JeRjG0XnwPsqN2S3gAWwmqg4PWoNvL2Dqyx4/F3COb
 shgJY94GKqMqO1jc7uBbethvRAIB52aJpUHFC4URcl9pqsTiBR1L/21iqw9rZhRCIxBt
 gZTI3luzaCXsykxW6IRcfiWwdAWLqIgcpMGcVfaGNuZEZThQk0rJA6k4HKp2Nb92R6OG
 Nd8AXfuazFFcVgrbLnNptmUFMM1B8sw37VuozwS4IIPRcTzdRiUTkjWCkRd42Ry33mf1
 WrD2m10nJeP6+FgKWnBhbk7pDjiZ1/EH1sl3MEfuS8y8qbnlE3SCI+TuMkmpIDET7Q5t
 ui6w==
X-Gm-Message-State: AC+VfDzbhQDRPqsDapvI7/CbCfRJ/erfM5vbP23l8x+0ubFlXZuoXrGJ
 qEV2piDagVqqZYvLXdnGjbzg6JyQWQA=
X-Google-Smtp-Source: ACHHUZ4FHHmEhjQbG9pnuHKknc55z27ILls1GCUv0rX/obemng0C1c4+KLXvaGAHHKzJU8xud2NQoA==
X-Received: by 2002:adf:fd83:0:b0:305:f2d5:2a12 with SMTP id
 d3-20020adffd83000000b00305f2d52a12mr15175071wrr.21.1683817805023; 
 Thu, 11 May 2023 08:10:05 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0030789698eebsm17088387wrw.89.2023.05.11.08.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:10:04 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/3] target/openrisc: Allow fpcsr access in user mode
Date: Thu, 11 May 2023 16:09:57 +0100
Message-Id: <20230511151000.381911-2-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230511151000.381911-1-shorne@gmail.com>
References: <20230511151000.381911-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As per OpenRISC spec 1.4 FPCSR can be read and written in user mode.

Update mtspr and mfspr helpers to support this by moving the is_user
check into the helper.

Link: https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.4-rev0.pdf
Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

Since v2:
 - Add reviewed-by
 - In helper_mfspr bring cpu out of ifdef to avoid replicatig the definition.
   Originally I left it in the ifdef to avoid having to mix having pointers and
   the data array defined on the stack.  But that's overthinking.
Since v1:
 - Update commit message to remove text about no-existant logic change.

 target/openrisc/sys_helper.c | 45 ++++++++++++++++------
 target/openrisc/translate.c  | 72 ++++++++++++++++--------------------
 2 files changed, 66 insertions(+), 51 deletions(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index ec145960e3..ccdee3b8be 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -29,17 +29,37 @@
 
 #define TO_SPR(group, number) (((group) << 11) + (number))
 
+static inline bool is_user(CPUOpenRISCState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return true;
+#else
+    return (env->sr & SR_SM) == 0;
+#endif
+}
+
 void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
 {
-#ifndef CONFIG_USER_ONLY
     OpenRISCCPU *cpu = env_archcpu(env);
+#ifndef CONFIG_USER_ONLY
     CPUState *cs = env_cpu(env);
     target_ulong mr;
     int idx;
 #endif
 
+    /* Handle user accessible SPRs first.  */
     switch (spr) {
+    case TO_SPR(0, 20): /* FPCSR */
+        cpu_set_fpcsr(env, rb);
+        return;
+    }
+
+    if (is_user(env)) {
+        raise_exception(cpu, EXCP_ILLEGAL);
+    }
+
 #ifndef CONFIG_USER_ONLY
+    switch (spr) {
     case TO_SPR(0, 11): /* EVBAR */
         env->evbar = rb;
         break;
@@ -187,27 +207,33 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         cpu_openrisc_timer_update(cpu);
         qemu_mutex_unlock_iothread();
         break;
-#endif
-
-    case TO_SPR(0, 20): /* FPCSR */
-        cpu_set_fpcsr(env, rb);
-        break;
     }
+#endif
 }
 
 target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
                            target_ulong spr)
 {
+    OpenRISCCPU *cpu = env_archcpu(env);
 #ifndef CONFIG_USER_ONLY
     uint64_t data[TARGET_INSN_START_WORDS];
     MachineState *ms = MACHINE(qdev_get_machine());
-    OpenRISCCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
     int idx;
 #endif
 
+    /* Handle user accessible SPRs first.  */
     switch (spr) {
+    case TO_SPR(0, 20): /* FPCSR */
+        return env->fpcsr;
+    }
+
+    if (is_user(env)) {
+        raise_exception(cpu, EXCP_ILLEGAL);
+    }
+
 #ifndef CONFIG_USER_ONLY
+    switch (spr) {
     case TO_SPR(0, 0): /* VR */
         return env->vr;
 
@@ -324,11 +350,8 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         cpu_openrisc_count_update(cpu);
         qemu_mutex_unlock_iothread();
         return cpu_openrisc_count_get(cpu);
-#endif
-
-    case TO_SPR(0, 20): /* FPCSR */
-        return env->fpcsr;
     }
+#endif
 
     /* for rd is passed in, if rd unchanged, just keep it back.  */
     return rd;
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 76e53c78d4..43ba0cc1ad 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -819,45 +819,12 @@ static bool trans_l_xori(DisasContext *dc, arg_rri *a)
 
 static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
 {
-    check_r0_write(dc, a->d);
-
-    if (is_user(dc)) {
-        gen_illegal_exception(dc);
-    } else {
-        TCGv spr = tcg_temp_new();
-
-        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-            if (dc->delayed_branch) {
-                tcg_gen_mov_tl(cpu_pc, jmp_pc);
-                tcg_gen_discard_tl(jmp_pc);
-            } else {
-                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
-            }
-            dc->base.is_jmp = DISAS_EXIT;
-        }
+    TCGv spr = tcg_temp_new();
 
-        tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
-        gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
-    }
-    return true;
-}
-
-static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
-{
-    if (is_user(dc)) {
-        gen_illegal_exception(dc);
-    } else {
-        TCGv spr;
+    check_r0_write(dc, a->d);
 
-        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        /* For SR, we will need to exit the TB to recognize the new
-         * exception state.  For NPC, in theory this counts as a branch
-         * (although the SPR only exists for use by an ICE).  Save all
-         * of the cpu state first, allowing it to be overwritten.
-         */
+    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
         if (dc->delayed_branch) {
             tcg_gen_mov_tl(cpu_pc, jmp_pc);
             tcg_gen_discard_tl(jmp_pc);
@@ -865,11 +832,36 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
             tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
         }
         dc->base.is_jmp = DISAS_EXIT;
+    }
+
+    tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
+    gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
+    return true;
+}
+
+static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
+{
+    TCGv spr = tcg_temp_new();
 
-        spr = tcg_temp_new();
-        tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
-        gen_helper_mtspr(cpu_env, spr, cpu_R(dc, a->b));
+    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
     }
+    /*
+     * For SR, we will need to exit the TB to recognize the new
+     * exception state.  For NPC, in theory this counts as a branch
+     * (although the SPR only exists for use by an ICE).  Save all
+     * of the cpu state first, allowing it to be overwritten.
+     */
+    if (dc->delayed_branch) {
+        tcg_gen_mov_tl(cpu_pc, jmp_pc);
+        tcg_gen_discard_tl(jmp_pc);
+    } else {
+        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
+    }
+    dc->base.is_jmp = DISAS_EXIT;
+
+    tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
+    gen_helper_mtspr(cpu_env, spr, cpu_R(dc, a->b));
     return true;
 }
 
-- 
2.39.1


