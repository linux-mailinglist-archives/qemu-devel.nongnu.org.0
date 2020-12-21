Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3D2DFC3E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:14:55 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krL1a-0001Le-Lb
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krKqM-0001DZ-Ca
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:03:18 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krKqF-0005q0-Ie
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:03:17 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D004K0rQfz7JDl;
 Mon, 21 Dec 2020 21:02:25 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Mon, 21 Dec 2020
 21:03:00 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 6/6] acpi: Update addr_trans and _DSM in expected files
Date: Mon, 21 Dec 2020 21:02:16 +0800
Message-ID: <20201221130216.6086-7-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201221130216.6086-1-cenjiahui@huawei.com>
References: <20201221130216.6086-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Addr_trans in _CRS is changed and a new _DSM #5 method is added.
Also the expected file for pxb for ARM virt does not match the source code.

Update expected DSDT files accordingly, and re-enable their testing.

Full diff of changed files disassembly:

diff -ru /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl
--- /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl      2020-12-21 18:24:33.560000000 +0800
+++ /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl      2020-12-21 18:29:14.392000000 +0800
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
-                             0x01                                             /* . */
+                             0x21                                             /* ! */
                         })
                     }
+
+                    If (Arg2 == 0x05)
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.dsl /tmp/new/tests/data/acpi/virt/DSDT.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.dsl      2020-12-21 18:24:33.772000000 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.dsl      2020-12-21 18:29:14.736000000 +0800
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
-                             0x01                                             /* . */
+                             0x21                                             /* ! */
                         })
                     }
+
+                    If (Arg2 == 0x05)
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.memhp.dsl /tmp/new/tests/data/acpi/virt/DSDT.memhp.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.memhp.dsl        2020-12-21 18:24:33.780000000 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.memhp.dsl        2020-12-21 18:29:14.740000000 +0800
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
-                             0x01                                             /* . */
+                             0x21                                             /* ! */
                         })
                     }
+
+                    If (Arg2 == 0x05)
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.numamem.dsl /tmp/new/tests/data/acpi/virt/DSDT.numamem.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.numamem.dsl      2020-12-21 18:24:33.784000000 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.numamem.dsl      2020-12-21 18:29:14.744000000 +0800
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
-                             0x01                                             /* . */
+                             0x21                                             /* ! */
                         })
                     }
+
+                    If (Arg2 == 0x05)
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl  2020-12-21 18:24:33.792000000 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl  2020-12-21 18:29:14.752000000 +0800
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
@@ -1839,9 +1810,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             /* . */
+                             0x21                                             /* ! */
                         })
                     }
+
+                    If (Arg2 == 0x05)
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
@@ -1857,7 +1833,7 @@
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
             Name (_SEG, Zero)  // _SEG: PCI Segment
             Name (_BBN, Zero)  // _BBN: BIOS Bus Number
-            Name (_UID, "PCI0")  // _UID: Unique ID
+            Name (_UID, Zero)  // _UID: Unique ID
             Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
             Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
@@ -2983,41 +2959,37 @@
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
-                        ,, , TypeStatic)
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
+                    ,, , TypeStatic)
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
@@ -3058,9 +3030,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             /* . */
+                             0x21                                             /* ! */
                         })
                     }
+
+                    If (Arg2 == 0x05)
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

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
index d5f0533a02d62bc2ae2db9b9de9484e5c06652fe..ce3b67dff277e23f43925b1adcbb55c9d0b4eee3 100644
GIT binary patch
delta 125
zcmexm(`m!y66_MfDaXLTWH6CSnyKa9MD>J?Z+CDoI!|84sl53%XA~!gX}n9YFUtbW
z$+p7sqKXUHCuec7E@4<A$jrzP-Q>0+z}a*1Do**y9m4#Z=LoOmVC9H+4hr5JBqPg+
NqLmY_b@FuC#{fVBB|`uJ

delta 255
zcmeCQ`DMf966_LECC9+P6h4tlnyK~aMD>JvLpPsb1CDqPPZwSvzaW1D14B~=j`&bd
z7a-{z6f7vn#n;Bkz{mgrER_t=O&~3X*t9UBYheNE0&B5w3wL&dXbE)n4K*+@Fanw%
z9OAff!F&!z-^mV~%KVNlK_EMw9f8IKySi^q;Ed(u(2aKq_GMY1IQgH9JSXE4L1spv
r1KcNn6*6Mw4RH1}*sLzRmV;Bo5o|NVlFc`zWf@U4F)~h8lYI;TA6Y!*

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
2.28.0


