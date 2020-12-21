Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A42DFC2E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:05:52 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKsp-0002El-Qz
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krKqI-0001BX-PW
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:03:14 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krKqE-0005pv-2K
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:03:14 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D00442xNqzM7b3;
 Mon, 21 Dec 2020 21:02:12 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 21 Dec 2020
 21:02:57 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/6] acpi/gpex: Inform os to keep firmware resource map
Date: Mon, 21 Dec 2020 21:02:13 +0800
Message-ID: <20201221130216.6086-4-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201221130216.6086-1-cenjiahui@huawei.com>
References: <20201221130216.6086-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There may be some differences in pci resource assignment between guest os
and firmware.

Eg. A Bridge with Bus [d2]
    -+-[0000:d2]---01.0-[d3]----01.0

    where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
          [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
                                          BAR4 (mem, 64-bit, pref) [size=64M]

    In EDK2, the Resource Map would be:
        PciBus: Resource Map for Bridge [D2|01|00]
        Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
           Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
           Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
        Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
    It would use 0x4100000 to calculate the root bus's PMem64 resource window.

    While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
    the PMem64 size, which would be 0x6000000. So kernel would try to
    allocate 0x6000000 from the PMem64 resource window, but since the window
    size is 0x4100000 as assigned by EDK2, the allocation would fail.

The diffences could result in resource assignment failure.

Using _DSM #5 method to inform guest os not to ignore the PCI configuration
that firmware has done at boot time could handle the differences.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci-host/gpex-acpi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 11b3db8f71..c189306599 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -112,10 +112,24 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
     UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
     ifctx = aml_if(aml_equal(aml_arg(0), UUID));
     ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
-    uint8_t byte_list[1] = {1};
-    buf = aml_buffer(1, byte_list);
+    uint8_t byte_list[] = {
+                0x1 << 0 /* support for functions other than function 0 */ |
+                0x1 << 5 /* support for function 5 */
+                };
+    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
     aml_append(ifctx1, aml_return(buf));
     aml_append(ifctx, ifctx1);
+
+    /* PCI Firmware Specification 3.1
+     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
+     */
+    /* Arg2: Function Index: 5 */
+    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
+    /* 0 - The operating system must not ignore the PCI configuration that
+     *     firmware has done at boot time.
+     */
+    aml_append(ifctx1, aml_return(aml_int(0)));
+    aml_append(ifctx, ifctx1);
     aml_append(method, ifctx);
 
     byte_list[0] = 0;
-- 
2.28.0


