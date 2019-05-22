Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B225D22
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 06:55:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJHn-0001hg-SJ
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 00:55:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8v-0003NY-Cw
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8u-0006hk-AJ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:21 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43637 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ8t-0006fA-TT; Wed, 22 May 2019 00:46:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580Sw3Ffhz9sPD; Wed, 22 May 2019 14:46:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500368;
	bh=s7n9GOFMHz6jZbmXHbQuUX0/Qi9S9CpdqCJBOttcq4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+QBQv4bMX+FOk/Pykv8UdRfG4yDqxLqmafsJIi+D2yMEL4e87Q/wkpswNBOLeymu
	p+jXMf/xTYhNevOsFTps/tr5NWaWc3naStDxT1fVxN4ZK6diVsNH+YPgMHSdC7b8Bo
	FwQinp16qfJ83/Mf7Gy+au5k1/Fsxx+vYRsBnBfY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:37 +1000
Message-Id: <20190522044600.16534-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 15/38] spapr/xive: print out the EQ page address
 in the monitor
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

This proved to be a useful information when debugging issues with OS
event queues allocated above 64GB.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190508171946.657-4-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index a19e998093..58cc6e2b50 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -120,6 +120,7 @@ static int spapr_xive_target_to_end(uint32_t target, =
uint8_t prio,
 static void spapr_xive_end_pic_print_info(SpaprXive *xive, XiveEND *end,
                                           Monitor *mon)
 {
+    uint64_t qaddr_base =3D xive_end_qaddr(end);
     uint32_t qindex =3D xive_get_field32(END_W1_PAGE_OFF, end->w1);
     uint32_t qgen =3D xive_get_field32(END_W1_GENERATION, end->w1);
     uint32_t qsize =3D xive_get_field32(END_W0_QSIZE, end->w0);
@@ -127,9 +128,9 @@ static void spapr_xive_end_pic_print_info(SpaprXive *=
xive, XiveEND *end,
     uint32_t nvt =3D xive_get_field32(END_W6_NVT_INDEX, end->w6);
     uint8_t priority =3D xive_get_field32(END_W7_F0_PRIORITY, end->w7);
=20
-    monitor_printf(mon, "%3d/%d % 6d/%5d ^%d",
+    monitor_printf(mon, "%3d/%d % 6d/%5d @%"PRIx64" ^%d",
                    spapr_xive_nvt_to_target(0, nvt),
-                   priority, qindex, qentries, qgen);
+                   priority, qindex, qentries, qaddr_base, qgen);
=20
     xive_end_queue_pic_print_info(end, 6, mon);
     monitor_printf(mon, "]");
--=20
2.21.0


