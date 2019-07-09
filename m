Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9B63614
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 14:41:51 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkpRO-0000Rs-Vb
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 08:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkpIx-0002ix-Uj
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkpIw-0004Zk-KG
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:33:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkpIt-0004WJ-Qs; Tue, 09 Jul 2019 08:33:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A4BD3179B62;
 Tue,  9 Jul 2019 12:32:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3CF21001B0F;
 Tue,  9 Jul 2019 12:32:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 14:32:39 +0200
Message-Id: <20190709123240.16298-3-philmd@redhat.com>
In-Reply-To: <20190709123240.16298-1-philmd@redhat.com>
References: <20190709123240.16298-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 09 Jul 2019 12:32:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v6 2/3] hw/ssi/xilinx_spips: Avoid AXI
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
 Alistair Francis <alistair@alistair23.me>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lei Sun found while auditing the code that a CPU write would
trigger a NULL pointer dereference.

From UG1085 datasheet [*] AXI writes in this region are ignored
and generates an AXI Slave Error (SLVERR).

Fix by implementing the write_with_attrs() handler.
Return MEMTX_ERROR when the region is accessed (this error maps
to an AXI slave error).

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v4: Fix typos (Francisco)
---
 hw/ssi/xilinx_spips.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index b7c7275dbe..3c4e8365ee 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1220,8 +1220,24 @@ static MemTxResult lqspi_read(void *opaque, hwaddr=
 addr, uint64_t *value,
     return lqspi_read(opaque, addr, value, size, attrs);
 }
=20
+static MemTxResult lqspi_write(void *opaque, hwaddr offset, uint64_t val=
ue,
+                               unsigned size, MemTxAttrs attrs)
+{
+    /*
+     * From UG1085, Chapter 24 (Quad-SPI controllers):
+     * - Writes are ignored
+     * - AXI writes generate an external AXI slave error (SLVERR)
+     */
+    qemu_log_mask(LOG_GUEST_ERROR, "%s Unexpected %u-bit access to 0x%" =
PRIx64
+                                   " (value: 0x%" PRIx64 "\n",
+                  __func__, size << 3, offset, value);
+
+    return MEMTX_ERROR;
+}
+
 static const MemoryRegionOps lqspi_ops =3D {
     .read_with_attrs =3D lqspi_read,
+    .write_with_attrs =3D lqspi_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.20.1


