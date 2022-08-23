Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F14459E6B6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:14:53 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQWYG-00070d-MI
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWOA-0003bK-Hp
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:04:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWO7-0006Ni-NW
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:04:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l33-20020a05600c1d2100b003a645240a95so5627409wms.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2+iUB97QvHpXygI4MqNZaS2vuPc/FaGWHhOF0GBTvWM=;
 b=EsHhHVKUg0SZzUQHkPlv+dSgaN8WJMEjULo7xQWX9s7UUPi5K9lSBjTc93+jd0oF1X
 ubATbbDiaY/InD+gIzzYwBxSLRi1tjhWHEBFiXj6rgr1hkIvhUAX8jnWuVY0Iiq3zO54
 t9CRmjZWRf+jHx+wIm0UOPdybx/VU7Nbpolsr8uoBcrG2rPtTRMUD4SGOFdy3HiAwQBr
 LcFhqWwoxf+XXR+4mssAG3iAq8HOLVNlQCKPyD4beZeM5cL5yyiWH1LAeIpHQe16+CbB
 Bz+gH0vYqxTEHHx01mlM0bFZcweIgRyMN75L//muIc80TjR1kMf8LUwiesa7aHc1tlOt
 Veig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2+iUB97QvHpXygI4MqNZaS2vuPc/FaGWHhOF0GBTvWM=;
 b=71SNYaV+MpBZd9VNkoDjagHornhYQ7p4omwYbukVX3yt9IvT3y5tICGBrlnaTMwgmU
 5XQ6yJCfbzbLxchfmlDSczsbXg/EMEaTXcpp+ZGPGA6UO9QULtBBVFCvWicO0VVMoE0T
 VJnzG3QXzhzY0ut2VykxRGN74IOnl4lQOnmmtz9/lNzcC5X2WmGG6PMX0VKvTOz7O17A
 GskCx09BumkLoSlWOX8SlMClO2PpVLVHFrUC0EUCOvcZ1TmHwgGDfUDnrHh6TKJp2RHi
 ukNael5KfexgwYvsfzCoDvoNm7NKe41TjSu0QjgYOHWsppldV0ch0mfFaYw2b5dxvo+9
 Nk+g==
X-Gm-Message-State: ACgBeo0q9MfWhi+gZHM4Bl18hymKK1wy5ZRsTbJfnjQrTpysweZjc0Xe
 mUDV+RgK0A4c5MafPh7Ky3z4n1vO7RQvyw==
X-Google-Smtp-Source: AA6agR7iMbpNDLKP3PwScgr7ZD8oR2TdLhP1SRh4zKPh7rWtQ95QR2rL6D8X3hKgvoHD8nXcVRuZTQ==
X-Received: by 2002:a05:600c:20f:b0:3a5:a785:7f2a with SMTP id
 15-20020a05600c020f00b003a5a7857f2amr2664021wmi.94.1661270662334; 
 Tue, 23 Aug 2022 09:04:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056000181b00b0022549ac786asm9152241wrh.47.2022.08.23.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 09:04:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
Subject: [PATCH 2/2] target/arm: Make boards pass base address to
 armv7m_load_kernel()
Date: Tue, 23 Aug 2022 17:04:17 +0100
Message-Id: <20220823160417.3858216-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823160417.3858216-1-peter.maydell@linaro.org>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently armv7m_load_kernel() takes the size of the block of memory
where it should load the initial guest image, but assumes that it
should always load it at address 0.  This happens to be true of all
our M-profile boards at the moment, but it isn't guaranteed to always
be so: M-profile CPUs can be configured (via init-svtor and
init-nsvtor, which match equivalent hardware configuration signals)
to have the initial vector table at any address, not just zero.  (For
instance the Teeny board has the boot ROM at address 0x0200_0000.)

