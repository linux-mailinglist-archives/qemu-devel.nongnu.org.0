Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8587124471F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:37:26 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6W9N-0004tc-IY
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vn7-0006IW-Iw
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46091
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vn1-0002yh-DA
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+tLYmqq+bqBSm+SVqYgCtU4ES0SyXA53nimNMiI1Z4=;
 b=RMJKcFVX13M3sO9gmx44kaTxbfN1PVZOJ600PDB/eFlcq3UBKRSxzRAc6dKQ2xr6iIJsey
 VVsE52B4hPeD9fD/759kx8idFOjkCtv83oIuyFGffqQeXWktFUrHkcGp2yvc0cc3X5cg7/
 EwGP2qeB6GTKaCf8aKx1uLnsFXIxiak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-GcJBIWFeN1GmaTvW5aEeDA-1; Fri, 14 Aug 2020 05:14:15 -0400
X-MC-Unique: GcJBIWFeN1GmaTvW5aEeDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 050A81853DA0
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA3A15D9D2;
 Fri, 14 Aug 2020 09:14:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 064/150] meson: convert block
Date: Fri, 14 Aug 2020 05:12:00 -0400
Message-Id: <20200814091326.16173-65-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 01:57:54
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                    |   8 ---
 Makefile.objs               |  32 ++++++++---
 Makefile.target             |   3 +-
 block.c                     |   2 +-
 block/Makefile.objs         |  75 ------------------------
 block/meson.build           | 111 ++++++++++++++++++++++++++++++++++++
 block/monitor/Makefile.objs |   2 -
 block/monitor/meson.build   |   2 +
 configure                   |  14 +++--
 meson.build                 |  68 ++++++++++++++++++++++
 nbd/Makefile.objs           |   1 -
 nbd/meson.build             |   5 ++
 rules.mak                   |   3 +-
 scsi/Makefile.objs          |   4 --
 scsi/meson.build            |   4 ++
 15 files changed, 227 insertions(+), 107 deletions(-)
 delete mode 100644 block/Makefile.objs
 create mode 100644 block/meson.build
 delete mode 100644 block/monitor/Makefile.objs
 create mode 100644 block/monitor/meson.build
 delete mode 100644 nbd/Makefile.objs
 create mode 100644 nbd/meson.build
 delete mode 100644 scsi/Makefile.objs
 create mode 100644 scsi/meson.build

diff --git a/Makefile b/Makefile
index aaa0c3156b..4abc29cd59 100644
--- a/Makefile
+++ b/Makefile
@@ -112,7 +112,6 @@ include $(SRC_PATH)/rules.mak
 # lor is defined in rules.mak
 CONFIG_BLOCK := $(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS))
 
-generated-files-y += module_block.h
 generated-files-y += target/s390x/gen-features.h
 target/s390x/gen-features.h: Makefile.ninja
 
