Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F43926D4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:24:09 +0200 (CEST)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8V6-0002Zc-E3
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lm8Se-0008KW-Ep
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:36 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:58635)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lm8Sc-00067C-2a
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:36 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 1EE1C11D3D0;
 Thu, 27 May 2021 14:21:33 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (y245018.dynamic.ppp.asahi-net.or.jp [118.243.245.18])
 by sakura.ysato.name (Postfix) with ESMTPSA id C36801C060B;
 Thu, 27 May 2021 14:21:32 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] hw/rx: rx-gdbsim Add bootstrup for linux
Date: Thu, 27 May 2021 14:21:22 +0900
Message-Id: <20210527052122.97103-12-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527052122.97103-1-ysato@users.sourceforge.jp>
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.13;
 envelope-from=ysato@users.sourceforge.jp; helo=mail01.asahi-net.or.jp
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux kernel require initializing some peripherals.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/rx/rx62n.h | 16 ++++----
 hw/rx/rx-gdbsim.c     | 89 +++++++++++++++++++++++++------------------
 hw/rx/rx62n.c         | 15 --------
 3 files changed, 59 insertions(+), 61 deletions(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 942ed0639f..3bbeb5da52 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -33,14 +33,6 @@
 #include "qemu/units.h"
 #include "qom/object.h"
 
-#define TYPE_RX62N_MCU "rx62n-mcu"
-typedef struct RX62NState RX62NState;
-DECLARE_INSTANCE_CHECKER(RX62NState, RX62N_MCU,
-                         TYPE_RX62N_MCU)
-
-#define TYPE_R5F562N7_MCU "r5f562n7-mcu"
-#define TYPE_R5F562N8_MCU "r5f562n8-mcu"
-
 #define EXT_CS_BASE         0x01000000
 #define VECTOR_TABLE_BASE   0xffffff80
 #define RX62N_CFLASH_BASE   0xfff80000
@@ -49,7 +41,7 @@ DECLARE_INSTANCE_CHECKER(RX62NState, RX62N_MCU,
 #define RX62N_NR_CMT    2
 #define RX62N_NR_SCI    6
 
-struct RX62NState {
+typedef struct RX62NState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -75,5 +67,11 @@ struct RX62NState {
     uint32_t xtal_freq_hz;
 } RX62NState;
 
+#define TYPE_RX62N_MCU "rx62n-mcu"
+
+#define TYPE_R5F562N7_MCU "r5f562n7-mcu"
+#define TYPE_R5F562N8_MCU "r5f562n8-mcu"
+DECLARE_INSTANCE_CHECKER(RX62NState, RX62N_MCU,
+                         TYPE_RX62N_MCU)
 
 #endif
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 75d1fec6ca..34705d953b 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -31,14 +31,16 @@
 /* Same address of GDB integrated simulator */
 #define SDRAM_BASE  EXT_CS_BASE
 
+typedef struct RxGdbSimMachineClass RxGdbSimMachineClass;
+
 struct RxGdbSimMachineClass {
     /*< private >*/
     MachineClass parent_class;
     /*< public >*/
     const char *mcu_name;
     uint32_t xtal_freq_hz;
+    size_t romsize;
 };
-typedef struct RxGdbSimMachineClass RxGdbSimMachineClass;
 
 struct RxGdbSimMachineState {
     /*< private >*/
@@ -54,26 +56,50 @@ DECLARE_OBJ_CHECKERS(RxGdbSimMachineState, RxGdbSimMachineClass,
                      RX_GDBSIM_MACHINE, TYPE_RX_GDBSIM_MACHINE)
 
 
-static void rx_load_image(RXCPU *cpu, const char *filename,
-                          uint32_t start, uint32_t size)
+#define TINYBOOT_TOP (0xffffff00)
+
+static void set_bootstrap(hwaddr entry, hwaddr dtb)
 {
-    static uint32_t extable[32];
-    long kernel_size;
+    /* Minimal hardware initialize for kernel requirement */
+    /* linux kernel only works little-endian mode */
+    static uint8_t tinyboot[256] = {
+        0xfb, 0x2e, 0x20, 0x00, 0x08,       /* mov.l #0x80020, r2 */
+        0xf8, 0x2e, 0x00, 0x01, 0x01,       /* mov.l #0x00010100, [r2] */
+        0xfb, 0x2e, 0x10, 0x00, 0x08,       /* mov.l #0x80010, r2 */
+        0xf8, 0x22, 0xdf, 0x7d, 0xff, 0xff, /* mov.l #0xffff7ddf, [r2] */
+        0x62, 0x42,                         /* add #4, r2 */
+        0xf8, 0x22, 0xff, 0x7f, 0xff, 0x7f, /* mov.l #0x7fff7fff, [r2] */
+        0xfb, 0x2e, 0x40, 0x82, 0x08,       /* mov.l #0x88240, r2 */
+        0x3c, 0x22, 0x00,                   /* mov.b #0, 2[r2] */
+        0x3c, 0x21, 0x4e,                   /* mov.b #78, 1[r2] */
+        0xfb, 0x22, 0x70, 0xff, 0xff, 0xff, /* mov.l #0xffffff70, r2 */
+        0xec, 0x21,                         /* mov.l [r2], r1 */
+        0xfb, 0x22, 0x74, 0xff, 0xff, 0xff, /* mov.l #0xffffff74, r2 */
+        0xec, 0x22,                         /* mov.l [r2], r2 */
+        0x7f, 0x02,                         /* jmp r2 */
+    };
     int i;
 
+    *((uint32_t *)&tinyboot[0x70]) = cpu_to_le32(dtb);
+    *((uint32_t *)&tinyboot[0x74]) = cpu_to_le32(entry);
+
+    /* setup exception trap trampoline */
+    for (i = 0; i < 31; i++) {
+        *((uint32_t *)&tinyboot[0x80 + i * 4]) = cpu_to_le32(0x10 + i * 4);
+    }
+    *((uint32_t *)&tinyboot[0xfc]) = cpu_to_le32(TINYBOOT_TOP);
+    rom_add_blob_fixed("tinyboot", tinyboot, sizeof(tinyboot), TINYBOOT_TOP);
+}
+
+static void load_kernel(const char *filename, uint32_t start, uint32_t size)
+{
+    long kernel_size;
+
     kernel_size = load_image_targphys(filename, start, size);
     if (kernel_size < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n", filename);
         exit(1);
     }
-    cpu->env.pc = start;
-
-    /* setup exception trap trampoline */
-    /* linux kernel only works little-endian mode */
-    for (i = 0; i < ARRAY_SIZE(extable); i++) {
-        extable[i] = cpu_to_le32(0x10 + i * 4);
-    }
-    rom_add_blob_fixed("extable", extable, sizeof(extable), VECTOR_TABLE_BASE);
 }
 
 static void rx_gdbsim_init(MachineState *machine)
@@ -101,33 +127,15 @@ static void rx_gdbsim_init(MachineState *machine)
                              &error_abort);
     object_property_set_uint(OBJECT(&s->mcu), "xtal-frequency-hz",
                              rxc->xtal_freq_hz, &error_abort);
-    object_property_set_bool(OBJECT(&s->mcu), "load-kernel",
-                             kernel_filename != NULL, &error_abort);
-
-    if (!kernel_filename) {
-        if (machine->firmware) {
-            rom_add_file_fixed(machine->firmware, RX62N_CFLASH_BASE, 0);
-        } else if (!qtest_enabled()) {
-            error_report("No bios or kernel specified");
-            exit(1);
-        }
-    }
-
-    qdev_realize(DEVICE(&s->mcu), NULL, &error_abort);
-
     /* Load kernel and dtb */
     if (kernel_filename) {
         ram_addr_t kernel_offset;
-
-        /*
-         * The kernel image is loaded into
-         * the latter half of the SDRAM space.
-         */
+        ram_addr_t dtb_offset = 0;
         kernel_offset = machine->ram_size / 2;
-        rx_load_image(RX_CPU(first_cpu), kernel_filename,
-                      SDRAM_BASE + kernel_offset, kernel_offset);
+
+        load_kernel(machine->kernel_filename,
+                    SDRAM_BASE + kernel_offset, kernel_offset);
         if (dtb_filename) {
-            ram_addr_t dtb_offset;
             int dtb_size;
             g_autofree void *dtb = load_device_tree(dtb_filename, &dtb_size);
 
@@ -145,10 +153,17 @@ static void rx_gdbsim_init(MachineState *machine)
             dtb_offset = machine->ram_size - dtb_size;
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
-            /* Set dtb address to R1 */
-            RX_CPU(first_cpu)->env.regs[1] = SDRAM_BASE + dtb_offset;
+        }
+        set_bootstrap(SDRAM_BASE + kernel_offset, SDRAM_BASE + dtb_offset);
+    } else {
+        if (machine->firmware) {
+            rom_add_file_fixed(machine->firmware, RX62N_CFLASH_BASE, 0);
+        } else if (!qtest_enabled()) {
+            error_report("No bios or kernel specified");
+            exit(1);
         }
     }
+    qdev_realize(DEVICE(&s->mcu), NULL, &error_abort);
 }
 
 static void rx_gdbsim_class_init(ObjectClass *oc, void *data)
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 58eff0b4a3..d84ffa148c 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -58,20 +58,6 @@
 #define RX62N_XTAL_MIN_HZ  (8 * 1000 * 1000)
 #define RX62N_XTAL_MAX_HZ (14 * 1000 * 1000)
 
-struct RX62NClass {
-    /*< private >*/
-    DeviceClass parent_class;
-    /*< public >*/
-    const char *name;
-    uint64_t ram_size;
-    uint64_t rom_flash_size;
-    uint64_t data_flash_size;
-};
-typedef struct RX62NClass RX62NClass;
-
-DECLARE_CLASS_CHECKERS(RX62NClass, RX62N_MCU,
-                       TYPE_RX62N_MCU)
-
 /*
  * IRQ -> IPR mapping table
  * 0x00 - 0x91: IPR no (IPR00 to IPR91)
@@ -281,7 +267,6 @@ static void rx62n_realize(DeviceState *dev, Error **errp)
 static Property rx62n_properties[] = {
     DEFINE_PROP_LINK("main-bus", RX62NState, sysmem, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_BOOL("load-kernel", RX62NState, kernel, false),
     DEFINE_PROP_UINT32("xtal-frequency-hz", RX62NState, xtal_freq_hz, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.20.1


