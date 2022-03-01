Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C944C982D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:11:53 +0100 (CET)
Received: from localhost ([::1]:52488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAim-0008Q2-9r
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXX-0001Fv-9A
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:15 -0500
Received: from [2607:f8b0:4864:20::434] (port=43728
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXT-0004wg-Qu
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:15 -0500
Received: by mail-pf1-x434.google.com with SMTP id d187so46239pfa.10
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
 b=mq2ltQuvsaGII0nw21LCdZQ9vRhu+28qEW5tjEtWd8kZKUrGy9SKf9m7hDdbGyU/py
 WVbzzG7efFmDHTqilAKCt5F773MS4MiGulnOX/29f8woFmOx8WsUT6MGpFrYeLSlR1yM
 I0qYQtmfcy6GY4X8U1yKCXzS2o38Jy03HBkzo5/xkI1qXqYAXmDRZK29hEcQ8iWEOzuR
 bus8SOvOtG25OzocVXY/94RKHNZZWNsjWDCZyhEK3rTGmwi/pfBOsDLVCUKoxr3rqtFe
 bgbHU027H9GdDmx65hLDgqAo8bITJedZYib/G4aO3sBKT1VOUZRH1S67tc5E4vdQBBNx
 1bRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
 b=xIZ3iHKiUdsW7gSCsBmHHBmaS9SHOkBwE2DCfQTL2tFA4RgngLMpcp9wNtirYN3UzI
 PJrLZEjRazRAmFohlf7c3Jvyf9rxmdNerkLwtu6n7IK+Tqcbg/Qkg7yQxA8Hg9loX0vR
 aZp78AObCGOygcLHd+ZNmzKP+Lf4FgaV3PTLvnGfHme+1SwQVYhUTIakrvnWqN0dvTtp
 /HT5oU+SXrCwobQ/JuXlOC10Mnc0lTdAivgMbu1dWhx9Zi+yQCgYXG5a7KXNQXRqfuSA
 QXB1w9fXaIwdZ+C0S2UBfmx9EVy1dvRPkONrcj7jPkdt6vNlzW3pr4p4ouzqsATi11Dy
 9NMA==
X-Gm-Message-State: AOAM531OQrlX6QRkJg2+AxG7nFnSeqsmbTs+I9Qnq8xywZK8CSwAi9+/
 ubm1EO6xTUUx1pf1nyGY/o6VBljXpoYnGQ==
X-Google-Smtp-Source: ABdhPJxjvJKUJ+gOLQNlE8UvJ++/e3NjvvE9mSqCFx/G8Z24shQmr/GiejIN7xvL9WxkTeYsa8wjFw==
X-Received: by 2002:a65:4d0c:0:b0:379:3df:eac8 with SMTP id
 i12-20020a654d0c000000b0037903dfeac8mr1793340pgt.166.1646172009529; 
 Tue, 01 Mar 2022 14:00:09 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/18] target/arm: Move arm_pamax out of line
Date: Tue,  1 Mar 2022 11:59:44 -1000
Message-Id: <20220301215958.157011-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index dd4d95bda2..71e575f352 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11152,6 +11152,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
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


