Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB910C492
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 08:54:06 +0100 (CET)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaEcm-0001KU-F7
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 02:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aaron@localhost>) id 1iaEaZ-0007s8-Sj
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:51:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aaron@localhost>) id 1iaEaX-0003Aj-R6
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:51:46 -0500
Received: from [2406:7400:73:186d:af79:94fc:29ef:77e6] (port=56076
 helo=localhost) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aaron@localhost>) id 1iaEaX-0002k0-E3
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:51:45 -0500
Received: by localhost (Postfix, from userid 1000)
 id 61E46D41707; Mon, 25 Nov 2019 19:52:26 +0530 (IST)
From: aaron.zakhrov@gmail.com
To: qemu-devel@nongnu.org
Subject: [RFC 2/8] Fix MC STATUS resgister
Date: Mon, 25 Nov 2019 19:49:06 +0530
Message-Id: <20191125141908.5441-3-aaron.zakhrov@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125141908.5441-1-aaron.zakhrov@gmail.com>
References: <20191125141908.5441-1-aaron.zakhrov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2406:7400:73:186d:af79:94fc:29ef:77e6
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
Cc: kraxel@redhat.com, Aaron Dominick <aaron.zakhrov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aaron Dominick <aaron.zakhrov@gmail.com>

---
 hw/display/r300.c | 15 ++++++++++++---
 hw/display/r300.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/display/r300.c b/hw/display/r300.c
index 94e90b7a95..653474c3aa 100644
--- a/hw/display/r300.c
+++ b/hw/display/r300.c
@@ -278,6 +278,10 @@ static uint64_t r300_mm_read(void *opaque, hwaddr ad=
dr, unsigned int size)
     uint64_t val =3D 0;
=20
     switch (addr) {
+    case RADEON_MC_STATUS:
+        val =3D s->regs.mc_status;
+        break;
+
     case RADEON_MM_INDEX:
         val =3D s->regs.mm_index;
         break;
@@ -358,9 +362,9 @@ static uint64_t r300_mm_read(void *opaque, hwaddr add=
r, unsigned int size)
     case RADEON_CONFIG_REG_APER_SIZE:
         val =3D memory_region_size(&s->mm);
         break;
-    case RADEON_MC_STATUS:
-        val =3D 5;
-        break;
+    // case RADEON_MC_STATUS:
+    //     val =3D 5;
+    //     break;
     case RADEON_RBBM_STATUS:
         val =3D 64; /* free CMDFIFO entries */
         break;
@@ -512,6 +516,10 @@ static void r300_mm_write(void *opaque, hwaddr addr,
         trace_ati_mm_write(size, addr, r300_reg_name(addr & ~3ULL), data=
);
     }
     switch (addr) {
+      case RADEON_MC_STATUS:
+        s->regs.mc_status =3D R300_MC_IDLE;
+        s->regs.mc_status =3D data;
+        break;
       case RADEON_RBBM_STATUS:
         s->regs.rbbm_status =3D data|=3D RADEON_RBBM_FIFOCNT_MASK;
         break;
@@ -946,6 +954,7 @@ static void r300_vga_realize(PCIDevice *dev, Error **=
errp)
 static void r300_vga_reset(DeviceState *dev)
 {
     RADVGAState *s =3D RAD_VGA(dev);
+    s->regs.mc_status =3D R300_MC_IDLE;
=20
     timer_del(&s->vblank_timer);
     r300_vga_update_irq(s);
diff --git a/hw/display/r300.h b/hw/display/r300.h
index 60f572647f..a9e1db32be 100644
--- a/hw/display/r300.h
+++ b/hw/display/r300.h
@@ -81,6 +81,7 @@ typedef struct RADVGARegs{
   uint32_t default_pitch;
   uint32_t default_tile;
   uint32_t default_sc_bottom_right;
+  uint32_t mc_status;
=20
 //Color Buffer RB3D
   uint32_t r300_rb3d_aaresolve_ctl;
--=20
2.24.0


