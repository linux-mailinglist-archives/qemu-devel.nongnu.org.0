Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6B23E27E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:46:42 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3lqb-00074E-LG
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lPN-0006yD-IC
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:18:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58023
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lPL-0006eH-Fl
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dML5eCovLgLX7NmYqgD15Mx8pEcIi5cjKd7b0sYFUU=;
 b=X7VuHdv/cJD8s7pY8QkNrmnSisYU1Dr/uE9lzqDMzVwyQkHMivPdrg+a8Z1gNi6phi4L0H
 hidGCaXYXmduA9omD9s+NVP7mDK3aQYUEqD9PnpFwqmlgRwA4vxX61dH+defpm+iwFDp5X
 tn1R9fuvgsrgsy481+tr5Fhz/g4QxZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-3Y-OfsmoOOSHeW_91DzExg-1; Thu, 06 Aug 2020 15:18:28 -0400
X-MC-Unique: 3Y-OfsmoOOSHeW_91DzExg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C4A3100AA22
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:18:27 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8D95F9DC;
 Thu,  6 Aug 2020 19:18:26 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 072/143] meson: convert common QMP bits for qemu and
 qemu-storage-daemon
Date: Thu,  6 Aug 2020 21:15:08 +0200
Message-Id: <1596741379-12902-73-git-send-email-pbonzini@redhat.com>
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs         |  8 +++++---
 Makefile.target       |  1 -
 meson.build           | 10 ++++++++++
 monitor/Makefile.objs |  6 ------
 monitor/meson.build   |  9 +++++++++
 qom/Makefile.objs     |  2 --
 qom/meson.build       |  3 +++
 7 files changed, 27 insertions(+), 12 deletions(-)
 delete mode 100644 monitor/Makefile.objs
 create mode 100644 monitor/meson.build
 delete mode 100644 qom/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index 11ca458..9b9bb40 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -36,10 +36,11 @@ endif # CONFIG_SOFTMMU or CONFIG_TOOLS
 # storage-daemon-obj-y is code used by qemu-storage-daemon (these objects are
 # used for system emulation, too, but specified separately there)
 
-storage-daemon-obj-y = block/ monitor/ qapi/ qom/ storage-daemon/
+storage-daemon-obj-y = block/ qapi/ qom/ storage-daemon/
 storage-daemon-obj-y += blockdev.o blockdev-nbd.o iothread.o job-qmp.o
 storage-daemon-obj-$(CONFIG_WIN32) += os-win32.o
 storage-daemon-obj-$(CONFIG_POSIX) += os-posix.o
+storage-daemon-obj-y += libqmp.fa
 
 ######################################################################
 # Target independent part of system emulation. The long term path is to
@@ -47,8 +48,7 @@ storage-daemon-obj-$(CONFIG_POSIX) += os-posix.o
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-y = monitor/
-common-obj-y += net/
+common-obj-y = net/
 common-obj-$(CONFIG_LINUX) += fsdev/
 
 common-obj-y += accel/
@@ -82,6 +82,8 @@ common-obj-y += backends/
 
 common-obj-y += qapi/
 
+common-obj-y += libqmp.fa
+
 endif # CONFIG_SOFTMMU
 
 #######################################################################
diff --git a/Makefile.target b/Makefile.target
index c8f7a6c..54a9ef1 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -157,7 +157,6 @@ ifdef CONFIG_SOFTMMU
 obj-y += softmmu/
 obj-y += gdbstub.o
 obj-y += hw/
-obj-y += monitor/
 obj-y += qapi/
 obj-y += migration/ram.o
 LIBS := $(libs_softmmu) $(LIBS)
diff --git a/meson.build b/meson.build
index f025ac5..cfc57f8 100644
--- a/meson.build
+++ b/meson.build
@@ -451,6 +451,7 @@ stub_ss = ss.source_set()
 trace_ss = ss.source_set()
 block_ss = ss.source_set()
 blockdev_ss = ss.source_set()
+qmp_ss = ss.source_set()
 common_ss = ss.source_set()
 softmmu_ss = ss.source_set()
 user_ss = ss.source_set()
@@ -628,6 +629,7 @@ softmmu_ss.add(when: ['CONFIG_FDT', fdt],  if_true: [files('device_tree.c')])
 common_ss.add(files('cpus-common.c'))
 
 subdir('softmmu')
+subdir('monitor')
 
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
@@ -677,6 +679,14 @@ block = declare_dependency(link_whole: [libblock],
                            link_args: '@block.syms',
                            dependencies: [crypto, io])
 
+qmp_ss = qmp_ss.apply(config_host, strict: false)
+libqmp = static_library('qmp', qmp_ss.sources(),
+                        dependencies: qmp_ss.dependencies(),
+                        name_suffix: 'fa',
+                        build_by_default: false)
+
+qmp = declare_dependency(link_whole: [libqmp])
+
 foreach m : mods
   shared_module(m['dir'] + '-' + m['name'],
                 name_prefix: '',
diff --git a/monitor/Makefile.objs b/monitor/Makefile.objs
deleted file mode 100644
index a8533c9..0000000
--- a/monitor/Makefile.objs
+++ /dev/null
@@ -1,6 +0,0 @@
-obj-y += misc.o
-common-obj-y += monitor.o qmp.o hmp.o
-common-obj-y += qmp-cmds.o qmp-cmds-control.o
-common-obj-y += hmp-cmds.o
-
-storage-daemon-obj-y += monitor.o qmp.o qmp-cmds-control.o
diff --git a/monitor/meson.build b/monitor/meson.build
new file mode 100644
index 0000000..0484a64
--- /dev/null
+++ b/monitor/meson.build
@@ -0,0 +1,9 @@
+qmp_ss.add(files('monitor.c', 'qmp.c', 'qmp-cmds-control.c'))
+
+softmmu_ss.add(files(
+  'hmp-cmds.c',
+  'hmp.c',
+  'qmp-cmds.c',
+))
+
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('misc.c'))
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
deleted file mode 100644
index b962904..0000000
--- a/qom/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-common-obj-$(CONFIG_SOFTMMU) += qom-hmp-cmds.o qom-qmp-cmds.o
-storage-daemon-obj-y += qom-qmp-cmds.o
diff --git a/qom/meson.build b/qom/meson.build
index 4af044d..35815f6 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -7,6 +7,9 @@ qom_ss.add(files(
   'qom-qobject.c',
 ))
 
+qmp_ss.add(files('qom-qmp-cmds.c'))
+softmmu_ss.add(files('qom-hmp-cmds.c'))
+
 qom_ss = qom_ss.apply(config_host, strict: false)
 libqom = static_library('qom', qom_ss.sources(),
                         dependencies: [qom_ss.dependencies()],
-- 
1.8.3.1



