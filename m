Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52531150020
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 01:18:44 +0100 (CET)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyPRr-0000sa-D9
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 19:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQX-00071N-Ve
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQW-0004Dj-PY
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:21 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:38208 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQU-00048G-9a; Sun, 02 Feb 2020 19:17:18 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 67CB4D6B5B1CFFB84D44;
 Mon,  3 Feb 2020 08:17:14 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:04 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 6/7] arm/acpi: simplify the description of PCI _CRS
Date: Mon, 3 Feb 2020 08:15:04 +0800
Message-ID: <20200203001505.52573-7-guoheyi@huawei.com>
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

The original code defines a named object for the resource template but
then returns the resource template object itself; the resulted output
is like below:

Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
{
    Name (RBUF, ResourceTemplate ()
    {
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0000,             // Range Minimum
            0x00FF,             // Range Maximum
            0x0000,             // Translation Offset
            0x0100,             // Length
            ,, )
        ......
    })
    Return (ResourceTemplate ()
    {
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0000,             // Range Minimum
            0x00FF,             // Range Maximum
            0x0000,             // Translation Offset
            0x0100,             // Length
            ,, )
        ......
    })
}

So the named object "RBUF" is actually useless. The more natural way
is to return RBUF instead, or simply drop RBUF definition.

Choose the latter one to simplify the code.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f3e340b172..fb4b166f82 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -236,7 +236,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
                              size_mmio_high));
     }
=20
-    aml_append(method, aml_name_decl("RBUF", rbuf));
     aml_append(method, aml_return(rbuf));
     aml_append(dev, method);
=20
--=20
2.19.1


