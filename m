Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BA258B39
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 11:16:30 +0200 (CEST)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD2Oz-0003Gl-2w
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD2KP-0003Lc-Bn
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD2KN-0006qA-En
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598951502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbS219AVLb1A+L1jEI7CAc136MB75Gui7SQ3+JMr1Hk=;
 b=TPeatHzRTbGznXuH61kaRrbvzBwCMbdROjcRZHAaTcESS2ybxPJ/Ht7dIRYNU/A4oW5SuI
 rY2cRUs8Pj+s6TVa1QC3bT1yyojKrsrQ2q/Ikk1NCiBRfOKeAl1xoNKPttIRQ99c8dDJaj
 dpb+DkbW+XitNQIBRE8PvdYKlY/nN2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-6nplcxToO4WmAUJn4w5O6g-1; Tue, 01 Sep 2020 05:11:40 -0400
X-MC-Unique: 6nplcxToO4WmAUJn4w5O6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1877418A2243
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 09:11:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDEB661177;
 Tue,  1 Sep 2020 09:11:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] meson: move zlib detection to meson
Date: Tue,  1 Sep 2020 05:11:18 -0400
Message-Id: <20200901091132.29601-11-pbonzini@redhat.com>
In-Reply-To: <20200901091132.29601-1-pbonzini@redhat.com>
References: <20200901091132.29601-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 01:27:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Meson includes the same logic that tries to look for -lz if
pkg-config (and cmake) cannot find zlib.  The undocumented
--disable-zlib-test option becomes a no-op.

There is still an instance of "-lz" in the LIBS directory.
It will go away as soon as tests are converted to meson,
because the zlib dependency does not propagate from libblock.fa
to the Makefile-build unit tests.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 32 +-------------------------------
 meson.build |  6 +-----
 2 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/configure b/configure
index f81900880a..e8946aeefb 100755
--- a/configure
+++ b/configure
@@ -502,7 +502,6 @@ opengl=""
 opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt=""
-zlib="yes"
 capstone=""
 lzo=""
 snappy=""
@@ -1428,7 +1427,7 @@ for opt do
   ;;
   --enable-usb-redir) usb_redir="yes"
   ;;
-  --disable-zlib-test) zlib="no"
+  --disable-zlib-test)
   ;;
   --disable-lzo) lzo="no"
   ;;
@@ -3904,30 +3903,6 @@ if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
     fi
 fi
 
-#########################################
-# zlib check
-
-if test "$zlib" != "no" ; then
-    if $pkg_config --exists zlib; then
-        zlib_cflags=$($pkg_config --cflags zlib)
-        zlib_libs=$($pkg_config --libs zlib)
-        QEMU_CFLAGS="$zlib_cflags $QEMU_CFLAGS"
-        LIBS="$zlib_libs $LIBS"
-    else
-        cat > $TMPC << EOF
-#include <zlib.h>
-int main(void) { zlibVersion(); return 0; }
-EOF
-        if compile_prog "" "-lz" ; then
-            zlib_libs=-lz
-            LIBS="$LIBS $zlib_libs"
-        else
-            error_exit "zlib check failed" \
-                "Make sure to have the zlib libs and headers installed."
-        fi
-    fi
-fi
-
 ##########################################
 # SHA command probe for modules
 if test "$modules" = yes; then
@@ -7135,11 +7110,6 @@ fi
 if test "$posix_memalign" = "yes" ; then
   echo "CONFIG_POSIX_MEMALIGN=y" >> $config_host_mak
 fi
-if test "$zlib" != "no" ; then
-    echo "CONFIG_ZLIB=y" >> $config_host_mak
-    echo "ZLIB_CFLAGS=$zlib_cflags" >> $config_host_mak
-    echo "ZLIB_LIBS=$zlib_libs" >> $config_host_mak
-fi
 if test "$spice" = "yes" ; then
   echo "CONFIG_SPICE=y" >> $config_host_mak
   echo "SPICE_CFLAGS=$spice_cflags" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 6b2fc76933..8b28ecff28 100644
--- a/meson.build
+++ b/meson.build
@@ -134,11 +134,7 @@ if 'CONFIG_AUTH_PAM' in config_host
   pam = cc.find_library('pam')
 endif
 libaio = cc.find_library('aio', required: false)
-zlib = not_found
-if 'CONFIG_ZLIB' in config_host
-  zlib = declare_dependency(compile_args: config_host['ZLIB_CFLAGS'].split(),
-                            link_args: config_host['ZLIB_LIBS'].split())
-endif
+zlib = dependency('zlib', required: true)
 linux_io_uring = not_found
 if 'CONFIG_LINUX_IO_URING' in config_host
   linux_io_uring = declare_dependency(compile_args: config_host['LINUX_IO_URING_CFLAGS'].split(),
-- 
2.26.2



