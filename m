Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF9649E8F1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:26:43 +0100 (CET)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8Xi-00005P-CA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zN-0006f3-SH
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:10 -0500
Received: from [2a00:1450:4864:20::42b] (port=46887
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zG-0008O4-46
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so5501005wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GFkNt2ByvuaZ+sNn2Dl4tejBkKkrraxOjreg3A2I/28=;
 b=VJyYlQLkRJR3hiFtNhNE9Sqa5UhLsbl7Sg+cQfZyDL2jpHbGRMsuSQXEtf9TzYfr/C
 kBLsbUWb5+rD/eOW2FpatYn6dGPSmUC4MGM7mnVVTrbuExGMmCA9sK9c1CnWObYKQ2YY
 3Bsy1DADB6gVpv2R2jrbCsqb1bld8Z7iwXrxtAVl3NT5Ut2etYoDf8IL5iFsqBxpTO4Q
 PxHqPZ6aw77ho1tq5BKR8Ez9tox8uD9DXmTpMcUPisUjknkWhhhAccL+3/39c2gEJPzV
 uacMEaly61oRC4FZdJ+uyqKc5gJO+dtXV5V7ukYVkcxDkDbBGupKXqE0j65V3cDSH4xn
 D/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GFkNt2ByvuaZ+sNn2Dl4tejBkKkrraxOjreg3A2I/28=;
 b=uvvjtpj1yb0pl6fXlJvTNPxAz+rtfUIWzSEUzdu+6Oz9irwog7lA9r2eGI0VeXJMqP
 3ox++9DwuX6YFgQkaUq3Kfr+t5JJi4SSu8wb6FuDXIEq8WgqdPVLVgbEaxuBWhnFB5WS
 VeDoiLRkP8L/bluujS3eZ5l12G7/8lQR03/lgOdD0OlBoe5/AJerffIDPgHW62J8rhb/
 tb1cPV7fn3GJvzBXIoP67WuLyErCRm7k/ZvSwn1i8bI25R8jZNngU39DAczObgI9U44S
 9TF8dijB/dzQQtCSzXpiW5qYFSxA9jDBueJu4q1iuhiTPxl0WCoFnMXkMvoDMa47JN8e
 TysA==
X-Gm-Message-State: AOAM531bmm+svytPMjKTgZH2W+Ot0Ki7IHME3K/Md4WhGuo1vCRHgH05
 hmBvv6MoufbPcYzd40gAfAQHNQ==
X-Google-Smtp-Source: ABdhPJwyUhh5QCAPuw8KJ1CI4r0P3cAWRuSVPKOMsBNJKLlRzwyrHc9539QW+/N0bGRVKZZtXiHBHA==
X-Received: by 2002:adf:f981:: with SMTP id f1mr3486934wrr.651.1643298420401; 
 Thu, 27 Jan 2022 07:47:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/16] hw/arm/virt: Let boot.c handle PSCI enablement
Date: Thu, 27 Jan 2022 15:46:31 +0000
Message-Id: <20220127154639.2090164-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Instead of setting the CPU psci-conduit and start-powered-off
properties in the virt board code, set the arm_boot_info psci_conduit
field so that the boot.c code can do it.

This will fix a corner case where we were incorrectly enabling PSCI
emulation when booting guest code into EL3 because it was an ELF file
passed to -kernel or to the generic loader.  (EL3 guest code started
via -bios or -pflash was already being run with PSCI emulation
disabled.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 141350bf215..398145a7180 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2088,17 +2088,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
-            object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
-                                    NULL);
-
-            /* Secondary CPUs start in PSCI powered-down state */
-            if (n > 0) {
-                object_property_set_bool(cpuobj, "start-powered-off", true,
-                                         NULL);
-            }
-        }
-
         if (vmc->kvm_no_adjvtime &&
             object_property_find(cpuobj, "kvm-no-adjvtime")) {
             object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
@@ -2246,6 +2235,7 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
+    vms->bootinfo.psci_conduit = vms->psci_conduit;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
-- 
2.25.1


