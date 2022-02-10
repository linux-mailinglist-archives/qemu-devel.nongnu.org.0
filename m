Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C304B044A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:13:30 +0100 (CET)
Received: from localhost ([::1]:58276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0pl-000574-RJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:13:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hL-0003wa-B4
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:48 -0500
Received: from [2607:f8b0:4864:20::42a] (port=41983
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hJ-00047B-K7
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:47 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i30so7963318pfk.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrRLKIw2UploLh3OYXeRorBfG35Au7O6BtUh3Pw46MI=;
 b=iBi1wrg4DQGv4B7r5taPRZ3/8W1VV57B/vUAAX7NvlrYXf1bLUL0cbPuJG7r8el9ov
 vvgcD4IdYSqeUPKWnRfXEsOaK5zNFQ5jgCEzjNyDVRxHs1D2VS01qfIbAeR6C20uNnSH
 XZNI9jsspQIPNebsQ38OCtGpwCs6oIZ83aybixWk5DlqJQBI5mqMrQILt/vuOgwQbRAM
 nBZQ8o9oUY/TSHsvldrfKhdlOOQlqjLSaMGgjfcTou8htfMwIl+0ZO5uCDHc8ndmUpu/
 4wacc4u5PUQ9+VekUMCybTZqhnqvbiQ931tM39Bh89U/HZwV8TOOMxAdnquP+nCDe1vL
 30Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrRLKIw2UploLh3OYXeRorBfG35Au7O6BtUh3Pw46MI=;
 b=rtFchY7SRUHGguh8g56LGLAEHLPIfBUNtneHygZ/22LqpMWODuH72T89baiBdts9lt
 QUXorjmyS4XwZAGxZoxN2FlABHTgM+qALrwGN936B9kdUI0VgRLniox5WfeaWGngiseh
 UBG3E4yTJS11xvRMZvG4epvTIFKSE6VEBUgqrwOSVH/NTlmxr53f6VH3AVPAjJvCJUYt
 kzVu+E5en/BrvPL6vEEsSoKBuhqZr692l5Li2MveyXuCo2x+CigVvGJz08UPe3q6hCq0
 kEW35kIQIkliwz+G6L72J4hw6mxnfqq5VZomsijvHuDAVSRPAUYzQJ/oVtLjUS6D9Y0r
 pYoA==
X-Gm-Message-State: AOAM533luGRSxInVQCI64ULeP6LKuldknlHYV7ENNcqsA0pbafA485jz
 lq65gsMkl0A4qCnFfI++uVGXlcyZ8fnyFmNi
X-Google-Smtp-Source: ABdhPJygVkRQssZ6DGrIskSk9b4mojjSxaH827Koe8+9NAh4Jt+RvGE5gCdpeYolXN5EpRTreiL8RQ==
X-Received: by 2002:a62:b618:: with SMTP id j24mr5792829pff.42.1644465884304; 
 Wed, 09 Feb 2022 20:04:44 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] target/arm: Move arm_pamax out of line
Date: Thu, 10 Feb 2022 15:04:12 +1100
Message-Id: <20220210040423.95120-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ef6c25d8cb..fefd1fb8d8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14cc866d8d..fa0824e12c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11150,6 +11150,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1


