Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878124D348
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:54:13 +0200 (CEST)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94gW-00036p-JT
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Du-0002ML-Lt
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:38 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52458
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dm-0001eI-6R
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xn26e/+LaYf5RDNq1lBdA6DKa1hXtnHq1aP5C4movc4=;
 b=V2/meoEzLFh859IusBHmp1tU3tstkBrECA1XdgpRx8PJeG8C77J+mrE3Kp/JrFOrmCvrlh
 HKEY1vvBuJFyiklky6YPfZwil3k6rl8sSldmyrZLASIBpp/eCihyex8/SYSyYEzV2HHFHx
 LbV7pDYMXVHrWQvH3RWKwe/4d4sqg1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-gOkvO5BUNDWY9QXdmONc9Q-1; Fri, 21 Aug 2020 06:24:25 -0400
X-MC-Unique: gOkvO5BUNDWY9QXdmONc9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834641009441
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D80110098AE;
 Fri, 21 Aug 2020 10:24:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 062/152] meson: infrastructure for building emulators
Date: Fri, 21 Aug 2020 06:21:59 -0400
Message-Id: <20200821102329.29777-63-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile               |  74 ++----------------
 Makefile.target        |  19 +++--
 configure              |   6 --
 hw/i386/fw_cfg.c       |   2 +-
 hw/i386/pc.c           |   2 +-
 hw/i386/pc_piix.c      |   2 +-
 hw/i386/x86.c          |   2 +-
 hw/vfio/pci-quirks.c   |   2 +-
 hw/virtio/virtio-mem.c |   2 +-
 include/qemu/osdep.h   |   2 +-
 meson.build            | 166 ++++++++++++++++++++++++++++++++++++++++-
 rules.mak              |   8 --
 scripts/create_config  |   2 +
 scripts/grepy.sh       |   3 +
 scripts/minikconf.py   |   0
 softmmu/qtest.c        |   2 +-
 16 files changed, 192 insertions(+), 102 deletions(-)
 create mode 100755 scripts/grepy.sh
 mode change 100755 => 100644 scripts/minikconf.py

diff --git a/Makefile b/Makefile
index 698bbdfcd3..19f167ba5f 100644
--- a/Makefile
+++ b/Makefile
@@ -121,8 +121,6 @@ include $(SRC_PATH)/rules.mak
 # lor is defined in rules.mak
 CONFIG_BLOCK := $(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS))
 
-generated-files-y = config-host.h
-
 generated-files-y += module_block.h
 generated-files-y += target/s390x/gen-features.h
 target/s390x/gen-features.h: Makefile.ninja
@@ -178,65 +176,6 @@ DOCS=
 endif
 
 SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet) BUILD_DIR=$(BUILD_DIR)
