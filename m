Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623282487A5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:35:20 +0200 (CEST)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82hr-0005mf-BZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82KX-0003ev-3W
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46246
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82KT-0007NX-UT
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I01kMBp63EOgupnkKBjWSy2Amff3pdqr9v9AU6HZRz4=;
 b=CP0LMxc9no2vIAjNyGVbRY38cXFdlRdLduuXvLpViynTUDjXfaEyw8pHj9Nrrlbt5wUcXl
 hE0/klT4/DxbI85m1u4+ssjK7OJbLVjcDNoWopXSFtGEXIU/jkAf7miqG/BL2Ku5Yv9v4h
 0iCmGPMek772DFArjK2aTbjCQKpOuAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-R2vt8aTBPXOR73PnOCKEIw-1; Tue, 18 Aug 2020 10:11:02 -0400
X-MC-Unique: R2vt8aTBPXOR73PnOCKEIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB857101962B
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E5659;
 Tue, 18 Aug 2020 14:11:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 037/150] contrib/elf2dmp: convert to meson
Date: Tue, 18 Aug 2020 10:08:32 -0400
Message-Id: <20200818141025.21608-38-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
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
index 208e98dd4d..653c16bb0d 100644
--- a/Makefile
+++ b/Makefile
@@ -293,7 +293,6 @@ dummy := $(call unnest-vars,, \
                 authz-obj-y \
                 chardev-obj-y \
                 qga-obj-y \
-                elf2dmp-obj-y \
                 qga-vss-dll-obj-y \
                 block-obj-y \
                 block-obj-m \
@@ -503,9 +502,6 @@ ifneq ($(EXESUF),)
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
index 932c0743e4..02b3336a32 100755
--- a/configure
+++ b/configure
@@ -6680,9 +6680,6 @@ if test "$want_tools" = "yes" ; then
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
index 7bb5984652..1fd903c32a 100644
--- a/meson.build
+++ b/meson.build
@@ -107,6 +107,11 @@ if 'CONFIG_VIRGL' in config_host
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
@@ -271,6 +276,7 @@ qemuutil = declare_dependency(link_with: libqemuutil,
 
 if have_tools
   subdir('contrib/rdmacm-mux')
+  subdir('contrib/elf2dmp')
 
   if 'CONFIG_VHOST_USER' in config_host
     subdir('contrib/libvhost-user')
-- 
2.26.2



