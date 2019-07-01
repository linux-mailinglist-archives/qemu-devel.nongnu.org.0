Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB7EB39A
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Apr 2019 15:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKNR0-0006RX-DG
	for lists+qemu-devel@lfdr.de; Sat, 27 Apr 2019 09:32:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKNPd-000624-HF
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 09:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKNPc-00025b-NK
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 09:30:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKNPZ-00021g-JI; Sat, 27 Apr 2019 09:30:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7612130BC73E;
	Sat, 27 Apr 2019 13:30:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B50B65ED4D;
	Sat, 27 Apr 2019 13:30:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 15:30:28 +0200
Message-Id: <20190427133028.12874-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sat, 27 Apr 2019 13:30:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/dma: Compile the bcm2835_dma device as
 common object
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device is used by both ARM (BCM2836, for raspi2) and AArch64
(BCM2837, for raspi3) targets, and is not CPU-specific.
Move it to common object, so we build it once for all targets.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/dma/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 79affecc390..8b39f9c6004 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -14,4 +14,4 @@ common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
=20
 obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
+common-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
--=20
2.20.1


