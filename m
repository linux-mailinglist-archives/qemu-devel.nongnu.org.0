Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70063150022
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 01:19:48 +0100 (CET)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyPSt-0003N1-Gv
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 19:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQX-00071O-V2
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQW-0004Dx-TI
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:21 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:38210 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQU-00048B-Ey; Sun, 02 Feb 2020 19:17:18 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 626D8FD170912DF4A5B2;
 Mon,  3 Feb 2020 08:17:14 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:03 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/7] arm/acpi: fix duplicated _UID of PCI interrupt link
 devices
Date: Mon, 3 Feb 2020 08:15:03 +0800
Message-ID: <20200203001505.52573-6-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200203001505.52573-1-guoheyi@huawei.com>
References: <20200203001505.52573-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using _UID of 0 for all PCI interrupt link devices absolutely violates
the spec. Simply increase one by one.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5d157a9dd5..f3e340b172 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -189,7 +189,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
         uint32_t irqs =3D  irq + i;
         Aml *dev_gsi =3D aml_device("GSI%d", i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F"))=
);
-        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
         crs =3D aml_resource_template();
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIG=
H,
--=20
2.19.1


