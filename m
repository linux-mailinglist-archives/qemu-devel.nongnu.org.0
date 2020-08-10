Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C902240BD2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:20:39 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BTS-0000qF-9y
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BJC-0006mF-Nn
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:10:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56519
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BJA-0002mo-Rl
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=LfhaaV0IWW8+d6MiU3ZNGehjzRVw6lRdeh9EZzy4RK4=;
 b=GTuTVlVPAH+yRYDdugfABLr7r505M448KzXSdWkUyhxap6+cIL/7vwd699XWz1BcOXYrcQ
 AylfMNamOGMcZZ5PdzpSo0IGXJrr5N5JRFywpbHYvsGJbmeNUtfiHT1z8m7V81VdKRNcLq
 W3dfyBMquYfNwXVnZc3rMA80ZX6H3aI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-05h4nm9tPAqAHEki7MyfRA-1; Mon, 10 Aug 2020 13:09:58 -0400
X-MC-Unique: 05h4nm9tPAqAHEki7MyfRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88F8C10CB427
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:57 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA0065F1E9
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 030/147] contrib/vhost-user-scsi: convert to Meson
Date: Mon, 10 Aug 2020 19:07:08 +0200
Message-Id: <1597079345-42801-31-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:31:01
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

The libiscsi pkg-config information is extracted from config-host.mak and
used to link vhost-user-blk.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                              | 3 ---
 Makefile.objs                         | 3 ---
 contrib/vhost-user-scsi/Makefile.objs | 1 -
 contrib/vhost-user-scsi/meson.build   | 7 +++++++
 meson.build                           | 6 ++++++
 5 files changed, 13 insertions(+), 7 deletions(-)
 delete mode 100644 contrib/vhost-user-scsi/Makefile.objs
 create mode 100644 contrib/vhost-user-scsi/meson.build

diff --git a/Makefile b/Makefile
index 7317554..11716bb 100644
--- a/Makefile
+++ b/Makefile
@@ -296,7 +296,6 @@ dummy := $(call unnest-vars,, \
                 ivshmem-client-obj-y \
                 ivshmem-server-obj-y \
                 rdmacm-mux-obj-y \
-                vhost-user-scsi-obj-y \
                 vhost-user-input-obj-y \
                 vhost-user-gpu-obj-y \
                 qga-vss-dll-obj-y \
@@ -517,8 +516,6 @@ ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
 ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
-vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
-	$(call LINK, $^)
 
 rdmacm-mux$(EXESUF): LIBS += "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
diff --git a/Makefile.objs b/Makefile.objs
index f69736c..ab798b0 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -106,9 +106,6 @@ qga-vss-dll-obj-y = qga/
 elf2dmp-obj-y = contrib/elf2dmp/
 ivshmem-client-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-client/
 ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
-vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
-vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
-vhost-user-scsi-obj-y = contrib/vhost-user-scsi/
 rdmacm-mux-obj-y = contrib/rdmacm-mux/
 vhost-user-input-obj-y = contrib/vhost-user-input/
 vhost-user-gpu-obj-y = contrib/vhost-user-gpu/
diff --git a/contrib/vhost-user-scsi/Makefile.objs b/contrib/vhost-user-scsi/Makefile.objs
deleted file mode 100644
index e83a38a..0000000
--- a/contrib/vhost-user-scsi/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-vhost-user-scsi-obj-y = vhost-user-scsi.o
diff --git a/contrib/vhost-user-scsi/meson.build b/contrib/vhost-user-scsi/meson.build
new file mode 100644
index 0000000..257cbff
--- /dev/null
+++ b/contrib/vhost-user-scsi/meson.build
@@ -0,0 +1,7 @@
+if 'CONFIG_LIBISCSI' in config_host
+  executable('vhost-user-scsi', files('vhost-user-scsi.c'),
+             link_with: libvhost_user,
+             dependencies: [qemuutil, libiscsi],
+             build_by_default: targetos == 'linux',
+             install: false)
+endif
diff --git a/meson.build b/meson.build
index fc1346a..eb0ae2c 100644
--- a/meson.build
+++ b/meson.build
@@ -88,6 +88,11 @@ libcap_ng = not_found
 if 'CONFIG_LIBCAP_NG' in config_host
   libcap_ng = declare_dependency(link_args: config_host['LIBCAP_NG_LIBS'].split())
 endif
+libiscsi = not_found
+if 'CONFIG_LIBISCSI' in config_host
+  libiscsi = declare_dependency(compile_args: config_host['LIBISCSI_CFLAGS'].split(),
+                                link_args: config_host['LIBISCSI_LIBS'].split())
+endif
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_user = false
@@ -254,6 +259,7 @@ if have_tools
   if 'CONFIG_VHOST_USER' in config_host
     subdir('contrib/libvhost-user')
     subdir('contrib/vhost-user-blk')
+    subdir('contrib/vhost-user-scsi')
   endif
 endif
 
-- 
1.8.3.1



