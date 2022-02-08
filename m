Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DD4AD994
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:22:40 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQS3-0005AG-1i
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqw-0000pB-Ns
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:10 -0500
Received: from [2a00:1450:4864:20::32e] (port=43812
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00027O-00
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso1401518wms.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cC5mdKRuC+fKKjkTJ4bWT+06ilMknwtgKl7IQRoNk9g=;
 b=XEXEeCvhaaVM9HAPV764rxCW2t2bkkOpD73/Xya6JGlo3FTyRyxkxXhXTck5/RBqIA
 3zU0fAuCnk7rnxArnoLS89LDvq4t9x3qWfQEoTbstT65Meh9l2Kp3xFzh9KLWnpAiVhq
 aHNE/u3AKpxPuSqx0RylrmQfMu/twQrfd2ZNqb7HaadYTWBf+OwUU+J39lqxNV34MrMB
 bUNIHtANopOBhsjFBp8qPhYpzRyQxOuFMf/B3fYYdzZNU2ibHfvG+gtep7lKcsjiX3rl
 OVwfRpTszZ/2bVDt31FmBYpw18u/nuGPqViABW9oLeGAzncdyKA/8alc7m+jHuynAjai
 64gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cC5mdKRuC+fKKjkTJ4bWT+06ilMknwtgKl7IQRoNk9g=;
 b=FPP7nmqSnXeNvhhx81pjXYhOyOIKLyxABOQ17fFXhHoZFeWYq6Z4yPRI1JTK6+6MKf
 rW2J4SvoD7kcruh4JDJ1ERBhXBA3Y/At812ahaPQY48XH3LfWKrXz0Tt7bCBZJNh7a0s
 zR2YVkGlDwp5HY0m8hLLBTyG9C0ggiUExJ61rWo/8fKBBMUMGZvgpiZsLEAIWif7dLQl
 DezJWRGzRyAvv/eWnf7xFG+Zo1UtVeeyVDkCvY8707SzIVySirUyMyLlrRyxyD4p+cdJ
 VOlBXyt3bFhcqV2WLK9LG0/qWoIZBdjrUHLlJilBv2PFOt6ASTs+Xlsma6qQjELAeWoa
 l1jQ==
X-Gm-Message-State: AOAM531rckwfavaDnwM30KKB0UTCAPSXj4xIR+53iJz98w6Z1fYf/IqZ
 1gbBQBgTf/DqbUEILp7wN6ZJNtU4+JbknA==
X-Google-Smtp-Source: ABdhPJwg/+yi9uZUJBeiKgLzKOPRnySe3x50AVJWkRWy0SXeaCRyu6rPwRYpC/X+/xV3LBrmJsmJxA==
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr796897wms.62.1644320401775; 
 Tue, 08 Feb 2022 03:40:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/39] hw/arm/boot: Don't write secondary boot stub if using
 PSCI
Date: Tue,  8 Feb 2022 11:39:27 +0000
Message-Id: <20220208113948.3217356-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we're using PSCI emulation to start secondary CPUs, there is no
point in writing the "secondary boot" stub code, because it will
never be used -- secondary CPUs start powered-off, and when powered
on are set to begin execution at the address specified by the guest's
power-on PSCI call, not at the stub.

Move the call to the hook that writes the secondary boot stub code so
that we can do it only if we're starting a Linux kernel and not using
PSCI.

(None of the users of the hook care about the ordering of its call
relative to anything else: they only use it to write a rom blob to
guest memory.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-14-peter.maydell@linaro.org
---
 include/hw/arm/boot.h |  3 +++
 hw/arm/boot.c         | 35 ++++++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 0bcb58babba..0cfc1c95c4e 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -70,6 +70,9 @@ struct arm_boot_info {
      * boot loader/boot ROM code, and secondary_cpu_reset_hook() should
      * perform any necessary CPU reset handling and set the PC for the
      * secondary CPUs to point at this boot blob.
+     *
+     * These hooks won't be called if secondary CPUs are booting via
+     * emulated PSCI (see psci_conduit below).
      */
     void (*write_secondary_boot)(ARMCPU *cpu,
                                  const struct arm_boot_info *info);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0424c178305..184628ce564 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -804,7 +804,7 @@ static void do_cpu_reset(void *opaque)
                         set_kernel_args(info, as);
                     }
                 }
-            } else {
+            } else if (info->secondary_cpu_reset_hook) {
                 info->secondary_cpu_reset_hook(cpu, info);
             }
         }
@@ -1030,13 +1030,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         elf_machine = EM_ARM;
     }
 
-    if (!info->secondary_cpu_reset_hook) {
-        info->secondary_cpu_reset_hook = default_reset_secondary;
-    }
-    if (!info->write_secondary_boot) {
-        info->write_secondary_boot = default_write_secondary;
-    }
-
     if (info->nb_cpus == 0)
         info->nb_cpus = 1;
 
@@ -1216,9 +1209,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         write_bootloader("bootloader", info->loader_start,
                          primary_loader, fixupcontext, as);
 
-        if (info->nb_cpus > 1) {
-            info->write_secondary_boot(cpu, info);
-        }
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
         }
@@ -1385,6 +1375,29 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
         }
     }
 
+    if (info->psci_conduit == QEMU_PSCI_CONDUIT_DISABLED &&
+        info->is_linux && info->nb_cpus > 1) {
+        /*
+         * We're booting Linux but not using PSCI, so for SMP we need
+         * to write a custom secondary CPU boot loader stub, and arrange
+         * for the secondary CPU reset to make the accompanying initialization.
+         */
+        if (!info->secondary_cpu_reset_hook) {
+            info->secondary_cpu_reset_hook = default_reset_secondary;
+        }
+        if (!info->write_secondary_boot) {
+            info->write_secondary_boot = default_write_secondary;
+        }
+        info->write_secondary_boot(cpu, info);
+    } else {
+        /*
+         * No secondary boot stub; don't use the reset hook that would
+         * have set the CPU up to call it
+         */
+        info->write_secondary_boot = NULL;
+        info->secondary_cpu_reset_hook = NULL;
+    }
+
     /*
      * arm_load_dtb() may add a PSCI node so it must be called after we have
      * decided whether to enable PSCI and set the psci-conduit CPU properties.
-- 
2.25.1


