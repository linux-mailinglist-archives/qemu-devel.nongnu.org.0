Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3E2487E1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:39:41 +0200 (CEST)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82m4-0007mb-SD
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Kg-00040K-Se
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41807
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82KX-0007Om-48
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJPDAgGBJ5+W7NXyAPlK9tqt+xTyVeSLeGlG9TPepww=;
 b=ie52xNuNnr95vuS4PJOFBRYVoPsuPxVtTioMM89dxGRvj4GRvJqT6Tu11Rn8BNK2JKmuK1
 A3BOB15/hpXRVf5jkW9W7ZUdOoJKpzhHwmntOhfcpNqtuSz0ztMLtqb6R0K1zdGK92mIvt
 +x6rnkhivoIvzrl3XJYn0n4G6X2aHUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-pkdUwBhoM1KklJfKYrJzrQ-1; Tue, 18 Aug 2020 10:11:10 -0400
X-MC-Unique: pkdUwBhoM1KklJfKYrJzrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B48AD6385
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CDE85882D;
 Tue, 18 Aug 2020 14:11:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 047/150] meson: add virtfs-proxy-helper
Date: Tue, 18 Aug 2020 10:08:42 -0400
Message-Id: <20200818141025.21608-48-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
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
 Makefile          | 2 --
 configure         | 7 +++++--
 fsdev/meson.build | 8 ++++++++
 meson.build       | 6 ++++++
 4 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 fsdev/meson.build

diff --git a/Makefile b/Makefile
index a768af38eb..79abbedd9d 100644
--- a/Makefile
+++ b/Makefile
@@ -420,8 +420,6 @@ qemu-nbd$(EXESUF): qemu-nbd.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io
 qemu-io$(EXESUF): qemu-io.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 qemu-storage-daemon$(EXESUF): qemu-storage-daemon.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(chardev-obj-y) $(io-obj-y) $(qom-obj-y) $(storage-daemon-obj-y) $(COMMON_LDADDS)
 
-fsdev/virtfs-proxy-helper$(EXESUF): fsdev/virtfs-proxy-helper.o fsdev/9p-marshal.o fsdev/9p-iov-marshal.o $(COMMON_LDADDS)
-
 scsi/qemu-pr-helper$(EXESUF): scsi/qemu-pr-helper.o scsi/utils.o $(authz-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 ifdef CONFIG_MPATH
 scsi/qemu-pr-helper$(EXESUF): LIBS += -ludev -lmultipath -lmpathpersist
diff --git a/configure b/configure
index f1ce9d7f0c..1421883577 100755
--- a/configure
+++ b/configure
@@ -4339,6 +4339,7 @@ fi
 ##########################################
 # attr probe
 
+libattr_libs=
 if test "$attr" != "no" ; then
   cat > $TMPC <<EOF
 #include <stdio.h>
@@ -4355,7 +4356,8 @@ EOF
   # Older distros have <attr/xattr.h>, and need -lattr:
   elif compile_prog "-DCONFIG_LIBATTR" "-lattr" ; then
     attr=yes
-    LIBS="-lattr $LIBS"
+    libattr_libs="-lattr"
+    LIBS="$libattr_libs $LIBS"
     libattr=yes
   else
     if test "$attr" = "yes" ; then
@@ -6667,6 +6669,7 @@ if [ "$eventfd" = "yes" ]; then
 fi
 
 tools=""
+helpers=""
 if test "$want_tools" = "yes" ; then
   tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
@@ -6677,7 +6680,6 @@ if test "$softmmu" = yes ; then
   if test "$linux" = yes; then
     if test "$virtfs" != no && test "$cap_ng" = yes && test "$attr" = yes ; then
       virtfs=yes
-      helpers="$helpers fsdev/virtfs-proxy-helper\$(EXESUF)"
     else
       if test "$virtfs" = yes; then
         error_exit "VirtFS requires libcap-ng devel and libattr devel"
@@ -7259,6 +7261,7 @@ if test "$linux_io_uring" = "yes" ; then
 fi
 if test "$attr" = "yes" ; then
   echo "CONFIG_ATTR=y" >> $config_host_mak
+  echo "LIBATTR_LIBS=$libattr_libs" >> $config_host_mak
 fi
 if test "$libattr" = "yes" ; then
   echo "CONFIG_LIBATTR=y" >> $config_host_mak
diff --git a/fsdev/meson.build b/fsdev/meson.build
new file mode 100644
index 0000000000..30e2319960
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
index 0b465043d7..69e099fb8f 100644
--- a/meson.build
+++ b/meson.build
@@ -99,6 +99,10 @@ if 'CONFIG_GNUTLS' in config_host
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
@@ -298,6 +302,8 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
+subdir('fsdev')
+
 # Other build targets
 if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
-- 
2.26.2



