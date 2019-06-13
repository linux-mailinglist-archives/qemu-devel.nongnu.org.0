Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E164444A02
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 19:57:56 +0200 (CEST)
Received: from localhost ([::1]:43144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbTz1-00067j-NW
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 13:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46241)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbTvz-0003Xx-Tp
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 13:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbTvw-0000PK-IX
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 13:54:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbTvw-0000N1-8f
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 13:54:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C4CBD3082E10
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 17:54:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 679D7176BA;
 Thu, 13 Jun 2019 17:54:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 19:54:35 +0200
Message-Id: <20190613175435.6575-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 13 Jun 2019 17:54:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] roms/edk2-build.sh: Allow to run edk2-build.sh
 from command line
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The edk2-build.sh script set the 'nounset' option:

  BASH(1)

  set [arg ...]

      -u   Treat unset variables and parameters other than the
           special parameters "@" and "*" as an error when
           performing parameter expansion.  If expansion is
           attempted on an unset variable or parameter, the shell
           prints an error message, and, if not interactive,
           exits with a non-zero status.

When running this script out of 'make', we get:

  $ cd roms
  $ ./edk2-build.sh aarch64 --arch=3DAARCH64 --platform=3DArmVirtPkg/ArmV=
irtQemu.dsc > /dev/null
  ./edk2-build.sh: line 46: MAKEFLAGS: unbound variable

Fix this by checking the variable is defined before using it,
else use a default value.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 roms/edk2-build.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
index 4f46f8a6a2..5390228b4e 100755
--- a/roms/edk2-build.sh
+++ b/roms/edk2-build.sh
@@ -43,7 +43,13 @@ fi
 # any), for the edk2 "build" utility.
 source ../edk2-funcs.sh
 edk2_toolchain=3D$(qemu_edk2_get_toolchain "$emulation_target")
-edk2_thread_count=3D$(qemu_edk2_get_thread_count "$MAKEFLAGS")
+if [ -v MAKEFLAGS ]; then
+  edk2_thread_count=3D$(qemu_edk2_get_thread_count "$MAKEFLAGS")
+else
+  # We are not running within 'make', let the edk2 "build" utility to fe=
tch
+  # the logical CPU count with Python's multiprocessing.cpu_count() meth=
od.
+  edk2_thread_count=3D0
+fi
 qemu_edk2_set_cross_env "$emulation_target"
=20
 # Build the platform firmware.
--=20
2.20.1


