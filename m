Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C0D23E2D0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:05:34 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3m8r-0001D4-Gu
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQy-0002V4-Mt
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:20:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQv-0006rn-V7
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6ZWrbSM4hRb9pcD/ftrj0TG9QiGPyB3PoHY/X9d0GY=;
 b=ch8l4QmSH7OysZmgtzydKR8v9M8gwa2hy+MYh7fS+TrETNRjeD23yKjM36q9L9TYtkbMAu
 D6Q07ysCI9aX1F6ydDrWTGNc8g5foor6aK74wku11ygeUZr+4A/II8ebWx1Cl6c64rRcTE
 srSZc2U3rw8CM4WPz2pn/T3ZRlKwOAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-YLu9jiaYNCa4RvzxMnP58w-1; Thu, 06 Aug 2020 15:20:07 -0400
X-MC-Unique: YLu9jiaYNCa4RvzxMnP58w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A15107BEF7
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:20:06 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2827F6179B;
 Thu,  6 Aug 2020 19:20:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 122/143] meson: convert hw/9pfs, cleanup
Date: Thu,  6 Aug 2020 21:15:58 +0200
Message-Id: <1596741379-12902-123-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:24:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
index d9d6b59..2aaa3f8 100644
--- a/Makefile
+++ b/Makefile
@@ -163,10 +163,6 @@ ifneq ($(wildcard config-host.mak),)
 include $(SRC_PATH)/Makefile.objs
 endif
 
-dummy := $(call unnest-vars,, \
-                common-obj-y \
-                common-obj-m)
-
 include $(SRC_PATH)/tests/Makefile.include
 
 all: $(DOCS) $(if $(BUILD_DOCS),sphinxdocs) recurse-all modules
diff --git a/Makefile.objs b/Makefile.objs
index 965f64c..7eaf047 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -60,18 +60,10 @@ common-obj-$(if $(CONFIG_RBD),m) += block-rbd$(DSOSUF)
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
index 3534ece..c95e0de 100644
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
index 3ae5749..d3ebd73 100644
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
index 70ded6f..0000000
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
index 0000000..cc09426
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
index ebae00a..0000000
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
index 55ca2b2..ba8763c 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
+subdir('9pfs')
 subdir('acpi')
 subdir('adc')
 subdir('audio')
-- 
1.8.3.1



