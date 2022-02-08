Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E674AD84F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:29:02 +0100 (CET)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPcD-0005il-UQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:29:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000lA-Pp
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::42f] (port=38565
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqj-000246-Ap
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:04 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s10so27592158wra.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VYqx5i90QNVSg4oDJ8Ire4MWcmLtpzgJo5wY1iMRSRA=;
 b=ylIY/srV63tVkAWoowPooIjoAsEan1u8QaA/O/lJW6YSKP8HyFez/lzsk+EC9u9hrV
 8Im6Ftf5x9uJTfAJrvXcjhBladPGpT3ZgVOy8ceUROzgLHIxFZPlbs9W9+iPRtE9RLsB
 cMbUE2ABLTcm81DZMWw1FUE44k+RsTwRqVItE/txy7fYmKVAKVo30sFmEKtMSO3Me9br
 u1AqNLoElHVlwEAssVIzds5LixTaHwV27upN/U5cuHeZi5VlY3Y+Ci8zxJLcDXwk87Yx
 YCAKyAx7AdYKNUR0nKLFT6mxe0ntYAAMfZE8Bvs6VkY00AFzePa6hmb4fGCloiczU2DQ
 ZLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYqx5i90QNVSg4oDJ8Ire4MWcmLtpzgJo5wY1iMRSRA=;
 b=M7xfDywEoFs9AEusBVcEpr79FOXipe8fSoIBtiRlRhjCZxlwyB5NnGGlLMNYBorbm/
 fzyncpZf3ctGpzNWZJXXAESugrAnElNWWJm4VuDjEnViiXY4sdtcunwZuw8ReFoJcQPF
 r+n38NvMGhB+69DBtpvkUiU7qGcZbhvmk6R/rP+coSMX/rzBIDt8dhdvUfZwiZrGfcnT
 xz+/XYCsR2jYLxTgMxxTN2HmM/bGw7BgaC2RopcaRX9WbXMXtKzmBIe9+MDf5uqQHTvA
 E8dDy0F+sgWg77Yefm9Ma/q7eW5/DE5xQgfH2fIb76WeB12e3T8zCHlezekzHnf//x6e
 PniA==
X-Gm-Message-State: AOAM5330gfJUmJZX53fsSBCYlTdoVE3dZ7tUKf/77PpHWffKfeygPu/d
 OBOv9tvk59kolgk8Zhf0PnE1TO0KaYMaWg==
X-Google-Smtp-Source: ABdhPJz7JfwCswSGUiGRJfVtMpwY0em7SULHnfhY+x3zPwaA21sIecM3X5hDsH1JubsEwGpEvlToMA==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr3124630wrw.493.1644320396024; 
 Tue, 08 Feb 2022 03:39:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/39] hw/arm: imx: Don't enable PSCI conduit when booting
 guest in EL3
Date: Tue,  8 Feb 2022 11:39:18 +0000
Message-Id: <20220208113948.3217356-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Change the iMX-SoC based boards to use the new boot.c functionality
to allow us to enable psci-conduit only if the guest is being booted
in EL1 or EL2, so that if the user runs guest EL3 firmware code our
PSCI emulation doesn't get in its way.

To do this we stop setting the psci-conduit property on the CPU
objects in the SoC code, and instead set the psci_conduit field in
the arm_boot_info struct to tell the common boot loader code that
we'd like PSCI if the guest is starting at an EL that it makes
sense with.

This affects the mcimx6ul-evk and mcimx7d-sabre boards.

Note that for the mcimx7d board, this means that when running guest
code at EL3 there is currently no way to power on the secondary CPUs,
because we do not currently have a model of the system reset
controller module which should be used to do that for the imx7 SoC,
only for the imx6 SoC.  (Previously EL3 code which knew it was
running on QEMU could use a PSCI call to do this.) This doesn't
affect the imx6ul-evk board because it is uniprocessor.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220127154639.2090164-5-peter.maydell@linaro.org
---
 hw/arm/fsl-imx6ul.c    | 2 --
 hw/arm/fsl-imx7.c      | 8 ++++----
 hw/arm/mcimx6ul-evk.c  | 1 +
 hw/arm/mcimx7d-sabre.c | 1 +
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 1d1a708dd97..f1897123294 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -166,8 +166,6 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    object_property_set_int(OBJECT(&s->cpu), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_SMC, &error_abort);
     qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
 
     /*
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 149885f2b80..cc6fdb9373f 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -159,9 +159,6 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < smp_cpus; i++) {
         o = OBJECT(&s->cpu[i]);
 
-        object_property_set_int(o, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
-                                &error_abort);
-
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
             object_property_set_int(o, "reset-cbar", FSL_IMX7_A7MPCORE_ADDR,
@@ -169,7 +166,10 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         }
 
         if (i) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /*
+             * Secondary CPUs start in powered-down state (and can be
+             * powered up via the SRC system reset controller)
+             */
             object_property_set_bool(o, "start-powered-off", true,
                                      &error_abort);
         }
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 28b4886f48b..8131518426a 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -35,6 +35,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
         .board_id = -1,
         .ram_size = machine->ram_size,
         .nb_cpus = machine->smp.cpus,
+        .psci_conduit = QEMU_PSCI_CONDUIT_SMC,
     };
 
     s = FSL_IMX6UL(object_new(TYPE_FSL_IMX6UL));
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 50a5ecde31a..ba84fc21920 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -37,6 +37,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
         .board_id = -1,
         .ram_size = machine->ram_size,
         .nb_cpus = machine->smp.cpus,
+        .psci_conduit = QEMU_PSCI_CONDUIT_SMC,
     };
 
     s = FSL_IMX7(object_new(TYPE_FSL_IMX7));
-- 
2.25.1


