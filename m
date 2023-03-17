Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59616BEEDF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDII-0001Uf-UC; Fri, 17 Mar 2023 12:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDIG-0001U7-PM
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:51:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDIE-0000yj-4e
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:51:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so5500380wmb.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679071860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
 b=IR4T/+vwPMsWe13l5Ri/VHW+QLrQi+hBBZq2nUG/G1I7bUM55W3uFiErbJT03HYtM0
 5KO9W0MpwMFbFq8jg/zLda7UtCnHfPLA3tKD38J0/aPkUV6p6xSulVygC2HVsQdsP2pi
 AdHrekxgCFAnH3NID6OdO9AwRgU1aVgpV9Jf+9kjDDJxU7wLXiJI8lv//WCuzCeqE0Iq
 6YyQrL8jcXPLaH8D8sZ95UM1/0W8aEvy57lZy4fQhSHN2YT/yv8ef4VZMsVlyVLc1RCE
 +S8Eg08fK5lV0jX1eHDvshNaiR1eFm3eTMOSf1Vk7mFR9bnIlP2D+IpzaIpHs9RcFG4/
 gYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679071860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
 b=tx2EE/Oj4eUdtlKLnvnf/bsHFW70d9nK/+auuw6NmSiPTFIcGs280IsM6VPxidZDN7
 yNz+ZEN/1grfOJeggDfPylP6Ck3PFfstLeUMsPHIkR1u7vzaC+CE/7VcDg9XbKEuEBnG
 yERItxPgKob3mbAuvT8naKvKulbh8dYQqDJHehejnOha/wGLe1h6fGtc80Aj8thllZjz
 PnEnngaRYVUU3F2DISRfTf51QOj5FoNPBpq7SZ5NZJx01A4z/7ruxn5Ge9p/AltfRm16
 Fb/hvMEsAqYM3MxwQZWngO5O+nfwo9wHNVhbY1RLqJ3YSnTaZ36BzGFxP38e7G9enDS9
 kKLw==
X-Gm-Message-State: AO0yUKWBjhB68N7sbzn5jCdNWEPygMmkhDrVU6RLsruuvPEMRm1MOBMO
 ZK026rjBiTmwpJqnMVKhxjPvgg==
X-Google-Smtp-Source: AK7set9sq2bZPzy4KLStvSM2/bgSJXJIMkLMG5tGNW4TW0+MUHdsy8OyL9fr8AKgiq5kJIcDzpjZcQ==
X-Received: by 2002:a05:600c:3c83:b0:3ea:ed4d:38eb with SMTP id
 bg3-20020a05600c3c8300b003eaed4d38ebmr24571505wmb.24.1679071860295; 
 Fri, 17 Mar 2023 09:51:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600c364600b003ed2c0a0f37sm2460106wmq.35.2023.03.17.09.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 09:50:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Machado <luis.machado@arm.com>
Subject: [PATCH for-8.0] target/arm: Don't advertise aarch64-pauth.xml to gdb
Date: Fri, 17 Mar 2023 16:50:57 +0000
Message-Id: <20230317165057.1522743-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Unfortunately a bug in older versions of gdb means that they will
crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
gdb commit 1ba3a3222039eb25, and there are plans to backport that to
affected gdb release branches, but since the bug affects gdb 9
through 12 it is very widely deployed (for instance by distros).

It is not currently clear what the best way to deal with this is; it
has been proposed to define a new XML feature name that old gdb will
ignore but newer gdb can handle.  Since QEMU's 8.0 release is
imminent and at least one of our CI runners is now falling over this,
disable the pauth XML for the moment.  We can follow up with a more
considered fix either in time for 8.0 or else for the 8.1 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 78105b8078b..3bd86cee979 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -520,11 +520,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
+#if 0
+        /*
+         * GDB versions 9 through 12 have a bug which means they will
+         * crash if they see this XML from QEMU; disable it for the 8.0
+         * release, pending a better solution.
+         */
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
+#endif
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
-- 
2.34.1


