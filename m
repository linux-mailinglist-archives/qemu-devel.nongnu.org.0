Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7545653
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 09:28:54 +0200 (CEST)
Received: from localhost ([::1]:48998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbgdp-00024o-P2
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 03:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbgaJ-0007PG-D1
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 03:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbgaI-0004zN-AL
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 03:25:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hbgaD-0004pp-5p; Fri, 14 Jun 2019 03:25:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5332B81DE9;
 Fri, 14 Jun 2019 07:25:08 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9477C557;
 Fri, 14 Jun 2019 07:24:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 09:24:28 +0200
Message-Id: <20190614072432.820-3-philmd@redhat.com>
In-Reply-To: <20190614072432.820-1-philmd@redhat.com>
References: <20190614072432.820-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 14 Jun 2019 07:25:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/6] configure: Link test before auto-enabling
 glusterfs libraries
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Bharata B Rao <bharata@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Niels de Vos <ndevos@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit a73e82ef912, test the libraries link correctly
before considering them as usable.

This fixes using ./configure --static on Ubuntu 18.04:

  $ make subdir-aarch64-softmmu
  [...]
    LINK    aarch64-softmmu/qemu-system-aarch64
  /usr/bin/ld: cannot find -lgfapi
  /usr/bin/ld: cannot find -lglusterfs
  /usr/bin/ld: cannot find -lgfrpc
  /usr/bin/ld: cannot find -lgfxdr
  collect2: error: ld returned 1 exit status
  Makefile:204: recipe for target 'qemu-system-aarch64' failed
  make[1]: *** [qemu-system-aarch64] Error 1

  $ fgrep gf config-host.mak
  GLUSTERFS_LIBS=3D-lacl -lgfapi -lglusterfs -lgfrpc -lgfxdr -luuid

  $ lsb_release -cri
  Distributor ID: Ubuntu
  Release:        18.04
  Codename:       bionic

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 13fd4a1166..3428adb75b 100755
--- a/configure
+++ b/configure
@@ -4179,9 +4179,23 @@ fi
 # glusterfs probe
 if test "$glusterfs" !=3D "no" ; then
   if $pkg_config --atleast-version=3D3 glusterfs-api; then
-    glusterfs=3D"yes"
     glusterfs_cflags=3D$($pkg_config --cflags glusterfs-api)
-    glusterfs_libs=3D$($pkg_config --libs glusterfs-api)
+    if test "$static" =3D "yes"; then
+        glusterfs_libs=3D$($pkg_config --libs --static glusterfs-api)
+    else
+        glusterfs_libs=3D$($pkg_config --libs glusterfs-api)
+    fi
+    # Packaging for the static libraries is not always correct.
+    # At least ubuntu 18.04 ships only shared libraries.
+    write_c_skeleton
+    if ! compile_prog "$glusterfs_cflags" "$glusterfs_libs" ; then
+        if test "$glusterfs" =3D "yes" ; then
+          error_exit "glusterfs check failed."
+        fi
+        glusterfs=3D"no"
+    else
+        glusterfs=3D"yes"
+    fi
     if $pkg_config --atleast-version=3D4 glusterfs-api; then
       glusterfs_xlator_opt=3D"yes"
     fi
--=20
2.20.1


