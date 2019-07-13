Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8E67B40
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jul 2019 18:36:42 +0200 (CEST)
Received: from localhost ([::1]:57308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmL0r-0004yy-HX
	for lists+qemu-devel@lfdr.de; Sat, 13 Jul 2019 12:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmL0O-0003X7-AM
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 12:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmL0N-0004vF-5r
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 12:36:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44310)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hmL0M-0004uf-TM
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 12:36:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39FF085376;
 Sat, 13 Jul 2019 16:36:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-24.brq.redhat.com [10.40.204.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F8E05D9D6;
 Sat, 13 Jul 2019 16:36:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 13 Jul 2019 18:35:57 +0200
Message-Id: <20190713163558.13204-3-philmd@redhat.com>
In-Reply-To: <20190713163558.13204-1-philmd@redhat.com>
References: <20190713163558.13204-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Sat, 13 Jul 2019 16:36:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/3] tests/docker: Install the NSIS tools in
 the MXE images
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
Cc: Fam Zheng <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes:

  $ make installer
  (cd /tmp/qemu-nsis; \
           for i in qemu-system-*.exe; do \
             arch=3D${i%.exe}; \
             arch=3D${arch#qemu-system-}; \
             echo Section \"$arch\" Section_$arch; \
             echo SetOutPath \"\$INSTDIR\"; \
             echo File \"\${BINDIR}\\$i\"; \
             echo SectionEnd; \
           done \
          ) >/tmp/qemu-nsis/system-emulations.nsh
  makensis -V2 -NOCD \
                  -DCONFIG_DOCUMENTATION=3D"y" \
                   \
                  -DBINDIR=3D"/tmp/qemu-nsis" \
                   \
                  -DSRCDIR=3D"/home/phil/source/qemu" \
                  -DOUTFILE=3D"qemu-setup-4.0.90.exe" \
                  -DDISPLAYVERSION=3D"4.0.90" \
                  /home/phil/source/qemu/qemu.nsi
  /bin/sh: 1: makensis: not found
  Makefile:1077: recipe for target 'qemu-setup-4.0.90.exe' failed
  make: *** [qemu-setup-4.0.90.exe] Error 127

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/docker/dockerfiles/debian-win32-cross.docker | 3 +++
 tests/docker/dockerfiles/debian-win64-cross.docker | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-win32-cross.docker b/tests/d=
ocker/dockerfiles/debian-win32-cross.docker
index c787e43245..77f5cc45e9 100644
--- a/tests/docker/dockerfiles/debian-win32-cross.docker
+++ b/tests/docker/dockerfiles/debian-win32-cross.docker
@@ -9,6 +9,8 @@ MAINTAINER Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
=20
 ENV TARGET i686
=20
+ENV PATH $PATH:/usr/lib/mxe/usr/$TARGET-w64-mingw32.shared/bin
+
 RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt-get install -y --no-install-recommends \
         mxe-$TARGET-w64-mingw32.shared-bzip2 \
@@ -19,6 +21,7 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
         mxe-$TARGET-w64-mingw32.shared-lzo \
         mxe-$TARGET-w64-mingw32.shared-nettle \
         mxe-$TARGET-w64-mingw32.shared-ncurses \
+        mxe-$TARGET-w64-mingw32.shared-nsis \
         mxe-$TARGET-w64-mingw32.shared-pixman \
         mxe-$TARGET-w64-mingw32.shared-pkgconf \
         mxe-$TARGET-w64-mingw32.shared-pthreads \
diff --git a/tests/docker/dockerfiles/debian-win64-cross.docker b/tests/d=
ocker/dockerfiles/debian-win64-cross.docker
index a7068ed6ac..3908c5abc4 100644
--- a/tests/docker/dockerfiles/debian-win64-cross.docker
+++ b/tests/docker/dockerfiles/debian-win64-cross.docker
@@ -9,6 +9,8 @@ MAINTAINER Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
=20
 ENV TARGET x86-64
=20
+ENV PATH $PATH:/usr/lib/mxe/usr/$TARGET-w64-mingw32.shared/bin
+
 RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt-get install -y --no-install-recommends \
         mxe-$TARGET-w64-mingw32.shared-bzip2 \
@@ -19,6 +21,7 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
         mxe-$TARGET-w64-mingw32.shared-lzo \
         mxe-$TARGET-w64-mingw32.shared-nettle \
         mxe-$TARGET-w64-mingw32.shared-ncurses \
+        mxe-$TARGET-w64-mingw32.shared-nsis \
         mxe-$TARGET-w64-mingw32.shared-pixman \
         mxe-$TARGET-w64-mingw32.shared-pkgconf \
         mxe-$TARGET-w64-mingw32.shared-pthreads \
--=20
2.20.1


