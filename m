Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFA343B9B1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:37:09 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRJs-00064t-Ng
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8X-0005yG-O1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:26 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8Q-0006l2-M6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m42so342740wms.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SMPxXY858z4Kf7KrvjZGDmyceiHBnIhXO+Rom1fQSGo=;
 b=oSqy5OCmIW0E/0q+n3BLnFezKMW/bD/26YodxtHr+ijp7zly2LFnVdBrqbSFRpmJbu
 2VSY5Fs8ggy+rO91d0JvwCR7DBcpyizRVsD4IsSs1P8O11hw8/LuXxs/dva6HSvz/V6i
 IRn/OMgErhIdceQBiOiPqPvlhmzKF4PeEP5I9XFO5BQY+r5whjy+3dHERNcn8288EC7w
 BySbem71CahLnujgZa8E6ReD0j0upRixm2f+EOYMgcl++4lEflYA1IzuEFIEzqe/oTJC
 ECNc7t5XXiLhfLBaXaGslNGQG+ezs/R1X8N/5jGRWdPti4YK+mstHkc4+3UjyMtMmr5c
 OJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SMPxXY858z4Kf7KrvjZGDmyceiHBnIhXO+Rom1fQSGo=;
 b=K7H8SIqCb+e6KBbRnOJDFwKm1Dm4eeikeakwi7gCOkr5iJjGkpqU6HxOeeTiNBEHEn
 Pyq2OxOgT5e9F3J2iLGykpZjz53fZLi+weWxYzS4NWErch2YZyywUUSMee6NhGEf7FRf
 YZa0R+bIaIpfU3zO7g1RHlc56kTNuDu1ESQKSWPmTnwVj7ARUEC2qW0BomIqTC+Dz+N9
 tmy6n3kQ0YI0Uktbmkl6Tf3UNTz8ekxeNEJYuS8xaXkxDSN2gDge6ka7E1jnzVUKIqCf
 3JwSm/6b6HU/ii0s/ZNhOqWOLkTngYGxuzhYW1EQZPKTHVTiXY6UKiHy41nxKOA4EnE/
 iyVw==
X-Gm-Message-State: AOAM533/1twC2AZHymPwMXrjPrriE46Cstbhwhy5zdFE7cM5Dvb4CN5Q
 jJXhx5Ez7IITjvGCqMezLoXWRg==
X-Google-Smtp-Source: ABdhPJy1gfZr08MuWeGyGwQnNHHRtNfDBr59IKzffEc7biJvfRNXBXhnSSFlIgEd6D2Wa+dduNlvYg==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr344567wmk.51.1635272713961;
 Tue, 26 Oct 2021 11:25:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:13 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 7/7] tests/acpi: add expected blobs for VIOT test on q35
 machine
Date: Tue, 26 Oct 2021 19:20:26 +0100
Message-Id: <20211026182024.2642038-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026182024.2642038-1-jean-philippe@linaro.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add expected blobs of the VIOT and DSDT table for the VIOT test on the
q35 machine.

Since the test instantiates a virtio device and two PCIe expander
bridges, DSDT.viot has more blocks than the base DSDT.

The VIOT table generated for the q35 test is:

[000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
[004h 0004   4]                 Table Length : 00000070
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 3D
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]                   Node count : 0003
[026h 0038   2]                  Node offset : 0030
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
[031h 0049   1]                     Reserved : 00
[032h 0050   2]                       Length : 0010

[034h 0052   2]                  PCI Segment : 0000
[036h 0054   2]               PCI BDF number : 0010
[038h 0056   8]                     Reserved : 0000000000000000

[040h 0064   1]                         Type : 01 [PCI Range]
[041h 0065   1]                     Reserved : 00
[042h 0066   2]                       Length : 0018

[044h 0068   4]               Endpoint start : 00003000
[048h 0072   2]            PCI Segment start : 0000
[04Ah 0074   2]              PCI Segment end : 0000
[04Ch 0076   2]                PCI BDF start : 3000
[04Eh 0078   2]                  PCI BDF end : 30FF
[050h 0080   2]                  Output node : 0030
[052h 0082   6]                     Reserved : 000000000000

[058h 0088   1]                         Type : 01 [PCI Range]
[059h 0089   1]                     Reserved : 00
[05Ah 0090   2]                       Length : 0018

