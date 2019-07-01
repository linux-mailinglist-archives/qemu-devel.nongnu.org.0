Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66B45A26
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 12:15:57 +0200 (CEST)
Received: from localhost ([::1]:49868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbjFU-0000y0-Jv
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 06:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbj7l-0003kD-4n
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 06:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbj7i-0000C9-Ig
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 06:07:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hbj7c-00008r-Pp; Fri, 14 Jun 2019 06:07:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A36E030821F4;
 Fri, 14 Jun 2019 10:07:44 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47AE21001B0F;
 Fri, 14 Jun 2019 10:07:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 12:07:11 +0200
Message-Id: <20190614100718.14019-3-philmd@redhat.com>
In-Reply-To: <20190614100718.14019-1-philmd@redhat.com>
References: <20190614100718.14019-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 14 Jun 2019 10:07:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/9] configure: Link test before
 auto-enabling GlusterFS libraries
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Bharata B Rao <bharata@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 configure | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 13fd4a1166..fe0e2e1b75 100755
--- a/configure
+++ b/configure
@@ -4179,9 +4179,19 @@ fi
 # glusterfs probe
 if test "$glusterfs" !=3D "no" ; then
   if $pkg_config --atleast-version=3D3 glusterfs-api; then
-    glusterfs=3D"yes"
     glusterfs_cflags=3D$($pkg_config --cflags glusterfs-api)
     glusterfs_libs=3D$($pkg_config --libs glusterfs-api)
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


