Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695D24D2EF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:41:30 +0200 (CEST)
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94UD-00019z-EY
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DS-0001Xs-6Q
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50645
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DO-0001XA-Fv
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTLBASyZXTpBzQp3pPpUDXlFDN6UXgZTXL3fTgX6ZC4=;
 b=LUQL+nKOUhj83N4OvIPkYO9YoTh9fLQEvI311C2w/9UdQCKrlC1owDvBO4QX48nakpjTaH
 z/1/KiB1HPUE0E+Ion85UI2KI/106q3fcg5+k0Xe5fWwRKMyazt+cnTSUMilU+QsYb8KlD
 Hb9tYpfhyUnz/az5FStZqfLdMc0idDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-wRaHNrzuMNWKINJXOFsCPg-1; Fri, 21 Aug 2020 06:24:04 -0400
X-MC-Unique: wRaHNrzuMNWKINJXOFsCPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36BBE191E2B2
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E05B419D6C;
 Fri, 21 Aug 2020 10:24:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 038/152] contrib/elf2dmp: convert to meson
Date: Fri, 21 Aug 2020 06:21:35 -0400
Message-Id: <20200821102329.29777-39-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                      | 4 ----
 Makefile.objs                 | 6 ------
 configure                     | 3 ---
 contrib/elf2dmp/Makefile.objs | 4 ----
 contrib/elf2dmp/meson.build   | 5 +++++
 meson.build                   | 6 ++++++
 6 files changed, 11 insertions(+), 17 deletions(-)
 delete mode 100644 contrib/elf2dmp/Makefile.objs
 create mode 100644 contrib/elf2dmp/meson.build

diff --git a/Makefile b/Makefile
index e16cbe6191..91602ad51e 100644
--- a/Makefile
+++ b/Makefile
@@ -302,7 +302,6 @@ dummy := $(call unnest-vars,, \
                 authz-obj-y \
                 chardev-obj-y \
                 qga-obj-y \
-                elf2dmp-obj-y \
                 qga-vss-dll-obj-y \
                 block-obj-y \
                 block-obj-m \
@@ -512,9 +511,6 @@ ifneq ($(EXESUF),)
 qemu-ga: qemu-ga$(EXESUF) $(QGA_VSS_PROVIDER) $(QEMU_GA_MSI)
 endif
 
-elf2dmp$(EXESUF): $(elf2dmp-obj-y)
-	$(call LINK, $^)
-
 module_block.h: $(SRC_PATH)/scripts/modules/module_block.py config-host.mak
 	$(call quiet-command,$(PYTHON) $< $@ \
 	$(addprefix $(SRC_PATH)/,$(patsubst %.mo,%.c,$(block-obj-m))), \
diff --git a/Makefile.objs b/Makefile.objs
index 336a684ff3..1486254a2c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -100,9 +100,3 @@ version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
 # extracted into a QAPI schema module, or perhaps a separate schema.
 qga-obj-y = qga/
 qga-vss-dll-obj-y = qga/
-
-######################################################################
-# contrib
-elf2dmp-obj-y = contrib/elf2dmp/
-
-######################################################################
diff --git a/configure b/configure
index 1d00af339c..dc27877932 100755
--- a/configure
+++ b/configure
@@ -6725,9 +6725,6 @@ if test "$want_tools" = "yes" ; then
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
     tools="qemu-nbd\$(EXESUF) qemu-storage-daemon\$(EXESUF) $tools"
   fi
-  if [ "$curl" = "yes" ]; then
-      tools="elf2dmp\$(EXESUF) $tools"
-  fi
 fi
 if test "$softmmu" = yes ; then
   if test "$linux" = yes; then
diff --git a/contrib/elf2dmp/Makefile.objs b/contrib/elf2dmp/Makefile.objs
deleted file mode 100644
index 1505716916..0000000000
--- a/contrib/elf2dmp/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-elf2dmp-obj-y = main.o addrspace.o download.o pdb.o qemu_elf.o
-
-download.o-cflags := $(CURL_CFLAGS)
-download.o-libs   := $(CURL_LIBS)
diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build
new file mode 100644
index 0000000000..b3de173316
--- /dev/null
+++ b/contrib/elf2dmp/meson.build
@@ -0,0 +1,5 @@
+if 'CONFIG_CURL' in config_host
+  executable('elf2dmp', files('main.c', 'addrspace.c', 'download.c', 'pdb.c', 'qemu_elf.c'),
+             dependencies: [glib, curl],
+             install: true)
+endif
diff --git a/meson.build b/meson.build
index c1078b6759..59ac2f05d9 100644
--- a/meson.build
+++ b/meson.build
@@ -110,6 +110,11 @@ if 'CONFIG_VIRGL' in config_host
   virgl = declare_dependency(compile_args: config_host['VIRGL_CFLAGS'].split(),
                              link_args: config_host['VIRGL_LIBS'].split())
 endif
+curl = not_found
+if 'CONFIG_CURL' in config_host
+  curl = declare_dependency(compile_args: config_host['CURL_CFLAGS'].split(),
+                            link_args: config_host['CURL_LIBS'].split())
+endif
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_user = false
@@ -274,6 +279,7 @@ qemuutil = declare_dependency(link_with: libqemuutil,
 
 if have_tools
   subdir('contrib/rdmacm-mux')
+  subdir('contrib/elf2dmp')
 
   if 'CONFIG_VHOST_USER' in config_host
     subdir('contrib/libvhost-user')
-- 
2.26.2



