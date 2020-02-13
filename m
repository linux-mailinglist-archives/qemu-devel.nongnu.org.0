Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A815B732
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 03:37:10 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j24NJ-0008Ve-OV
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 21:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j24M3-0007Ci-GR
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j24M2-0000Yf-Gc
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2763 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j24Lz-0000PK-TP; Wed, 12 Feb 2020 21:35:48 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6183B8CACE345A96321E;
 Thu, 13 Feb 2020 10:35:42 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 10:35:34 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 1/4] acpi: Add aml_generic_register
Date: Thu, 13 Feb 2020 10:35:29 +0800
Message-ID: <20200213023532.902-2-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20200213023532.902-1-fangying1@huawei.com>
References: <20200213023532.902-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic register descriptor describes the localtion of a
fixed width register within any of the ACPI-defined address space.

This is needed to declare the ACPI CPPC registers.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/aml-build.c         | 22 ++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2c3702b882..79b1431f07 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1370,6 +1370,28 @@ Aml *aml_sleep(uint64_t msec)
     return var;
 }
=20
+/* ACPI 5.0b: 6.4.3.7 Generic Register Descriptor */
+Aml *aml_generic_register(AmlRegionSpace rs, uint8_t reg_width,
+                          uint8_t reg_offset, AmlAccessType type, uint64=
_t addr)
+{
+    int i;
+    Aml *var =3D aml_alloc();
+    build_append_byte(var->buf, 0x82); /* Generic Register Descriptor */
+    build_append_byte(var->buf, 0x0C); /* Length, bits[7:0] value =3D 0x=
0C */
+    build_append_byte(var->buf, 0);    /* Length, bits[15:8] value =3D 0=
 */
+    build_append_byte(var->buf, rs);   /* Address Space ID */
+    build_append_byte(var->buf, reg_width);   /* Register Bit Width */
+    build_append_byte(var->buf, reg_offset);  /* Register Bit Offset */
+    build_append_byte(var->buf, type);        /* Access Size */
+
+    /* Register address */
+    for (i =3D 0; i < 8; i++) {
+        build_append_byte(var->buf, extract64(addr, i * 8, 8));
+    }
+
+    return var;
+}
+
 static uint8_t Hex2Byte(const char *src)
 {
     int hi, lo;
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de4a406568..37a047b156 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -364,6 +364,9 @@ Aml *aml_qword_memory(AmlDecode dec, AmlMinFixed min_=
fixed,
 Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
              uint8_t channel);
 Aml *aml_sleep(uint64_t msec);
+Aml *aml_generic_register(AmlRegionSpace rs, uint8_t reg_width,
+                          uint8_t reg_offset, AmlAccessType type,
+                          uint64_t addr);
 Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_so=
urce);
=20
 /* Block AML object primitives */
--=20
2.19.1



