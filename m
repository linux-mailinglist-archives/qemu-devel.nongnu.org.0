Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134725B892F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:31:19 +0200 (CEST)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSU1-00026f-8D
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwj-0000kp-79
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwZ-00009B-JD
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id bz13so25313952wrb.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Wl2zuZCkpWsrqwmY/y35zPau0OJUQvZb8wKw4Kz7SNs=;
 b=n/HYBfJi39anBz+NUXM8lEebVSQL+cy+3AGGZ1df+a4f94suh8SgMUvGAQcUFvfGLY
 MDiP0/YN5IRYe6VZyW17ERqZtcIGIJdnq+/y0Ym6YElLG8uTCeCtHBKpL7Rq+QGrp2Ut
 6UYdT2A9HyOVjhMhkO8npDulMcTI527Wb/sg3kiWTKrkbTNRhfycoBNHGeojZsNhXgmV
 c+FkJp28+0DhfCisEjX4Qu04UvOYeUm50tDceKfxejd2Y2O1P6ibKpVRk2D2YAPcbwza
 ApYe9ttyvj0jPPxfmkKAbs0ShtU3G22QNJoZmOldCeLMaLW2ShDWP4Ow2O1cOBmlMaUk
 CSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Wl2zuZCkpWsrqwmY/y35zPau0OJUQvZb8wKw4Kz7SNs=;
 b=byPwzrtzK98bvohYyocGdtTHCzo6NfyyvEkrmU/5fPdF3aHJdhxACyKMF9fTqmt9Fg
 Nyf7MdthCILxOsRWrJ1XBZsADxR8E0Eah5liymSHBse3PJTWQcmeKF5Adw9BrOe0VYuF
 cFWkv8EWGW9dACHa5OWlO2jzIqKcfFaZVRC6VDhL8cw7Xb4DbqYQo53eGzBDsxZRs0QF
 blS3aoljAW90Guj4NWtLrEjOHnj2TqsQaPGGnAbNwzg+7/xL4HsaU079XfYq990pQVdC
 YxxQtvWl4Q6/UHOrsPtrzZWvanbrAFqV8ZrkgcZm2iETZ36NuTgfp9tWGQar0Tkk0tTg
 EMGA==
X-Gm-Message-State: ACgBeo1cRfIJ/EQggMEyyKNSQrxgu2t5WGoNuZdTriwkHOPBu/mteHoR
 AIkv7W0Jp819RtkD4GKYDZhUvYcl9Cx2yZ6+
X-Google-Smtp-Source: AA6agR5fKsU1FY3e5Ni/80AqauhC/48fRBFvb4C8Zw8ZI0pYWCbH3QzO4zLj2DlKZ3+4QQD9e/MElQ==
X-Received: by 2002:a05:6000:681:b0:22a:3007:df45 with SMTP id
 bo1-20020a056000068100b0022a3007df45mr17042884wrb.149.1663156358105; 
 Wed, 14 Sep 2022 04:52:38 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 20/20] target/arm: Make boards pass base address to
 armv7m_load_kernel()
Date: Wed, 14 Sep 2022 12:52:17 +0100
Message-Id: <20220914115217.117532-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220823160417.3858216-3-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index c7ebae156e..f18cc3064f 100644
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
index fa4c2c735d..50a9507c0b 100644
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
index b3bbe06f8f..bc3ecdb619 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1430,6 +1430,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
                        machine->kernel_filename,
+                       0,
                        AST1030_INTERNAL_FLASH_SIZE);
 }
 
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index e9494334ce..50df362088 100644
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
index 4017392bf5..394192b9b2 100644
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
index bb76fa6889..a86a994dba 100644
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
index d9f881690e..a6df473ec9 100644
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
index 7a83f7dda7..6eeee57c9d 100644
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
index 3365da11bf..83753d53a3 100644
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
index 76cea8e489..515c081605 100644
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
index 12c673c917..a9e96c37f8 100644
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
index 04036da3ee..67675e952f 100644
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
2.34.1


