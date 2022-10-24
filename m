Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C460AACB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:39:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSX-0003Hv-DA; Mon, 24 Oct 2022 09:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSN-0003Ga-VW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:32 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSM-0003zB-F5
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:31 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so9040243pjl.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yZmYpKwUK74faGnCAnts/fHysNDsEevWZrFSDUez0+A=;
 b=KRRgrVPVsJtsUIebPitKsx+n6s/bYDIk7qCi58PwCzSP1gFyX8HCtfuNGVXZgS2hKp
 PhuCvv4je1BpFS0as7/0aYUvRawqeLQy7MC5N5yXgMITvN4gEo0JD2oouJOEst5C74R+
 IaEhgcAlgqTvRFHbgh6ruYkvyAI0mPFbF+sgV55nud1brY4SteY+85A6O5S+QyCsZb5x
 FrTJ92XhIy3Zgs/OSnyWeE4HY7Ejch5B8wff2GYTHI64wH0wYszwR9xe0sRWCY9+BOEY
 YkAJkCawA/p/CfUPosWUcOFG2lTSw8V9o14qrcxQZgb7RNMEPbkp7lrpSMhc/zJIsgTk
 JrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZmYpKwUK74faGnCAnts/fHysNDsEevWZrFSDUez0+A=;
 b=gIbJOAodKFByvS1bSm/sliUCR4pUdYoV5yATOWqYyrWyXv7Aqf7XKoPHM1ZlyEhuNd
 EZyzYRbzZeYdfJURkel5MtRBmZI7u6tONvhKl0q3KfE/NS2nMySmJyprbGLaHc1vVhCo
 9Q7XUAecuv/lJZT+i/hCtikZx4XwKZLPn/rUI3A2ozwY3+D33l5JiHKJ2xvtpy4MCeT+
 Gk90GSMgCpAqTtTP0aIan1VE2cUOg8wCtAYnhTQSFaGq3NTimTQ4VeriurD9P3JEB8WU
 TFItyBqFtxoYFvQs63ZKhxLDP12p//qYcBO3EdK5xDzimpiMbMd9+r/VRtJTALeqtjGD
 48Ig==
X-Gm-Message-State: ACrzQf3VFxFXwnEz85n1AmG+vP3RLB9N+t7OPoOLUrtnfHt9JtXzegoE
 dOJbkthI/6dB2otA2dAsBwnFI63G8gflIw==
X-Google-Smtp-Source: AMsMyM56XZBDbK6Q7NuvLAVKGKw7E8eQj9u/K9kUCeebnalSv1wnCi1l8rEcsnxBxsdGXgw6B3vrwg==
X-Received: by 2002:a17:902:ebce:b0:186:9905:11bf with SMTP id
 p14-20020a170902ebce00b00186990511bfmr9323904plg.110.1666617929130; 
 Mon, 24 Oct 2022 06:25:29 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/29] target/hppa: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:37 +1000
Message-Id: <20221024132459.3229709-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.c       | 19 +++++++++++++++++++
 target/hppa/translate.c | 13 -------------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e677ca09d4..55c190280e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -68,6 +68,24 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+static void hppa_restore_state_to_opc(CPUState *cs,
+                                      const TranslationBlock *tb,
+                                      const uint64_t *data)
+{
+    HPPACPU *cpu = HPPA_CPU(cs);
+
+    cpu->env.iaoq_f = data[0];
+    if (data[1] != (target_ureg)-1) {
+        cpu->env.iaoq_b = data[1];
+    }
+    /*
+     * Since we were executing the instruction at IAOQ_F, and took some
+     * sort of action that provoked the cpu_restore_state, we can infer
+     * that the instruction was not nullified.
+     */
+    cpu->env.psw_n = 0;
+}
+
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -153,6 +171,7 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
+    .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = hppa_cpu_tlb_fill,
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 8b861957e0..1af77473da 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4346,16 +4346,3 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     DisasContext ctx;
     translator_loop(cs, tb, max_insns, pc, host_pc, &hppa_tr_ops, &ctx.base);
 }
-
-void restore_state_to_opc(CPUHPPAState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->iaoq_f = data[0];
-    if (data[1] != (target_ureg)-1) {
-        env->iaoq_b = data[1];
-    }
-    /* Since we were executing the instruction at IAOQ_F, and took some
-       sort of action that provoked the cpu_restore_state, we can infer
-       that the instruction was not nullified.  */
-    env->psw_n = 0;
-}
-- 
2.34.1


