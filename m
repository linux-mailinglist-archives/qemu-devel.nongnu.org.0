Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D724D3D0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:21:52 +0200 (CEST)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k957H-0000UW-Sq
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ej-0003jr-Nk
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:29 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52928
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EX-0001vQ-PB
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXpS+DJO8SYJiZ36G3FuP6vRcSSoHjXPfSRczbwmdWo=;
 b=D42W17zdWC3YzpxDt302LeppUDUR85EEiyAU+RRMshRJ4/6w2wrBkESYN07AT9u49EwnM9
 aLiKbm4tGF04zy7tyGaGwMW2cLshC1PCY2niqD3iEXIEqJ0HA60OXnnsGJe5MifYvmpHnj
 rpHiMOwDESU8EYOXguD7PP2gqXtedbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-9Ed70hH0P62IM0474YdLqg-1; Fri, 21 Aug 2020 06:25:13 -0400
X-MC-Unique: 9Ed70hH0P62IM0474YdLqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F23AA100CF75
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC28310098AE;
 Fri, 21 Aug 2020 10:25:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 127/152] meson: convert hw/9pfs, cleanup
Date: Fri, 21 Aug 2020 06:23:04 -0400
Message-Id: <20200821102329.29777-128-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 01:00:15
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

hw/Makefile.objs is gone so there is more code that can be removed.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile              |  4 ----
 Makefile.objs         |  8 --------
 Makefile.target       | 15 ---------------
 hw/9pfs/Kconfig       |  4 ++++
 hw/9pfs/Makefile.objs |  9 ---------
 hw/9pfs/meson.build   | 20 ++++++++++++++++++++
 hw/Makefile.objs      |  8 --------
 hw/meson.build        |  1 +
 8 files changed, 25 insertions(+), 44 deletions(-)
 delete mode 100644 hw/9pfs/Makefile.objs
 create mode 100644 hw/9pfs/meson.build
 delete mode 100644 hw/Makefile.objs

diff --git a/Makefile b/Makefile
index 0b06b9cacd..ca51abfd8c 100644
--- a/Makefile
+++ b/Makefile
@@ -178,10 +178,6 @@ ifneq ($(wildcard config-host.mak),)
 include $(SRC_PATH)/Makefile.objs
 endif
 
-dummy := $(call unnest-vars,, \
-                common-obj-y \
-                common-obj-m)
-
 include $(SRC_PATH)/tests/Makefile.include
 
 all: $(DOCS) $(if $(BUILD_DOCS),sphinxdocs) recurse-all modules
diff --git a/Makefile.objs b/Makefile.objs
index c332323b81..c9720a92df 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -61,18 +61,10 @@ common-obj-$(if $(CONFIG_RBD),m) += block-rbd$(DSOSUF)
 common-obj-$(if $(CONFIG_LZFSE),m) += block-dmg-lzfse$(DSOSUF)
 common-obj-$(if $(and $(CONFIG_BZIP2),$(CONFIG_DMG)),m) += block-dmg-bz2$(DSOSUF)
 
-common-obj-y += hw/
-common-obj-m += hw/
-
 common-obj-y += libqmp.fa
 
 endif # CONFIG_SOFTMMU
 
-#######################################################################
-# Target-independent parts used in system and user emulation
-
-common-obj-y += hw/
-
 ######################################################################
 # Resource file for Windows executables
 version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
diff --git a/Makefile.target b/Makefile.target
index 3534ece38a..c95e0deb79 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -156,7 +156,6 @@ endif #CONFIG_BSD_USER
 ifdef CONFIG_SOFTMMU
 obj-y += softmmu/
 obj-y += gdbstub.o
-obj-y += hw/
 LIBS := $(libs_softmmu) $(LIBS)
 
 # Temporary until emulators are linked by Meson
@@ -185,20 +184,6 @@ endif # CONFIG_SOFTMMU
 dummy := $(call unnest-vars,,obj-y)
 all-obj-y := $(obj-y)
 
-#
-# common-obj-m has some crap here, probably as side effect from
-# unnest-vars recursing into target directories to fill obj-y and not
-# properly handling the -m case.
-#
-# Clear common-obj-m as workaround.  Fixes suspious dependency errors
-# when building devices as modules.  A bit hackish, but should be ok
-# as long as we do not have any target-specific modules.
-#
-# The meson-based build system currently in development doesn't need
-# unnest-vars and will obsolete this workaround.
-#
-common-obj-m :=
-
 include $(SRC_PATH)/Makefile.objs
 dummy := $(call fix-paths,../,, \
               authz-obj-y \
diff --git a/hw/9pfs/Kconfig b/hw/9pfs/Kconfig
index 3ae5749661..d3ebd73730 100644
--- a/hw/9pfs/Kconfig
+++ b/hw/9pfs/Kconfig
@@ -2,8 +2,12 @@ config FSDEV_9P
     bool
     depends on VIRTFS
 
+config 9PFS
+    bool
+
 config VIRTIO_9P
     bool
     default y
     depends on VIRTFS && VIRTIO
     select FSDEV_9P
+    select 9PFS
diff --git a/hw/9pfs/Makefile.objs b/hw/9pfs/Makefile.objs
deleted file mode 100644
index 70ded6fd8f..0000000000
--- a/hw/9pfs/Makefile.objs
+++ /dev/null
@@ -1,9 +0,0 @@
-common-obj-y  = 9p.o 9p-util.o
-common-obj-y += 9p-local.o 9p-xattr.o
-common-obj-y += 9p-xattr-user.o 9p-posix-acl.o
-common-obj-y += coth.o cofs.o codir.o cofile.o
-common-obj-y += coxattr.o 9p-synth.o
-common-obj-y += 9p-proxy.o
-
-common-obj-$(CONFIG_XEN) += xen-9p-backend.o
-obj-$(CONFIG_VIRTIO_9P) += virtio-9p-device.o
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
new file mode 100644
index 0000000000..cc09426212
--- /dev/null
+++ b/hw/9pfs/meson.build
@@ -0,0 +1,20 @@
+fs_ss = ss.source_set()
+fs_ss.add(files(
+  '9p-local.c',
+  '9p-posix-acl.c',
+  '9p-proxy.c',
+  '9p-synth.c',
+  '9p-util.c',
+  '9p-xattr-user.c',
+  '9p-xattr.c',
+  '9p.c',
+  'codir.c',
+  'cofile.c',
+  'cofs.c',
+  'coth.c',
+  'coxattr.c',
+))
+fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
+softmmu_ss.add_all(when: 'CONFIG_9PFS', if_true: fs_ss)
+
+specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
deleted file mode 100644
index ebae00af6e..0000000000
--- a/hw/Makefile.objs
+++ /dev/null
@@ -1,8 +0,0 @@
-ifeq ($(CONFIG_SOFTMMU), y)
-devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
-endif
-
-common-obj-y += $(devices-dirs-y)
-common-obj-m += display/
-common-obj-m += usb/
-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 55ca2b2b61..ba8763cad8 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
+subdir('9pfs')
 subdir('acpi')
 subdir('adc')
 subdir('audio')
-- 
2.26.2



