Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936FD244751
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:47:20 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WIx-0006qW-K4
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnJ-0006mD-V4
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33888
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnG-00031r-CY
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1vdLqyZHYPVpKZYlNKe7l8hkA0P1BlGDeAlf+ZccV8=;
 b=XqrHjm2zlvM2jk+Zsx+Q8ElHi4D2QRRWG8Lo1L2EcCOmkOFZkqGGNs/dYwAIvImXMkcA/w
 z+82x1pEvb3Zi/pG4FsjfgqlBliLVKGdAolA5vmK0rCt8QnuJw6vRD+xI4LkUfkn5FXRtV
 P4hcJsF9O4rIq3e3tOtCGPKoExEHtUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-bPeQNcJyN1O9a2zDcxm_8w-1; Fri, 14 Aug 2020 05:14:31 -0400
X-MC-Unique: bPeQNcJyN1O9a2zDcxm_8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9C48015C3
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0216600E4;
 Fri, 14 Aug 2020 09:14:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 086/150] meson: convert hw/core
Date: Fri, 14 Aug 2020 05:12:22 -0400
Message-Id: <20200814091326.16173-87-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
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
 hw/Makefile.objs       |  1 -
 hw/core/Makefile.objs  | 34 -----------------------------
 hw/core/meson.build    | 49 ++++++++++++++++++++++++++++++++++++++++++
 hw/meson.build         |  1 +
 tests/Makefile.include | 10 +--------
 5 files changed, 51 insertions(+), 44 deletions(-)
 delete mode 100644 hw/core/Makefile.objs
 create mode 100644 hw/core/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index d204a906af..bdf8bdf256 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -1,4 +1,3 @@
-devices-dirs-y = core/
 ifeq ($(CONFIG_SOFTMMU), y)
 devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
 devices-dirs-y += acpi/
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
deleted file mode 100644
index d8fee8effe..0000000000
--- a/hw/core/Makefile.objs
+++ /dev/null
@@ -1,34 +0,0 @@
-# core qdev-related obj files, also used by *-user:
-common-obj-y += qdev.o qdev-properties.o
-common-obj-y += bus.o
-common-obj-y += cpu.o
-common-obj-y += resettable.o
-common-obj-y += hotplug.o
-common-obj-y += vmstate-if.o
-# irq.o needed for qdev GPIO handling:
-common-obj-y += irq.o
-common-obj-y += clock.o qdev-clock.o
-
-common-obj-$(CONFIG_SOFTMMU) += reset.o
-common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
-common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
-common-obj-$(CONFIG_SOFTMMU) += nmi.o
-common-obj-$(CONFIG_SOFTMMU) += vm-change-state-handler.o
-common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
-common-obj-$(CONFIG_SOFTMMU) += sysbus.o
-common-obj-$(CONFIG_SOFTMMU) += machine.o
-common-obj-$(CONFIG_SOFTMMU) += null-machine.o
-common-obj-$(CONFIG_SOFTMMU) += loader.o
-common-obj-$(CONFIG_SOFTMMU) += machine-hmp-cmds.o
-common-obj-$(CONFIG_SOFTMMU) += numa.o
-common-obj-$(CONFIG_SOFTMMU) += clock-vmstate.o
-obj-$(CONFIG_SOFTMMU) += machine-qmp-cmds.o
-
-common-obj-$(CONFIG_XILINX_AXI) += stream.o
-common-obj-$(CONFIG_PTIMER) += ptimer.o
-common-obj-$(CONFIG_FITLOADER) += loader-fit.o
-common-obj-$(CONFIG_REGISTER) += register.o
-common-obj-$(CONFIG_OR_IRQ) += or-irq.o
-common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
-common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
-common-obj-$(CONFIG_GENERIC_LOADER) += generic-loader.o
diff --git a/hw/core/meson.build b/hw/core/meson.build
new file mode 100644
index 0000000000..fc91f98075
--- /dev/null
+++ b/hw/core/meson.build
@@ -0,0 +1,49 @@
+# core qdev-related obj files, also used by *-user and unit tests
+hwcore_files = files(
+  'bus.c',
+  'fw-path-provider.c',
+  'hotplug.c',
+  'qdev-properties.c',
+  'qdev.c',
+  'reset.c',
+  'resettable.c',
+  'vmstate-if.c',
+  # irq.c needed for qdev GPIO handling:
+  'irq.c',
+  'clock.c',
+  'qdev-clock.c',
+)
+
+libhwcore = static_library('hwcore', sources: hwcore_files + genh,
+                           name_suffix: 'fa',
+                           build_by_default: false)
+hwcore = declare_dependency(link_whole: libhwcore)
+common_ss.add(hwcore)
+
+common_ss.add(files('cpu.c'))
+common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
+common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
+common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
+common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
+common_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
+common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+
+softmmu_ss.add(files(
+  'loader.c',
+  'machine-hmp-cmds.c',
+  'machine.c',
+  'nmi.c',
+  'null-machine.c',
+  'qdev-fw.c',
+  'qdev-properties-system.c',
+  'sysbus.c',
+  'vm-change-state-handler.c',
+  'clock-vmstate.c',
+))
+
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
+  'machine-qmp-cmds.c',
+  'numa.c',
+))
diff --git a/hw/meson.build b/hw/meson.build
index 08112a5e4b..fe7c466460 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1 +1,2 @@
+subdir('core')
 subdir('xen')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 425c8ce699..b6d96614cb 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -244,15 +244,7 @@ tests/test-bufferiszero$(EXESUF): tests/test-bufferiszero.o $(test-util-obj-y)
 tests/atomic_add-bench$(EXESUF): tests/atomic_add-bench.o $(test-util-obj-y)
 tests/atomic64-bench$(EXESUF): tests/atomic64-bench.o $(test-util-obj-y)
 
-tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o \
-	hw/core/qdev.o hw/core/qdev-properties.o hw/core/hotplug.o\
-	hw/core/bus.o \
-	hw/core/resettable.o \
-	hw/core/irq.o \
-	hw/core/fw-path-provider.o \
-	hw/core/reset.o \
-	hw/core/vmstate-if.o \
-	hw/core/clock.o hw/core/qdev-clock.o \
+tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o hw/core/libhwcore.fa \
 	$(test-qapi-obj-y)
 tests/test-vmstate$(EXESUF): tests/test-vmstate.o migration/libmigration.fa \
 	$(test-io-obj-y)
-- 
2.26.2



