Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675292ECEF0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:45:34 +0100 (CET)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTjR-0001cJ-FC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxThL-0007yl-Jj
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:43:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxThI-0002p0-3k
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:43:23 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBPV46PZlzj4Zx;
 Thu,  7 Jan 2021 19:42:20 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Jan 2021
 19:43:06 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/8] acpi: Fix unmatched expected DSDT.pxb file
Date: Thu, 7 Jan 2021 19:40:37 +0800
Message-ID: <20210107114043.9624-3-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107114043.9624-1-cenjiahui@huawei.com>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
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
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit fe1127da11 ("unit-test: Add the binary file and clear diff.h") does not
use the up-to-date expected file for pxb for ARM virt.

Fix the expected DSDT.pxb file.

Full diff of changed file disassembly:

diff -ru /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:04:51.246831080 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:11:59.566831080 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001E7A (7802)
+ *     Length           0x00001DF9 (7673)
  *     Revision         0x02
- *     Checksum         0x57
+ *     Checksum         0x42
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -45,32 +45,6 @@
             })
         }

-        Device (FLS0)
-        {
-            Name (_HID, "LNRO0015")  // _HID: Hardware ID
-            Name (_UID, Zero)  // _UID: Unique ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadWrite,
-                    0x00000000,         // Address Base
-                    0x04000000,         // Address Length
-                    )
-            })
-        }
-
-        Device (FLS1)
-        {
-            Name (_HID, "LNRO0015")  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadWrite,
-                    0x04000000,         // Address Base
-                    0x04000000,         // Address Length
-                    )
-            })
-        }
-
         Device (FWCF)
         {
             Name (_HID, "QEMU0002")  // _HID: Hardware ID
@@ -665,9 +639,6 @@
         {
             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
-            Name (_ADR, Zero)  // _ADR: Address
-            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
-            Name (_SEG, Zero)  // _SEG: PCI Segment
             Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
             Name (_UID, 0x80)  // _UID: Unique ID
             Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
@@ -1857,7 +1828,7 @@
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
             Name (_SEG, Zero)  // _SEG: PCI Segment
             Name (_BBN, Zero)  // _BBN: BIOS Bus Number
-            Name (_UID, "PCI0")  // _UID: Unique ID
+            Name (_UID, Zero)  // _UID: Unique ID
             Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
             Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
@@ -2983,41 +2954,37 @@
                 Return (0x0000004010000000)
             }

-            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
-                Return (ResourceTemplate ()
-                {
-                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
-                        0x0000,             // Granularity
-                        0x0000,             // Range Minimum
-                        0x007F,             // Range Maximum
-                        0x0000,             // Translation Offset
-                        0x0080,             // Length
-                        ,, )
-                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
-                        0x00000000,         // Granularity
-                        0x10000000,         // Range Minimum
-                        0x3EFEFFFF,         // Range Maximum
-                        0x00000000,         // Translation Offset
-                        0x2EFF0000,         // Length
-                        ,, , AddressRangeMemory, TypeStatic)
-                    DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
-                        0x00000000,         // Granularity
-                        0x00000000,         // Range Minimum
-                        0x0000FFFF,         // Range Maximum
-                        0x3EFF0000,         // Translation Offset
-                        0x00010000,         // Length
-                        ,, , TypeStatic, DenseTranslation)
-                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
-                        0x0000000000000000, // Granularity
-                        0x0000008000000000, // Range Minimum
-                        0x000000FFFFFFFFFF, // Range Maximum
-                        0x0000000000000000, // Translation Offset
-                        0x0000008000000000, // Length
-                        ,, , AddressRangeMemory, TypeStatic)
-                })
-            }
-
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0000,             // Range Minimum
+                    0x007F,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0080,             // Length
+                    ,, )
+                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x00000000,         // Granularity
+                    0x10000000,         // Range Minimum
+                    0x3EFEFFFF,         // Range Maximum
+                    0x00000000,         // Translation Offset
+                    0x2EFF0000,         // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
+                    0x00000000,         // Granularity
+                    0x00000000,         // Range Minimum
+                    0x0000FFFF,         // Range Maximum
+                    0x3EFF0000,         // Translation Offset
+                    0x00010000,         // Length
+                    ,, , TypeStatic, DenseTranslation)
+                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x0000000000000000, // Granularity
+                    0x0000008000000000, // Range Minimum
+                    0x000000FFFFFFFFFF, // Range Maximum
+                    0x0000000000000000, // Translation Offset
+                    0x0000008000000000, // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+            })
             Name (SUPP, Zero)
             Name (CTRL, Zero)
             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities

Fixes: fe1127da11 ("unit-test: Add the binary file and clear diff.h")
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 tests/data/acpi/virt/DSDT.pxb | Bin 7802 -> 7673 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index d5f0533a02d62bc2ae2db9b9de9484e5c06652fe..76f5f1c2fd487644c6b4f827a70ad770edb9fdc9 100644
GIT binary patch
delta 70
zcmV-M0J;DAJo!5cL{mgm`5gcN0z#1r8v=ygktblW?YIa6OPZ6X2_m!G35f{>PNz^q
cNt3DxACrg^53`&Ttq27OUqez;vr-%=0*oRUFaQ7m

delta 217
zcmexq{mX{SCD<jTN{)enDSRTAG*j!-iRuaUhHgH=1|0Doo-VvTenI{Q28N~#9Py!^
zE<n;bC|FRCi?5B7fsp|MSSlH!n?PC&v1wsM*TMqS1=eEW7Vhi@(GuwD8){%+U<5Qj
zIK*+|g83XwzOyGgaw_pVx&(nNb#?@r6YT1~If1i>lgWL><aa`bth@ovo(7xch1YU$
Qia3I;VOX;HqO=AR0CN5_Pyhe`

-- 
2.29.2


