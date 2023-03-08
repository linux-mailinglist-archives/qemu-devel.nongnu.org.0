Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FE6B0F88
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8W-0004mk-QI; Wed, 08 Mar 2023 11:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8G-0004XZ-A4; Wed, 08 Mar 2023 11:59:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8D-00045d-VP; Wed, 08 Mar 2023 11:59:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6A4124010A;
 Wed,  8 Mar 2023 19:58:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 1D3CA92;
 Wed,  8 Mar 2023 19:58:36 +0300 (MSK)
Received: (nullmailer pid 2098342 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 32/47] Revert "hw/i386: pass RNG seed via setup_data entry"
Date: Wed,  8 Mar 2023 19:57:35 +0300
Message-Id: <20230308165815.2098148-32-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Michael S. Tsirkin" <mst@redhat.com>

This reverts commit 67f7e426e53833a5db75b0d813e8d537b8a75bd2.

Additionally to the automatic revert, I went over the code
and dropped all mentions of legacy_no_rng_seed manually,
effectively reverting a combination of 2 additional commits:

    commit ffe2d2382e5f1aae1abc4081af407905ef380311
    Author: Jason A. Donenfeld <Jason@zx2c4.com>
    Date:   Wed Sep 21 11:31:34 2022 +0200

        x86: re-enable rng seeding via SetupData

    commit 3824e25db1a84fadc50b88dfbe27047aa2f7f85d
    Author: Gerd Hoffmann <kraxel@redhat.com>
    Date:   Wed Aug 17 10:39:40 2022 +0200

        x86: disable rng seeding via setup_data

Fixes: 67f7e426e5 ("hw/i386: pass RNG seed via setup_data entry")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit 167f4873580d3729565044cda73c3e20997950f2)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Mjt: this required manual edit for stable-7.2
---
 hw/i386/microvm.c     |  2 +-
 hw/i386/pc.c          |  4 ++--
 hw/i386/pc_piix.c     |  2 --
 hw/i386/pc_q35.c      |  2 --
 hw/i386/x86.c         | 26 ++++----------------------
 include/hw/i386/pc.h  |  3 ---
 include/hw/i386/x86.h |  3 +--
 7 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 170a331e3f..b231ceda9a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -330,7 +330,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, false);
+        x86_load_linux(x86ms, fw_cfg, 0, true);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 546b703cb4..ec5a10534b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -799,7 +799,7 @@ void xen_load_linux(PCMachineState *pcms)
     rom_set_fw(fw_cfg);
 
     x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                   pcmc->pvh_enabled);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -1119,7 +1119,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     if (linux_boot) {
         x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                       pcmc->pvh_enabled);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed1603..24616bf924 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -449,11 +449,9 @@ DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
 
 static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_2_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
-    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a496bd6e74..f522874add 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -383,10 +383,8 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
 
 static void pc_q35_7_1_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
     m->alias = NULL;
-    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4831193c86..80be3032cc 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -26,7 +26,6 @@
 #include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
-#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
@@ -771,8 +770,7 @@ static bool load_elfboot(const char *kernel_filename,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed)
+                    bool pvh_enabled)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
@@ -780,7 +778,7 @@ void x86_load_linux(X86MachineState *x86ms,
     int dtb_size, setup_data_offset;
     uint32_t initrd_max;
     uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
+    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
@@ -790,7 +788,6 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
-    enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1070,31 +1067,16 @@ void x86_load_linux(X86MachineState *x86ms,
         kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
+        stq_p(header + 0x250, prot_addr + setup_data_offset);
 
         setup_data = (struct setup_data *)(kernel + setup_data_offset);
-        setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
+        setup_data->next = 0;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
 
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed) {
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
-        kernel = g_realloc(kernel, kernel_size);
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
-        setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
-        setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
-        setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
-        qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-    }
-
-    /* Offset 0x250 is a pointer to the first setup_data link. */
-    stq_p(header + 0x250, first_setup_data);
-
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
      * efi stub for booting and doesn't require any values to be placed in the
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c95333514e..0c76e82626 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -128,9 +128,6 @@ struct PCMachineClass {
 
     /* create kvmclock device even when KVM PV features are not exposed */
     bool kvmclock_create_always;
-
-    /* skip passing an rng seed for legacy machines */
-    bool legacy_no_rng_seed;
 };
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f8..df82c5fd42 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -126,8 +126,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed);
+                    bool pvh_enabled);
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
-- 
2.30.2


