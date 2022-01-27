Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF049E8B5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:19:18 +0100 (CET)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8QW-0004b0-U7
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:19:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z8-00066v-Ek
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:54 -0500
Received: from [2a00:1450:4864:20::432] (port=44676
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z6-0008Im-ON
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:54 -0500
Received: by mail-wr1-x432.google.com with SMTP id k18so5505429wrg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHJ9nThESHzWZK/5l0R4RVfaxxtdAwJGigaCcT5eBLk=;
 b=bfEhqLLicqGanBmEIeQu/xw3rEURaJgj5UxM2th6wKmp/gYIQJSvm26qG4OyA/UbOI
 pj/g8kakC1Ed9z4N6W0hAY6q7kbeoFSifw9OqD7sx7+LUGD5rUz0/h2qyTy4mWHgBFkG
 QZAOiDrT2fYuu2n2nMZLBFoza6RjL/sd4cXi5EHm2f3LuFQRLKLOic0mwNM4eRbel02X
 4mQvYhHNZ/qtQP0f1EU6y0qbNXkuibtr2HqYYZlJUn5tLsG5A10bSh+fR2B0N1cKScxy
 LX8B1WFPxHo2eyakUxe1wJWoNdTbXNnwJrcgVYhzV/1ivDAfX20a25f/D/AVUbDXms2Q
 1GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHJ9nThESHzWZK/5l0R4RVfaxxtdAwJGigaCcT5eBLk=;
 b=61jQgaHPcsGn5IlYhxWM4KImnoegOZyCPCkYI9GUhQ0t2oB5RB72ecIfImx8QEIc/R
 HZcbjleV6t228FSPmbecOKDse5jCj56VryaQzJQwYqOjK3Vbj/NnesVumR/rqTKrQjWW
 b/omfZyQIEIBiX7ENtJ8ZJaXHafaLHhBm3EG4czebyqWom8625O6wkTynudqEv1pr4pt
 SI46NfE8DKH2KJhT8xi1p1sG/O4HMwvlrWWfg6bFunywjXXIV7o65qOdSpcpd9i1QxJH
 CexKYuPA7t1TwPeJjJ2epNNjD2yMT4CxiR3hWZenycyptnreNoG/5xbKFDj1Dsz6IpMX
 0ezw==
X-Gm-Message-State: AOAM530CZc4C/4wcKCBg2lsXl9uakbo0Ny8349k+NREBUcLxcbiBL+kl
 JkngFcJPlc4wHMyn2/xiwyOufw==
X-Google-Smtp-Source: ABdhPJzbWg/xGsyVhdiJdwxTMSICOJDcNbPCPGufNpVVHdO8z0tpenATHzVFdhgAblyd/i8GYrWo7A==
X-Received: by 2002:adf:e602:: with SMTP id p2mr3578645wrm.126.1643298411408; 
 Thu, 27 Jan 2022 07:46:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Date: Thu, 27 Jan 2022 15:46:29 +0000
Message-Id: <20220127154639.2090164-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
boot.c functionality to allow us to enable psci-conduit only if
the guest is being booted in EL1 or EL2, so that if the user runs
guest EL3 firmware code our PSCI emulation doesn't get in its
way.

To do this we stop setting the psci-conduit property on the CPU
objects in the SoC code, and instead set the psci_conduit field in
the arm_boot_info struct to tell the common boot loader code that
we'd like PSCI if the guest is starting at an EL that it makes
sense with.

Note that this means that EL3 guest code will have no way
to power on secondary cores, because we don't model any
kind of power controller that does that on this SoC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Again, if anybody knows the real-hardware EL3 behaviour for
CPUs that would be great.
---
 hw/arm/xlnx-zcu102.c |  1 +
 hw/arm/xlnx-zynqmp.c | 13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 45eb19ab3b7..4c84bb932aa 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -236,6 +236,7 @@ static void xlnx_zcu102_init(MachineState *machine)
     s->binfo.ram_size = ram_size;
     s->binfo.loader_start = 0;
     s->binfo.modify_dtb = zcu102_modify_dtb;
+    s->binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
 }
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 1c52a575aad..17305fe7b76 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -215,7 +215,10 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
 
         name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /*
+             * Secondary CPUs start in powered-down state.
+             * TODO: check this is what EL3 firmware expects.
+             */
             object_property_set_bool(OBJECT(&s->rpu_cpu[i]),
                                      "start-powered-off", true, &error_abort);
         } else {
@@ -435,12 +438,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < num_apus; i++) {
         const char *name;
 
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), "psci-conduit",
-                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
-
         name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /*
+             * Secondary CPUs start in powered-down state.
+             * TODO: check this is what EL3 firmware expects.
+             */
             object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                      "start-powered-off", true, &error_abort);
         } else {
-- 
2.25.1


