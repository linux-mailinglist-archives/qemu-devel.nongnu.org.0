Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB05F45660
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 09:32:17 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbgh6-0004WF-VQ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 03:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbgap-0008Fj-5F
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 03:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbgao-0005TG-1n
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 03:25:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hbgal-0005PV-0w; Fri, 14 Jun 2019 03:25:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 169375945D;
 Fri, 14 Jun 2019 07:25:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53BDB60637;
 Fri, 14 Jun 2019 07:25:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 09:24:31 +0200
Message-Id: <20190614072432.820-6-philmd@redhat.com>
In-Reply-To: <20190614072432.820-1-philmd@redhat.com>
References: <20190614072432.820-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 14 Jun 2019 07:25:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 5/6] configure: Link test before auto-enabling
 the pulseaudio library
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

Similarly to commit a73e82ef912, test the library links correctly
before considering it as usable.

This fixes using ./configure --static on Ubuntu 18.04:

  $ make subdir-aarch64-softmmu
  [...]
    LINK    aarch64-softmmu/qemu-system-aarch64
  /usr/bin/ld: cannot find -lpulse
  /usr/bin/ld: cannot find -lpulsecommon-11.1
  collect2: error: ld returned 1 exit status
  Makefile:204: recipe for target 'qemu-system-aarch64' failed
  make[1]: *** [qemu-system-aarch64] Error 1

  $ fgrep pulse config-host.mak
  PULSE_LIBS=3D-L/usr/lib/aarch64-linux-gnu/pulseaudio -lpulse -lpulsecom=
mon-11.1

  $ lsb_release -cri
  Distributor ID: Ubuntu
  Release:        18.04
  Codename:       bionic

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 4eed33e1b1..4d015496ae 100755
--- a/configure
+++ b/configure
@@ -3408,10 +3408,25 @@ for drv in $audio_drv_list; do
=20
     pa | try-pa)
     if $pkg_config libpulse --exists; then
-        pulse_libs=3D$($pkg_config libpulse --libs)
-        audio_pt_int=3D"yes"
-        if test "$drv" =3D "try-pa"; then
-            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/try-pa=
/pa/')
+        pulse_cflags=3D$($pkg_config --cflags libpulse)
+        if test "$static" =3D "yes"; then
+            pulse_libs=3D$($pkg_config --libs --static libpulse)
+        else
+            pulse_libs=3D$($pkg_config --libs libpulse)
+        fi
+        # Packaging for the static libraries is not always correct.
+        # At least ubuntu 18.04 ships only shared libraries.
+        write_c_skeleton
+        if ! compile_prog "$pulse_cflags" "$pulse_libs" ; then
+            unset pulse_cflags pulse_libs
+            if test "$drv" =3D "try-pa"; then
+                audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/tr=
y-pa//')
+            fi
+        else
+            audio_pt_int=3D"yes"
+            if test "$drv" =3D "try-pa"; then
+                audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/tr=
y-pa/pa/')
+            fi
         fi
     else
         if test "$drv" =3D "try-pa"; then
--=20
2.20.1


