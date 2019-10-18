Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D559DC34B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 12:59:23 +0200 (CEST)
Received: from localhost ([::1]:37906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLPyc-0000qS-9W
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 06:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iLPtS-0004l0-Qg
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:54:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iLPtR-0000sT-JH
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:54:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58780)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iLPtR-0000rj-Df
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:54:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9FFF08110B;
 Fri, 18 Oct 2019 10:54:00 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 181075D713;
 Fri, 18 Oct 2019 10:53:56 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 04/15] hw/i386/pc: replace use of strtol with qemu_strtoui
 in x86_load_linux()
Date: Fri, 18 Oct 2019 12:53:04 +0200
Message-Id: <20191018105315.27511-5-slp@redhat.com>
In-Reply-To: <20191018105315.27511-1-slp@redhat.com>
References: <20191018105315.27511-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 18 Oct 2019 10:54:00 +0000 (UTC)
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
Cc: berrange@redhat.com, ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>,
 mst@redhat.com, lersek@redhat.com, groug@kaod.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 marcandre.lureau@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow checkpatch.pl recommendation and replace the use of strtol with
qemu_strtoui in x86_load_linux().

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/i386/pc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 77e86bfc3d..c8608b8007 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -68,6 +68,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "qemu/cutils.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/boards.h"
@@ -1202,6 +1203,7 @@ static void x86_load_linux(PCMachineState *pcms,
     vmode =3D strstr(kernel_cmdline, "vga=3D");
     if (vmode) {
         unsigned int video_mode;
+        int ret;
         /* skip "vga=3D" */
         vmode +=3D 4;
         if (!strncmp(vmode, "normal", 6)) {
@@ -1211,7 +1213,12 @@ static void x86_load_linux(PCMachineState *pcms,
         } else if (!strncmp(vmode, "ask", 3)) {
             video_mode =3D 0xfffd;
         } else {
-            video_mode =3D strtol(vmode, NULL, 0);
+            ret =3D qemu_strtoui(vmode, NULL, 0, &video_mode);
+            if (ret !=3D 0) {
+                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\n=
",
+                        strerror(-ret));
+                exit(1);
+            }
         }
         stw_p(header + 0x1fa, video_mode);
     }
--=20
2.21.0


