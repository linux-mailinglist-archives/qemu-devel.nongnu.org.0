Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5117125B95
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 07:51:05 +0100 (CET)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihpeK-0001xX-Qv
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 01:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ihpco-0000ec-Pb
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 01:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ihpcn-0006Yw-Hc
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 01:49:30 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:42606 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ihpck-0005iX-JF; Thu, 19 Dec 2019 01:49:26 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 64E7DF7544FEBC85BDD4;
 Thu, 19 Dec 2019 14:49:19 +0800 (CST)
Received: from linux-CPUxgZ.huawei.com (10.175.104.212) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 14:49:13 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 1/2] arm/virt/acpi: remove meaningless sub device "PR0" from
 PCI0
Date: Thu, 19 Dec 2019 14:47:58 +0800
Message-ID: <20191219064759.35053-2-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191219064759.35053-1-guoheyi@huawei.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sub device "PR0" under PCI0 in ACPI/DSDT does not make any sense,
so simply remote it.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c          |   4 ----
 tests/data/acpi/virt/DSDT         | Bin 18462 -> 18449 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19786 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18449 bytes
 4 files changed, 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd5f771e9b..9f4c7d1889 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemM=
apEntry *memmap,
     aml_append(method, aml_return(buf));
     aml_append(dev, method);
=20
-    Aml *dev_rp0 =3D aml_device("%s", "RP0");
-    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
-    aml_append(dev, dev_rp0);
-
     Aml *dev_res0 =3D aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
     crs =3D aml_resource_template();
diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d32=
ec856feb388be4c 100644
GIT binary patch
delta 39
vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)

delta 50
zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I
G{V4!>hYx%J

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.=
memhp
index 41ccc6431b917252bcbaac86c33b340c796be5ce..69ad844f65d047973a3e55198=
beecd45a35b8fce 100644
GIT binary patch
delta 40
wcmcaUi}BPfMlP3Nmk=3D*s1_q}3iCof5t(P{ccXBfI+}XT|v(|RAjk`1(02g)*ivR!s

delta 51
zcmX>#i}Cs_MlP3NmymE@1_mbiiCof5O_w*ScXBdy-rc;3v(}c2J1D>)o+IATC1|sb
HyBr$;t7;Fc

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSD=
T.numamem
index d0f3afeb134fdf1c11f64cd06dbcdd30be603b80..b5895cb22446860a0b9be3d32=
ec856feb388be4c 100644
GIT binary patch
delta 39
vcmbO?fpOvlMlP3Nmk>b@1_q`B6S<_Bdg?Z+cXBfI+}XT|v(|R9jr$`2@RSW)

delta 50
zcmbO@fpOjhMlP3Nmk>D*1_q{tiCof5o%I{lJ2{y;?{412S!>J19TZ>?&k^tF5;R%I
G{V4!>hYx%J

--=20
2.19.1


