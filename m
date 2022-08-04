Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D7589570
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 02:47:39 +0200 (CEST)
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJP1W-0005ym-8Z
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 20:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJOye-00048j-Da
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 20:44:40 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:55576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJOyO-0005FK-RL
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 20:44:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8FD7B82432;
 Thu,  4 Aug 2022 00:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C85C433D6;
 Thu,  4 Aug 2022 00:44:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Qsxz7cCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659573856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eb+IyzaQ5UhVR8gB4ToJNUcKL3HcRYomTlc/B/MZLvM=;
 b=Qsxz7cCGKMbYV46764/Na7zejpPHIZUvHY04F6xa5LJP9AkGe6Io5E2NUkRzd+LrxVuXSi
 W7LvZZoMewYuEu27Wqmp23UxG4CUZ3E2TOmYFDde58JbmLDs2hu2hNiddjGa6NF+gneU4V
 0zTu9v3M2p8Qn+QKTRkRufQhCn3cAXI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 439ebe31
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 00:44:16 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
Subject: [PATCH v2] hw/i386: place setup_data at fixed place in memory
Date: Thu,  4 Aug 2022 02:44:11 +0200
Message-Id: <20220804004411.1343158-1-Jason@zx2c4.com>
In-Reply-To: <YusVVLNbLgsk49PK@zx2c4.com>
References: <YusVVLNbLgsk49PK@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

The boot parameter header refers to setup_data at an absolute address,
and each setup_data refers to the next setup_data at an absolute address
too. Currently QEMU simply puts the setup_datas right after the kernel
image, and since the kernel_image is loaded at prot_addr -- a fixed
address knowable to QEMU apriori -- the setup_data absolute address
winds up being just `prot_addr + a_fixed_offset_into_kernel_image`.

This mostly works fine, so long as the kernel image really is loaded at
prot_addr. However, OVMF doesn't load the kernel at prot_addr, and
generally EFI doesn't give a good way of predicting where it's going to
load the kernel. So when it loads it at some address != prot_addr, the
absolute addresses in setup_data now point somewhere bogus, causing
crashes when EFI stub tries to follow the next link.

Fix this by placing setup_data at some fixed place in memory, relative
to real_addr, not as part of the kernel image, and then pointing the
setup_data absolute address to that fixed place in memory. This way,
even if OVMF or other chains relocate the kernel image, the boot
parameter still points to the correct absolute address.

Fixes: 3cbeb52467 ("hw/i386: add device tree support")
Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..8b853abf38 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -760,36 +760,36 @@ static bool load_elfboot(const char *kernel_filename,
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, pvh_start_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, mh_load_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, elf_kernel_size);
 
     return true;
 }
 
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
                     bool pvh_enabled,
                     bool legacy_no_rng_seed)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
     int setup_size, kernel_size, cmdline_size;
-    int dtb_size, setup_data_offset;
+    int dtb_size, setup_data_item_len, setup_data_total_len = 0;
     uint32_t initrd_max;
-    uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
+    uint8_t header[8192], *setup, *kernel, *setup_datas = NULL;
+    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0, setup_data_base;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
     struct setup_data *setup_data;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
     enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
 
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
@@ -886,32 +886,33 @@ void x86_load_linux(X86MachineState *x86ms,
     if (protocol < 0x200 || !(header[0x211] & 0x01)) {
         /* Low kernel */
         real_addr    = 0x90000;
         cmdline_addr = 0x9a000 - cmdline_size;
         prot_addr    = 0x10000;
     } else if (protocol < 0x202) {
         /* High but ancient kernel */
         real_addr    = 0x90000;
         cmdline_addr = 0x9a000 - cmdline_size;
         prot_addr    = 0x100000;
     } else {
         /* High and recent kernel */
         real_addr    = 0x10000;
         cmdline_addr = 0x20000;
         prot_addr    = 0x100000;
     }
+    setup_data_base = real_addr + 0x8000;
 
     /* highest address for loading the initrd */
     if (protocol >= 0x20c &&
         lduw_p(header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
         /*
          * Linux has supported initrd up to 4 GB for a very long time (2007,
          * long before XLF_CAN_BE_LOADED_ABOVE_4G which was added in 2013),
          * though it only sets initrd_max to 2 GB to "work around bootloader
          * bugs". Luckily, QEMU firmware(which does something like bootloader)
          * has supported this.
          *
          * It's believed that if XLF_CAN_BE_LOADED_ABOVE_4G is set, initrd can
          * be loaded into any address.
          *
          * In addition, initrd_max is uint32_t simply because QEMU doesn't
          * support the 64-bit boot protocol (specifically the ext_ramdisk_image
@@ -1049,60 +1050,61 @@ void x86_load_linux(X86MachineState *x86ms,
     fclose(f);
 
     /* append dtb to kernel */
     if (dtb_filename) {
         if (protocol < 0x209) {
             fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
             exit(1);
         }
 
         dtb_size = get_image_size(dtb_filename);
         if (dtb_size <= 0) {
             fprintf(stderr, "qemu: error reading dtb %s: %s\n",
                     dtb_filename, strerror(errno));
             exit(1);
         }
 
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
-        kernel = g_realloc(kernel, kernel_size);
-
-
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data_item_len = sizeof(struct setup_data) + dtb_size;
+        setup_datas = g_realloc(setup_datas, setup_data_total_len + setup_data_item_len);
+        setup_data = (struct setup_data *)(setup_datas + setup_data_total_len);
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
+        first_setup_data = setup_data_base + setup_data_total_len;
+        setup_data_total_len += setup_data_item_len;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
-
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
     if (!legacy_no_rng_seed) {
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
-        kernel = g_realloc(kernel, kernel_size);
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data_item_len = sizeof(struct setup_data) + RNG_SEED_LENGTH;
+        setup_datas = g_realloc(setup_datas, setup_data_total_len + setup_data_item_len);
+        setup_data = (struct setup_data *)(setup_datas + setup_data_total_len);
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
+        first_setup_data = setup_data_base + setup_data_total_len;
+        setup_data_total_len += setup_data_item_len;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
     }
 
-    /* Offset 0x250 is a pointer to the first setup_data link. */
-    stq_p(header + 0x250, first_setup_data);
+    if (first_setup_data) {
+            /* Offset 0x250 is a pointer to the first setup_data link. */
+            stq_p(header + 0x250, first_setup_data);
+            rom_add_blob("setup_data", setup_datas, setup_data_total_len, setup_data_total_len,
+                         setup_data_base, NULL, NULL, NULL, NULL, false);
+    }
 
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
      * efi stub for booting and doesn't require any values to be placed in the
      * kernel header.  We therefore don't update the header so the hash of the
      * kernel on the other side of the fw_cfg interface matches the hash of the
      * file the user passed in.
      */
     if (!sev_enabled()) {
         memcpy(setup, header, MIN(sizeof(header), setup_size));
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
-- 
2.35.1


