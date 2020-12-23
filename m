Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C7C2E1A72
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 10:15:33 +0100 (CET)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks0F2-0001zG-Nj
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 04:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1ks0A5-0003jh-LV
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 04:10:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1ks09s-0002aA-RI
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 04:10:22 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D16pW0vHzzhwn7;
 Wed, 23 Dec 2020 17:09:23 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 23 Dec 2020
 17:09:56 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 8/8] acpi: Update addr_trans and _DSM in expected files
Date: Wed, 23 Dec 2020 17:08:36 +0800
Message-ID: <20201223090836.9075-9-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223090836.9075-1-cenjiahui@huawei.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
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

Addr_trans in _CRS is changed and a new _DSM #5 method is added.
Also the expected file for pxb for ARM virt does not match the source code.

Update expected DSDT files accordingly, and re-enable their testing.

Full diff of changed files disassembly:

diff -ru /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl
--- /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl      2020-12-23 15:49:57.161081285 +0800
+++ /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl      2020-12-23 15:55:11.837769953 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00000BCF (3023)
+ *     Length           0x00000BD7 (3031)
  *     Revision         0x02
- *     Checksum         0x29
+ *     Checksum         0x99
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1302,9 +1302,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.dsl /tmp/new/tests/data/acpi/virt/DSDT.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.dsl      2020-12-23 15:49:57.421095066 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.dsl      2020-12-23 15:55:12.267792771 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000144C (5196)
+ *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0xF0
+ *     Checksum         0x60
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1838,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.memhp.dsl /tmp/new/tests/data/acpi/virt/DSDT.memhp.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.memhp.dsl        2020-12-23 15:49:57.421095066 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.memhp.dsl        2020-12-23 15:55:12.277793302 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000199D (6557)
+ *     Length           0x000019A5 (6565)
  *     Revision         0x02
- *     Checksum         0x11
+ *     Checksum         0x90
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1840,9 +1840,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.numamem.dsl /tmp/new/tests/data/acpi/virt/DSDT.numamem.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.numamem.dsl      2020-12-23 15:49:57.431095596 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.numamem.dsl      2020-12-23 15:55:12.287793832 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000144C (5196)
+ *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0xF0
+ *     Checksum         0x60
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1838,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl  2020-12-23 15:49:57.441096126 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl  2020-12-23 15:55:12.287793832 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001E7A (7802)
+ *     Length           0x00001E09 (7689)
  *     Revision         0x02
- *     Checksum         0x57
+ *     Checksum         0x30
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
@@ -661,16 +635,15 @@
             })
         }

-        Device (PC80)
+        Device (PCI0)
         {
             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
-            Name (_ADR, Zero)  // _ADR: Address
-            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_SEG, Zero)  // _SEG: PCI Segment
-            Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
-            Name (_UID, 0x80)  // _UID: Unique ID
-            Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
+            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
+            Name (_UID, Zero)  // _UID: Unique ID
+            Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
+            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
             {
                 Package (0x04)
@@ -1789,15 +1762,41 @@
                 }
             }

+            Method (_CBA, 0, NotSerialized)  // _CBA: Configuration Base Address
+            {
+                Return (0x0000004010000000)
+            }
+
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                     0x0000,             // Granularity
-                    0x0080,             // Range Minimum
-                    0x0080,             // Range Maximum
+                    0x0000,             // Range Minimum
+                    0x007F,             // Range Maximum
                     0x0000,             // Translation Offset
-                    0x0001,             // Length
+                    0x0080,             // Length
                     ,, )
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
             })
             Name (SUPP, Zero)
             Name (CTRL, Zero)
@@ -1808,8 +1807,8 @@
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
-                    SUPP = CDW2 /* \_SB_.PC80._OSC.CDW2 */
-                    CTRL = CDW3 /* \_SB_.PC80._OSC.CDW3 */
+                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
+                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                     CTRL &= 0x1F
                     If ((Arg1 != One))
                     {
@@ -1821,7 +1820,7 @@
                         CDW1 |= 0x10
                     }

-                    CDW3 = CTRL /* \_SB_.PC80.CTRL */
+                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                     Return (Arg3)
                 }
                 Else
@@ -1839,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
@@ -1849,17 +1853,30 @@
                      0x00                                             // .
                 })
             }
+
+            Device (RES0)
+            {
+                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                        0x0000000000000000, // Granularity
+                        0x0000004010000000, // Range Minimum
+                        0x000000401FFFFFFF, // Range Maximum
+                        0x0000000000000000, // Translation Offset
+                        0x0000000010000000, // Length
+                        ,, , AddressRangeMemory, TypeStatic)
+                })
+            }
         }

-        Device (PCI0)
+        Device (PC80)
         {
             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
-            Name (_SEG, Zero)  // _SEG: PCI Segment
-            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
-            Name (_UID, "PCI0")  // _UID: Unique ID
-            Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
-            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
+            Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
+            Name (_UID, 0x80)  // _UID: Unique ID
+            Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
             {
                 Package (0x04)
@@ -2978,46 +2995,16 @@
                 }
             }

