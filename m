Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A75C793
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:09:28 +0200 (CEST)
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9Ad-0007dm-NW
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34313)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi791-0002pl-MI
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 20:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi78z-00016o-SD
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 20:59:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi78u-0000wc-Fi; Mon, 01 Jul 2019 20:59:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 047FFF9E76;
 Tue,  2 Jul 2019 00:59:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 071AC1001B33;
 Tue,  2 Jul 2019 00:59:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 21:58:47 -0300
Message-Id: <20190702005912.15905-3-philmd@redhat.com>
In-Reply-To: <20190702005912.15905-1-philmd@redhat.com>
References: <20190702005912.15905-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 02 Jul 2019 00:59:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/27] hw/block/pflash: Simplify
 trace_pflash_io_read/write()
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
 Thomas Huth <thuth@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call the read() trace function after the value is set, so we can
log the returned value.
Rename the I/O trace functions with '_io_' in their name.

Reviewed-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190627202719.17739-3-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 5 +++--
 hw/block/pflash_cfi02.c | 6 ++----
 hw/block/trace-events   | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 35080d915f..74fc1bc2da 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -288,7 +288,6 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
     uint32_t ret;
=20
     ret =3D -1;
-    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read *=
/
@@ -391,6 +390,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
=20
         break;
     }
+    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->=
wcycle);
+
     return ret;
 }
=20
@@ -453,7 +454,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
=20
     cmd =3D value;
=20
-    trace_pflash_write(offset, value, width, pfl->wcycle);
+    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index eb106f4996..f05cd507b3 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -145,7 +145,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
     uint8_t *p;
=20
     ret =3D -1;
-    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
     /* Lazy reset to ROMD mode after a certain amount of read accesses *=
/
     if (!pfl->rom_mode && pfl->wcycle =3D=3D 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
@@ -241,6 +240,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
         }
         break;
     }
+    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->=
wcycle);
=20
     return ret;
 }
@@ -267,6 +267,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
     uint8_t *p;
     uint8_t cmd;
=20
+    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
     cmd =3D value;
     if (pfl->cmd !=3D 0xA0 && cmd =3D=3D 0xF0) {
 #if 0
@@ -275,11 +276,8 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr of=
fset,
 #endif
         goto reset_flash;
     }
-    trace_pflash_write(offset, value, width, pfl->wcycle);
     offset &=3D pfl->chip_len - 1;
=20
-    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d\n", __func__,
-            offset, value, width);
     boff =3D offset & (pfl->sector_len - 1);
     if (pfl->width =3D=3D 2)
         boff =3D boff >> 1;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 97a17838ed..f637fe918e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -7,9 +7,9 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0=
x%02x val 0x%02x"
 # pflash_cfi02.c
 # pflash_cfi01.c
 pflash_reset(void) "reset"
-pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "of=
fset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
-pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle)=
 "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
+pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value=
, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*=
x cmd:0x%02x wcycle:%u"
+pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t valu=
e, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
 pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PR=
Ix64" value:0x%02x"
 pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%04x"
 pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%08x"
--=20
2.20.1