@@ -173,8 +172,6 @@ include $(SRC_PATH)/Makefile.objs
 endif
 
 dummy := $(call unnest-vars,, \
-                block-obj-y \
-                block-obj-m \
                 storage-daemon-obj-y \
                 storage-daemon-obj-m \
                 common-obj-y \
@@ -295,11 +292,6 @@ ifdef CONFIG_MPATH
 scsi/qemu-pr-helper$(EXESUF): LIBS += -ludev -lmultipath -lmpathpersist
 endif
 
-module_block.h: $(SRC_PATH)/scripts/modules/module_block.py config-host.mak
-	$(call quiet-command,$(PYTHON) $< $@ \
-	$(addprefix $(SRC_PATH)/,$(patsubst %.mo,%.c,$(block-obj-m))), \
-	"GEN","$@")
-
 clean: recurse-clean ninja-clean clean-ctlist
 	-test -f ninjatool && ./ninjatool $(if $(V),-v,) -t clean
 # avoid old build problems by removing potentially incorrect old files
diff --git a/Makefile.objs b/Makefile.objs
index 297bd5beeb..eeaa0cfa82 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -10,12 +10,20 @@ ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
 authz-obj-y = authz/libauthz.fa
 authz/libauthz.fa-libs = $(if $(CONFIG_AUTH_PAM),-lpam)
 
-block-obj-y = block/ nbd/ scsi/
-block-obj-y += block.o blockjob.o job.o
-block-obj-y += qemu-io-cmds.o
-block-obj-$(CONFIG_REPLICATION) += replication.o
-
-block-obj-m = block/
+block-obj-y += libblock.fa
+
+libblock.fa-libs = $(ZSTD_LIBS)
+libblock.fa-libs += $(LIBNFS_LIBS)
+libblock.fa-libs += $(LIBISCSI_LIBS)
+libblock.fa-libs += $(CURL_LIBS)
+libblock.fa-libs += $(RBD_LIBS)
+libblock.fa-libs += $(GLUSTERFS_LIBS)
+libblock.fa-libs += $(VXHS_LIBS)
+libblock.fa-libs += $(LIBSSH_LIBS)
+libblock.fa-libs += $(BZIP2_LIBS)
+libblock.fa-libs += $(LZFSE_LIBS)
+libblock.fa-libs += $(if $(CONFIG_LINUX_AIO),-laio)
+libblock.fa-libs += $(LIBXML2_LIBS)
 
 chardev-obj-y = chardev/libchardev.fa
 
@@ -40,7 +48,7 @@ storage-daemon-obj-$(CONFIG_POSIX) += os-posix.o
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-y = blockdev.o blockdev-nbd.o block/
+common-obj-y = blockdev.o blockdev-nbd.o
 common-obj-y += bootdevice.o iothread.o
 common-obj-y += dump/
 common-obj-y += job-qmp.o
@@ -55,6 +63,16 @@ common-obj-$(CONFIG_LINUX) += fsdev/
 common-obj-y += accel/
 common-obj-y += migration/
 
+common-obj-$(if $(CONFIG_CURL),m) += block-curl$(DSOSUF)
+common-obj-$(if $(CONFIG_GLUSTERFS),m) += block-gluster$(DSOSUF)
+common-obj-$(if $(CONFIG_LIBISCSI),m) += block-iscsi$(DSOSUF)
+common-obj-$(if $(CONFIG_LIBNFS),m) += block-nfs$(DSOSUF)
+common-obj-$(if $(CONFIG_LIBSSH),m) += block-ssh$(DSOSUF)
+common-obj-$(if $(CONFIG_RBD),m) += block-rbd$(DSOSUF)
+
+common-obj-$(if $(CONFIG_LZFSE),m) += block-dmg-lzfse$(DSOSUF)
+common-obj-$(if $(and $(CONFIG_BZIP2),$(CONFIG_DMG)),m) += block-dmg-bz2$(DSOSUF)
+
 common-obj-y += audio/
 common-obj-m += audio/
 common-obj-y += hw/
diff --git a/Makefile.target b/Makefile.target
index 6b9de09df5..c0575da132 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -199,13 +199,12 @@ common-obj-m :=
 include $(SRC_PATH)/Makefile.objs
 dummy := $(call fix-paths,../,, \
               authz-obj-y \
+              block-obj-y \
               chardev-obj-y \
               crypto-obj-y \
               io-obj-y \
               qom-obj-y)
 dummy := $(call unnest-vars,.., \
-               block-obj-y \
-               block-obj-m \
                common-obj-y \
                common-obj-m)
 all-obj-y += $(common-obj-y)
diff --git a/block.c b/block.c
index d9ac0e07eb..67c5028dd8 100644
--- a/block.c
+++ b/block.c
@@ -29,7 +29,7 @@
 #include "block/nbd.h"
 #include "block/qdict.h"
 #include "qemu/error-report.h"
-#include "module_block.h"
+#include "block/module_block.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
diff --git a/block/Makefile.objs b/block/Makefile.objs
deleted file mode 100644
index 19c6f371c9..0000000000
--- a/block/Makefile.objs
+++ /dev/null
@@ -1,75 +0,0 @@
-block-obj-y += raw-format.o vmdk.o vpc.o
-block-obj-$(CONFIG_QCOW1) += qcow.o
-block-obj-$(CONFIG_VDI) += vdi.o
-block-obj-$(CONFIG_CLOOP) += cloop.o
-block-obj-$(CONFIG_BOCHS) += bochs.o
-block-obj-$(CONFIG_VVFAT) += vvfat.o
-block-obj-$(CONFIG_DMG) += dmg.o
-
-block-obj-y += qcow2.o qcow2-refcount.o qcow2-cluster.o qcow2-snapshot.o qcow2-cache.o qcow2-bitmap.o qcow2-threads.o
-block-obj-$(CONFIG_QED) += qed.o qed-l2-cache.o qed-table.o qed-cluster.o
-block-obj-$(CONFIG_QED) += qed-check.o
-block-obj-y += vhdx.o vhdx-endian.o vhdx-log.o
-block-obj-y += quorum.o
-block-obj-y += blkdebug.o blkverify.o blkreplay.o
-block-obj-$(CONFIG_PARALLELS) += parallels.o
-block-obj-y += blklogwrites.o
-block-obj-y += block-backend.o snapshot.o qapi.o
-block-obj-$(CONFIG_WIN32) += file-win32.o win32-aio.o
-block-obj-$(CONFIG_POSIX) += file-posix.o
-block-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
-block-obj-$(CONFIG_LINUX_IO_URING) += io_uring.o
-block-obj-y += null.o mirror.o commit.o io.o create.o amend.o
-block-obj-y += throttle-groups.o
-block-obj-$(CONFIG_LINUX) += nvme.o
-
-block-obj-y += nbd.o
-block-obj-$(CONFIG_SHEEPDOG) += sheepdog.o
-block-obj-$(CONFIG_LIBISCSI) += iscsi.o
-block-obj-$(if $(CONFIG_LIBISCSI),y,n) += iscsi-opts.o
-block-obj-$(CONFIG_LIBNFS) += nfs.o
-block-obj-$(CONFIG_CURL) += curl.o
-block-obj-$(CONFIG_RBD) += rbd.o
-block-obj-$(CONFIG_GLUSTERFS) += gluster.o
-block-obj-$(CONFIG_LIBSSH) += ssh.o
-block-obj-y += accounting.o dirty-bitmap.o
-block-obj-y += write-threshold.o
-block-obj-y += backup.o
-block-obj-$(CONFIG_REPLICATION) += replication.o
-block-obj-y += throttle.o copy-on-read.o
-block-obj-y += block-copy.o
-
-block-obj-y += crypto.o
-
-block-obj-y += aio_task.o
-block-obj-y += backup-top.o
-block-obj-y += filter-compress.o
-common-obj-y += monitor/
-block-obj-y += monitor/
-
-block-obj-y += stream.o
-
-common-obj-y += qapi-sysemu.o
-
-nfs.o-libs         := $(LIBNFS_LIBS)
-iscsi.o-cflags     := $(LIBISCSI_CFLAGS)
-iscsi.o-libs       := $(LIBISCSI_LIBS)
-curl.o-cflags      := $(CURL_CFLAGS)
-curl.o-libs        := $(CURL_LIBS)
-rbd.o-cflags       := $(RBD_CFLAGS)
-rbd.o-libs         := $(RBD_LIBS)
-gluster.o-cflags   := $(GLUSTERFS_CFLAGS)
-gluster.o-libs     := $(GLUSTERFS_LIBS)
-ssh.o-cflags       := $(LIBSSH_CFLAGS)
-ssh.o-libs         := $(LIBSSH_LIBS)
-block-obj-dmg-bz2-$(CONFIG_BZIP2) += dmg-bz2.o
-block-obj-$(if $(CONFIG_DMG),m,n) += $(block-obj-dmg-bz2-y)
-dmg-bz2.o-libs     := $(BZIP2_LIBS)
-block-obj-$(if $(CONFIG_LZFSE),m,n) += dmg-lzfse.o
-dmg-lzfse.o-libs   := $(LZFSE_LIBS)
-qcow.o-libs        := -lz
-linux-aio.o-libs   := -laio
-io_uring.o-cflags  := $(LINUX_IO_URING_CFLAGS)
-io_uring.o-libs    := $(LINUX_IO_URING_LIBS)
-parallels.o-cflags := $(LIBXML2_CFLAGS)
-parallels.o-libs   := $(LIBXML2_LIBS)
diff --git a/block/meson.build b/block/meson.build
new file mode 100644
index 0000000000..a177f2061e
--- /dev/null
+++ b/block/meson.build
@@ -0,0 +1,111 @@
+block_ss.add(genh)
+block_ss.add(files(
+  'accounting.c',
+  'aio_task.c',
+  'amend.c',
+  'backup.c',
+  'backup-top.c',
+  'blkdebug.c',
+  'blklogwrites.c',
+  'blkreplay.c',
+  'blkverify.c',
+  'block-backend.c',
+  'block-copy.c',
+  'commit.c',
+  'copy-on-read.c',
+  'create.c',
+  'crypto.c',
+  'dirty-bitmap.c',
+  'filter-compress.c',
+  'io.c',
+  'mirror.c',
+  'nbd.c',
+  'null.c',
+  'qapi.c',
+  'qcow2-bitmap.c',
+  'qcow2-cache.c',
+  'qcow2-cluster.c',
+  'qcow2-refcount.c',
+  'qcow2-snapshot.c',
+  'qcow2-threads.c',
+  'qcow2.c',
+  'quorum.c',
+  'raw-format.c',
+  'snapshot.c',
+  'throttle-groups.c',
+  'throttle.c',
+  'vhdx-endian.c',
+  'vhdx-log.c',
+  'vhdx.c',
+  'vmdk.c',
+  'vpc.c',
+  'write-threshold.c',
+), zstd)
+
+block_ss.add(when: [zlib, 'CONFIG_QCOW1'], if_true: files('qcow.c'))
+block_ss.add(when: 'CONFIG_VDI', if_true: files('vdi.c'))
+block_ss.add(when: 'CONFIG_CLOOP', if_true: files('cloop.c'))
+block_ss.add(when: 'CONFIG_BOCHS', if_true: files('bochs.c'))
+block_ss.add(when: 'CONFIG_VVFAT', if_true: files('vvfat.c'))
+block_ss.add(when: 'CONFIG_DMG', if_true: files('dmg.c'))
+block_ss.add(when: 'CONFIG_QED', if_true: files(
+  'qed-check.c',
+  'qed-cluster.c',
+  'qed-l2-cache.c',
+  'qed-table.c',
+  'qed.c',
+))
+block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true: files('parallels.c'))
+block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
+block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
+block_ss.add(when: 'CONFIG_LIBISCSI', if_true: files('iscsi-opts.c'))
+block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
+block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
+block_ss.add(when: 'CONFIG_SHEEPDOG', if_true: files('sheepdog.c'))
+block_ss.add(when: ['CONFIG_LINUX_AIO', libaio], if_true: files('linux-aio.c'))
+block_ss.add(when: ['CONFIG_LINUX_IO_URING', linux_io_uring], if_true: files('io_uring.c'))
+
+block_modules = []
+
+modsrc = []
+foreach m : [
+  ['CONFIG_CURL', 'curl', [curl, glib], 'curl.c'],
+  ['CONFIG_GLUSTERFS', 'gluster', glusterfs, 'gluster.c'],
+  ['CONFIG_LIBISCSI', 'iscsi', libiscsi, 'iscsi.c'],
+  ['CONFIG_LIBNFS', 'nfs', libnfs, 'nfs.c'],
+  ['CONFIG_LIBSSH', 'ssh', libssh, 'ssh.c'],
+  ['CONFIG_RBD', 'rbd', rbd, 'rbd.c'],
+]
+  if config_host.has_key(m[0])
+    if enable_modules
+      modsrc += files(m[3])
+    endif
+    block_modules += [[m[1], files(m[3]), m[2]]]
+  endif
+endforeach
+
+# those are not exactly regular block modules, so treat them apart
+if 'CONFIG_DMG' in config_host
+  foreach m : [
+    ['CONFIG_LZFSE', 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
+    ['CONFIG_BZIP2', 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
+  ]
+    if config_host.has_key(m[0])
+      block_modules += [[m[1], files(m[3]), m[2]]]
+    endif
+  endforeach
+endif
+
+module_block_py = find_program('../scripts/modules/module_block.py')
+module_block_h = custom_target('module_block.h',
+                               output: 'module_block.h',
+                               input: modsrc,
+                               command: [module_block_py, '@OUTPUT0@', modsrc])
+block_ss.add(module_block_h)
+
+block_ss.add(files('stream.c'))
+
+softmmu_ss.add(files('qapi-sysemu.c'))
+subdir('monitor')
+
+modules += {'block': block_modules}
diff --git a/block/monitor/Makefile.objs b/block/monitor/Makefile.objs
deleted file mode 100644
index 39acf85022..0000000000
--- a/block/monitor/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-common-obj-y += block-hmp-cmds.o
-block-obj-y += bitmap-qmp-cmds.o
diff --git a/block/monitor/meson.build b/block/monitor/meson.build
new file mode 100644
index 0000000000..374aac1140
--- /dev/null
+++ b/block/monitor/meson.build
@@ -0,0 +1,2 @@
+softmmu_ss.add(files('block-hmp-cmds.c'))
+block_ss.add(files('bitmap-qmp-cmds.c'))
diff --git a/configure b/configure
index 92fcb8df56..966351314f 100755
--- a/configure
+++ b/configure
@@ -2643,8 +2643,6 @@ if test "$zstd" != "no" ; then
     if $pkg_config --atleast-version=$libzstd_minver libzstd ; then
         zstd_cflags="$($pkg_config --cflags libzstd)"
         zstd_libs="$($pkg_config --libs libzstd)"
-        LIBS="$zstd_libs $LIBS"
-        QEMU_CFLAGS="$QEMU_CFLAGS $zstd_cflags"
         zstd="yes"
     else
         if test "$zstd" = "yes" ; then
@@ -4062,7 +4060,8 @@ if test "$zlib" != "no" ; then
 int main(void) { zlibVersion(); return 0; }
 EOF
         if compile_prog "" "-lz" ; then
-            LIBS="$LIBS -lz"
+            zlib_libs=-lz
+            LIBS="$LIBS $zlib_libs"
         else
             error_exit "zlib check failed" \
                 "Make sure to have the zlib libs and headers installed."
@@ -7347,7 +7346,11 @@ fi
 if test "$posix_memalign" = "yes" ; then
   echo "CONFIG_POSIX_MEMALIGN=y" >> $config_host_mak
 fi
-
+if test "$zlib" != "no" ; then
+    echo "CONFIG_ZLIB=y" >> $config_host_mak
+    echo "ZLIB_CFLAGS=$zlib_cflags" >> $config_host_mak
+    echo "ZLIB_LIBS=$zlib_libs" >> $config_host_mak
+fi
 if test "$spice" = "yes" ; then
   echo "CONFIG_SPICE=y" >> $config_host_mak
 fi
@@ -7417,6 +7420,8 @@ fi
 
 if test "$zstd" = "yes" ; then
   echo "CONFIG_ZSTD=y" >> $config_host_mak
+  echo "ZSTD_CFLAGS=$zstd_cflags" >> $config_host_mak
+  echo "ZSTD_LIBS=$zstd_libs" >> $config_host_mak
 fi
 
 if test "$libiscsi" = "yes" ; then
@@ -7449,7 +7454,6 @@ if test "$qom_cast_debug" = "yes" ; then
 fi
 if test "$rbd" = "yes" ; then
   echo "CONFIG_RBD=m" >> $config_host_mak
-  echo "RBD_CFLAGS=$rbd_cflags" >> $config_host_mak
   echo "RBD_LIBS=$rbd_libs" >> $config_host_mak
 fi
 
diff --git a/meson.build b/meson.build
index 19538284e1..dabba7e452 100644
--- a/meson.build
+++ b/meson.build
@@ -105,6 +105,26 @@ pam = not_found
 if 'CONFIG_AUTH_PAM' in config_host
   pam = cc.find_library('pam')
 endif
+libaio = cc.find_library('aio', required: false)
+zlib = not_found
+if 'CONFIG_ZLIB' in config_host
+  zlib = declare_dependency(compile_args: config_host['ZLIB_CFLAGS'].split(),
+                            link_args: config_host['ZLIB_LIBS'].split())
+endif
+linux_io_uring = not_found
+if 'CONFIG_LINUX_IO_URING' in config_host
+  linux_io_uring = declare_dependency(compile_args: config_host['LINUX_IO_URING_CFLAGS'].split(),
+                                      link_args: config_host['LINUX_IO_URING_LIBS'].split())
+endif
+libxml2 = not_found
+if 'CONFIG_LIBXML2' in config_host
+  libxml2 = declare_dependency(compile_args: config_host['LIBXML2_CFLAGS'].split(),
+                               link_args: config_host['LIBXML2_LIBS'].split())
+endif
+libnfs = not_found
+if 'CONFIG_LIBNFS' in config_host
+  libnfs = declare_dependency(link_args: config_host['LIBNFS_LIBS'].split())
+endif
 libattr = not_found
 if 'CONFIG_ATTR' in config_host
   libattr = declare_dependency(link_args: config_host['LIBATTR_LIBS'].split())
@@ -129,6 +149,11 @@ if 'CONFIG_LIBISCSI' in config_host
   libiscsi = declare_dependency(compile_args: config_host['LIBISCSI_CFLAGS'].split(),
                                 link_args: config_host['LIBISCSI_LIBS'].split())
 endif
+zstd = not_found
+if 'CONFIG_ZSTD' in config_host
+  zstd = declare_dependency(compile_args: config_host['ZSTD_CFLAGS'].split(),
+                            link_args: config_host['ZSTD_LIBS'].split())
+endif
 gbm = not_found
 if 'CONFIG_GBM' in config_host
   gbm = declare_dependency(compile_args: config_host['GBM_CFLAGS'].split(),
@@ -148,6 +173,28 @@ libudev = not_found
 if 'CONFIG_LIBUDEV' in config_host
   libudev = declare_dependency(link_args: config_host['LIBUDEV_LIBS'].split())
 endif
+rbd = not_found
+if 'CONFIG_RBD' in config_host
+  rbd = declare_dependency(link_args: config_host['RBD_LIBS'].split())
+endif
+glusterfs = not_found
+if 'CONFIG_GLUSTERFS' in config_host
+  glusterfs = declare_dependency(compile_args: config_host['GLUSTERFS_CFLAGS'].split(),
+                                 link_args: config_host['GLUSTERFS_LIBS'].split())
+endif
+libssh = not_found
+if 'CONFIG_LIBSSH' in config_host
+  libssh = declare_dependency(compile_args: config_host['LIBSSH_CFLAGS'].split(),
+                              link_args: config_host['LIBSSH_LIBS'].split())
+endif
+libbzip2 = not_found
+if 'CONFIG_BZIP2' in config_host
+  libbzip2 = declare_dependency(link_args: config_host['BZIP2_LIBS'].split())
+endif
+liblzfse = not_found
+if 'CONFIG_LZFSE' in config_host
+  liblzfse = declare_dependency(link_args: config_host['LZFSE_LIBS'].split())
+endif
 
 create_config = find_program('scripts/create_config')
 minikconf = find_program('scripts/minikconf.py')
@@ -454,6 +501,18 @@ subdir('chardev')
 subdir('fsdev')
 subdir('target')
 
+block_ss.add(files(
+  'block.c',
+  'blockjob.c',
+  'job.c',
+  'qemu-io-cmds.c',
+))
+block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
+
+subdir('nbd')
+subdir('scsi')
+subdir('block')
+
 mods = []
 block_mods = []
 softmmu_mods = []
@@ -488,6 +547,15 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
                              capture: true,
                              command: [undefsym, nm, '@INPUT@'])
 
+block_ss = block_ss.apply(config_host, strict: false)
+libblock = static_library('block', block_ss.sources(),
+                          dependencies: block_ss.dependencies(),
+                          link_depends: block_syms,
+                          name_suffix: 'fa',
+                          build_by_default: false)
+
+block = declare_dependency(link_whole: [libblock],
+                           link_args: '@block.syms')
 
 foreach m : mods
   shared_module(m['dir'] + '-' + m['name'],
diff --git a/nbd/Makefile.objs b/nbd/Makefile.objs
deleted file mode 100644
index eb3dd4461d..0000000000
--- a/nbd/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-block-obj-y += server.o client.o common.o
diff --git a/nbd/meson.build b/nbd/meson.build
new file mode 100644
index 0000000000..0c00a776d3
--- /dev/null
+++ b/nbd/meson.build
@@ -0,0 +1,5 @@
+block_ss.add(files(
+  'client.c',
+  'common.c',
+  'server.c',
+))
diff --git a/rules.mak b/rules.mak
index 9da9dcd4f6..8285fe529a 100644
--- a/rules.mak
+++ b/rules.mak
@@ -374,8 +374,7 @@ define unnest-vars
             # Find all the .mo objects in variables and add dependency rules
             # according to .mo-objs. Report error if not set
             $(if $($o-objs),
-                $(eval $(o:%.mo=%$(DSOSUF)): module-common.o $($o-objs)),
-                $(error $o added in $v but $o-objs is not set)))
+                $(eval $(o:%.mo=%$(DSOSUF)): module-common.o $($o-objs))))
         $(shell mkdir -p ./ $(sort $(dir $($v))))
         # Include all the .d files
         $(eval -include $(patsubst %.o,%.d,$(patsubst %.mo,%.d,$(filter %.o,$($v)))))
diff --git a/scsi/Makefile.objs b/scsi/Makefile.objs
deleted file mode 100644
index bb8789cd8b..0000000000
--- a/scsi/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-block-obj-y += utils.o
-
-block-obj-$(CONFIG_LINUX) += pr-manager.o pr-manager-helper.o
-block-obj-$(call lnot,$(CONFIG_LINUX)) += pr-manager-stub.o
diff --git a/scsi/meson.build b/scsi/meson.build
new file mode 100644
index 0000000000..53f3a1f716
--- /dev/null
+++ b/scsi/meson.build
@@ -0,0 +1,4 @@
+block_ss.add(files('utils.c'))
+block_ss.add(when: 'CONFIG_LINUX',
+             if_true: files('pr-manager.c', 'pr-manager-helper.c'),
+             if_false: files('pr-manager-stub.c'))
-- 
2.26.2