-            Method (_CBA, 0, NotSerialized)  // _CBA: Configuration Base Address
-            {
-                Return (0x0000004010000000)
-            }
-
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
+                    0x0080,             // Range Minimum
+                    0x0080,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
             Name (SUPP, Zero)
             Name (CTRL, Zero)
             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
@@ -3027,8 +3014,8 @@
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
-                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
-                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
+                    SUPP = CDW2 /* \_SB_.PC80._OSC.CDW2 */
+                    CTRL = CDW3 /* \_SB_.PC80._OSC.CDW3 */
                     CTRL &= 0x1F
                     If ((Arg1 != One))
                     {
@@ -3040,7 +3027,7 @@
                         CDW1 |= 0x10
                     }

-                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
+                    CDW3 = CTRL /* \_SB_.PC80.CTRL */
                     Return (Arg3)
                 }
                 Else
@@ -3058,9 +3045,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
@@ -3068,21 +3060,6 @@
                      0x00                                             // .
                 })
             }
-
-            Device (RES0)
-            {
-                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
-                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-                {
-                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
-                        0x0000000000000000, // Granularity
-                        0x0000004010000000, // Range Minimum
-                        0x000000401FFFFFFF, // Range Maximum
-                        0x0000000000000000, // Translation Offset
-                        0x0000000010000000, // Length
-                        ,, , AddressRangeMemory, TypeStatic)
-                })
-            }
         }

         Device (\_SB.GED)

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 tests/data/acpi/microvm/DSDT.pcie           | Bin 3023 -> 3031 bytes
 tests/data/acpi/virt/DSDT                   | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp             | Bin 6557 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem           | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb               | Bin 7802 -> 7689 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 6 files changed, 5 deletions(-)

diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
index 4b765541e372f4ba4e25529c14acf696516c8f61..e590b98f9960025f75dd0544492d3088781406dc 100644
GIT binary patch
delta 59
zcmV-B0L1^#7uOdGL{mgm*9!mu0-2Et8v;SPu_reH0Z6l70pke>HD5$iO$4ARlS&I8
R2_c{dlWGbDqyUp@3uOk*5ZC|!

delta 51
zcmcaEeqNl*CD<k8JU0UaljcM&X(rE|8`aGj867sqGd||z(2aKq_GMY1IN6I^o{@2K
H5qBy8b(js<

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index bc519abff9cadc1552e4e586b0a3f5f0db498f4a..ea8a0869af1637ab75fe335e100256a2acf85e16 100644
GIT binary patch
delta 58
zcmX@3aYcj6CD<h-M1+BXDPba)G-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{T<qzlp

delta 50
zcmcbjaYlp7CD<jzM}&ca>BB@WX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%yeGTXU

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
index 54728e2b4b8b959f3f829386f6a388ef2600e747..897648637cc6c8af47c67a9a349477c0240f833b 100644
GIT binary patch
delta 60
zcmV-C0K@;CGo>>ML{mgmr5OMK0+5jk8v=lsu_qV_0!FB#K?w>7HD5$iO$4ARlSvaF
S2_c{dlWGbDqyV#N6Ep_<;t(eQ

delta 52
zcmZ2#JlB}ZCD<iot|S8kli)-yX{L_p8`UK^nf#V7cI4#Z(2aKq_GMY1IN4KJo{@2L
Ip|A-X0Bmp#CjbBd

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
index bc519abff9cadc1552e4e586b0a3f5f0db498f4a..ea8a0869af1637ab75fe335e100256a2acf85e16 100644
GIT binary patch
delta 58
zcmX@3aYcj6CD<h-M1+BXDPba)G-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{T<qzlp

delta 50
zcmcbjaYlp7CD<jzM}&ca>BB@WX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%yeGTXU

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index d5f0533a02d62bc2ae2db9b9de9484e5c06652fe..f380e6023e7fc209a43280d71bf8a91286e35b63 100644
GIT binary patch
delta 127
zcmexm(`m!y66_MfDaXLTWH6CSnyKa9MD>J?Z+CF8x~&Ls_ME(mQ+{%XF#qN`!fQEL
zIpUpzf;R`r$TD)6#=8XjvMkV?Y%46!sknfBauyfs5{AjsWy2VqCokhv-h7)giW5Z@
QFI?3UL1xCuuVg0x0IJI-00000

delta 259
zcmeCQ`DMf966_LECC9+P6h4tlnyK~aMD>JvLpPsb1CDqPPZwSvzaW1D14B~=j`&bd
z7a-{z6f7vn#n;Bkz{mgrER_t=O&~3X*t9UBYheNE0&B5w3wL&dXbE)n4K*+@Fanw%
z9OAff!F&!z-^nM0mH8cAf<SgUI|7Xfc6HzULO7O_LpR<f*q3F2;$&Z0c}~V9g3OFS
v2e?mm;51_84RH1}*j&W9mV;Bo5o|NVlFceYvWzI27#SxQ3WrUuk?jQl7Wq8e

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 42418e58e7..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/microvm/DSDT.pcie",
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/DSDT.numamem",
-"tests/data/acpi/virt/DSDT.pxb",
-- 
2.29.2


