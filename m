Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4783151411
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 02:53:27 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iynP4-0007Oi-W3
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 20:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIc-0007rb-1d
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 20:46:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIa-0008Qw-Rt
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 20:46:45 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2694 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynIL-0008B1-9K; Mon, 03 Feb 2020 20:46:31 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 45B71803D8D6B998D2E7;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/7] arm/virt/acpi: remove meaningless sub device "RP0"
 from PCI0
Date: Tue, 4 Feb 2020 09:43:20 +0800
Message-ID: <20200204014325.16279-3-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
References: <20200204014325.16279-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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

The sub device "RP0" under PCI0 in ACPI/DSDT does not contain any
method or property other than "_ADR", so it is safe to remove it.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Acked-by: "Michael S. Tsirkin" <mst@redhat.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 4 ----
 1 file changed, 4 deletions(-)

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
--=20
2.19.1


