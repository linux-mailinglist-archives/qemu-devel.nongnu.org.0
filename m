Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAFC0857
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:11:00 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrta-0002wc-Jl
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iDqWm-0006cf-Bp
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iDqWl-0005S4-7J
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:43:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iDqWl-0005Rs-1u
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:43:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 51E23307D9CF
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 13:43:18 +0000 (UTC)
Received: from localhost (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DC2B5D6A7;
 Fri, 27 Sep 2019 13:43:14 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] configure: add GDBUS_CODEGEN
Date: Fri, 27 Sep 2019 17:42:23 +0400
Message-Id: <20190927134224.14550-7-marcandre.lureau@redhat.com>
In-Reply-To: <20190927134224.14550-1-marcandre.lureau@redhat.com>
References: <20190927134224.14550-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 27 Sep 2019 13:43:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: berrange@redhat.com, quintela@redhat.com, mprivozn@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdbus-codegen generated code requires gio-unix on Unix, so add it to
GIO libs/cflags.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 configure | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configure b/configure
index 397bb476e1..54f4b9c667 100755
--- a/configure
+++ b/configure
@@ -3631,10 +3631,16 @@ if $pkg_config --atleast-version=3D$glib_req_ver =
gio-2.0; then
     gio=3Dyes
     gio_cflags=3D$($pkg_config --cflags gio-2.0)
     gio_libs=3D$($pkg_config --libs gio-2.0)
+    gdbus_codegen=3D$($pkg_config --variable=3Dgdbus_codegen gio-2.0)
 else
     gio=3Dno
 fi
=20
+if $pkg_config --atleast-version=3D$glib_req_ver gio-unix-2.0; then
+    gio_cflags=3D"$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
+    gio_libs=3D"$gio_libs $($pkg_config --libs gio-unix-2.0)"
+fi
+
 # Sanity check that the current size_t matches the
 # size that glib thinks it should be. This catches
 # problems on multi-arch where people try to build
@@ -6782,6 +6788,7 @@ if test "$gio" =3D "yes" ; then
     echo "CONFIG_GIO=3Dy" >> $config_host_mak
     echo "GIO_CFLAGS=3D$gio_cflags" >> $config_host_mak
     echo "GIO_LIBS=3D$gio_libs" >> $config_host_mak
+    echo "GDBUS_CODEGEN=3D$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=3D\"$tls_priority\"" >> $config_host_mak
 if test "$gnutls" =3D "yes" ; then
--=20
2.23.0


