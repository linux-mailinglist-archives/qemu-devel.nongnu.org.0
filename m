Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5024D323
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:50:17 +0200 (CEST)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94ci-0003wX-SP
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Db-0001me-Lm
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DT-0001ZV-TD
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDnZv2ZQa1bGMRDASM5qTMHQbU0SlAQPIDC6YaCwmTM=;
 b=AR3hzERdY6xJlsZBOm6dTpTOsONhhMfk0mMvLyaeaMLjeGfxgpsKbO+LONqwg1ndecz1ZZ
 NW88QaBVV1texfN43Z0ENy4yFx5Sk0X5YPkw+Us58pvgOlU1xipdo3TTD2SQ+ZSFgKdK+c
 BsA2zPTCR1FIuME168tC+qbirBWcRTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-wcZCmx8aN7i1eLyKGJfK2w-1; Fri, 21 Aug 2020 06:24:09 -0400
X-MC-Unique: wcZCmx8aN7i1eLyKGJfK2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF7B4239E
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BDB55C1D0;
 Fri, 21 Aug 2020 10:24:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 042/152] meson: convert vss-win32
Date: Fri, 21 Aug 2020 06:21:39 -0400
Message-Id: <20200821102329.29777-43-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
 Makefile                    |  1 -
 Makefile.objs               |  8 --------
 qga/Makefile.objs           |  1 -
 qga/meson.build             |  6 ++++++
 qga/vss-win32/Makefile.objs | 23 -----------------------
 qga/vss-win32/meson.build   | 33 +++++++++++++++++++++++++++++++++
 6 files changed, 39 insertions(+), 33 deletions(-)
 delete mode 100644 qga/Makefile.objs
 delete mode 100644 qga/vss-win32/Makefile.objs
 create mode 100644 qga/vss-win32/meson.build

diff --git a/Makefile b/Makefile
index 83e2c86725..0fa9d63bb4 100644
--- a/Makefile
+++ b/Makefile
@@ -301,7 +301,6 @@ endif
 dummy := $(call unnest-vars,, \
                 authz-obj-y \
                 chardev-obj-y \
-                qga-vss-dll-obj-y \
                 block-obj-y \
                 block-obj-m \
                 storage-daemon-obj-y \
diff --git a/Makefile.objs b/Makefile.objs
index 259f9936ac..baf15656e8 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -91,11 +91,3 @@ common-obj-y += disas/
 ######################################################################
 # Resource file for Windows executables
 version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
-
-######################################################################
-# guest agent
-
-# FIXME: a few definitions from qapi/qapi-types.o and
-# qapi/qapi-visit.o are needed by libqemuutil.a.  These should be
-# extracted into a QAPI schema module, or perhaps a separate schema.
-qga-vss-dll-obj-y = qga/
diff --git a/qga/Makefile.objs b/qga/Makefile.objs
deleted file mode 100644
index 9ecf2496da..0000000000
--- a/qga/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-qga-vss-dll-obj-$(CONFIG_QGA_VSS) += vss-win32/
diff --git a/qga/meson.build b/qga/meson.build
index 3513a90f5d..9ddb260cff 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -44,3 +44,9 @@ qga = executable('qemu-ga', qga_ss.sources(),
                  link_args: config_host['LIBS_QGA'].split(),
                  dependencies: [qemuutil, libudev],
                  install: true)
+
+if targetos == 'windows'
+  if 'CONFIG_QGA_VSS' in config_host
+    subdir('vss-win32')
+  endif
+endif
diff --git a/qga/vss-win32/Makefile.objs b/qga/vss-win32/Makefile.objs
deleted file mode 100644
index c82676aeb8..0000000000
--- a/qga/vss-win32/Makefile.objs
+++ /dev/null
@@ -1,23 +0,0 @@
-# rules to build qga-vss.dll
-
-qga-vss-dll-obj-y += requester.o provider.o install.o
-
-obj-qga-vss-dll-obj-y = $(addprefix $(obj)/, $(qga-vss-dll-obj-y))
-$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS := $(filter-out -fstack-protector-all -fstack-protector-strong, $(QEMU_CXXFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
-
-QGA_VSS_LDFLAGS = -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lglib-2.0 -lole32 -loleaut32 -lshlwapi -luuid -lintl -lws2_32 -static
-$(obj)/qga-vss.dll: $(obj-qga-vss-dll-obj-y) $(SRC_PATH)/$(obj)/qga-vss.def
-	$(call quiet-command,$(CXX) -o $@ $(qga-vss-dll-obj-y) $(SRC_PATH)/qga/vss-win32/qga-vss.def $(CXXFLAGS) $(QGA_VSS_LDFLAGS),"LINK","$(TARGET_DIR)$@")
-
-
-# rules to build qga-provider.tlb
-# Currently, only native build is supported because building .tlb
-# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in VC++).
-MIDL=$(WIN_SDK)/Bin/midl
-
-$(obj)/qga-vss.tlb: $(SRC_PATH)/$(obj)/qga-vss.idl
-ifeq ($(WIN_SDK),"")
-	$(call quiet-command,cp $(dir $<)qga-vss.tlb $@,"COPY","$(TARGET_DIR)$@")
-else
-	$(call quiet-command,$(MIDL) -tlb $@ -I $(WIN_SDK)/Include $<,"MIDL","$(TARGET_DIR)$@")
-endif
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
new file mode 100644
index 0000000000..42c8d31a3d
--- /dev/null
+++ b/qga/vss-win32/meson.build
@@ -0,0 +1,33 @@
+if add_languages('cpp', required: false)
+  glib_static = dependency('glib-2.0', static: true)
+  link_args = cc.get_supported_link_arguments(['-fstack-protector-all', '-fstack-protector-strong',
+                                               '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
+  shared_module('qga-vss', ['requester.cpp', 'provider.cpp', 'install.cpp'],
+                name_prefix: '',
+                cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
+                link_args: link_args,
+                vs_module_defs: 'qga-vss.def',
+                dependencies: [glib_static, socket,
+                               cc.find_library('ole32'),
+                               cc.find_library('oleaut32'),
+                               cc.find_library('shlwapi'),
+                               cc.find_library('uuid'),
+                               cc.find_library('intl')])
+endif
+
+# rules to build qga-vss.tlb
+# Currently, only native build is supported because building .tlb
+# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in VC++).
+midl = find_program('midl', required: false)
+if midl.found()
+  gen_tlb = custom_target('gen-tlb',
+                          input: 'qga-vss.idl',
+                          output: 'qga-vss.tlb',
+                          command: [midl, '-tlb', '-I' + config_host['WIN_SDK'],
+                                     '@INPUT@', '@OUTPUT@'])
+else
+  gen_tlb = custom_target('gen-tlb',
+                          input: 'qga-vss.tlb',
+                          output: 'qga-vss.tlb',
+                          command: ['cp', '@INPUT@', '@OUTPUT@'])
+endif
-- 
2.26.2



