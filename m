Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C7523E22B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:28:43 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3lZC-0002Hv-35
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lO6-0004F9-5w
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32579
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lO4-0006Q6-4C
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=kY7cpgOkG6vHZDUtutwFJmP7pnFO7ijWy/cHk+7WQLI=;
 b=CE9n/qKPd2eOLRFs8ZWwuVrqNnrd3P/zD9HkrzrVuarEqxBtkEMnTwda4L0Tvnr8i+/GAc
 EfDOapKH2Xyk94QE9Lkq34wp57oFJa1rZ5AepcPz4J9jNZCo9+xQBb8xKiY+nR86eBD0Oo
 uRrVfB/kJ+xP2+wB0h7Ke1UCUqrsHIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-EDw2daEwNOe7v-0CYeqsqw-1; Thu, 06 Aug 2020 15:17:09 -0400
X-MC-Unique: EDw2daEwNOe7v-0CYeqsqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D151DE1
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:08 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70F865F9DC
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 024/143] contrib/libvhost-user: convert to Meson
Date: Thu,  6 Aug 2020 21:14:20 +0200
Message-Id: <1596741379-12902-25-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since libqemuutil.a has been converted to Meson, the conversion is
straightforward.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                            | 16 +++++-----------
 Makefile.objs                       |  1 -
 contrib/libvhost-user/Makefile.objs |  1 -
 contrib/libvhost-user/meson.build   |  2 ++
 meson.build                         |  8 ++++++++
 5 files changed, 15 insertions(+), 13 deletions(-)
 delete mode 100644 contrib/libvhost-user/Makefile.objs
 create mode 100644 contrib/libvhost-user/meson.build

diff --git a/Makefile b/Makefile
index 3f902a2..0d45423 100644
--- a/Makefile
+++ b/Makefile
@@ -302,7 +302,6 @@ dummy := $(call unnest-vars,, \
                 ivshmem-server-obj-y \
                 virtiofsd-obj-y \
                 rdmacm-mux-obj-y \
-                libvhost-user-obj-y \
                 vhost-user-scsi-obj-y \
                 vhost-user-blk-obj-y \
                 vhost-user-input-obj-y \
@@ -428,11 +427,6 @@ $(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h
 Makefile: $(version-obj-y)
 
 ######################################################################
-# Build libraries
-
-libvhost-user.a: $(libvhost-user-obj-y)
-
-######################################################################
 
 COMMON_LDADDS = libqemuutil.a
 
@@ -530,9 +524,9 @@ ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
 ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
-vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) libvhost-user.a $(COMMON_LDADDS)
+vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
-vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) libvhost-user.a $(COMMON_LDADDS)
+vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 
 rdmacm-mux$(EXESUF): LIBS += "-libumad"
@@ -541,16 +535,16 @@ rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
 
 # relies on Linux-specific syscalls
 ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
-virtiofsd$(EXESUF): $(virtiofsd-obj-y) libvhost-user.a $(COMMON_LDADDS)
+virtiofsd$(EXESUF): $(virtiofsd-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
 
-vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) libvhost-user.a $(COMMON_LDADDS)
+vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 
 ifdef CONFIG_VHOST_USER_INPUT
 ifdef CONFIG_LINUX
-vhost-user-input$(EXESUF): $(vhost-user-input-obj-y) libvhost-user.a $(COMMON_LDADDS)
+vhost-user-input$(EXESUF): $(vhost-user-input-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 
 # build by default, do not install
diff --git a/Makefile.objs b/Makefile.objs
index e5c9077..9489864 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -106,7 +106,6 @@ qga-vss-dll-obj-y = qga/
 elf2dmp-obj-y = contrib/elf2dmp/
 ivshmem-client-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-client/
 ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
-libvhost-user-obj-y = contrib/libvhost-user/
 vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
 vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
 vhost-user-scsi-obj-y = contrib/vhost-user-scsi/
diff --git a/contrib/libvhost-user/Makefile.objs b/contrib/libvhost-user/Makefile.objs
deleted file mode 100644
index ef3778e..0000000
--- a/contrib/libvhost-user/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-libvhost-user-obj-y += libvhost-user.o libvhost-user-glib.o
diff --git a/contrib/libvhost-user/meson.build b/contrib/libvhost-user/meson.build
new file mode 100644
index 0000000..03ba2af
--- /dev/null
+++ b/contrib/libvhost-user/meson.build
@@ -0,0 +1,2 @@
+libvhost_user = static_library('vhost-user',
+                               [files('libvhost-user.c', 'libvhost-user-glib.c')])
diff --git a/meson.build b/meson.build
index bfaa08f..4540a81 100644
--- a/meson.build
+++ b/meson.build
@@ -223,6 +223,14 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
+# Other build targets
+
+if have_tools
+  if 'CONFIG_VHOST_USER' in config_host
+    subdir('contrib/libvhost-user')
+  endif
+endif
+
 summary_info = {}
 summary_info += {'Install prefix':    config_host['prefix']}
 summary_info += {'BIOS directory':    config_host['qemu_datadir']}
-- 
1.8.3.1