-SUBDIR_DEVICES_MAK=$(patsubst %, %/config-devices.mak, $(filter %-softmmu, $(TARGET_DIRS)))
-SUBDIR_DEVICES_MAK_DEP=$(patsubst %, %.d, $(SUBDIR_DEVICES_MAK))
-
-ifeq ($(SUBDIR_DEVICES_MAK),)
-config-all-devices.mak: config-host.mak
-	$(call quiet-command,echo '# no devices' > $@,"GEN","$@")
-else
-config-all-devices.mak: $(SUBDIR_DEVICES_MAK) config-host.mak
-	$(call quiet-command, sed -n \
-             's|^\([^=]*\)=\(.*\)$$|\1:=$$(findstring y,$$(\1)\2)|p' \
-             $(SUBDIR_DEVICES_MAK) | sort -u > $@, \
-             "GEN","$@")
-endif
-
--include $(SUBDIR_DEVICES_MAK_DEP)
-
-# This has to be kept in sync with Kconfig.host.
-MINIKCONF_ARGS = \
-    $(CONFIG_MINIKCONF_MODE) \
-    $@ $*/config-devices.mak.d $< $(SRC_PATH)/Kconfig \
-    CONFIG_TCG=$(CONFIG_TCG) \
-    CONFIG_KVM=$(CONFIG_KVM) \
-    CONFIG_SPICE=$(CONFIG_SPICE) \
-    CONFIG_IVSHMEM=$(CONFIG_IVSHMEM) \
-    CONFIG_TPM=$(CONFIG_TPM) \
-    CONFIG_XEN=$(CONFIG_XEN) \
-    CONFIG_OPENGL=$(CONFIG_OPENGL) \
-    CONFIG_X11=$(CONFIG_X11) \
-    CONFIG_VHOST_USER=$(CONFIG_VHOST_USER) \
-    CONFIG_VHOST_KERNEL=$(CONFIG_VHOST_KERNEL) \
-    CONFIG_VIRTFS=$(CONFIG_VIRTFS) \
-    CONFIG_LINUX=$(CONFIG_LINUX) \
-    CONFIG_PVRDMA=$(CONFIG_PVRDMA)
-
-MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
-
-$(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(SRC_PATH)/Kconfig $(BUILD_DIR)/config-host.mak
-	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
-		> $@.tmp, "GEN", "$@.tmp")
-	$(call quiet-command, if test -f $@; then \
-	  if cmp -s $@.old $@; then \
-	    mv $@.tmp $@; \
-	    cp -p $@ $@.old; \
-	  else \
-	    if test -f $@.old; then \
-	      echo "WARNING: $@ (user modified) out of date.";\
-	    else \
-	      echo "WARNING: $@ out of date.";\
-	    fi; \
-	    echo "Run \"$(MAKE) defconfig\" to regenerate."; \
-	    rm $@.tmp; \
-	  fi; \
-	 else \
-	  mv $@.tmp $@; \
-	  cp -p $@ $@.old; \
-	 fi,"GEN","$@");
-
-defconfig:
-	rm -f config-all-devices.mak $(SUBDIR_DEVICES_MAK)
 
 ifneq ($(wildcard config-host.mak),)
 include $(SRC_PATH)/Makefile.objs
@@ -279,10 +218,15 @@ $(SOFTMMU_FUZZ_RULES): $(io-obj-y)
 $(SOFTMMU_FUZZ_RULES): config-all-devices.mak
 $(SOFTMMU_FUZZ_RULES): $(edk2-decompressed)
 
+# meson: this is sub-optimal but going away after conversion
+TARGET_DEPS = $(patsubst %,%-config-target.h, $(TARGET_DIRS))
+TARGET_DEPS += $(patsubst %,%-config-devices.h, $(filter %-softmmu,$(TARGET_DIRS)))
+TARGET_DEPS += $(patsubst %,libqemu-%.fa, $(TARGET_DIRS))
+
 .PHONY: $(TARGET_DIRS_RULES)
 # The $(TARGET_DIRS_RULES) are of the form SUBDIR/GOAL, so that
 # $(dir $@) yields the sub-directory, and $(notdir $@) yields the sub-goal
-$(TARGET_DIRS_RULES):
+$(TARGET_DIRS_RULES): $(TARGET_DEPS)
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
 
 # LIBFDT_lib="": avoid breaking existing trees with objects requiring -fPIC
@@ -370,7 +314,6 @@ clean: recurse-clean ninja-clean clean-ctlist
 	-test -f ninjatool && ./ninjatool $(if $(V),-v,) -t clean
 # avoid old build problems by removing potentially incorrect old files
 	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
-	rm -f qemu-options.def
 	find . \( -name '*.so' -o -name '*.dll' -o -name '*.mo' -o -name '*.[oda]' \) -type f \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
