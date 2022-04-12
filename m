Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9874FC950
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:37:15 +0200 (CEST)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4Ww-00052H-H7
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TP-0001qY-FF
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TN-0001nY-Fg
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:35 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 32so13510024pgl.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HR8MUA8fBXQu193YcvQc60M+IS6UFPGuHEP3w6sFTCo=;
 b=k//801UqOgonIkmqyU09EcQUoBzj2TXzWecMstijBmyislFOJtkilxjWM7wCbaL0O5
 yFfmokwIThyGOeApSSbN8h2+FyfwLHSF8jTWoSUjplY2dT+wxv28eMg2DSk+eY7/buw0
 Li2iQPfpU+DurZFfVGKAUegGahFAD/U+5b07aVVVQnrzmB008AneLIT2YkzNe3mqFBkV
 FlutHW7Q+TH5sefBbIwZEH2De8nZTnqtkuxH5ohXQdmJ109mNkPXomRjZj2gr1iRElcC
 9IP8RrShes9+Vswo27UJu3vzLclPRGcNwcbh01UwdGJGfsOgWr+i8AyQjuIhbM4BvqBP
 6xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HR8MUA8fBXQu193YcvQc60M+IS6UFPGuHEP3w6sFTCo=;
 b=AyQ5IHranShhStfLSJrEMBHB1SNX54e/Jgee+VMW9Z6UNBAXeavm2le53bRfoCVa4W
 t3mtg7eS7GR0hErnM0j5FR0GIaTe2QmtWLTv2FuTLgtSe2urSvMVO/7jBH2vGY3RTwg1
 kXQjlSSNr1ha7cgbhKWW4PgW++VHmzLY+wvhDrN/CtZR9keMraX7dUkzObaDzsCqHcLu
 jmyjcEh0dPKhzgUlmCP3/n0ekfIX4hYqEiLsvjHLoj94ZCmCfhB0iOFHKQS0WyAwX8tz
 +JF0Eg61giPXxTq7AXZx9fgupmBTTjmxLD5Jhgwtwzf9/ih14fO0wn82YC6J62haV9Dq
 wUIQ==
X-Gm-Message-State: AOAM530HwQi/OWI6cApmbCGQTEKnTSNmKBNkjqm1FqB6Yk/skdn+SdeD
 +p1G89UCuHZBHc5BEYqkGF82DKIQY8Gtdw==
X-Google-Smtp-Source: ABdhPJxzIo0awn2BKcejj/Z/qVSUxBgV4IXb/G2MwaIT8b+4r0zjRgguRuwx6lvJ0Z+2jtgVvy377A==
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr1911352pfu.27.1649723612047; 
 Mon, 11 Apr 2022 17:33:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
Date: Mon, 11 Apr 2022 17:33:06 -0700
Message-Id: <20220412003326.588530-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of starting with cortex-a15 and adding v8 features to
a v7 cpu, begin with a v8 cpu stripped of its aarch64 features.
This fixes the long-standing to-do where we only enabled v8
features for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Create impdef sysregs; only enable short-vector support for user-only.
---
 target/arm/cpu_tcg.c | 151 ++++++++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 59 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 17bb5e5d76..b7cb3a6cb3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -998,71 +998,104 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t t;
 
-    cortex_a15_initfn(obj);
+    /* aarch64_a57_initfn, advertising none of the aarch64 features */
+    cpu->dtb_compatible = "arm,cortex-a57";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x411fd070;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034070;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50838;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10101105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_isar6 = 0;
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 
-    /* old-style VFP short-vector support */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    /* Add additional features supported by QEMU */
+    t = cpu->isar.id_isar5;
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = t;
+
+    t = cpu->isar.id_isar6;
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = t;
+
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+    cpu->isar.mvfr1 = t;
+
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
+
+    t = cpu->isar.id_mmfr3;
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = t;
+
+    t = cpu->isar.id_mmfr4;
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = t;
+
+    t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = t;
+
+    t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = t;
 
 #ifdef CONFIG_USER_ONLY
     /*
-     * We don't set these in system emulation mode for the moment,
-     * since we don't correctly set (all of) the ID registers to
-     * advertise them.
+     * Break with true ARMv8 and add back old-style VFP short-vector support.
+     * Only do this for user-mode, where -cpu max is the default, so that
+     * older v6 and v7 programs are more likely to work without adjustment.
      */
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    {
-        uint32_t t;
-
-        t = cpu->isar.id_isar5;
-        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = t;
-
-        t = cpu->isar.id_isar6;
-        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
-        t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
-        cpu->isar.id_isar6 = t;
-
-        t = cpu->isar.mvfr1;
-        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-        cpu->isar.mvfr1 = t;
-
-        t = cpu->isar.mvfr2;
-        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-        cpu->isar.mvfr2 = t;
-
-        t = cpu->isar.id_mmfr3;
-        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = t;
-
-        t = cpu->isar.id_mmfr4;
-        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = t;
-
-        t = cpu->isar.id_pfr0;
-        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = t;
-
-        t = cpu->isar.id_pfr2;
-        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
-        cpu->isar.id_pfr2 = t;
-    }
-#endif /* CONFIG_USER_ONLY */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+#endif
 }
 #endif /* !TARGET_AARCH64 */
 
-- 
2.25.1


