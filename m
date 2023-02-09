Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF62690E25
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:16:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9aX-0000Ns-4o; Thu, 09 Feb 2023 11:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ9aT-0000NF-59
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:15:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ9aP-0002Gk-5x
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675959348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SjrrmDsazWS25tib6h7foygVztHGc7w4kmdfPJY6DgA=;
 b=JkJJqADRzKDNPVt2YeT31FpBEgg3cmm/IUfs9r/rHcOwtjHclICk9zbmDOPB1EA6rPdOf4
 xmXDpqdCl4WQVQ2UgDf2JOcIxuRFAhzg5ecV7aXQDoSwmO4fNCN02cED4JX4lHFxYse109
 RTJsV44w1sZbVwOtjHwp5OLlMl6ezxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-QaBk_LTPMNWtpbfs4ptu3Q-1; Thu, 09 Feb 2023 11:15:44 -0500
X-MC-Unique: QaBk_LTPMNWtpbfs4ptu3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D8158027FD;
 Thu,  9 Feb 2023 16:15:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 633C01121314;
 Thu,  9 Feb 2023 16:15:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] hw/misc/sga: Remove the deprecated "sga" device
Date: Thu,  9 Feb 2023 17:15:40 +0100
Message-Id: <20230209161540.1054669-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It's been deprecated since QEMU v6.2, so it should be OK to
finally remove this now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                         |   1 -
 docs/about/deprecated.rst           |   9 ----
 docs/about/removed-features.rst     |  10 ++++
 hw/misc/sga.c                       |  71 ----------------------------
 .gitmodules                         |   3 --
 hw/i386/Kconfig                     |   1 -
 hw/misc/Kconfig                     |   4 --
 hw/misc/meson.build                 |   1 -
 pc-bios/README                      |   6 ---
 pc-bios/meson.build                 |   1 -
 pc-bios/sgabios.bin                 | Bin 4096 -> 0 bytes
 roms/Makefile                       |   9 +---
 roms/sgabios                        |   1 -
 tests/migration/guestperf/engine.py |   2 +-
 14 files changed, 12 insertions(+), 107 deletions(-)
 delete mode 100644 hw/misc/sga.c
 delete mode 100644 pc-bios/sgabios.bin
 delete mode 160000 roms/sgabios

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..fd54c1f140 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1676,7 +1676,6 @@ F: hw/acpi/piix4.c
 F: hw/acpi/ich9*.c
 F: include/hw/acpi/ich9*.h
 F: include/hw/southbridge/piix.h
-F: hw/misc/sga.c
 F: hw/isa/apm.c
 F: include/hw/isa/apm.h
 F: tests/unit/test-x86-cpuid.c
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index da2e6fe63d..641d7d41ec 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -246,15 +246,6 @@ full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
 Note this also applies to ``-device virtio-blk-pci,scsi=on|off``, which is an
 alias.
 
-``-device sga`` (since 6.2)
-^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-The ``sga`` device loads an option ROM for x86 targets which enables
-SeaBIOS to send messages to the serial console. SeaBIOS 1.11.0 onwards
-contains native support for this feature and thus use of the option
-ROM approach is obsolete. The native SeaBIOS support can be activated
-by using ``-machine graphics=off``.
-
 ``-device nvme-ns,eui64-default=on|off`` (since 7.1)
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index a17d0554d6..4a84e6174f 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -789,6 +789,16 @@ The 'ide-drive' device has been removed. Users should use 'ide-hd' or
 The 'scsi-disk' device has been removed. Users should use 'scsi-hd' or
 'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
 
+``sga`` (removed in 8.0)
+''''''''''''''''''''''''
+
+The ``sga`` device loaded an option ROM for x86 targets which enabled
+SeaBIOS to send messages to the serial console. SeaBIOS 1.11.0 onwards
+contains native support for this feature and thus use of the option
+ROM approach was obsolete. The native SeaBIOS support can be activated
+by using ``-machine graphics=off``.
+
+
 Related binaries
 ----------------
 
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
deleted file mode 100644
index 1d04672b01..0000000000
--- a/hw/misc/sga.c
+++ /dev/null
@@ -1,71 +0,0 @@
-/*
- * QEMU dummy ISA device for loading sgabios option rom.
- *
- * Copyright (c) 2011 Glauber Costa, Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- *
- * sgabios code originally available at code.google.com/p/sgabios
- *
- */
-
-#include "qemu/osdep.h"
-#include "hw/isa/isa.h"
-#include "hw/loader.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-#include "qemu/error-report.h"
-
-#define SGABIOS_FILENAME "sgabios.bin"
-
-#define TYPE_SGA "sga"
-OBJECT_DECLARE_SIMPLE_TYPE(ISASGAState, SGA)
-
-struct ISASGAState {
-    ISADevice parent_obj;
-};
-
-static void sga_realizefn(DeviceState *dev, Error **errp)
-{
-    warn_report("-device sga is deprecated, use -machine graphics=off");
-    rom_add_vga(SGABIOS_FILENAME);
-}
-
-static void sga_class_initfn(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
-    dc->realize = sga_realizefn;
-    dc->desc = "Serial Graphics Adapter";
-}
-
-static const TypeInfo sga_info = {
-    .name          = TYPE_SGA,
-    .parent        = TYPE_ISA_DEVICE,
-    .instance_size = sizeof(ISASGAState),
-    .class_init    = sga_class_initfn,
-};
-
-static void sga_register_types(void)
-{
-    type_register_static(&sga_info);
-}
-
-type_init(sga_register_types)
diff --git a/.gitmodules b/.gitmodules
index 24cffa87d4..6ce5bf49c5 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -13,9 +13,6 @@
 [submodule "roms/qemu-palcode"]
 	path = roms/qemu-palcode
 	url = https://gitlab.com/qemu-project/qemu-palcode.git
