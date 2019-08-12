Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0D89D40
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 13:39:08 +0200 (CEST)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx8fL-0004gv-HU
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 07:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36129)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hx8eF-00031S-0u
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hx8eD-0008Ny-Vm
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:37:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32850)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hx8eD-0008Na-Qj; Mon, 12 Aug 2019 07:37:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25162182D;
 Mon, 12 Aug 2019 11:37:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-96.brq.redhat.com [10.40.204.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8D55D9CA;
 Mon, 12 Aug 2019 11:37:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 13:37:38 +0200
Message-Id: <20190812113739.16587-3-philmd@redhat.com>
In-Reply-To: <20190812113739.16587-1-philmd@redhat.com>
References: <20190812113739.16587-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 12 Aug 2019 11:37:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] hw/display: Compile various display
 devices as common object
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
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various display devices are not target-specific and can
be compiled once for all the targets.
After this commit, the 'make world' target is reduced by
54 objects

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/Makefile.objs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index a64998fc7b..0f11d55b14 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -31,13 +31,13 @@ obj-$(CONFIG_MILKYMIST_TMU2) +=3D milkymist-tmu2.o
 milkymist-tmu2.o-cflags :=3D $(X11_CFLAGS) $(OPENGL_CFLAGS)
 milkymist-tmu2.o-libs :=3D $(X11_LIBS) $(OPENGL_LIBS)
=20
-obj-$(CONFIG_OMAP) +=3D omap_dss.o
+common-obj-$(CONFIG_OMAP) +=3D omap_dss.o
 obj-$(CONFIG_OMAP) +=3D omap_lcdc.o
-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_lcd.o
-obj-$(CONFIG_RASPI) +=3D bcm2835_fb.o
-obj-$(CONFIG_SM501) +=3D sm501.o
-obj-$(CONFIG_TCX) +=3D tcx.o
-obj-$(CONFIG_CG3) +=3D cg3.o
+common-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_lcd.o
+common-obj-$(CONFIG_RASPI) +=3D bcm2835_fb.o
+common-obj-$(CONFIG_SM501) +=3D sm501.o
+common-obj-$(CONFIG_TCX) +=3D tcx.o
+common-obj-$(CONFIG_CG3) +=3D cg3.o
=20
 obj-$(CONFIG_VGA) +=3D vga.o
=20
@@ -53,7 +53,7 @@ virtio-gpu.o-cflags :=3D $(VIRGL_CFLAGS)
 virtio-gpu.o-libs +=3D $(VIRGL_LIBS)
 virtio-gpu-3d.o-cflags :=3D $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs +=3D $(VIRGL_LIBS)
-obj-$(CONFIG_DPCD) +=3D dpcd.o
-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dp.o
+common-obj-$(CONFIG_DPCD) +=3D dpcd.o
+common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dp.o
=20
-obj-$(CONFIG_ATI_VGA) +=3D ati.o ati_2d.o ati_dbg.o
+common-obj-$(CONFIG_ATI_VGA) +=3D ati.o ati_2d.o ati_dbg.o
--=20
2.20.1


