Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA620604AD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 12:45:25 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjLiW-0007ro-Sg
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 06:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjLgP-0006Qd-9j
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 06:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjLgN-0005G1-U1
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 06:43:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56892)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjLgJ-0004vG-Uj; Fri, 05 Jul 2019 06:43:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D120301E11B;
 Fri,  5 Jul 2019 10:43:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A01EA100164A;
 Fri,  5 Jul 2019 10:42:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 12:42:55 +0200
Message-Id: <20190705104255.24027-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 05 Jul 2019 10:43:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v2] hw/ssi/xilinx_spips: Avoid AXI
 writes to the LQSPI linear memory
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
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lei Sun found while auditing the code than a CPU write would
trigger a NULL pointer deference.

From UG1085 datasheet [*] AXI writes in this region are ignored
and generates an External Slave Error (SLVERR).

Fix by checking the access is a READ before calling the region
callback.

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reported-by: Lei Sun <slei.casper@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
---
 hw/ssi/xilinx_spips.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..0c9ccd12bf 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1202,6 +1202,18 @@ static void lqspi_load_cache(void *opaque, hwaddr =
addr)
     }
 }
=20
+static bool lqspi_accepts(void *opaque, hwaddr addr,
+                          unsigned size, bool is_write,
+                          MemTxAttrs attrs)
+{
+    /*
+     * From UG1085, Chapter 24 (Quad-SPI controllers):
+     * - Writes are ignored
+     * - AXI writes generate an external AXI slave error (SLVERR)
+     */
+    return !is_write;
+}
+
 static uint64_t
 lqspi_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -1225,6 +1237,7 @@ static const MemoryRegionOps lqspi_ops =3D {
     .read =3D lqspi_read,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
+        .accepts =3D lqspi_accepts,
         .min_access_size =3D 1,
         .max_access_size =3D 4
     }
--=20
2.20.1