@@ -379,8 +322,6 @@ clean: recurse-clean ninja-clean clean-ctlist
 	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) TAGS cscope.* *.pod *~ */*~
 	rm -f fsdev/*.pod scsi/*.pod
 	rm -f $(foreach f,$(generated-files-y),$(f) $(f)-timestamp)
-	rm -f config-all-devices.mak
-	rm -f $(SUBDIR_DEVICES_MAK)
 
 VERSION ?= $(shell cat VERSION)
 
@@ -398,8 +339,7 @@ distclean: clean ninja-distclean
 	-test -f ninjatool && ./ninjatool $(if $(V),-v,) -t clean -g
 	rm -f config-host.mak config-host.h* $(DOCS)
 	rm -f tests/tcg/config-*.mak
-	rm -f config-all-devices.mak config-all-disas.mak config.status
-	rm -f $(SUBDIR_DEVICES_MAK)
+	rm -f config-all-disas.mak config.status
 	rm -f po/*.mo tests/qemu-iotests/common.env
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
 	rm -f qemu-plugins-ld.symbols qemu-plugins-ld64.symbols
diff --git a/Makefile.target b/Makefile.target
index f6b7a86390..43d2f9734f 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -6,8 +6,10 @@ include ../config-host.mak
 include config-target.mak
 include $(SRC_PATH)/rules.mak
 
+FULL_TARGET_NAME=$(TARGET_NAME)-$(if $(CONFIG_SOFTMMU),softmmu,linux-user)
+
 ifdef CONFIG_SOFTMMU
-include config-devices.mak
+include ../$(FULL_TARGET_NAME)-config-devices.mak
 endif
 
 $(call set-vpath, $(SRC_PATH):$(BUILD_DIR))
@@ -18,6 +20,9 @@ QEMU_CFLAGS += -iquote .. -iquote $(SRC_PATH)/target/$(TARGET_BASE_ARCH) -DNEED_
 
 QEMU_CFLAGS+=-iquote $(SRC_PATH)/include
 
+QEMU_CFLAGS += -DCONFIG_TARGET=\"../$(FULL_TARGET_NAME)-config-target.h\"
+QEMU_CFLAGS += -DCONFIG_DEVICES=\"../$(FULL_TARGET_NAME)-config-devices.h\"
+
 ifdef CONFIG_USER_ONLY
 # user emulator name
 QEMU_PROG=qemu-$(TARGET_NAME)
@@ -36,15 +41,10 @@ QEMU_PROG_BUILD = $(QEMU_PROG)
 endif
 endif
 
+LIBQEMU = ../libqemu-$(FULL_TARGET_NAME).fa
 PROGS=$(QEMU_PROG) $(QEMU_PROGW)
 STPFILES=
 
-config-target.h: config-target.h-timestamp
-config-target.h-timestamp: config-target.mak
-
-config-devices.h: config-devices.h-timestamp
-config-devices.h-timestamp: config-devices.mak
-
 ifdef CONFIG_TRACE_SYSTEMTAP
 stap: $(QEMU_PROG).stp-installed $(QEMU_PROG).stp $(QEMU_PROG)-simpletrace.stp $(QEMU_PROG)-log.stp
 
@@ -103,6 +103,7 @@ all: $(PROGS) stap
 # Dummy command so that make thinks it has done something
 	@true
 
+obj-y += $(LIBQEMU)
 obj-y += trace/
 
 #########################################################
@@ -169,7 +170,6 @@ obj-y += hw/$(TARGET_BASE_ARCH)/
 endif
 
 generated-files-y += hmp-commands.h hmp-commands-info.h
-generated-files-y += config-devices.h
 
 endif # CONFIG_SOFTMMU
 
@@ -210,7 +210,7 @@ all-obj-$(CONFIG_SOFTMMU) += $(crypto-obj-y)
 all-obj-$(CONFIG_SOFTMMU) += $(io-obj-y)
 
 ifdef CONFIG_SOFTMMU
-$(QEMU_PROG_BUILD): config-devices.mak
+$(QEMU_PROG_BUILD): ../$(FULL_TARGET_NAME)-config-devices.mak
 endif
 
 COMMON_LDADDS = ../libqemuutil.a
@@ -262,5 +262,4 @@ ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_DATA) $(QEMU_PROG)-log.stp "$(DESTDIR)$(qemu_datadir)/../systemtap/tapset/$(QEMU_PROG)-log.stp"
 endif
 
-generated-files-y += config-target.h
 Makefile: $(generated-files-y)
diff --git a/configure b/configure
index a89a433557..883986e4a7 100755
--- a/configure
+++ b/configure
@@ -8165,18 +8165,12 @@ fi
 
 if supported_xen_target $target; then
     echo "CONFIG_XEN=y" >> $config_target_mak
-    echo "$target/config-devices.mak: CONFIG_XEN=y" >> $config_host_mak
     if test "$xen_pci_passthrough" = yes; then
         echo "CONFIG_XEN_PCI_PASSTHROUGH=y" >> "$config_target_mak"
     fi
-else
-    echo "$target/config-devices.mak: CONFIG_XEN=n" >> $config_host_mak
 fi
 if supported_kvm_target $target; then
     echo "CONFIG_KVM=y" >> $config_target_mak
-    echo "$target/config-devices.mak: CONFIG_KVM=y" >> $config_host_mak
-else
-    echo "$target/config-devices.mak: CONFIG_KVM=n" >> $config_host_mak
 fi
 if supported_hax_target $target; then
     echo "CONFIG_HAX=y" >> $config_target_mak
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index c55abfb01a..33441ad484 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -22,7 +22,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "e820_memory_layout.h"
 #include "kvm_i386.h"
-#include "config-devices.h"
+#include CONFIG_DEVICES
 
 struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 47c5ca3e34..cc616e48f3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,10 +92,10 @@
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "qapi/qmp/qerror.h"
-#include "config-devices.h"
 #include "e820_memory_layout.h"
 #include "fw_cfg.h"
 #include "trace.h"
+#include CONFIG_DEVICES
 
 GlobalProperty pc_compat_5_0[] = {
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b789e83f9a..456e336934 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "config-devices.h"
+#include CONFIG_DEVICES
 
 #include "qemu/units.h"
 #include "hw/loader.h"
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 67bee1bcb8..cf384b9743 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -49,7 +49,7 @@
 #include "multiboot.h"
 #include "elf.h"
 #include "standard-headers/asm-x86/bootparam.h"
-#include "config-devices.h"
+#include CONFIG_DEVICES
 #include "kvm_i386.h"
 
 #define BIOS_FILENAME "bios.bin"
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 3a14b7c303..57150913b7 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "config-devices.h"
+#include CONFIG_DEVICES
 #include "exec/memop.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 7740fc613f..8fbec77ccc 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -29,7 +29,7 @@
 #include "migration/misc.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "config-devices.h"
+#include CONFIG_DEVICES
 #include "trace.h"
 
 /*
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 20872e793e..412962d91a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -29,7 +29,7 @@
 
 #include "config-host.h"
 #ifdef NEED_CPU_H
-#include "config-target.h"
+#include CONFIG_TARGET
 #else
 #include "exec/poison.h"
 #endif
diff --git a/meson.build b/meson.build
index c892672628..6f8024cdcf 100644
--- a/meson.build
+++ b/meson.build
@@ -9,6 +9,7 @@ ss = import('sourceset')
 sh = find_program('sh')
 cc = meson.get_compiler('c')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
+config_all_disas = keyval.load(meson.current_build_dir() / 'config-all-disas.mak')
 
 add_project_arguments(config_host['QEMU_CFLAGS'].split(),
                       native: false, language: ['c', 'objc'])
@@ -151,16 +152,96 @@ if 'CONFIG_LIBUDEV' in config_host
   libudev = declare_dependency(link_args: config_host['LIBUDEV_LIBS'].split())
 endif
 
+create_config = find_program('scripts/create_config')
+minikconf = find_program('scripts/minikconf.py')
 target_dirs = config_host['TARGET_DIRS'].split()
 have_user = false
 have_system = false
+config_devices_mak_list = []
+config_devices_h = {}
+config_target_mak = {}
+kconfig_external_symbols = [
+  'CONFIG_KVM',
+  'CONFIG_XEN',
+  'CONFIG_TPM',
+  'CONFIG_SPICE',
+  'CONFIG_IVSHMEM',
+  'CONFIG_OPENGL',
+  'CONFIG_X11',
+  'CONFIG_VHOST_USER',
+  'CONFIG_VHOST_KERNEL',
+  'CONFIG_VIRTFS',
+  'CONFIG_LINUX',
+  'CONFIG_PVRDMA',
+]
 foreach target : target_dirs
   have_user = have_user or target.endswith('-user')
-  have_system = have_system or target.endswith('-softmmu')
+  config_target = keyval.load(meson.current_build_dir() / target / 'config-target.mak') + config_host
+
+  if target.endswith('-softmmu')
+    have_system = true
+
+    base_kconfig = []
+    foreach sym : kconfig_external_symbols
+      if sym in config_target
+        base_kconfig += '@0@=y'.format(sym)
+      endif
+    endforeach
+
+    config_devices_mak = target + '-config-devices.mak'
+    config_devices_mak = configure_file(
+      input: ['default-configs' / target + '.mak', 'Kconfig'],
+      output: config_devices_mak,
+      depfile: config_devices_mak + '.d',
+      capture: true,
+      command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
+                config_devices_mak, '@DEPFILE@', '@INPUT@',
+                base_kconfig])
+    config_devices_h += {target: custom_target(
+      target + '-config-devices.h',
+      input: config_devices_mak,
+      output: target + '-config-devices.h',
+      capture: true,
+      command: [create_config, '@INPUT@'])}
+    config_devices_mak_list += config_devices_mak
+    config_target += keyval.load(config_devices_mak)
+  endif
+  config_target_mak += {target: config_target}
 endforeach
 have_tools = 'CONFIG_TOOLS' in config_host
 have_block = have_system or have_tools
 
+grepy = find_program('scripts/grepy.sh')
+# This configuration is used to build files that are shared by
+# multiple binaries, and then extracted out of the "common"
+# static_library target.
+#
+# We do not use all_sources()/all_dependencies(), because it would
+# build literally all source files, including devices only used by
+# targets that are not built for this compilation.  The CONFIG_ALL
+# pseudo symbol replaces it.
+
+if have_system
+  config_all_devices_mak = configure_file(
+    output: 'config-all-devices.mak',
+    input: config_devices_mak_list,
+    capture: true,
+    command: [grepy, '@INPUT@'],
+  )
+  config_all_devices = keyval.load(config_all_devices_mak)
+else
+  config_all_devices = {}
+endif
+config_all = config_all_devices
+config_all += config_host
+config_all += config_all_disas
+config_all += {
+  'CONFIG_XEN': config_host.has_key('CONFIG_XEN_BACKEND'),
+  'CONFIG_SOFTMMU': have_system,
+  'CONFIG_USER_ONLY': have_user,
+  'CONFIG_ALL': true,
+}
+
 # Generators
 
 genh = []
@@ -202,6 +283,13 @@ qemu_version = custom_target('qemu-version.h',
                              build_always_stale: true)
 genh += qemu_version
 
+config_host_h = custom_target('config-host.h',
+                              input: meson.current_build_dir() / 'config-host.mak',
+                              output: 'config-host.h',
+                              capture: true,
+                              command: [create_config, '@INPUT@'])
+genh += config_host_h
+
 hxdep = []
 hx_headers = [
   ['qemu-options.hx', 'qemu-options.def'],
@@ -228,6 +316,16 @@ genh += hxdep
 util_ss = ss.source_set()
 stub_ss = ss.source_set()
 trace_ss = ss.source_set()
+common_ss = ss.source_set()
+softmmu_ss = ss.source_set()
+user_ss = ss.source_set()
+bsd_user_ss = ss.source_set()
+linux_user_ss = ss.source_set()
+specific_ss = ss.source_set()
+
+hw_arch = {}
+target_arch = {}
+target_softmmu_arch = {}
 
 ###############
 # Trace files #
@@ -336,10 +434,10 @@ subdir('ui')
 
 # Build targets from sourcesets
 
-stub_ss = stub_ss.apply(config_host, strict: false)
+stub_ss = stub_ss.apply(config_all, strict: false)
 
 util_ss.add_all(trace_ss)
-util_ss = util_ss.apply(config_host, strict: false)
+util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
                              dependencies: [util_ss.dependencies(), m, glib, socket])
@@ -350,6 +448,68 @@ subdir('io')
 subdir('fsdev')
 subdir('target')
 
+common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: softmmu_ss)
+common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
+
+common_all = common_ss.apply(config_all, strict: false)
+common_all = static_library('common',
+                            build_by_default: false,
+                            sources: common_all.sources() + genh,
+                            dependencies: common_all.dependencies(),
+                            name_suffix: 'fa')
+
+foreach target : target_dirs
+  config_target = config_target_mak[target]
+  target_name = config_target['TARGET_NAME']
+  arch = config_target['TARGET_BASE_ARCH']
+  arch_srcs = []
+
+  target_inc = [include_directories('target' / config_target['TARGET_BASE_ARCH'])]
+  if targetos == 'linux'
+    target_inc += include_directories('linux-headers', is_system: true)
+  endif
+  if target.endswith('-softmmu')
+    qemu_target_name = 'qemu-system-' + target_name
+    target_type='system'
+    arch_srcs += config_devices_h[target]
+  else
+    target_type='user'
+    qemu_target_name = 'qemu-' + target_name
+    if 'CONFIG_LINUX_USER' in config_target
+      base_dir = 'linux-user'
+      target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+    else
+      base_dir = 'bsd-user'
+    endif
+    target_inc += include_directories(
+      base_dir,
+      base_dir / config_target['TARGET_ABI_DIR'],
+    )
+  endif
+
+  target_common = common_ss.apply(config_target, strict: false)
+  objects = common_all.extract_objects(target_common.sources())
+
+  # TODO: Change to generator once obj-y goes away
+  config_target_h = custom_target(target + '-config-target.h',
+                              input: meson.current_build_dir() / target / 'config-target.mak',
+                              output: target + '-config-target.h',
+                              capture: true,
+                              command: [create_config, '@INPUT@'])
+
+  target_specific = specific_ss.apply(config_target, strict: false)
+  arch_srcs += target_specific.sources()
+
+  static_library('qemu-' + target,
+                 sources: arch_srcs + [config_target_h] + genh,
+                 objects: objects,
+                 include_directories: target_inc,
+                 c_args: ['-DNEED_CPU_H',
+                          '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
+                          '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)],
+                 name_suffix: 'fa')
+endforeach
+
 # Other build targets
 if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
diff --git a/rules.mak b/rules.mak
index 1aa6394079..d8d35f735a 100644
--- a/rules.mak
+++ b/rules.mak
@@ -203,14 +203,6 @@ notempty = $(if $1,y,n)
 # Generate files with tracetool
 TRACETOOL=$(PYTHON) $(SRC_PATH)/scripts/tracetool.py
 
-# Generate timestamp files for .h include files
-
-config-%.h: config-%.h-timestamp
-	@cmp $< $@ >/dev/null 2>&1 || cp $< $@
-
-config-%.h-timestamp: config-%.mak $(SRC_PATH)/scripts/create_config
-	$(call quiet-command, sh $(SRC_PATH)/scripts/create_config < $< > $@,"GEN","$(TARGET_DIR)config-$*.h")
-
 .PHONY: clean-timestamp
 clean-timestamp:
 	rm -f *.timestamp
diff --git a/scripts/create_config b/scripts/create_config
index 6d8f08b39d..bc82661041 100755
--- a/scripts/create_config
+++ b/scripts/create_config
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+test $# -gt 0 && exec < $1
+
 echo "/* Automatically generated by create_config - do not modify */"
 
 while read line; do
diff --git a/scripts/grepy.sh b/scripts/grepy.sh
new file mode 100755
index 0000000000..aee46ddc8d
--- /dev/null
+++ b/scripts/grepy.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+grep -h '=y$' "$@" | sort -u
diff --git a/scripts/minikconf.py b/scripts/minikconf.py
old mode 100755
new mode 100644
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 5672b75c35..4e439caec7 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -27,7 +27,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
-#include "config-devices.h"
+#include CONFIG_DEVICES
 #ifdef CONFIG_PSERIES
 #include "hw/ppc/spapr_rtas.h"
 #endif
-- 
2.26.2



