Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2149E8D4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:22:52 +0100 (CET)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8Tz-0002b0-9h
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z9-0006Br-PA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:55 -0500
Received: from [2a00:1450:4864:20::32c] (port=42973
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z8-0008Kd-2s
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso2161967wmf.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bffQ5wNElfir0ludySMWzcts+VnP8j4cL7Lwt5H0SMU=;
 b=Be+gf7GtfE6uRbuCvxwj2P/xRgW1+CtJ6DrAO+XM6hhd2zDoCkfX6VDEdZaxRH6Zzy
 hGDa6aqKy6+JwJgSsS1HyZ8UVIXyuh5ob5ebiq7PBEx47WSCRxnM/nYa6MEQ/BtjYxex
 UqvM49nun8ulO8y3AMPCuEJrERRkJyzQh7Pl0kgE0H2XnRHsI9dxyRGZCRKyKgP6LoO/
 +lAJB1cnWiFzBo2dsoLo60gSM0RCGf4xAo+IoKoOa3CzexZzjEBuTJNxtdLJALLuGety
 bLIBcXSOzCUO2i8RvItWUVTUrS4J+w5ksobkYskdcp0xUSLUqS4HAZ6ovQRHaEUAQ9Sp
 WvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bffQ5wNElfir0ludySMWzcts+VnP8j4cL7Lwt5H0SMU=;
 b=l/YlTgaeO799b+EbtrVmkPIzuQ+NCQHeKXZ6s5dkMM7oOuqMAswL/K+ui/fmd7A/SE
 P+owqxbeKMR6/Un95AFty/kIKudjS1ohzzCWIGL1Q+q3sN3fhcYYjCB60x7tlFc+vzne
 b+lSW1EsF/hsNlbk0GoPinDkVskN08KvB/lIpQFxyqK58CM/jBx1r7yT6dBiHbNwNA1C
 bFmg+oiRhhMD3GIwqG/L+g0MsK02wopY9G7iCzY4bB2nnepTjo5KKaQLN+b9nEbNoF6/
 A9jkMQjwAw5IVtgYz/YjgAg94M9qwcvrEji2X+ADoBjEY7HQmZvVvbLC+JTd+TG8KkVF
 PZ7g==
X-Gm-Message-State: AOAM533x9TXSeDQ9C162IUrd96MzoAqprz0f2MzNr0lvZjHf4r0n0Zxh
 OTCLA78tyVjbWSMDlnEri5VluQ==
X-Google-Smtp-Source: ABdhPJwi5gRd/CkjVeH7qwrKozQEbE5dFF6HFuSuDlWxt0Gxz94ylS6VKv/MAtKcQY+mvt96Uyakpg==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr3746087wms.192.1643298412766; 
 Thu, 27 Jan 2022 07:46:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/16] hw/arm/versal: Let boot.c handle PSCI enablement
Date: Thu, 27 Jan 2022 15:46:30 +0000
Message-Id: <20220127154639.2090164-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
properties in the xlnx-versal-virt board code, set the arm_boot_info
psci_conduit field so that the boot.c code can do it.

This will fix a corner case where we were incorrectly enabling PSCI
emulation when booting guest code into EL3 because it was an ELF file
passed to -kernel.  (EL3 guest code started via -bios, -pflash, or
the generic loader was already being run with PSCI emulation
disabled.)

Note that EL3 guest code has no way to turn on the secondary CPUs
because there's no emulated power controller, but this was already
true for EL3 guest code run via -bios, -pflash, or the generic
loader.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 1 -
 hw/arm/xlnx-versal-virt.c    | 6 ++++--
 hw/arm/xlnx-versal.c         | 5 +----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 895ba12c61e..2de487564e4 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -89,7 +89,6 @@ struct Versal {
 
     struct {
         MemoryRegion *mr_ddr;
-        uint32_t psci_conduit;
     } cfg;
 };
 
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 0c5edc898e1..1b25342501b 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -626,6 +626,9 @@ static void versal_virt_init(MachineState *machine)
      * When loading an OS, we turn on QEMU's PSCI implementation with SMC
      * as the PSCI conduit. When there's no -kernel, we assume the user
      * provides EL3 firmware to handle PSCI.
+     *
+     * Even if the user provides a kernel filename, arm_load_kernel()
+     * may suppress PSCI if it's going to boot that guest code at EL3.
      */
     if (machine->kernel_filename) {
         psci_conduit = QEMU_PSCI_CONDUIT_SMC;
@@ -635,8 +638,6 @@ static void versal_virt_init(MachineState *machine)
                             TYPE_XLNX_VERSAL);
     object_property_set_link(OBJECT(&s->soc), "ddr", OBJECT(machine->ram),
                              &error_abort);
-    object_property_set_int(OBJECT(&s->soc), "psci-conduit", psci_conduit,
-                            &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     fdt_create(s);
@@ -677,6 +678,7 @@ static void versal_virt_init(MachineState *machine)
     s->binfo.loader_start = 0x0;
     s->binfo.get_dtb = versal_virt_get_dtb;
     s->binfo.modify_dtb = versal_virt_modify_dtb;
+    s->binfo.psci_conduit = psci_conduit;
     if (machine->kernel_filename) {
         arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
     } else {
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b2705b6925e..458ba33815f 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -35,10 +35,8 @@ static void versal_create_apu_cpus(Versal *s)
         object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i],
                                 XLNX_VERSAL_ACPU_TYPE);
         obj = OBJECT(&s->fpd.apu.cpu[i]);
-        object_property_set_int(obj, "psci-conduit", s->cfg.psci_conduit,
-                                &error_abort);
         if (i) {
-            /* Secondary CPUs start in PSCI powered-down state */
+            /* Secondary CPUs start in powered-down state */
             object_property_set_bool(obj, "start-powered-off", true,
                                      &error_abort);
         }
@@ -481,7 +479,6 @@ static void versal_init(Object *obj)
 static Property versal_properties[] = {
     DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.25.1