-[submodule "roms/sgabios"]
-	path = roms/sgabios
-	url = https://gitlab.com/qemu-project/sgabios.git
 [submodule "dtc"]
 	path = dtc
 	url = https://gitlab.com/qemu-project/dtc.git
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 1bf47b0b0b..9fbfe748b5 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -26,7 +26,6 @@ config PC
     imply QXL
     imply SEV
     imply SGX
-    imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
     imply TPM_TIS_ISA
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index eaeddca277..2ef5781ef8 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -15,10 +15,6 @@ config ISA_DEBUG
     bool
     depends on ISA_BUS
 
-config SGA
-    bool
-    depends on ISA_BUS
-
 config ISA_TESTDEV
     bool
     default y if TEST_DEVICES
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 448e14b531..fe869b98ca 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -5,7 +5,6 @@ softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
 softmmu_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
-softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
diff --git a/pc-bios/README b/pc-bios/README
index b94f3fb081..3702ed485c 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -20,12 +20,6 @@
   -machine pseries,x-vof=on. When enabled, the firmware acts as a slim shim and
   QEMU implements parts of the IEEE 1275 Open Firmware interface.
 
-- sgabios (the Serial Graphics Adapter option ROM) provides a means for
-  legacy x86 software to communicate with an attached serial console as
-  if a video card were attached.  The master sources reside in a subversion
-  repository at http://sgabios.googlecode.com/svn/trunk.  A git mirror is
-  available at https://gitlab.com/qemu-project/sgabios.git.
-
 - The PXE roms come from the iPXE project. Built with BANNER_TIME 0.
   Sources available at http://ipxe.org.  Vendor:Device ID -> ROM mapping:
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 388e0db6e4..a7224ef469 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -28,7 +28,6 @@ blobs = [
   'bios-256k.bin',
   'bios-microvm.bin',
   'qboot.rom',
-  'sgabios.bin',
   'vgabios.bin',
   'vgabios-cirrus.bin',
   'vgabios-stdvga.bin',
diff --git a/pc-bios/sgabios.bin b/pc-bios/sgabios.bin
deleted file mode 100644
index 6308f2e2d7064b52ff3c2e207b71018710866c05..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 4096
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

diff --git a/roms/Makefile b/roms/Makefile
index 5e44d97890..955f92286d 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -57,7 +57,6 @@ default help:
 	@echo "available build targets:"
 	@echo "  bios               -- update bios.bin (seabios)"
 	@echo "  vgabios            -- update vgabios binaries (seabios)"
-	@echo "  sgabios            -- update sgabios binaries"
 	@echo "  pxerom             -- update nic roms (bios only)"
 	@echo "  efirom             -- update nic roms (bios+efi)"
 	@echo "  slof               -- update slof.bin"
@@ -102,11 +101,7 @@ build-seabios-config-%: config.%
 		OUT=$(CURDIR)/seabios/builds/$*/ all
 
 
-.PHONY: sgabios skiboot qboot
-sgabios:
-	$(MAKE) -C sgabios
-	cp sgabios/sgabios.bin ../pc-bios
-
+.PHONY: skiboot qboot
 
 pxerom: $(patsubst %,pxe-rom-%,$(pxerom_variants))
 
@@ -199,8 +194,6 @@ npcm7xx_bootrom:
 
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
-	$(MAKE) -C sgabios clean
-	rm -f sgabios/.depend
 	$(MAKE) -C ipxe/src veryclean
 	$(MAKE) -C edk2/BaseTools clean
 	$(MAKE) -C SLOF clean
diff --git a/roms/sgabios b/roms/sgabios
deleted file mode 160000
index cbaee52287..0000000000
--- a/roms/sgabios
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit cbaee52287e5f32373181cff50a00b6c4ac9015a
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index cc06fac592..e69d16a62c 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -337,7 +337,7 @@ def _get_common_args(self, hardware, tunnelled=False):
         argv.extend(self._get_qemu_serial_args())
 
         if self._debug:
-            argv.extend(["-device", "sga"])
+            argv.extend(["-machine", "graphics=off"])
 
         if hardware._prealloc_pages:
             argv_source += ["-mem-path", "/dev/shm",
-- 
2.31.1


