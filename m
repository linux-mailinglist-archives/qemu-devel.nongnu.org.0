Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CCA49E779
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:27:33 +0100 (CET)
Received: from localhost ([::1]:60204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7cO-0005zI-Os
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:27:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z6-0005zu-2J
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:52 -0500
Received: from [2a00:1450:4864:20::32e] (port=37641
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z4-0008GY-7p
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6224470wmj.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cob6w3lHJEyO4gfhiCk6AitKryZfSl3diXAcUqlKPB0=;
 b=aO3YPA2FVFGvD8nFLRYV5PLU2tra2CgjvvtuYX0lph2wEaQ0XqP53ebAyD4hDzgRg8
 QBxM5/i+cOWfQ7G1Keik7Hufh6mbdvdUQ0krcF5zr694xSRmb4jeTFJGkG9jG4lPH75f
 VCiO1fLX4SlN60+KrXSdfmp1JbvIoZqdECWEzzODSMdSQD1/huykzkC7TjCsoDyGCSUx
 goE6hvOfOePaJLcGa2JJUbfzP6XLRoo8xryN/fyoAUBsQK8nUK8LPKPOZMucCtkOQ1Bh
 o9KMHBeg+sw59CHzLF5tDYCrr67c5VSPqMFsmqeOnEysXQhX/SyyX0e81h0a+FIkLFmV
 6iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cob6w3lHJEyO4gfhiCk6AitKryZfSl3diXAcUqlKPB0=;
 b=W10Qde6iA7LXE7Vge+vUIS/SnEwBManes/oJmrKOsvR4UQSM5MKUW5Dw9PPK0Z2Ysh
 og1G3zgLgZbh+IDqIUmcSdKx9ZgaV7FWsdtcxrwZg+uc0vKeZhXr5aF2PATr4Z0qwJ2g
 GR9W1KidpmmJBwG3DAcSUeuE9XApQoUFzVkqDlwja3AfN15iKWuGOEqx6DERnyuvagw9
 vIvCQj4Ix15+6IJhJKPsTBJVPGbKGRNceazNxHPWmO9ZNZ17QhAAl23JNWEMQHesQsJu
 9o7BI5RrC4NNCQnUtNhh4E1x3nEbZLP78hwYV2bp72BUXV502BHVTvDHuQyHxfT9iPw7
 U0Ug==
X-Gm-Message-State: AOAM532tB/qgSgw59fl0rPN3l1zaP6S9q5In1pSTvUtsCwuBbFfnyeV8
 VmqtLu7Zjkvq3nO1eu4tNyoLXQ==
X-Google-Smtp-Source: ABdhPJwwOUj3mBi3jqL5qRv5dq1/w/nIyepgKdqXs1AOzDjYW59kDE1OhRt/NLm1N/UoOatFaIUPBQ==
X-Received: by 2002:a1c:f709:: with SMTP id v9mr3660276wmh.131.1643298408671; 
 Thu, 27 Jan 2022 07:46:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/16] hw/arm: imx: Don't enable PSCI conduit when booting
 guest in EL3
Date: Thu, 27 Jan 2022 15:46:27 +0000
Message-Id: <20220127154639.2090164-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
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
---
I don't have the i.mx7 manual to hand, so I'm partly making
assumptions based on the i.mx6 behaviour. If somebody with the
manual could double-check that it does indeed start up with the
secondary CPUs powered down via the SRC that would be great.
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