Add a base address argument to armv7m_load_kernel(), so that
callers now pass in both base address and size. All the current
callers pass 0, so this is not a behaviour change.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I thought about having armv7m_load_kernel() be "clever" and ask the
CPU what init-svtor/init-nsvtor were set to, but that seems like it
might have unanticipated consequences.  "Just pass the base address"
is simpler and is how A-profile does it (though for A-profile it's
the loader_start field in struct arm_boot_info rather than an
extra argument).
---
 include/hw/arm/boot.h     | 5 ++++-
 hw/arm/armv7m.c           | 5 +++--
 hw/arm/aspeed.c           | 1 +
 hw/arm/microbit.c         | 2 +-
 hw/arm/mps2-tz.c          | 2 +-
 hw/arm/mps2.c             | 2 +-
 hw/arm/msf2-som.c         | 2 +-
 hw/arm/musca.c            | 3 ++-
 hw/arm/netduino2.c        | 2 +-
 hw/arm/netduinoplus2.c    | 2 +-
 hw/arm/stellaris.c        | 2 +-
 hw/arm/stm32vldiscovery.c | 2 +-
 12 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index c7ebae156ec..f18cc3064ff 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -25,13 +25,16 @@ typedef enum {
  * armv7m_load_kernel:
  * @cpu: CPU
  * @kernel_filename: file to load
+ * @mem_base: base address to load image at (should be where the
+ *            CPU expects to find its vector table on reset)
  * @mem_size: mem_size: maximum image size to load
  *
  * Load the guest image for an ARMv7M system. This must be called by
  * any ARMv7M board. (This is necessary to ensure that the CPU resets
  * correctly on system reset, as well as for kernel loading.)
  */
-void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
+void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename,
+                        hwaddr mem_base, int mem_size);
 
 /* arm_boot.c */
 struct arm_boot_info {
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index fa4c2c735da..50a9507c0bd 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -568,7 +568,8 @@ static void armv7m_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
+void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename,
+                        hwaddr mem_base, int mem_size)
 {
     ssize_t image_size;
     uint64_t entry;
@@ -588,7 +589,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
                                  &entry, NULL, NULL,
                                  NULL, 0, EM_ARM, 1, 0, as);
         if (image_size < 0) {
-            image_size = load_image_targphys_as(kernel_filename, 0,
+            image_size = load_image_targphys_as(kernel_filename, mem_base,
                                                 mem_size, as);
         }
         if (image_size < 0) {
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b3bbe06f8fa..bc3ecdb6199 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1430,6 +1430,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
                        machine->kernel_filename,
+                       0,
                        AST1030_INTERNAL_FLASH_SIZE);
 }
 
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index e9494334ce7..50df3620882 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -57,7 +57,7 @@ static void microbit_init(MachineState *machine)
                                         mr, -1);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       s->nrf51.flash_size);
+                       0, s->nrf51.flash_size);
 }
 
 static void microbit_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 4017392bf5a..394192b9b20 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1197,7 +1197,7 @@ static void mps2tz_common_init(MachineState *machine)
     }
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       boot_ram_size(mms));
+                       0, boot_ram_size(mms));
 }
 
 static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index bb76fa68890..a86a994dbac 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -450,7 +450,7 @@ static void mps2_common_init(MachineState *machine)
                                   mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       0x400000);
+                       0, 0x400000);
 }
 
 static void mps2_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index d9f881690e0..a6df473ec90 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -98,7 +98,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       soc->envm_size);
+                       0, soc->envm_size);
 }
 
 static void emcraft_sf2_machine_init(MachineClass *mc)
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 7a83f7dda7d..6eeee57c9dd 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -597,7 +597,8 @@ static void musca_init(MachineState *machine)
                                                      "cfg_sec_resp", 0));
     }
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x2000000);
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       0, 0x2000000);
 }
 
 static void musca_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 3365da11bf7..83753d53a3f 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -49,7 +49,7 @@ static void netduino2_init(MachineState *machine)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       FLASH_SIZE);
+                       0, FLASH_SIZE);
 }
 
 static void netduino2_machine_init(MachineClass *mc)
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 76cea8e4891..515c0816054 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -50,7 +50,7 @@ static void netduinoplus2_init(MachineState *machine)
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
                        machine->kernel_filename,
-                       FLASH_SIZE);
+                       0, FLASH_SIZE);
 }
 
 static void netduinoplus2_machine_init(MachineClass *mc)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 12c673c9172..a9e96c37f89 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1302,7 +1302,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
     create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, flash_size);
+    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, 0, flash_size);
 }
 
 /* FIXME: Figure out how to generate these from stellaris_boards.  */
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 04036da3ee0..67675e952fc 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -53,7 +53,7 @@ static void stm32vldiscovery_init(MachineState *machine)
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
                        machine->kernel_filename,
-                       FLASH_SIZE);
+                       0, FLASH_SIZE);
 }
 
 static void stm32vldiscovery_machine_init(MachineClass *mc)
-- 
2.25.1


