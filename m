Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22076240BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:29:18 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Bbp-0003JZ-5a
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BJZ-0007gc-LO
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BJW-0002qr-Mz
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJ6R1HLMwakwNbb1kvTa+tXJgQ90Hx2q/rx0hE7JYug=;
 b=CgZM8cUcgIMUEKXAiq/7JdJNw5sNNHjp9l+/Ywwtb2FgL9Nvjt/TN0/v0zh8IbzLG4O3ys
 yNp1VUA5JLlWGSp2mjfUmsRbfby5nULm6tSTk3droorditfmxBpALC2VKYERA262s8ddui
 VinnuVMa2bYgMeIJnQG56IYA1bl2eRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-U-1QnunhOa-mtnJaxYZTwg-1; Mon, 10 Aug 2020 13:10:20 -0400
X-MC-Unique: U-1QnunhOa-mtnJaxYZTwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37BE819067E1
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:10:19 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 454DA87D6B;
 Mon, 10 Aug 2020 17:10:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 043/147] meson: add virtfs-proxy-helper
Date: Mon, 10 Aug 2020 19:07:21 +0200
Message-Id: <1597079345-42801-44-git-send-email-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 11:11:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Makefile          | 2 --
 configure         | 7 +++++--
 fsdev/meson.build | 8 ++++++++
 meson.build       | 6 ++++++
 4 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 fsdev/meson.build

diff --git a/Makefile b/Makefile
index 6e22245..f4e5ecf 100644
--- a/Makefile
+++ b/Makefile
@@ -413,8 +413,6 @@ qemu-nbd$(EXESUF): qemu-nbd.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io
 qemu-io$(EXESUF): qemu-io.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 qemu-storage-daemon$(EXESUF): qemu-storage-daemon.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(chardev-obj-y) $(io-obj-y) $(qom-obj-y) $(storage-daemon-obj-y) $(COMMON_LDADDS)
 
-fsdev/virtfs-proxy-helper$(EXESUF): fsdev/virtfs-proxy-helper.o fsdev/9p-marshal.o fsdev/9p-iov-marshal.o $(COMMON_LDADDS)
-
 scsi/qemu-pr-helper$(EXESUF): scsi/qemu-pr-helper.o scsi/utils.o $(authz-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 ifdef CONFIG_MPATH
 scsi/qemu-pr-helper$(EXESUF): LIBS += -ludev -lmultipath -lmpathpersist
diff --git a/configure b/configure
index bdd5c48..76a4658 100755
--- a/configure
+++ b/configure
@@ -4325,6 +4325,7 @@ fi
 ##########################################
 # attr probe
 
+libattr_libs=
 if test "$attr" != "no" ; then
   cat > $TMPC <<EOF
 #include <stdio.h>
@@ -4341,7 +4342,8 @@ EOF
   # Older distros have <attr/xattr.h>, and need -lattr:
   elif compile_prog "-DCONFIG_LIBATTR" "-lattr" ; then
     attr=yes
-    LIBS="-lattr $LIBS"
+    libattr_libs="-lattr"
+    LIBS="$libattr_libs $LIBS"
     libattr=yes
   else
     if test "$attr" = "yes" ; then
@@ -6644,6 +6646,7 @@ if [ "$eventfd" = "yes" ]; then
 fi
 
 tools=""
+helpers=""
 if test "$want_tools" = "yes" ; then
   tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
@@ -6654,7 +6657,6 @@ if test "$softmmu" = yes ; then
   if test "$linux" = yes; then
     if test "$virtfs" != no && test "$cap_ng" = yes && test "$attr" = yes ; then
       virtfs=yes
-      helpers="$helpers fsdev/virtfs-proxy-helper\$(EXESUF)"
     else
       if test "$virtfs" = yes; then
         error_exit "VirtFS requires libcap-ng devel and libattr devel"
@@ -7236,6 +7238,7 @@ if test "$linux_io_uring" = "yes" ; then
 fi
 if test "$attr" = "yes" ; then
   echo "CONFIG_ATTR=y" >> $config_host_mak
+  echo "LIBATTR_LIBS=$libattr_libs" >> $config_host_mak
 fi
 if test "$libattr" = "yes" ; then
   echo "CONFIG_LIBATTR=y" >> $config_host_mak
diff --git a/fsdev/meson.build b/fsdev/meson.build
new file mode 100644
index 0000000..30e2319
--- /dev/null
+++ b/fsdev/meson.build
@@ -0,0 +1,8 @@
+have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and 'CONFIG_VIRTFS' in config_host
+if have_virtfs_proxy_helper
+  executable('virtfs-proxy-helper',
+             files('virtfs-proxy-helper.c', '9p-marshal.c', '9p-iov-marshal.c'),
+             dependencies: [qemuutil, libattr, libcap_ng],
+             install: true,
+             install_dir: get_option('libexecdir'))
+endif
diff --git a/meson.build b/meson.build
index b5de9f4..d71d87d 100644
--- a/meson.build
+++ b/meson.build
@@ -81,6 +81,10 @@ if 'CONFIG_GNUTLS' in config_host
 endif
 pixman = declare_dependency(compile_args: config_host['PIXMAN_CFLAGS'].split(),
                             link_args: config_host['PIXMAN_LIBS'].split())
+libattr = not_found
+if 'CONFIG_ATTR' in config_host
+  libattr = declare_dependency(link_args: config_host['LIBATTR_LIBS'].split())
+endif
 seccomp = not_found
 if 'CONFIG_SECCOMP' in config_host
   seccomp = declare_dependency(compile_args: config_host['SECCOMP_CFLAGS'].split(),
@@ -280,6 +284,8 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
+subdir('fsdev')
+
 # Other build targets
 if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
-- 
1.8.3.1



