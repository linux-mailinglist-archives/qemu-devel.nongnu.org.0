Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389A3D637E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:35:12 +0200 (CEST)
Received: from localhost ([::1]:52260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83ZP-000361-FD
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m83YD-0002G8-J7
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:33:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m83YA-0005DG-Nc
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:33:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g15so11853745wrd.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WpXLmn65XHv7xnK6Qk1mytWSngxvajkN43MTrCt/aqU=;
 b=Gio1lCjaQKSvg96OzbsskFO8sxCY2sVOtqq2WfUkQEVxOZ4wkKuhJkEGSz2Ej8k+5h
 zACkv1LYG6ON98u6+2fM2Z46xczPvKuR+KA1QpunOrumgdciPW+7uMt/PhasCaptDlvt
 ZZr4J3O7MulsLx4xiVUKVuNizCwfGqeqleKV9M7SVwj1uLKEUeP+yL3bTpHrToRFFBso
 8obde575imadhUIUnozaQrlxKLQ8BOmWJ6049zD69b8rE9aaqgJIfFTOSxMl8hHDLd/H
 iYj7Vt1n5uVElbV1hNbtQzE0zTa3kx8l1JJ5eyEOWlyINw4u0s31OnlWAsu0FVB6vBll
 FOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WpXLmn65XHv7xnK6Qk1mytWSngxvajkN43MTrCt/aqU=;
 b=Ey09vkdwQP6OWMSQVi6KwA1/2T/NRs9FCNHNDqXaFH/V43b7t84uTz208Ft1bm4ROF
 KAvY7q1QRPJktFV6XXz/OBCThgYIi4UMNlKgUbL0fvsxR4w39UXLiK08KcvBgG+aPGNh
 7iqzIllAodf2jes7JheRcU1wJrENHd7LUJFeFnNETgtMxyhR8+KIPors7Ox783oeRSvo
 AdaJL7JYFoRQz6vTz7nSWTAfsDpF8oVLKuY87XC814ESbGQmWCvdG4p4EC463dRcqDHK
 yrU6v2ph68yWtQxtTSTUiKnAsn4e57SFm8tx0C5qzu+rIMshzzdjfawROgmVHHuv5oqQ
 JPbw==
X-Gm-Message-State: AOAM530phLqlsl2re4jV5YtGSP8F3BF7YtPxuy7BvpZybQYr1u7rwP1Y
 aZNh/vX0gQkTCaJ+YTAIev0trg==
X-Google-Smtp-Source: ABdhPJwYYKypWHTzwScVmXApZxVCabZkHd6MdloG7T6VR7lxUzouIoQaXl6XvBRyTg+Hiwf6YF78Vg==
X-Received: by 2002:adf:f282:: with SMTP id k2mr7096392wro.183.1627317233150; 
 Mon, 26 Jul 2021 09:33:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q5sm339930wrx.33.2021.07.26.09.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 09:33:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
Date: Mon, 26 Jul 2021 17:33:51 +0100
Message-Id: <20210726163351.32086-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the user provides both a BIOS/firmware image and also a guest
kernel filename, arm_setup_firmware_boot() will pass the
kernel image to the firmware via the fw_cfg device. However we
weren't checking whether there really was a fw_cfg device present,
and if there wasn't we would crash.

This crash can be provoked with a command line such as
 qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none

It is currently only possible on the raspi3 machine, because unless
the machine sets info->firmware_loaded we won't call
arm_setup_firmware_boot(), and the only machines which set that are:
 * virt (has a fw-cfg device)
 * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
 * raspi3 (crashes)

But this is an unfortunate beartrap to leave for future machine
model implementors, so we should handle this situation in boot.c.

Check in arm_setup_firmware_boot() whether the fw-cfg device exists
before trying to load files into it, and if it doesn't exist then
exit with a hopefully helpful error message.

Because we now handle this check in a machine-agnostic way, we
can remove the check from sbsa-ref.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I didn't reuse exactly the same wording sbsa-ref used to have,
because the bit about loading an OS from hard disk might not
apply to all machine types.
---
 hw/arm/boot.c     | 9 +++++++++
 hw/arm/sbsa-ref.c | 7 -------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e6..57efb61ee41 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1243,6 +1243,15 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         bool try_decompressing_kernel;
 
         fw_cfg = fw_cfg_find();
+
+        if (!fw_cfg) {
+            error_report("This machine type does not support loading both "
+                         "a guest firmware/BIOS image and a guest kernel at "
+                         "the same time. You should change your QEMU command "
+                         "line to specify one or the other, but not both.");
+            exit(1);
+        }
+
         try_decompressing_kernel = arm_feature(&cpu->env,
                                                ARM_FEATURE_AARCH64);
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 43c19b49234..c1629df6031 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -691,13 +691,6 @@ static void sbsa_ref_init(MachineState *machine)
 
     firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
 
-    if (machine->kernel_filename && firmware_loaded) {
-        error_report("sbsa-ref: No fw_cfg device on this machine, "
-                     "so -kernel option is not supported when firmware loaded, "
-                     "please load OS from hard disk instead");
-        exit(1);
-    }
-
     /*
      * This machine has EL3 enabled, external firmware should supply PSCI
      * implementation, so the QEMU's internal PSCI is disabled.
-- 
2.20.1


