Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57363719EB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 16:05:47 +0200 (CEST)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpvQI-0000nx-Db
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 10:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43441)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hpvPv-0008LZ-5Q
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 10:05:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hpvPq-0005nl-9k
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 10:05:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58248)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hpvPq-0005nV-2s
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 10:05:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 668B485542;
 Tue, 23 Jul 2019 14:05:17 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4152E5D704;
 Tue, 23 Jul 2019 14:05:02 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 16:04:45 +0200
Message-Id: <20190723140445.12748-3-sgarzare@redhat.com>
In-Reply-To: <20190723140445.12748-1-sgarzare@redhat.com>
References: <20190723140445.12748-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 23 Jul 2019 14:05:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/2] hw/i386/pc: Map into memory the initrd
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to reduce the memory footprint we map into memory
the initrd using g_mapped_file_new() instead of reading it.
In this way we can share the initrd pages between multiple
instances of QEMU.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/i386/pc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 549c437050..b139589777 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1241,17 +1241,20 @@ static void load_linux(PCMachineState *pcms,
=20
             /* load initrd */
             if (initrd_filename) {
+                GMappedFile *gmf;
                 gsize initrd_size;
                 gchar *initrd_data;
                 GError *gerr =3D NULL;
=20
-                if (!g_file_get_contents(initrd_filename, &initrd_data,
-                            &initrd_size, &gerr)) {
+                gmf =3D g_mapped_file_new(initrd_filename, false, &gerr)=
;
+                if (!gmf) {
                     fprintf(stderr, "qemu: error reading initrd %s: %s\n=
",
                             initrd_filename, gerr->message);
                     exit(1);
                 }
=20
+                initrd_data =3D g_mapped_file_get_contents(gmf);
+                initrd_size =3D g_mapped_file_get_length(gmf);
                 initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_data=
_size - 1;
                 if (initrd_size >=3D initrd_max) {
                     fprintf(stderr, "qemu: initrd is too large, cannot s=
upport."
@@ -1378,6 +1381,7 @@ static void load_linux(PCMachineState *pcms,
=20
     /* load initrd */
     if (initrd_filename) {
+        GMappedFile *gmf;
         gsize initrd_size;
         gchar *initrd_data;
         GError *gerr =3D NULL;
@@ -1387,12 +1391,15 @@ static void load_linux(PCMachineState *pcms,
             exit(1);
         }
=20
-        if (!g_file_get_contents(initrd_filename, &initrd_data,
-                                 &initrd_size, &gerr)) {
+        gmf =3D g_mapped_file_new(initrd_filename, false, &gerr);
+        if (!gmf) {
             fprintf(stderr, "qemu: error reading initrd %s: %s\n",
                     initrd_filename, gerr->message);
             exit(1);
         }
+
+        initrd_data =3D g_mapped_file_get_contents(gmf);
+        initrd_size =3D g_mapped_file_get_length(gmf);
         if (initrd_size >=3D initrd_max) {
             fprintf(stderr, "qemu: initrd is too large, cannot support."
                     "(max: %"PRIu32", need %"PRId64")\n",
--=20
2.20.1


