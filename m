Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C80142D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:21:53 +0100 (CET)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXw8-0007ij-Ck
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1itXtn-0005u3-Lc
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:19:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1itXtm-0005nZ-HC
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:19:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57156
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1itXtm-0005nC-DN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579529965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRL0nO3Z3F84wWN4tF/MaXoXGD2RsvuAjrbHQH3t9do=;
 b=ab4HtWYgWl81Giy+XJP32zT2SppCQ8AQ09NYDnACeA6gLuLrOGtivqfrAfVVhesTefyUGu
 8QKBVp99A45Z7Gmx7Y4wAyRYsesrazgb6h1OIVpQkcnVoOEMONpko3lnAmRumLR2j7N7wb
 J/OQGOb1eLYWpqHf4aBhPRmubsA7nF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-z_9IFPKdNzC2DSFgNiFxQg-1; Mon, 20 Jan 2020 09:19:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71BBE8014DB;
 Mon, 20 Jan 2020 14:19:19 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E7E684DBA;
 Mon, 20 Jan 2020 14:19:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/15] configure: permit use of io_uring
Date: Mon, 20 Jan 2020 14:18:44 +0000
Message-Id: <20200120141858.587874-2-stefanha@redhat.com>
In-Reply-To: <20200120141858.587874-1-stefanha@redhat.com>
References: <20200120141858.587874-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: z_9IFPKdNzC2DSFgNiFxQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: oleksandr@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Maxim Levitsky <maximlevitsky@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/configure b/configure
index 557e4382ea..62e78bfa1b 100755
--- a/configure
+++ b/configure
@@ -371,6 +371,7 @@ xen=3D""
 xen_ctrl_version=3D""
 xen_pci_passthrough=3D""
 linux_aio=3D""
+linux_io_uring=3D""
 cap_ng=3D""
 attr=3D""
 libattr=3D""
@@ -1253,6 +1254,10 @@ for opt do
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
@@ -1773,6 +1778,7 @@ disabled with --disable-FEATURE, default is enabled i=
f available:
   vde             support for vde network
   netmap          support for netmap network
   linux-aio       Linux AIO support
+  linux-io-uring  Linux io_uring support
   cap-ng          libcap-ng support
   attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
@@ -4004,6 +4010,21 @@ EOF
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
@@ -6492,6 +6513,7 @@ echo "PIE               $pie"
 echo "vde support       $vde"
 echo "netmap support    $netmap"
 echo "Linux AIO support $linux_aio"
+echo "Linux io_uring support $linux_io_uring"
 echo "ATTR/XATTR support $attr"
 echo "Install blobs     $blobs"
 echo "KVM support       $kvm"
@@ -6972,6 +6994,11 @@ fi
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
2.24.1


