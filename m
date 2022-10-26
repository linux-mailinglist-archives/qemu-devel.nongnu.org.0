Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335260D927
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:18:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuX-0005KM-Hk; Tue, 25 Oct 2022 22:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuW-0005KF-Fc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuU-0001Hi-Qh
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i3so13858017pfc.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivVGdg8T3tgMGN4Yqz/msc0BdoDhOdnaWJxKNMe3heo=;
 b=DZ5aVSKb9vLS+xsX+MmgygCHujSeCsnvwC3HqQ4FVyqMoi2QyMAeyQoOgXsfysIbv8
 0/sX8KYoIPOMCzztchPHK/l5CCtO3DAsI5rR9ayL2hE+maLm1QScOajgQGIZNTaf6IdQ
 JIh4JfEKz3AP3kmjaJA6V+/gtnfzJ+6wsj7nPoiIjvROIJoM1E1lAEBtTpUjkBafqXIw
 Hq5zSw8vqx8BQQ25KOk0/TguRu+/uR5kXTQQd/Z1Suv6eT57Qlbz4d2y803AyOeuk+n0
 zgzjytSbbkhRSX4q1VwTrUnsLGmFrIUJbJve9rXFVxWYIzejYUMOyoMhAcapu2xZG4eq
 oLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivVGdg8T3tgMGN4Yqz/msc0BdoDhOdnaWJxKNMe3heo=;
 b=HISjnoma/dHgPZRn0buA44GnUVz4PIqyTic1KHSIGJI9k593N5sMZyjFhAWafv973+
 MqaqDQKaz/XAnE1YHKsl5hggJvl1iHWIJ+GvJWlmM13RqdfS4k6PRL7eyXDWhpZzbCGQ
 a41DfX/b19llTNnQi4g++5RZV3gxp2mmYgWd11OYjo8DvxqV2SHaWPJGYZbAKApP+3zT
 57qBoDEPqvQYBObH/7bdODHkxBWJOR+5TBhpDQvjnEvBmGAZmdJkjleX+OoMnxdA+IOO
 lYNEkn6CrJubBUM/XBCC+U/vVi+WxtJZwoyPT9JcoSC1TEIAbgjdTrLG5Ajdg3D31A0+
 AcEg==
X-Gm-Message-State: ACrzQf3Ux7HypBrwArolUkwenMPt78SkOWV0atkCslZZRJhTEevKcdii
 EcOQc56MdvglY0dKaps8KLpfqdIWspxDRgm9
X-Google-Smtp-Source: AMsMyM5NkIVC6JFCDFnF9vTNeBa2l7u8/Qqj8OVdoTWZZFtTXY6IR399Wf5f1g/3VVP4yqrBBXzLSg==
X-Received: by 2002:a63:171b:0:b0:438:e47d:e79b with SMTP id
 x27-20020a63171b000000b00438e47de79bmr34716697pgl.542.1666750369504; 
 Tue, 25 Oct 2022 19:12:49 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 31/47] target/hppa: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:00 +1000
Message-Id: <20221026021116.1988449-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