[05Ch 0092   4]               Endpoint start : 00001000
[060h 0096   2]            PCI Segment start : 0000
[062h 0098   2]              PCI Segment end : 0000
[064h 0100   2]                PCI BDF start : 1000
[066h 0102   2]                  PCI BDF end : 10FF
[068h 0104   2]                  Output node : 0030
[06Ah 0106   6]                     Reserved : 000000000000

And the DSDT diff is:

@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Wed Oct 20 16:33:00 2021
+ * Disassembly of /tmp/aml-4TWUB1, Wed Oct 20 16:16:49 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002061 (8289)
+ *     Length           0x000024B6 (9398)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xF9
+ *     Checksum         0xA6
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -3114,6 +3114,339 @@
         }
     }

+    Scope (\_SB)
+    {
+        Device (PC30)
+        {
+            Name (_UID, 0x30)  // _UID: Unique ID
+            Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC30._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0030,             // Range Minimum
+                    0x0030,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
+    Scope (\_SB)
+    {
+        Device (PC20)
+        {
+            Name (_UID, 0x20)  // _UID: Unique ID
+            Name (_BBN, 0x20)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC20._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0020,             // Range Minimum
+                    0x0020,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
+    Scope (\_SB)
+    {
+        Device (PC10)
+        {
+            Name (_UID, 0x10)  // _UID: Unique ID
+            Name (_BBN, 0x10)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC10._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0010,             // Range Minimum
+                    0x0010,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
     Scope (\_SB.PCI0)
     {
         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
@@ -3121,9 +3454,9 @@
             WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                 0x0000,             // Granularity
                 0x0000,             // Range Minimum
-                0x00FF,             // Range Maximum
+                0x000F,             // Range Maximum
                 0x0000,             // Translation Offset
-                0x0100,             // Length
+                0x0010,             // Length
                 ,, )
             IO (Decode16,
                 0x0CF8,             // Range Minimum
@@ -3278,6 +3611,26 @@
                 }
             }

+            Device (S10)
+            {
+                Name (_ADR, 0x00020000)  // _ADR: Address
+            }
+
+            Device (S18)
+            {
+                Name (_ADR, 0x00030000)  // _ADR: Address
+            }
+
+            Device (S20)
+            {
+                Name (_ADR, 0x00040000)  // _ADR: Address
+            }
+
+            Device (S28)
+            {
+                Name (_ADR, 0x00050000)  // _ADR: Address
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
             }

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.viot               | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot               | Bin 0 -> 112 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index fa213e4738..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..20e5c87b6be3be9df70a8a74d82f68bb2c6a25cf 100644
GIT binary patch
literal 9398
zcmeHNO>7&-8J*>iv|O&FB}G~OOGG$H|5C)1oWHhc5OS9yDTx$CQgH$r;8Idr*-4Q_
z5(9Az1F`}niVsB-#zBvCpcK8er(A2Gm-gmc1N78GFS!;)e6sq!nH_0{q=4wuOC(@-
zzuEWZn>V|&Z#cVN(`$Y8BxA-O3af6pnJv6pceD627-Muyd#4h+!rD7tq0}*wk(klG
zo#e;Z6wJ&|y~29Q`2Dv3x$nRGk#BSZw(*5?ccUA8u;*_u0$tw-EQ=1D;$){;=(KlT
ztL|2EW~W^7?EC}EG&`<1ikh9g*I;I6z2dRV%6MnB>BjE7!Cde1e7_d&ZKtL!r(ON$
zrEllXzx?^-ck}mu`Hx@SdBchUuz<aZ{iT35{!QPS^ZU-Hy{pD8qVsd}{pnA8{In=@
z=uF^K$vs;XQC0K%Z?tz`^cs1Ww{fCgtLNO@Jlf?pnyESK{718l+0;4o_veFygTIJF
z=G<UT)f6g=X1QK$NtFh)k*fAix!$TWo3RIvk}TG~?NB`ZO0ni;>kY4y%{<>}w(=~X
z5<j4#?)$#w_<j46p3i!I^59^f^(Q~+b=hZKoBiv*@qM;$O^LRptjP}()RqU2Sd1~W
z<_FJEYpB25yJsuSe1~^2($AqO^-5zcV)>TsEKgmGN+6-yyU#8cJb=YDilX&sl}vNm
znkgAR^O<3kj4if>{e=j!wRfMauC5=lrlvKPX~i#454Cp}R_d*JS$9laZ$ra6)<ns8
zFZy28G%xJ%nit&F>LDi%G<tIc=VA0=l$jSC&UvcQat~XR46h%rI$!}a%nQsw7u8Zn
zeY8_|n=K=G-?mI#8VX$W-Fg-qFWcT}7MCyz{$^Xaa7hZ>Law-k6NOr}VI&_28U=2l
zwqDKFE8eTwwozDdms#eix?5a|w4b2p;2_v0L~z5n%BYU^52<*cWuDH1GYUm@1+?))
zte^45>Rz)t*<T5V#)B9B{_o~<?^i#W{ib^6uWmJ<y59Va-+!WajrGs;u38a{fLr`N
zvT@rUu>DljxJ?^&Z?-?vyJn3C>3D=qux{Y*bs5|5n)Qmi$TD^Zdn4GU$ocJS2Hh-<
z`wbt+^+v0nUVdjMos8k`WGl7hA`{03ju%<lrgAHSpd^DRf-*}_#Ly0mB!LSfVgWcQ
z&T$@~G9)JI=hz5m0vkrel+Xy{Oh7pkAu-V!j*W7rY(bO}Q$nMH2`FbGB&N)QaV4<4
zo)~9JXiP9=;}NPl<C@MmXG&;XFlFNrsyfFsonxFSp<}vEgsRSQP3O3#b6nSnP}ON_
zI!#Tdsp~|j>ckUB>FI=~GokB5sOq#dotCE4(sd$KbtW~PNlj-`*NIToiD#j5J#9^=
zt?NXn>YUJYPG~wObe#xQos*i*NloXZt`niEb4t@WrRki~bs|)CI+{*L)9L6s5vn><
zn$DD_Go|Z9sOn5>I@6lYw5}7Os&iV?Ij!lO)^#FOb!If38BJ$K*NIToIiu;E(R9w}
zIuWWmPiZ<&X*y5oIuWWmF_XaEC!a&Jn$B5WCqh-{X-(&8P3LJ{Cqh-{8P3dyPr@^t
zSqL9?X9Uwd3W@23*s~h*tj0X6GZCuHa~kuU#yqDp5vt7d8uPryJg+kms?5hU=3^T3
zF`bD}Wj@ZC(q$g!O!<s|TrlN>8zC{}6`a#@&S^R4^qdGqP7?;2R}8e&tROWvQv=6H
z92zJBq!mFFflLYm6*z851|ybipMj(TdT5{sr8F3*z)AyEpk$x|dT5{s(Hd!>0vkq@
zQ#DWlJv2~+Xc5Q4Km|68LX8|s1}dO3RCU5YMYWs>16818pa`Wal7S+WI$@v!%b74x
z1xf}gpgboTC_<?d1}d<e2?JH2WS|1dnPi{{rA`>Az;Y%GRDqI#3Mglifg+UG69y`<
zoCyO}pk$x|%9&)K2&GOKsK9b23{-)VfeI*Rl7S+WI$@v!%b74x1xf}gpqxnticso=
zfeI{V!ax-$8K{7ACK)I~sS^e&u$&14RiI>`0?L_Wpa`W-7^uK<CJa=8l7R{+XOe*;
zlsaLc0?U~&Pz6c`DxjQ628vMXgn<eyXTm@gC>f}LawZulLa7r5DzKah16818paRO7
zWS|J8P8g`bawZH^fs%m=C})y^B9uB|paRR8Fi-_b1}dPONd}5g>V$y`EN8+%6(|{~
zfN~}oC_<?d1}d<e2?JH2WS|1dnPi{{rA`>Az;Y%GRDqI#3Mglifg+STVW0xbnJ`cV
zN(L&RoJj_XQ0jz%3M^;BKouw%sDN@N87M-j69$S%F;GORfg)556rp0E3KIsZFv&m_
zCK;&0gn=qd7^uP|167!0pb8TPsxV=o3X=>}VUmF=Oc<!bgn=qdGEjv{2C6V&porwv
zg@Gc%72};r28s}uL59SXeG3CcB>NTyib(b?87M;8w`8CQu~c-n0}Ew+yT^a5?$Zy_
zdt<cAw{QRaVw8TR(y9incNq1?S{{zOR-lbb8_#4|ds!>e@gi+Xv?-gJ>B<^b1Nw=Z
z*3LE-SrYqJGV^R@&21zAXyj6pR`TO9mf$NvH`pC2v*OrRf}7jc6r&?FqJgECm2u1w
z@^Z<;#&QiU2AODfGj+<E{&<olqHs5c=QqQX7^@eVDZUQ0Pfb8;@|je}t2EgyI<|Ir
z$rP<eF(BLqk7qm0M$@>n9kzkeQ+b%ZFpwRKC*L`HLCId=*$Zf&n!S)2oxRZBt&(=J
zl!oQLP`ed5L3&q7@ACBSKzjF>^lq5m8xU_{LF+rK_muP=Pwx$+_l`;Lh3Sif>0>8I
zUsTc;dHUi&`r<L^i(&f3!SwMHq+e9hFY@$@1L+r!NxvATFAb(2J3;!AlD@>#mj=?8
zj!9n%)0YR+kDnlYSxH~!>B|G@%g3ZIBYlh>WrOJ*kzPJLFs;CF7wflrS!Rq6dF*Ih
zht&-ZV=JXshq=a3b)sx!bwlGatyhN$$WV2nY-Dvq;|xo{G|r?j%u0r;6J;Z-8yYtm
zy*f-)hN=@~BdZ%42Qzwgn7<5FC(1@vH*{a0(yPOyW~e$*HnO^*`*c>X4l|vh>O`4d
zopbJJJ$rYmSuNmI3tp?(QLOnpt1pSS6J_hl(Tab)QEbY))WYC|H%++p^=$dAcY`;t
z|2q5j>+igE{q4=y-(hXTt*<PHck6^@m5i_LuWiG|sy;l4md?MnExUdDM-=2))~y$7
zhFhsM4YyH!#lQl1jy8)1i@I*r!y<c{kWsf;T*(6N<y%>-HCJjCGhkGRyZ+J@t_KYg
zjhx84^-3-`pQC1o7f10-%55#a7U^5PZT6v?%jK?S%41l)&nMbXT)7yNuQo_1383Zo
z!D1u}nBPC!8$3Z00&5D(?n7r*miPTkHBPclmdF^a3N?(ZKeKqsZMrq{7#XHpD_%}V
z4g$6r7+YU>>E4zRu&u!G1J?aw#r|E-H|}nt$PYFLQ*yzBg}5mF*}H?KxGbAr_7lCX
zb$~Qq2BXgRpB(Bry6(Z|9<{N{u6NO@doT2#8-npW1D9{piUva+gOlK0-=r6d#h7@r
zNEL3dO}gaJw%MK^EpDhTwCDQ9=x(ki+|_2wKBk*T-z`J+qw|8RBl;$=B7>y_y*5~g
zZXVgX_6IN0J&o~?KMW7t*XBOm-53GYd@Gf-Oor74nulg4@zS)FBr$CJ>b1-{44zWG
z*eT`~SUBQoAkjVLtj6dRANb*z%016AKLd82QAZrU5fpE%l!Cfj<1N(?&eF^k@o>q{
z)ZI&X>fkwIVOJ>BXgB=2_y78eH}i4=*3@D_I<mt@OKtpa*V+l*?^+SI5!`&cyMf;q
zY_sq5HUUbA_dXumq5|WvAdiAnZ_|n#mK4I0=wXSA5qayzhUGANKeo5USa7q8y7#sW
z7HsYLG&uHsF$I{h(t8suf<+aU!#`bByra~*b|LKAtms<ozVF%-b}hVSWY^AzUF(Rh
z#qRsAJz>{6jApd_uC2}p>*jBX`NtDWN$V?ldozZ$IDkvWL;Im^m?$?eNx|Q@xceX4
zhw%gk4P*b|UtRF?^gH?BfPN>_UxaDjW0-ia{U>pT{ZTt}A0KKw5@+tebmwV&!x7dd
z%INV)FU9dB)&3}^uNK@Go|d>ja7XY@Lh^W8in$V%E0ZMgB|}n-XFf^Fj%CLT{^`R~
ztX{4+Mpc4N8ZqG-uIs*i-!@L;negK)NZ-8FNsq-0v>nIKcG70dis1Q0(Q|Z$lsLaQ
zx(w~zXBIEJVj?`TR;;eWR~873uRGKhJ8>sY(>kY+;16|Y$)u~;-c2@hIq?w*y5uL#
z+>0W>6*CxS=goPK;VT9lEXadPbkN33bUq{k8xaLZ<R~v#I6}lk!4V?PGGpXB?0>z7
B)Oi2^

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..9b179266ccbf84f1c250ee646812d17e27987764 100644
GIT binary patch
literal 112
zcmWIZ^baXu00LVle`k+i1*eDrX9XZ&1PX!JAex!M0Hgv8m>C3sGzdcgBZCA3T-xBj
Q0Zb)W9Hva*zW_`e0M!8s0RR91

literal 0
HcmV?d00001

-- 
2.33.0


