Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A2124DCE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:35:09 +0100 (CET)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcHz-0004Eo-F7
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ihcFp-0002j2-Tl
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:32:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ihcFo-0006l1-Gi
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:32:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35359
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ihcFo-0006h9-9S
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576686771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COhHhumUMNCq81Rg1JY+HjQFERSd+slEA9mkqQ7PHKs=;
 b=Wk8YP31Nj1+LhXCr0E7u1ei4DQ0m5NXmtDq7jEc6HnxbSuRmQvJX++pKk/zRECTWCbnyLP
 GjUM3xYhPhgQ2z7Fg5f6arVWjDvlMSzCuHAsQKlp5sOjCaQnuqX17q9iA25HNPWxl9k7c8
 Stzk15kmejiiYRHqW+JZPrK7czFK9I8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-q-hChBxeOw-r5HnwX6RxIg-1; Wed, 18 Dec 2019 11:32:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38772100551C;
 Wed, 18 Dec 2019 16:32:49 +0000 (UTC)
Received: from localhost (unknown [10.36.118.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 643081891F;
 Wed, 18 Dec 2019 16:32:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 01/15] configure: permit use of io_uring
Date: Wed, 18 Dec 2019 16:32:14 +0000
Message-Id: <20191218163228.1613099-2-stefanha@redhat.com>
In-Reply-To: <20191218163228.1613099-1-stefanha@redhat.com>
References: <20191218163228.1613099-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: q-hChBxeOw-r5HnwX6RxIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, qemu-block@nongnu.org,
 oleksandr@redhat.com, Julia Suvorova <jusual@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Maxim Levitsky <maximlevitsky@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/configure b/configure
index 84b413dbfc..acab024021 100755
--- a/configure
+++ b/configure
@@ -370,6 +370,7 @@ xen=3D""
 xen_ctrl_version=3D""
 xen_pci_passthrough=3D""
 linux_aio=3D""
+linux_io_uring=3D""
 cap_ng=3D""
 attr=3D""
 libattr=3D""
@@ -1251,6 +1252,10 @@ for opt do
   ;;
   --enable-linux-aio) linux_aio=3D"yes"
   ;;
+  --disable-linux-io-uring) linux_io_uring=3D"no"
+  ;;
+  --enable-linux-io-uring) linux_io_uring=3D"yes"
+  ;;
   --disable-attr) attr=3D"no"
   ;;
   --enable-attr) attr=3D"yes"
@@ -1766,6 +1771,7 @@ disabled with --disable-FEATURE, default is enabled i=
f available:
   vde             support for vde network
   netmap          support for netmap network
   linux-aio       Linux AIO support
+  linux-io-uring  Linux io_uring support
   cap-ng          libcap-ng support
   attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
@@ -3988,6 +3994,21 @@ EOF
     linux_aio=3Dno
   fi
 fi
+##########################################
+# linux-io-uring probe
+
+if test "$linux_io_uring" !=3D "no" ; then
+  if $pkg_config liburing; then
+    linux_io_uring_cflags=3D$($pkg_config --cflags liburing)
+    linux_io_uring_libs=3D$($pkg_config --libs liburing)
+    linux_io_uring=3Dyes
+  else
+    if test "$linux_io_uring" =3D "yes" ; then
+      feature_not_found "linux io_uring" "Install liburing devel"
+    fi
+    linux_io_uring=3Dno
+  fi
+fi
=20
 ##########################################
 # TPM emulation is only on POSIX
@@ -6472,6 +6493,7 @@ echo "PIE               $pie"
 echo "vde support       $vde"
 echo "netmap support    $netmap"
 echo "Linux AIO support $linux_aio"
+echo "Linux io_uring support $linux_io_uring"
 echo "ATTR/XATTR support $attr"
 echo "Install blobs     $blobs"
 echo "KVM support       $kvm"
@@ -6960,6 +6982,11 @@ fi
 if test "$linux_aio" =3D "yes" ; then
   echo "CONFIG_LINUX_AIO=3Dy" >> $config_host_mak
 fi
+if test "$linux_io_uring" =3D "yes" ; then
+  echo "CONFIG_LINUX_IO_URING=3Dy" >> $config_host_mak
+  echo "LINUX_IO_URING_CFLAGS=3D$linux_io_uring_cflags" >> $config_host_ma=
k
+  echo "LINUX_IO_URING_LIBS=3D$linux_io_uring_libs" >> $config_host_mak
+fi
 if test "$attr" =3D "yes" ; then
   echo "CONFIG_ATTR=3Dy" >> $config_host_mak
 fi
--=20
2.23.0


