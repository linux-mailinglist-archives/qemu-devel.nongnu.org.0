Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C6E240C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:50:07 +0200 (CEST)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Bvy-0003Cy-2g
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BKg-0001Ki-6x
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:34 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40308
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BKd-00039m-Sg
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oieG5UguaHnxo9MZHtvw+tWgGhydS5IXTW7+UQFi3BA=;
 b=Q8VllonZ+VceRKeF8DegpYVDlf8KHaPFCwGQ1RO7EJXHgFwmKlZ7e/2WH2qdU0w5E2PKsV
 ky4JMDfHazyc6n66Iq4J8wkZ79G9U+KlZqi3ST6xaT/ITDRYrcCSH+UoiRwa6qAY/1X9Pr
 /FuvSIKOCghrVMOaYDLPrc8tNjw0FtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-NqHJqYaYP2OSmAu8pYIrUg-1; Mon, 10 Aug 2020 13:11:27 -0400
X-MC-Unique: NqHJqYaYP2OSmAu8pYIrUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 455F88014D7
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:11:26 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52E4187D61;
 Mon, 10 Aug 2020 17:11:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 082/147] meson: convert hw/xen
Date: Mon, 10 Aug 2020 19:08:00 +0200
Message-Id: <1597079345-42801-83-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 04:13:00
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            |  7 +++++--
 hw/Makefile.objs     |  1 -
 hw/meson.build       |  1 +
 hw/xen/Makefile.objs |  7 -------
 hw/xen/meson.build   | 20 ++++++++++++++++++++
 meson.build          |  6 ++++++
 6 files changed, 32 insertions(+), 10 deletions(-)
 create mode 100644 hw/meson.build
 delete mode 100644 hw/xen/Makefile.objs
 create mode 100644 hw/xen/meson.build

diff --git a/configure b/configure
index f3baba1..1bdea00 100755
--- a/configure
+++ b/configure
@@ -2676,6 +2676,8 @@ if test "$xen" != "no" ; then
     fi
     QEMU_CFLAGS="$QEMU_CFLAGS $($pkg_config --cflags $xen_pc)"
     libs_softmmu="$($pkg_config --libs $xen_pc) $libs_softmmu"
+    xen_cflags="$($pkg_config --cflags $xen_pc)"
+    xen_libs="$($pkg_config --libs $xen_pc)"
   else
 
     xen_libs="-lxenstore -lxenctrl -lxenguest"
@@ -2956,9 +2958,8 @@ EOF
 
     if test "$xen" = yes; then
       if test $xen_ctrl_version -ge 40701  ; then
-        libs_softmmu="$xen_stable_libs $libs_softmmu"
+        xen_libs="$xen_libs $xen_stable_libs "
       fi
-      libs_softmmu="$xen_libs $libs_softmmu"
     fi
   fi
 fi
@@ -7242,6 +7243,8 @@ fi
 if test "$xen" = "yes" ; then
   echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
   echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
+  echo "XEN_CFLAGS=$xen_cflags" >> $config_host_mak
+  echo "XEN_LIBS=$xen_libs" >> $config_host_mak
 fi
 if test "$linux_aio" = "yes" ; then
   echo "CONFIG_LINUX_AIO=y" >> $config_host_mak
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 14b7ea4..d204a90 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -35,7 +35,6 @@ devices-dirs-y += usb/
 devices-dirs-$(CONFIG_VFIO) += vfio/
 devices-dirs-y += virtio/
 devices-dirs-y += watchdog/
-devices-dirs-$(CONFIG_XEN) += xen/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
 devices-dirs-$(CONFIG_NUBUS) += nubus/
 devices-dirs-y += semihosting/
diff --git a/hw/meson.build b/hw/meson.build
new file mode 100644
index 0000000..08112a5
--- /dev/null
+++ b/hw/meson.build
@@ -0,0 +1 @@
+subdir('xen')
diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
deleted file mode 100644
index 502b32d..0000000
--- a/hw/xen/Makefile.objs
+++ /dev/null
@@ -1,7 +0,0 @@
-# xen backend driver support
-common-obj-y += xen-legacy-backend.o xen_devconfig.o xen_pvdev.o xen-bus.o xen-bus-helper.o xen-backend.o
-
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
-obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt_load_rom.o
-obj-$(call lnot,$(CONFIG_XEN_PCI_PASSTHROUGH)) += xen_pt_stub.o
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
new file mode 100644
index 0000000..076954b
--- /dev/null
+++ b/hw/xen/meson.build
@@ -0,0 +1,20 @@
+softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+  'xen-backend.c',
+  'xen-bus-helper.c',
+  'xen-bus.c',
+  'xen-legacy-backend.c',
+  'xen_devconfig.c',
+  'xen_pvdev.c',
+))
+
+xen_specific_ss = ss.source_set()
+xen_specific_ss.add(when: 'CONFIG_XEN_PCI_PASSTHROUGH', if_true: files(
+  'xen-host-pci-device.c',
+  'xen_pt.c',
+  'xen_pt_config_init.c',
+  'xen_pt_graphics.c',
+  'xen_pt_load_rom.c',
+  'xen_pt_msi.c',
+), if_false: files('xen_pt_stub.c'))
+
+specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
diff --git a/meson.build b/meson.build
index 49ad9e7..19c81b6 100644
--- a/meson.build
+++ b/meson.build
@@ -313,6 +313,11 @@ numa = not_found
 if 'CONFIG_NUMA' in config_host
   numa = declare_dependency(link_args: config_host['NUMA_LIBS'].split())
 endif
+xen = not_found
+if 'CONFIG_XEN_BACKEND' in config_host
+  xen = declare_dependency(compile_args: config_host['XEN_CFLAGS'].split(),
+                           link_args: config_host['XEN_LIBS'].split())
+endif
 
 create_config = find_program('scripts/create_config')
 minikconf = find_program('scripts/minikconf.py')
@@ -666,6 +671,7 @@ subdir('migration')
 subdir('monitor')
 subdir('net')
 subdir('replay')
+subdir('hw')
 
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
-- 
1.8.3.1



