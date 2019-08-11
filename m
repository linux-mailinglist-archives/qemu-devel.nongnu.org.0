Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D003289470
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 23:35:27 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwvUt-0006Ew-2n
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 17:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58156)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hwvSy-000208-20
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hwvSw-00045l-Uu
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:55460)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hwvSw-0003yQ-NS
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 716CD74C9F1;
 Sun, 11 Aug 2019 23:33:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D7C9874581E; Sun, 11 Aug 2019 23:33:11 +0200 (CEST)
Message-Id: <31ff69ca6959d090869907774faa1af7d2c02b2b.1565558093.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1565558093.git.balaton@eik.bme.hu>
References: <cover.1565558093.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 11 Aug 2019 23:14:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-devel] [PATCH 2/7] ati-vga: Add some register definitions for
 debugging
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add names for AMCGPIO regs to make it easier to identify these in
trace output. This is where rage128p has the DDC from the DVI port
among others but because we don't implement the flat panel controller
we don't want to connect an EDID here to make sure drivers use the VGA
output instead. But since these are often probed by drivers it helps
to see what happens by logging these registers by name.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati_dbg.c  | 4 ++++
 hw/display/ati_regs.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/display/ati_dbg.c b/hw/display/ati_dbg.c
index cbc52025d0..7e59c41ac2 100644
--- a/hw/display/ati_dbg.c
+++ b/hw/display/ati_dbg.c
@@ -23,6 +23,10 @@ static struct ati_regdesc ati_reg_names[] =3D {
     {"GPIO_DVI_DDC", 0x0064},
     {"GPIO_MONID", 0x0068},
     {"I2C_CNTL_1", 0x0094},
+    {"AMCGPIO_MASK_MIR", 0x009c},
+    {"AMCGPIO_A_MIR", 0x00a0},
+    {"AMCGPIO_Y_MIR", 0x00a4},
+    {"AMCGPIO_EN_MIR", 0x00a8},
     {"PALETTE_INDEX", 0x00b0},
     {"PALETTE_DATA", 0x00b4},
     {"CNFG_CNTL", 0x00e0},
diff --git a/hw/display/ati_regs.h b/hw/display/ati_regs.h
index 81fb5302c0..91947ab1e7 100644
--- a/hw/display/ati_regs.h
+++ b/hw/display/ati_regs.h
@@ -41,6 +41,10 @@
 #define GPIO_DVI_DDC                            0x0064
 #define GPIO_MONID                              0x0068
 #define I2C_CNTL_1                              0x0094
+#define AMCGPIO_MASK_MIR                        0x009c
+#define AMCGPIO_A_MIR                           0x00a0
+#define AMCGPIO_Y_MIR                           0x00a4
+#define AMCGPIO_EN_MIR                          0x00a8
 #define PALETTE_INDEX                           0x00b0
 #define PALETTE_DATA                            0x00b4
 #define CNFG_CNTL                               0x00e0
--=20
2.13.7


