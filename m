Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C68610C495
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 08:54:32 +0100 (CET)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaEdD-0001t0-Ju
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 02:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aaron@localhost>) id 1iaEaw-0008CD-VZ
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aaron@localhost>) id 1iaEau-0003hv-R6
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:52:09 -0500
Received: from [2406:7400:73:186d:af79:94fc:29ef:77e6] (port=56110
 helo=localhost) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aaron@localhost>) id 1iaEau-0003fd-Eb
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:52:08 -0500
Received: by localhost (Postfix, from userid 1000)
 id 63415D4170B; Mon, 25 Nov 2019 19:53:03 +0530 (IST)
From: aaron.zakhrov@gmail.com
To: qemu-devel@nongnu.org
Subject: [RFC 3/8] R300 fixes
Date: Mon, 25 Nov 2019 19:49:08 +0530
Message-Id: <20191125141908.5441-4-aaron.zakhrov@gmail.com>
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
 hw/display/r300.c | 9 +++++++++
 hw/display/r300.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/hw/display/r300.c b/hw/display/r300.c
index 653474c3aa..074dbf5b2d 100644
--- a/hw/display/r300.c
+++ b/hw/display/r300.c
@@ -878,6 +878,15 @@ static void r300_mm_write(void *opaque, hwaddr addr,
     case RADEON_DEFAULT_SC_BOTTOM_RIGHT:
         s->regs.default_sc_bottom_right =3D data & 0x3fff3fff;
         break;
+    case R300_GB_ENABLE:
+        s->regs.r300_gb_enable =3D data;
+        break;
+    case R300_GB_TILE_CONFIG:
+            s->regs.r300_gb_tile_config =3D data;
+            break;
+    case R300_GB_FIFO_SIZE:
+            s->regs.r300_gb_fifo_size =3D data;
+            break;
     default:
         break;
     }
diff --git a/hw/display/r300.h b/hw/display/r300.h
index a9e1db32be..19e3d97f8a 100644
--- a/hw/display/r300.h
+++ b/hw/display/r300.h
@@ -83,6 +83,12 @@ typedef struct RADVGARegs{
   uint32_t default_sc_bottom_right;
   uint32_t mc_status;
=20
+  //R300 GB Registers
+  uint32_t r300_gb_enable;
+  uint32_t r300_gb_tile_config;
+  uint32_t r300_gb_fifo_size;
+
+
 //Color Buffer RB3D
   uint32_t r300_rb3d_aaresolve_ctl;
   uint32_t r300_rb3d_aaresolve_offset;
--=20
2.24.0


