Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C190033E05D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:19:47 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH6Q-0002N5-Q3
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2h-0005de-RV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2Z-0003WR-W1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBoqlLC/BhqsNfuI2cl/rqg1pW0BJW/8ArptsabiTFY=;
 b=JFGPjIVyguQHo9A6O/BRd5QZBHywlGY3/4TgRQM+rBWJ9s1W+HiK6p6cRWLJBNXnb6LTbr
 4ZguJycorrlcFhurgIhzmBILWq01ogyRKkrXl9XBKVLcPu4ZguqBaiV3MxJzfSkUW7UpwF
 S9VesgpgE9kqVTjKercBlxM5nlZUMuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-IbMgs1J7NoqO5PgGHIXUTQ-1; Tue, 16 Mar 2021 17:15:44 -0400
X-MC-Unique: IbMgs1J7NoqO5PgGHIXUTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C7C80006E;
 Tue, 16 Mar 2021 21:15:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18EAC5032D;
 Tue, 16 Mar 2021 21:15:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] configure: add option to explicitly enable/disable libgio
Date: Tue, 16 Mar 2021 17:15:27 -0400
Message-Id: <20210316211531.1649909-13-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <den-plotnikov@yandex-team.ru>

Now, compilation of util/dbus is implicit and depends
on libgio presence on the building host.
The patch adds options to manage libgio dependencies explicitly.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-Id: <20210312151440.405776-1-den-plotnikov@yandex-team.ru>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 60 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..847bc4d095 100755
--- a/configure
+++ b/configure
@@ -465,6 +465,7 @@ fuse_lseek="auto"
 multiprocess="auto"
 
 malloc_trim="auto"
+gio="$default_feature"
 
 # parse CC options second
 for opt do
@@ -1560,6 +1561,10 @@ for opt do
   ;;
   --disable-multiprocess) multiprocess="disabled"
   ;;
+  --enable-gio) gio=yes
+  ;;
+  --disable-gio) gio=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1913,6 +1918,7 @@ disabled with --disable-FEATURE, default is enabled if available
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
   multiprocess    Out of process device emulation support
+  gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3319,17 +3325,19 @@ if test "$static" = yes && test "$mingw32" = yes; then
     glib_cflags="-DGLIB_STATIC_COMPILATION $glib_cflags"
 fi
 
-if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
-    gio_cflags=$($pkg_config --cflags gio-2.0)
-    gio_libs=$($pkg_config --libs gio-2.0)
-    gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
-    if [ ! -x "$gdbus_codegen" ]; then
-        gdbus_codegen=
-    fi
-    # Check that the libraries actually work -- Ubuntu 18.04 ships
-    # with pkg-config --static --libs data for gio-2.0 that is missing
-    # -lblkid and will give a link error.
-    cat > $TMPC <<EOF
+if ! test "$gio" = "no"; then
+    pass=no
+    if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
+        gio_cflags=$($pkg_config --cflags gio-2.0)
+        gio_libs=$($pkg_config --libs gio-2.0)
+        gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
+        if [ ! -x "$gdbus_codegen" ]; then
+            gdbus_codegen=
+        fi
+        # Check that the libraries actually work -- Ubuntu 18.04 ships
+        # with pkg-config --static --libs data for gio-2.0 that is missing
+        # -lblkid and will give a link error.
+        cat > $TMPC <<EOF
 #include <gio/gio.h>
 int main(void)
 {
@@ -3337,18 +3345,28 @@ int main(void)
     return 0;
 }
 EOF
-    if compile_prog "$gio_cflags" "$gio_libs" ; then
-        gio=yes
-    else
-        gio=no
+        if compile_prog "$gio_cflags" "$gio_libs" ; then
+            pass=yes
+        else
+            pass=no
+        fi
+
+        if test "$pass" = "yes" &&
+            $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
+            gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
+            gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
+        fi
     fi
-else
-    gio=no
-fi
 
-if $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
-    gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
-    gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
+    if test "$pass" = "no"; then
+        if test "$gio" = "yes"; then
+            feature_not_found "gio" "Install libgio >= 2.0"
+        else
+            gio=no
+        fi
+    else
+        gio=yes
+    fi
 fi
 
 # Sanity check that the current size_t matches the
-- 
2.26.2



