Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8AC69A26
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 19:49:42 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn56a-0007OT-VK
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 13:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50641)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hn565-0005ye-FP
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 13:49:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hn564-000854-Ar
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 13:49:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hn564-00083m-4q; Mon, 15 Jul 2019 13:49:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B9BD30842D1;
 Mon, 15 Jul 2019 17:49:07 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2602A5C224;
 Mon, 15 Jul 2019 17:48:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Date: Mon, 15 Jul 2019 19:48:11 +0200
Message-Id: <20190715174817.18981-5-philmd@redhat.com>
In-Reply-To: <20190715174817.18981-1-philmd@redhat.com>
References: <20190715174817.18981-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 15 Jul 2019 17:49:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v2 4/9] tests/docker: Set the correct
 cross-PKG_CONFIG_PATH in the MXE images
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
 Laszlo Ersek <lersek@redhat.com>, Helge Deller <deller@gmx.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This silents a bunch of warnings while compiling the Slirp objects:

 $ make
 [...]
   CC      slirp/src/tftp.o
 Package glib-2.0 was not found in the pkg-config search path.
 Perhaps you should add the directory containing `glib-2.0.pc'
 to the PKG_CONFIG_PATH environment variable
 No package 'glib-2.0' found
   CC      slirp/src/udp6.o
 Package glib-2.0 was not found in the pkg-config search path.
 Perhaps you should add the directory containing `glib-2.0.pc'
 to the PKG_CONFIG_PATH environment variable
 No package 'glib-2.0' found
 [...]

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/docker/dockerfiles/debian-win32-cross.docker | 3 +++
 tests/docker/dockerfiles/debian-win64-cross.docker | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-win32-cross.docker b/tests/d=
ocker/dockerfiles/debian-win32-cross.docker
index 77f5cc45e9..dc74ce7e0e 100644
--- a/tests/docker/dockerfiles/debian-win32-cross.docker
+++ b/tests/docker/dockerfiles/debian-win32-cross.docker
@@ -11,6 +11,9 @@ ENV TARGET i686
=20
 ENV PATH $PATH:/usr/lib/mxe/usr/$TARGET-w64-mingw32.shared/bin
=20
+ENV PKG_CONFIG_PATH \
+    $PKG_CONFIG_PATH:/usr/lib/mxe/usr/$TARGET-w64-mingw32.shared/lib/pkg=
config
+
 RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt-get install -y --no-install-recommends \
         mxe-$TARGET-w64-mingw32.shared-bzip2 \
diff --git a/tests/docker/dockerfiles/debian-win64-cross.docker b/tests/d=
ocker/dockerfiles/debian-win64-cross.docker
index 3908c5abc4..df7bfce7ea 100644
--- a/tests/docker/dockerfiles/debian-win64-cross.docker
+++ b/tests/docker/dockerfiles/debian-win64-cross.docker
@@ -11,6 +11,9 @@ ENV TARGET x86-64
=20
 ENV PATH $PATH:/usr/lib/mxe/usr/$TARGET-w64-mingw32.shared/bin
=20
+ENV PKG_CONFIG_PATH \
+    $PKG_CONFIG_PATH:/usr/lib/mxe/usr/$TARGET-w64-mingw32.shared/lib/pkg=
config
+
 RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt-get install -y --no-install-recommends \
         mxe-$TARGET-w64-mingw32.shared-bzip2 \
--=20
2.20.1


