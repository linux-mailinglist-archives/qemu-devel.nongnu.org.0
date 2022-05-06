Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF26551DEAA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:09:29 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2OO-0006QI-RS
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I6-0005Pn-BJ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:58 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I4-0003rP-03
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:58 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 z5-20020a9d62c5000000b00606041d11f1so5424820otk.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UglyDtIiGqvTEpM7++4FJGDf8c2/b7gl9ujFn0OBb74=;
 b=ns3Fm158nG1omQ6h+hpiBym00CFOu3j9iowyripCITbdE5w0dIU+kGW590kUbxsV+k
 tmYM1OT1zwqxRgeusaAzETHMSfx5mmwM9DBftDkM7PWmLzj7BzVx0AARPTk0FdRuq00q
 QfvsgDvHvDuNvR6EBP4MzCk7P0hDVhGDWavKwnUf3WugxYmJemzpX592xTvuD4jqn9xK
 z2R0UPa1tvTdvgdd2f+GpB98YwnjPbjGgX9ntUNCRrDaONKJVmDwRkjsGyLNd0s1Aphf
 f4ybOJohHqvzg7g9lSGRqYfL8tbzDtYQnY1FJ74j/8oG/LSc0xC6+lryDoXUtisID/r/
 gNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UglyDtIiGqvTEpM7++4FJGDf8c2/b7gl9ujFn0OBb74=;
 b=QErWvEMJK9A/YBBsMu/N6hUDDoSKwP+NzCjD50fjVyeIY8sLW+8sAsqxYuXOFfJnWz
 kSzOpOUsTpgDgOSf1yB/8j1DHo/R/YSuferBJGF4Oom3vfagZPlDGpiUrIZdXtKsBozF
 CvmJtyVYb3WwHdIU9MJwoP0pU+LJfrfPm1DbcLSmkwyG7BjpD5q5VH03eZNOcXIWyVcB
 TO4nD/e4/Gg4+Cjl7oNv+XRmRN+qCjXt66tyOf19RVoVKGJaj+uo9DDKXb4s6SFEpBBu
 /khlzZxapd/a65XeVluhzLpXaSaluzbqi+dveJugjDX7fI20s21mLnCrER3zkQ+mIT/P
 xBZg==
X-Gm-Message-State: AOAM532PcgYmP2+AG+LiSR36TpzKtk9LFadlMl6UqPVvt2Ng3+CMMrtu
 MpoPxKO2pg3So374fBGbQdvrtLwDmAr8gAFk
X-Google-Smtp-Source: ABdhPJwt7Qj6U+pZqXMBOeqKPqZVJuEcWFxbfxJMkVEaJqvm4PKaE7o0HSCnPQ2sVu6oXkbt3Z7M3w==
X-Received: by 2002:a9d:5f16:0:b0:5cb:51de:6761 with SMTP id
 f22-20020a9d5f16000000b005cb51de6761mr1509647oti.139.1651860174786; 
 Fri, 06 May 2022 11:02:54 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 06/24] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
Date: Fri,  6 May 2022 13:02:24 -0500
Message-Id: <20220506180242.216785-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of starting with cortex-a15 and adding v8 features to
a v7 cpu, begin with a v8 cpu stripped of its aarch64 features.
This fixes the long-standing to-do where we only enabled v8
features for user-only.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Create impdef sysregs; only enable short-vector support for user-only.
---
 target/arm/cpu_tcg.c | 151 ++++++++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 59 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d078f06931..f9094c1752 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -994,71 +994,104 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
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
2.34.1


