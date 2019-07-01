Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415C58BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 22:34:28 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgb6B-0005Om-Fj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 16:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hgb0C-0001Ae-AG
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 16:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hgb0A-0007dr-PV
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 16:28:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38766)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hgb03-0007VF-MX; Thu, 27 Jun 2019 16:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAEFB3083391;
 Thu, 27 Jun 2019 20:28:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 542C36012D;
 Thu, 27 Jun 2019 20:27:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 22:26:54 +0200
Message-Id: <20190627202719.17739-4-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 27 Jun 2019 20:28:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 03/28] hw/block/pflash: Simplify
 trace_pflash_data_read/write()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a field width format to have a single function to log
the different width accesses.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 6 ++----
 hw/block/pflash_cfi02.c | 6 ++----
 hw/block/trace-events   | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 74fc1bc2da..db4a246b22 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -248,7 +248,6 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hw=
addr offset,
     switch (width) {
     case 1:
         ret =3D p[offset];
-        trace_pflash_data_read8(offset, ret);
         break;
     case 2:
         if (be) {
@@ -258,7 +257,6 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hw=
addr offset,
             ret =3D p[offset];
             ret |=3D p[offset + 1] << 8;
         }
-        trace_pflash_data_read16(offset, ret);
         break;
     case 4:
         if (be) {
@@ -272,12 +270,12 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, =
hwaddr offset,
             ret |=3D p[offset + 2] << 16;
             ret |=3D p[offset + 3] << 24;
         }
-        trace_pflash_data_read32(offset, ret);
         break;
     default:
         DPRINTF("BUG in %s\n", __func__);
         abort();
     }
+    trace_pflash_data_read(offset, width << 1, ret);
     return ret;
 }
=20
@@ -415,7 +413,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl=
, hwaddr offset,
 {
     uint8_t *p =3D pfl->storage;
=20
-    trace_pflash_data_write(offset, value, width, pfl->counter);
+    trace_pflash_data_write(offset, width << 1, value, pfl->counter);
     switch (width) {
     case 1:
         p[offset] =3D value;
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index f05cd507b3..6cdfc85264 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -172,7 +172,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
         switch (width) {
         case 1:
             ret =3D p[offset];
-            trace_pflash_data_read8(offset, ret);
             break;
         case 2:
             if (be) {
@@ -182,7 +181,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
                 ret =3D p[offset];
                 ret |=3D p[offset + 1] << 8;
             }
-            trace_pflash_data_read16(offset, ret);
             break;
         case 4:
             if (be) {
@@ -196,9 +194,9 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
                 ret |=3D p[offset + 2] << 16;
                 ret |=3D p[offset + 3] << 24;
             }
-            trace_pflash_data_read32(offset, ret);
             break;
         }
+        trace_pflash_data_read(offset, width << 1, ret);
         break;
     case 0x90:
         /* flash ID read */
@@ -343,7 +341,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
             /* We need another unlock sequence */
             goto check_unlock0;
         case 0xA0:
-            trace_pflash_data_write(offset, value, width, 0);
+            trace_pflash_data_write(offset, width << 1, value, 0);
             p =3D pfl->storage;
             if (!pfl->ro) {
                 switch (width) {
diff --git a/hw/block/trace-events b/hw/block/trace-events
index f637fe918e..13d1b21dd4 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -10,10 +10,8 @@ pflash_reset(void) "reset"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
 pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value=
, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*=
x cmd:0x%02x wcycle:%u"
 pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t valu=
e, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
-pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PR=
Ix64" value:0x%02x"
-pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%04x"
-pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%08x"
-pflash_data_write(uint64_t offset, uint32_t value, int width, uint64_t c=
ounter) "data offset:0x%04"PRIx64" value:0x%08x width:%d counter:0x%016"P=
RIx64
+pflash_data_read(uint64_t offset, int width, uint32_t value) "data offse=
t:0x%04"PRIx64" value:0x%0*x"
+pflash_data_write(uint64_t offset, int width, uint32_t value, uint64_t c=
ounter) "data offset:0x%04"PRIx64" value:0x%0*x counter:0x%016"PRIx64
 pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
 pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
 pflash_device_info(uint64_t offset) "Read Device Information offset:0x%0=
4"PRIx64
--=20
2.20.1


