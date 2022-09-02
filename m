Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707515AB706
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:59:10 +0200 (CEST)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUA0b-0006nf-Eg
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tf-0002vh-Ug
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tc-0003Sq-16
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihZeNS2nCTVlCER4JOGzCgikPrxdcWlAG763nl499m0=;
 b=gON6Ah7H2iZOXltt2vqDO56WIhwTt9SlkIq2+xxudIRDBZb2AiKFMXn1zRa3JqXYmdhwex
 etbzg+O4tRbX8tEeSMTOUONI6fGfq/FqJ1SSGyFaRLC0cXtwK65GBEwP8szBpTlyGOTKWv
 8CVTKqNt7+Y+kMd2EuqvegC5+BjT4eE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-lu9aWFfEOTemXAtPgcspuw-1; Fri, 02 Sep 2022 12:51:49 -0400
X-MC-Unique: lu9aWFfEOTemXAtPgcspuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AA36805B98;
 Fri,  2 Sep 2022 16:51:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1AFD2026D4C;
 Fri,  2 Sep 2022 16:51:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 5/8] tests/acpi: Regenerate all needed tables
Date: Fri,  2 Sep 2022 18:51:23 +0200
Message-Id: <20220902165126.1482-6-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-1-quintela@redhat.com>
References: <20220902165126.1482-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This handles the removal of VGA as a default device.  I include all
the diffs from the tables here.  q35/DSDT.cxl is missing because the
testlog decided that it was a good idea not to generate it.
Diff is huge, but all of it is removal of a device for each table.

--- /tmp/asl-1RMMR1.dsl	2022-08-28 10:18:06.068871627 +0200
+++ /tmp/asl-CKUMR1.dsl	2022-08-28 10:18:06.056871640 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT, Sun Aug 28 10:18:06 2022
+ * Disassembly of /tmp/aml-WKUMR1, Sun Aug 28 10:18:06 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001763 (5987)
+ *     Length           0x00001768 (5992)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x6F
+ *     Checksum         0x65
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -922,52 +922,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1382,32 +1372,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-1LKBR1.dsl	2022-08-28 10:18:07.582869904 +0200
+++ /tmp/asl-DM0AR1.dsl	2022-08-28 10:18:07.572869916 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Sun Aug 28 10:18:07 2022
+ * Disassembly of /tmp/aml-WM0AR1, Sun Aug 28 10:18:07 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002052 (8274)
+ *     Length           0x00002024 (8228)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xD6
+ *     Checksum         0x8B
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3242,42 +3242,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-9GPDR1.dsl	2022-08-28 10:18:10.971866049 +0200
+++ /tmp/asl-DBBFR1.dsl	2022-08-28 10:18:10.934866091 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.tis.tpm2, Sun Aug 28 10:18:10 2022
+ * Disassembly of /tmp/aml-AEBFR1, Sun Aug 28 10:18:10 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000022CA (8906)
+ *     Length           0x0000229C (8860)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xD5
+ *     Checksum         0x8A
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3429,42 +3429,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-X4MFR1.dsl	2022-08-28 10:18:11.916864974 +0200
+++ /tmp/asl-KIKFR1.dsl	2022-08-28 10:18:11.909864982 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.tis.tpm12, Sun Aug 28 10:18:11 2022
+ * Disassembly of /tmp/aml-UHKFR1, Sun Aug 28 10:18:11 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000022B0 (8880)
+ *     Length           0x00002282 (8834)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x2E
+ *     Checksum         0xE3
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3428,42 +3428,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-5LLER1.dsl	2022-08-28 10:18:12.874863884 +0200
+++ /tmp/asl-HWNGR1.dsl	2022-08-28 10:18:12.856863905 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.bridge, Sun Aug 28 10:18:12 2022
+ * Disassembly of /tmp/aml-HVNGR1, Sun Aug 28 10:18:12 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002AEC (10988)
+ *     Length           0x00002AC0 (10944)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xE0
+ *     Checksum         0x21
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3245,51 +3245,32 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S08)
             {
                 Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S10)
-            {
-                Name (_ADR, 0x00020000)  // _ADR: Address
                 Name (BSEL, Zero)
                 Device (S00)
                 {
                     Name (_SUN, Zero)  // _SUN: Slot User Number
                     Name (_ADR, Zero)  // _ADR: Address
                     Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                     {
                         PCEJ (BSEL, _SUN)
                     }

                     Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                     {
                         Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                     }
                 }

@@ -3918,22 +3899,22 @@
                     If ((Arg0 & 0x80000000))
                     {
                         Notify (SF8, Arg1)
                     }
                 }

                 Method (PCNT, 0, NotSerialized)
                 {
                     BNUM = Zero
                     DVNT (PCIU, One)
                     DVNT (PCID, 0x03)
                 }
             }

             Method (PCNT, 0, NotSerialized)
             {
-                ^S10.PCNT ()
+                ^S08.PCNT ()
             }
         }
     }
 }

--- /tmp/asl-LMW6Q1.dsl	2022-08-28 10:18:13.770862865 +0200
+++ /tmp/asl-S3K6Q1.dsl	2022-08-28 10:18:13.764862872 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.multi-bridge, Sun Aug 28 10:18:13 2022
+ * Disassembly of /tmp/aml-Y6K6Q1, Sun Aug 28 10:18:13 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002178 (8568)
+ *     Length           0x0000214C (8524)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x6A
+ *     Checksum         0xC7
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3242,51 +3242,32 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
                 Name (BSEL, One)
                 Device (S00)
                 {
                     Name (_SUN, Zero)  // _SUN: Slot User Number
                     Name (_ADR, Zero)  // _ADR: Address
                     Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                     {
                         PCEJ (BSEL, _SUN)
                     }

                     Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                     {
                         Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))

--- /tmp/asl-ZAC6Q1.dsl	2022-08-28 10:18:14.756861743 +0200
+++ /tmp/asl-IIS8Q1.dsl	2022-08-28 10:18:14.721861783 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.mmio64, Sun Aug 28 10:18:14 2022
+ * Disassembly of /tmp/aml-JHS8Q1, Sun Aug 28 10:18:14 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000024BC (9404)
+ *     Length           0x0000248E (9358)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x84
+ *     Checksum         0x15
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3481,44 +3481,25 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S08)
             {
                 Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S10)
-            {
-                Name (_ADR, 0x00020000)  // _ADR: Address
             }

             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-A267Q1.dsl	2022-08-28 10:18:15.691860680 +0200
+++ /tmp/asl-2X17Q1.dsl	2022-08-28 10:18:15.677860696 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.ipmibt, Sun Aug 28 10:18:15 2022
+ * Disassembly of /tmp/aml-QX17Q1, Sun Aug 28 10:18:15 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000209D (8349)
+ *     Length           0x0000206F (8303)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xFB
+ *     Checksum         0xB0
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3262,42 +3262,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-TJYNR1.dsl	2022-08-28 10:18:16.528859728 +0200
+++ /tmp/asl-0OUNR1.dsl	2022-08-28 10:18:16.497859763 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.cphp, Sun Aug 28 10:18:16 2022
+ * Disassembly of /tmp/aml-VOUNR1, Sun Aug 28 10:18:16 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002222 (8738)
+ *     Length           0x000021F4 (8692)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x3A
+ *     Checksum         0xF0
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3389,42 +3389,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-H3LQR1.dsl	2022-08-28 10:18:17.381858757 +0200
+++ /tmp/asl-GPEQR1.dsl	2022-08-28 10:18:17.372858768 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.memhp, Sun Aug 28 10:18:17 2022
+ * Disassembly of /tmp/aml-7OEQR1, Sun Aug 28 10:18:17 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000025A1 (9633)
+ *     Length           0x00002573 (9587)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xC8
+ *     Checksum         0x7D
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3548,42 +3548,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-FSTJR1.dsl	2022-08-28 10:18:18.195857831 +0200
+++ /tmp/asl-5QKJR1.dsl	2022-08-28 10:18:18.187857840 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.numamem, Sun Aug 28 10:18:18 2022
+ * Disassembly of /tmp/aml-IFKJR1, Sun Aug 28 10:18:18 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002058 (8280)
+ *     Length           0x0000202A (8234)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x80
+ *     Checksum         0x35
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3244,42 +3244,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-202AR1.dsl	2022-08-28 10:18:21.572853990 +0200
+++ /tmp/asl-ILSAR1.dsl	2022-08-28 10:18:21.565853998 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.nohpet, Sun Aug 28 10:18:21 2022
+ * Disassembly of /tmp/aml-3KSAR1, Sun Aug 28 10:18:21 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001FC4 (8132)
+ *     Length           0x00001F96 (8086)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xA0
+ *     Checksum         0x55
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3201,42 +3201,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-KFFPR1.dsl	2022-08-28 10:18:22.457852983 +0200
+++ /tmp/asl-CPCPR1.dsl	2022-08-28 10:18:22.449852992 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.dimmpxm, Sun Aug 28 10:18:22 2022
+ * Disassembly of /tmp/aml-ZOCPR1, Sun Aug 28 10:18:22 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000026C8 (9928)
+ *     Length           0x0000269A (9882)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x24
+ *     Checksum         0xD9
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     External (_SB_.NVDR, UnknownObj)

     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
@@ -3642,42 +3642,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-M0NIR1.dsl	2022-08-28 10:18:23.261852068 +0200
+++ /tmp/asl-ZZ1HR1.dsl	2022-08-28 10:18:23.249852082 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.acpihmat, Sun Aug 28 10:18:23 2022
+ * Disassembly of /tmp/aml-I21HR1, Sun Aug 28 10:18:23 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000257F (9599)
+ *     Length           0x00002551 (9553)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x93
+ *     Checksum         0x48
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3542,42 +3542,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-CUJMR1.dsl	2022-08-28 10:18:24.043851179 +0200
+++ /tmp/asl-LYHMR1.dsl	2022-08-28 10:18:24.036851187 +0200
@@ -1,517 +1,517 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/ERST.acpierst, Sun Aug 28 10:18:24 2022
+ * Disassembly of /tmp/aml-LZHMR1, Sun Aug 28 10:18:24 2022
  *
  * ACPI Data Table [ERST]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
 [004h 0004   4]                 Table Length : 00000390
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 13
+[009h 0009   1]                     Checksum : 83
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]  Serialization Header Length : 00000030
 [028h 0040   4]                     Reserved : 00000000
 [02Ch 0044   4]      Instruction Entry Count : 0000001B

 [030h 0048   1]                       Action : 00 [Begin Write Operation]
 [031h 0049   1]                  Instruction : 03 [Write Register Value]
 [032h 0050   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [033h 0051   1]                     Reserved : 00

 [034h 0052  12]              Register Region : [Generic Address Structure]
 [034h 0052   1]                     Space ID : 00 [SystemMemory]
 [035h 0053   1]                    Bit Width : 20
 [036h 0054   1]                   Bit Offset : 00
 [037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
-[038h 0056   8]                      Address : 00000000FEBF3000
+[038h 0056   8]                      Address : 00000000FEBFE000

 [040h 0064   8]                        Value : 0000000000000000
 [048h 0072   8]                         Mask : 00000000FFFFFFFF

 [050h 0080   1]                       Action : 01 [Begin Read Operation]
 [051h 0081   1]                  Instruction : 03 [Write Register Value]
 [052h 0082   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [053h 0083   1]                     Reserved : 00

 [054h 0084  12]              Register Region : [Generic Address Structure]
 [054h 0084   1]                     Space ID : 00 [SystemMemory]
 [055h 0085   1]                    Bit Width : 20
 [056h 0086   1]                   Bit Offset : 00
 [057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
-[058h 0088   8]                      Address : 00000000FEBF3000
+[058h 0088   8]                      Address : 00000000FEBFE000

 [060h 0096   8]                        Value : 0000000000000001
 [068h 0104   8]                         Mask : 00000000FFFFFFFF

 [070h 0112   1]                       Action : 02 [Begin Clear Operation]
 [071h 0113   1]                  Instruction : 03 [Write Register Value]
 [072h 0114   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [073h 0115   1]                     Reserved : 00

 [074h 0116  12]              Register Region : [Generic Address Structure]
 [074h 0116   1]                     Space ID : 00 [SystemMemory]
 [075h 0117   1]                    Bit Width : 20
 [076h 0118   1]                   Bit Offset : 00
 [077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
-[078h 0120   8]                      Address : 00000000FEBF3000
+[078h 0120   8]                      Address : 00000000FEBFE000

 [080h 0128   8]                        Value : 0000000000000002
 [088h 0136   8]                         Mask : 00000000FFFFFFFF

 [090h 0144   1]                       Action : 03 [End Operation]
 [091h 0145   1]                  Instruction : 03 [Write Register Value]
 [092h 0146   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [093h 0147   1]                     Reserved : 00

 [094h 0148  12]              Register Region : [Generic Address Structure]
 [094h 0148   1]                     Space ID : 00 [SystemMemory]
 [095h 0149   1]                    Bit Width : 20
 [096h 0150   1]                   Bit Offset : 00
 [097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
-[098h 0152   8]                      Address : 00000000FEBF3000
+[098h 0152   8]                      Address : 00000000FEBFE000

 [0A0h 0160   8]                        Value : 0000000000000003
 [0A8h 0168   8]                         Mask : 00000000FFFFFFFF

 [0B0h 0176   1]                       Action : 04 [Set Record Offset]
 [0B1h 0177   1]                  Instruction : 02 [Write Register]
 [0B2h 0178   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [0B3h 0179   1]                     Reserved : 00

 [0B4h 0180  12]              Register Region : [Generic Address Structure]
 [0B4h 0180   1]                     Space ID : 00 [SystemMemory]
 [0B5h 0181   1]                    Bit Width : 20
 [0B6h 0182   1]                   Bit Offset : 00
 [0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
-[0B8h 0184   8]                      Address : 00000000FEBF3008
+[0B8h 0184   8]                      Address : 00000000FEBFE008

 [0C0h 0192   8]                        Value : 0000000000000000
 [0C8h 0200   8]                         Mask : 00000000FFFFFFFF

 [0D0h 0208   1]                       Action : 04 [Set Record Offset]
 [0D1h 0209   1]                  Instruction : 03 [Write Register Value]
 [0D2h 0210   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [0D3h 0211   1]                     Reserved : 00

 [0D4h 0212  12]              Register Region : [Generic Address Structure]
 [0D4h 0212   1]                     Space ID : 00 [SystemMemory]
 [0D5h 0213   1]                    Bit Width : 20
 [0D6h 0214   1]                   Bit Offset : 00
 [0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
-[0D8h 0216   8]                      Address : 00000000FEBF3000
+[0D8h 0216   8]                      Address : 00000000FEBFE000

 [0E0h 0224   8]                        Value : 0000000000000004
 [0E8h 0232   8]                         Mask : 00000000FFFFFFFF

 [0F0h 0240   1]                       Action : 05 [Execute Operation]
 [0F1h 0241   1]                  Instruction : 03 [Write Register Value]
 [0F2h 0242   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [0F3h 0243   1]                     Reserved : 00

 [0F4h 0244  12]              Register Region : [Generic Address Structure]
 [0F4h 0244   1]                     Space ID : 00 [SystemMemory]
 [0F5h 0245   1]                    Bit Width : 20
 [0F6h 0246   1]                   Bit Offset : 00
 [0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
-[0F8h 0248   8]                      Address : 00000000FEBF3008
+[0F8h 0248   8]                      Address : 00000000FEBFE008

 [100h 0256   8]                        Value : 000000000000009C
 [108h 0264   8]                         Mask : 00000000FFFFFFFF

 [110h 0272   1]                       Action : 05 [Execute Operation]
 [111h 0273   1]                  Instruction : 03 [Write Register Value]
 [112h 0274   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [113h 0275   1]                     Reserved : 00

 [114h 0276  12]              Register Region : [Generic Address Structure]
 [114h 0276   1]                     Space ID : 00 [SystemMemory]
 [115h 0277   1]                    Bit Width : 20
 [116h 0278   1]                   Bit Offset : 00
 [117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
-[118h 0280   8]                      Address : 00000000FEBF3000
+[118h 0280   8]                      Address : 00000000FEBFE000

 [120h 0288   8]                        Value : 0000000000000005
 [128h 0296   8]                         Mask : 00000000FFFFFFFF

 [130h 0304   1]                       Action : 06 [Check Busy Status]
 [131h 0305   1]                  Instruction : 03 [Write Register Value]
 [132h 0306   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [133h 0307   1]                     Reserved : 00

 [134h 0308  12]              Register Region : [Generic Address Structure]
 [134h 0308   1]                     Space ID : 00 [SystemMemory]
 [135h 0309   1]                    Bit Width : 20
 [136h 0310   1]                   Bit Offset : 00
 [137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
-[138h 0312   8]                      Address : 00000000FEBF3000
+[138h 0312   8]                      Address : 00000000FEBFE000

 [140h 0320   8]                        Value : 0000000000000006
 [148h 0328   8]                         Mask : 00000000FFFFFFFF

 [150h 0336   1]                       Action : 06 [Check Busy Status]
 [151h 0337   1]                  Instruction : 01 [Read Register Value]
 [152h 0338   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [153h 0339   1]                     Reserved : 00

 [154h 0340  12]              Register Region : [Generic Address Structure]
 [154h 0340   1]                     Space ID : 00 [SystemMemory]
 [155h 0341   1]                    Bit Width : 20
 [156h 0342   1]                   Bit Offset : 00
 [157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
-[158h 0344   8]                      Address : 00000000FEBF3008
+[158h 0344   8]                      Address : 00000000FEBFE008

 [160h 0352   8]                        Value : 0000000000000001
 [168h 0360   8]                         Mask : 00000000FFFFFFFF

 [170h 0368   1]                       Action : 07 [Get Command Status]
 [171h 0369   1]                  Instruction : 03 [Write Register Value]
 [172h 0370   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [173h 0371   1]                     Reserved : 00

 [174h 0372  12]              Register Region : [Generic Address Structure]
 [174h 0372   1]                     Space ID : 00 [SystemMemory]
 [175h 0373   1]                    Bit Width : 20
 [176h 0374   1]                   Bit Offset : 00
 [177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
-[178h 0376   8]                      Address : 00000000FEBF3000
+[178h 0376   8]                      Address : 00000000FEBFE000

 [180h 0384   8]                        Value : 0000000000000007
 [188h 0392   8]                         Mask : 00000000FFFFFFFF

 [190h 0400   1]                       Action : 07 [Get Command Status]
 [191h 0401   1]                  Instruction : 00 [Read Register]
 [192h 0402   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [193h 0403   1]                     Reserved : 00

 [194h 0404  12]              Register Region : [Generic Address Structure]
 [194h 0404   1]                     Space ID : 00 [SystemMemory]
 [195h 0405   1]                    Bit Width : 20
 [196h 0406   1]                   Bit Offset : 00
 [197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
-[198h 0408   8]                      Address : 00000000FEBF3008
+[198h 0408   8]                      Address : 00000000FEBFE008

 [1A0h 0416   8]                        Value : 0000000000000000
 [1A8h 0424   8]                         Mask : 00000000FFFFFFFF

 [1B0h 0432   1]                       Action : 08 [Get Record Identifier]
 [1B1h 0433   1]                  Instruction : 03 [Write Register Value]
 [1B2h 0434   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [1B3h 0435   1]                     Reserved : 00

 [1B4h 0436  12]              Register Region : [Generic Address Structure]
 [1B4h 0436   1]                     Space ID : 00 [SystemMemory]
 [1B5h 0437   1]                    Bit Width : 20
 [1B6h 0438   1]                   Bit Offset : 00
 [1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
-[1B8h 0440   8]                      Address : 00000000FEBF3000
+[1B8h 0440   8]                      Address : 00000000FEBFE000

 [1C0h 0448   8]                        Value : 0000000000000008
 [1C8h 0456   8]                         Mask : 00000000FFFFFFFF

 [1D0h 0464   1]                       Action : 08 [Get Record Identifier]
 [1D1h 0465   1]                  Instruction : 00 [Read Register]
 [1D2h 0466   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [1D3h 0467   1]                     Reserved : 00

 [1D4h 0468  12]              Register Region : [Generic Address Structure]
 [1D4h 0468   1]                     Space ID : 00 [SystemMemory]
 [1D5h 0469   1]                    Bit Width : 40
 [1D6h 0470   1]                   Bit Offset : 00
 [1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
-[1D8h 0472   8]                      Address : 00000000FEBF3008
+[1D8h 0472   8]                      Address : 00000000FEBFE008

 [1E0h 0480   8]                        Value : 0000000000000000
 [1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF

 [1F0h 0496   1]                       Action : 09 [Set Record Identifier]
 [1F1h 0497   1]                  Instruction : 02 [Write Register]
 [1F2h 0498   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [1F3h 0499   1]                     Reserved : 00

 [1F4h 0500  12]              Register Region : [Generic Address Structure]
 [1F4h 0500   1]                     Space ID : 00 [SystemMemory]
 [1F5h 0501   1]                    Bit Width : 40
 [1F6h 0502   1]                   Bit Offset : 00
 [1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
-[1F8h 0504   8]                      Address : 00000000FEBF3008
+[1F8h 0504   8]                      Address : 00000000FEBFE008

 [200h 0512   8]                        Value : 0000000000000000
 [208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF

 [210h 0528   1]                       Action : 09 [Set Record Identifier]
 [211h 0529   1]                  Instruction : 03 [Write Register Value]
 [212h 0530   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [213h 0531   1]                     Reserved : 00

 [214h 0532  12]              Register Region : [Generic Address Structure]
 [214h 0532   1]                     Space ID : 00 [SystemMemory]
 [215h 0533   1]                    Bit Width : 20
 [216h 0534   1]                   Bit Offset : 00
 [217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
-[218h 0536   8]                      Address : 00000000FEBF3000
+[218h 0536   8]                      Address : 00000000FEBFE000

 [220h 0544   8]                        Value : 0000000000000009
 [228h 0552   8]                         Mask : 00000000FFFFFFFF

 [230h 0560   1]                       Action : 0A [Get Record Count]
 [231h 0561   1]                  Instruction : 03 [Write Register Value]
 [232h 0562   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [233h 0563   1]                     Reserved : 00

 [234h 0564  12]              Register Region : [Generic Address Structure]
 [234h 0564   1]                     Space ID : 00 [SystemMemory]
 [235h 0565   1]                    Bit Width : 20
 [236h 0566   1]                   Bit Offset : 00
 [237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
-[238h 0568   8]                      Address : 00000000FEBF3000
+[238h 0568   8]                      Address : 00000000FEBFE000

 [240h 0576   8]                        Value : 000000000000000A
 [248h 0584   8]                         Mask : 00000000FFFFFFFF

 [250h 0592   1]                       Action : 0A [Get Record Count]
 [251h 0593   1]                  Instruction : 00 [Read Register]
 [252h 0594   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [253h 0595   1]                     Reserved : 00

 [254h 0596  12]              Register Region : [Generic Address Structure]
 [254h 0596   1]                     Space ID : 00 [SystemMemory]
 [255h 0597   1]                    Bit Width : 20
 [256h 0598   1]                   Bit Offset : 00
 [257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
-[258h 0600   8]                      Address : 00000000FEBF3008
+[258h 0600   8]                      Address : 00000000FEBFE008

 [260h 0608   8]                        Value : 0000000000000000
 [268h 0616   8]                         Mask : 00000000FFFFFFFF

 [270h 0624   1]                       Action : 0B [Begin Dummy Write]
 [271h 0625   1]                  Instruction : 03 [Write Register Value]
 [272h 0626   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [273h 0627   1]                     Reserved : 00

 [274h 0628  12]              Register Region : [Generic Address Structure]
 [274h 0628   1]                     Space ID : 00 [SystemMemory]
 [275h 0629   1]                    Bit Width : 20
 [276h 0630   1]                   Bit Offset : 00
 [277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
-[278h 0632   8]                      Address : 00000000FEBF3000
+[278h 0632   8]                      Address : 00000000FEBFE000

 [280h 0640   8]                        Value : 000000000000000B
 [288h 0648   8]                         Mask : 00000000FFFFFFFF

 [290h 0656   1]                       Action : 0D [Get Error Address Range]
 [291h 0657   1]                  Instruction : 03 [Write Register Value]
 [292h 0658   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [293h 0659   1]                     Reserved : 00

 [294h 0660  12]              Register Region : [Generic Address Structure]
 [294h 0660   1]                     Space ID : 00 [SystemMemory]
 [295h 0661   1]                    Bit Width : 20
 [296h 0662   1]                   Bit Offset : 00
 [297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
-[298h 0664   8]                      Address : 00000000FEBF3000
+[298h 0664   8]                      Address : 00000000FEBFE000

 [2A0h 0672   8]                        Value : 000000000000000D
 [2A8h 0680   8]                         Mask : 00000000FFFFFFFF

 [2B0h 0688   1]                       Action : 0D [Get Error Address Range]
 [2B1h 0689   1]                  Instruction : 00 [Read Register]
 [2B2h 0690   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [2B3h 0691   1]                     Reserved : 00

 [2B4h 0692  12]              Register Region : [Generic Address Structure]
 [2B4h 0692   1]                     Space ID : 00 [SystemMemory]
 [2B5h 0693   1]                    Bit Width : 40
 [2B6h 0694   1]                   Bit Offset : 00
 [2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
-[2B8h 0696   8]                      Address : 00000000FEBF3008
+[2B8h 0696   8]                      Address : 00000000FEBFE008

 [2C0h 0704   8]                        Value : 0000000000000000
 [2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF

 [2D0h 0720   1]                       Action : 0E [Get Error Address Length]
 [2D1h 0721   1]                  Instruction : 03 [Write Register Value]
 [2D2h 0722   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [2D3h 0723   1]                     Reserved : 00

 [2D4h 0724  12]              Register Region : [Generic Address Structure]
 [2D4h 0724   1]                     Space ID : 00 [SystemMemory]
 [2D5h 0725   1]                    Bit Width : 20
 [2D6h 0726   1]                   Bit Offset : 00
 [2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
-[2D8h 0728   8]                      Address : 00000000FEBF3000
+[2D8h 0728   8]                      Address : 00000000FEBFE000

 [2E0h 0736   8]                        Value : 000000000000000E
 [2E8h 0744   8]                         Mask : 00000000FFFFFFFF

 [2F0h 0752   1]                       Action : 0E [Get Error Address Length]
 [2F1h 0753   1]                  Instruction : 00 [Read Register]
 [2F2h 0754   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [2F3h 0755   1]                     Reserved : 00

 [2F4h 0756  12]              Register Region : [Generic Address Structure]
 [2F4h 0756   1]                     Space ID : 00 [SystemMemory]
 [2F5h 0757   1]                    Bit Width : 40
 [2F6h 0758   1]                   Bit Offset : 00
 [2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
-[2F8h 0760   8]                      Address : 00000000FEBF3008
+[2F8h 0760   8]                      Address : 00000000FEBFE008

 [300h 0768   8]                        Value : 0000000000000000
 [308h 0776   8]                         Mask : FFFFFFFFFFFFFFFF

 [310h 0784   1]                       Action : 0F [Get Error Attributes]
 [311h 0785   1]                  Instruction : 03 [Write Register Value]
 [312h 0786   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [313h 0787   1]                     Reserved : 00

 [314h 0788  12]              Register Region : [Generic Address Structure]
 [314h 0788   1]                     Space ID : 00 [SystemMemory]
 [315h 0789   1]                    Bit Width : 20
 [316h 0790   1]                   Bit Offset : 00
 [317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
-[318h 0792   8]                      Address : 00000000FEBF3000
+[318h 0792   8]                      Address : 00000000FEBFE000

 [320h 0800   8]                        Value : 000000000000000F
 [328h 0808   8]                         Mask : 00000000FFFFFFFF

 [330h 0816   1]                       Action : 0F [Get Error Attributes]
 [331h 0817   1]                  Instruction : 00 [Read Register]
 [332h 0818   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [333h 0819   1]                     Reserved : 00

 [334h 0820  12]              Register Region : [Generic Address Structure]
 [334h 0820   1]                     Space ID : 00 [SystemMemory]
 [335h 0821   1]                    Bit Width : 20
 [336h 0822   1]                   Bit Offset : 00
 [337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
-[338h 0824   8]                      Address : 00000000FEBF3008
+[338h 0824   8]                      Address : 00000000FEBFE008

 [340h 0832   8]                        Value : 0000000000000000
 [348h 0840   8]                         Mask : 00000000FFFFFFFF

 [350h 0848   1]                       Action : 10 [Execute Timings]
 [351h 0849   1]                  Instruction : 03 [Write Register Value]
 [352h 0850   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [353h 0851   1]                     Reserved : 00

 [354h 0852  12]              Register Region : [Generic Address Structure]
 [354h 0852   1]                     Space ID : 00 [SystemMemory]
 [355h 0853   1]                    Bit Width : 20
 [356h 0854   1]                   Bit Offset : 00
 [357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
-[358h 0856   8]                      Address : 00000000FEBF3000
+[358h 0856   8]                      Address : 00000000FEBFE000

 [360h 0864   8]                        Value : 0000000000000010
 [368h 0872   8]                         Mask : 00000000FFFFFFFF

 [370h 0880   1]                       Action : 10 [Execute Timings]
 [371h 0881   1]                  Instruction : 00 [Read Register]
 [372h 0882   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [373h 0883   1]                     Reserved : 00

 [374h 0884  12]              Register Region : [Generic Address Structure]
 [374h 0884   1]                     Space ID : 00 [SystemMemory]
 [375h 0885   1]                    Bit Width : 40
 [376h 0886   1]                   Bit Offset : 00
 [377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
-[378h 0888   8]                      Address : 00000000FEBF3008
+[378h 0888   8]                      Address : 00000000FEBFE008

 [380h 0896   8]                        Value : 0000000000000000
 [388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF

 Raw Table Data: Length 912 (0x390)

-    0000: 45 52 53 54 90 03 00 00 01 13 42 4F 43 48 53 20  // ERST......BOCHS
+    0000: 45 52 53 54 90 03 00 00 01 83 42 4F 43 48 53 20  // ERST......BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 30 00 00 00 00 00 00 00 1B 00 00 00  // ....0...........
-    0030: 00 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0030: 00 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0040: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0050: 01 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0050: 01 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0060: 01 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0070: 02 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0070: 02 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0080: 02 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0090: 03 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0090: 03 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     00A0: 03 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    00B0: 04 02 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    00B0: 04 02 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     00C0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    00D0: 04 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    00D0: 04 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     00E0: 04 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    00F0: 05 03 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    00F0: 05 03 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0100: 9C 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0110: 05 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0110: 05 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0120: 05 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0130: 06 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0130: 06 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0140: 06 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0150: 06 01 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0150: 06 01 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0160: 01 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0170: 07 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0170: 07 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0180: 07 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0190: 07 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0190: 07 00 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     01A0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    01B0: 08 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    01B0: 08 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     01C0: 08 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    01D0: 08 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    01D0: 08 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     01E0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    01F0: 09 02 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    01F0: 09 02 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     0200: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    0210: 09 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0210: 09 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0220: 09 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0230: 0A 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0230: 0A 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0240: 0A 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0250: 0A 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0250: 0A 00 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0260: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0270: 0B 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0270: 0B 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0280: 0B 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0290: 0D 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0290: 0D 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     02A0: 0D 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    02B0: 0D 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    02B0: 0D 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     02C0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    02D0: 0E 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    02D0: 0E 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     02E0: 0E 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    02F0: 0E 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    02F0: 0E 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     0300: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    0310: 0F 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0310: 0F 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0320: 0F 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0330: 0F 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0330: 0F 00 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0340: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0350: 10 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0350: 10 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0360: 10 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0370: 10 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    0370: 10 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     0380: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................

--- /tmp/asl-CRWMR1.dsl	2022-08-28 10:18:24.064851155 +0200
+++ /tmp/asl-Z1SMR1.dsl	2022-08-28 10:18:24.055851165 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.acpierst, Sun Aug 28 10:18:24 2022
+ * Disassembly of /tmp/aml-0XHMR1, Sun Aug 28 10:18:24 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002063 (8291)
+ *     Length           0x00002035 (8245)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x76
+ *     Checksum         0x07
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3245,44 +3245,25 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S08)
             {
                 Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S10)
-            {
-                Name (_ADR, 0x00020000)  // _ADR: Address
             }

             Method (PCNT, 0, NotSerialized)
             {
             }z
         }
     }
 }

--- /tmp/asl-P6EGR1.dsl	2022-08-28 10:18:24.823850292 +0200
+++ /tmp/asl-1IAGR1.dsl	2022-08-28 10:18:24.817850298 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.applesmc, Sun Aug 28 10:18:24 2022
+ * Disassembly of /tmp/aml-AIAGR1, Sun Aug 28 10:18:24 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002080 (8320)
+ *     Length           0x00002052 (8274)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xC7
+ *     Checksum         0x7C
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3259,42 +3259,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-JKF9Q1.dsl	2022-08-28 10:18:25.612849394 +0200
+++ /tmp/asl-1XDBR1.dsl	2022-08-28 10:18:25.605849402 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.pvpanic-isa, Sun Aug 28 10:18:25 2022
+ * Disassembly of /tmp/aml-HWDBR1, Sun Aug 28 10:18:25 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000020B7 (8375)
+ *     Length           0x00002089 (8329)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x85
+ *     Checksum         0x3A
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3273,42 +3273,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-A47OR1.dsl	2022-08-28 10:18:26.441848451 +0200
+++ /tmp/asl-SZ5OR1.dsl	2022-08-28 10:18:26.439848453 +0200
@@ -1,132 +1,121 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/IVRS.ivrs, Sun Aug 28 10:18:26 2022
+ * Disassembly of /tmp/aml-ZY5OR1, Sun Aug 28 10:18:26 2022
  *
  * ACPI Data Table [IVRS]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000   4]                    Signature : "IVRS"    [I/O Virtualization Reporting Structure]
-[004h 0004   4]                 Table Length : 00000068
+[004h 0004   4]                 Table Length : 00000064
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 43
+[009h 0009   1]                     Checksum : 65
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]          Virtualization Info : 00002800
 [028h 0040   8]                     Reserved : 0000000000000000

 [030h 0048   1]                Subtable Type : 10 [Hardware Definition Block (IVHD)]
 [031h 0049   1]        Flags (decoded below) : D1
                                      HtTunEn : 1
                                       PassPW : 0
                                    ResPassPW : 0
                                 Isoc Control : 0
                                Iotlb Support : 1
                                     Coherent : 0
                             Prefetch Support : 1
                                  PPR Support : 1
-[032h 0050   2]                       Length : 0038
-[034h 0052   2]                     DeviceId : 0010
+[032h 0050   2]                       Length : 0034
+[034h 0052   2]                     DeviceId : 0008
 [036h 0054   2]            Capability Offset : 0040
 [038h 0056   8]                 Base Address : 00000000FED80000
 [040h 0064   2]            PCI Segment Group : 0000
 [042h 0066   2]          Virtualization Info : 0000
 [044h 0068   4]            Feature Reporting : 00000044

 [048h 0072   1]                Subtable Type : 02 [Device Entry: Select One Device]
 [049h 0073   2]                    Device ID : 0000
 [04Bh 0075   1] Data Setting (decoded below) : 00
                                     INITPass : 0
                                     EIntPass : 0
                                      NMIPass : 0
                                     Reserved : 0
                                  System MGMT : 0
                                   LINT0 Pass : 0
                                   LINT1 Pass : 0

 [04Ch 0076   1]                Subtable Type : 02 [Device Entry: Select One Device]
 [04Dh 0077   2]                    Device ID : 0008
 [04Fh 0079   1] Data Setting (decoded below) : 00
                                     INITPass : 0
                                     EIntPass : 0
                                      NMIPass : 0
                                     Reserved : 0
                                  System MGMT : 0
                                   LINT0 Pass : 0
                                   LINT1 Pass : 0

 [050h 0080   1]                Subtable Type : 02 [Device Entry: Select One Device]
-[051h 0081   2]                    Device ID : 0010
+[051h 0081   2]                    Device ID : 00F8
 [053h 0083   1] Data Setting (decoded below) : 00
                                     INITPass : 0
                                     EIntPass : 0
                                      NMIPass : 0
                                     Reserved : 0
                                  System MGMT : 0
                                   LINT0 Pass : 0
                                   LINT1 Pass : 0

 [054h 0084   1]                Subtable Type : 02 [Device Entry: Select One Device]
-[055h 0085   2]                    Device ID : 00F8
+[055h 0085   2]                    Device ID : 00FA
 [057h 0087   1] Data Setting (decoded below) : 00
                                     INITPass : 0
                                     EIntPass : 0
                                      NMIPass : 0
                                     Reserved : 0
                                  System MGMT : 0
                                   LINT0 Pass : 0
                                   LINT1 Pass : 0

 [058h 0088   1]                Subtable Type : 02 [Device Entry: Select One Device]
-[059h 0089   2]                    Device ID : 00FA
+[059h 0089   2]                    Device ID : 00FB
 [05Bh 0091   1] Data Setting (decoded below) : 00
                                     INITPass : 0
                                     EIntPass : 0
                                      NMIPass : 0
                                     Reserved : 0
                                  System MGMT : 0
                                   LINT0 Pass : 0
                                   LINT1 Pass : 0

-[05Ch 0092   1]                Subtable Type : 02 [Device Entry: Select One Device]
-[05Dh 0093   2]                    Device ID : 00FB
+[05Ch 0092   1]                Subtable Type : 48 [Device Entry: Special Device]
+[05Dh 0093   2]                    Device ID : 0000
 [05Fh 0095   1] Data Setting (decoded below) : 00
                                     INITPass : 0
                                     EIntPass : 0
                                      NMIPass : 0
                                     Reserved : 0
                                  System MGMT : 0
                                   LINT0 Pass : 0
                                   LINT1 Pass : 0
+[060h 0096   1]                       Handle : 00
+[061h 0097   2]        Source Used Device ID : 00A0
+[063h 0099   1]                      Variety : 01

-[060h 0096   1]                Subtable Type : 48 [Device Entry: Special Device]
-[061h 0097   2]                    Device ID : 0000
-[063h 0099   1] Data Setting (decoded below) : 00
-                                    INITPass : 0
-                                    EIntPass : 0
-                                     NMIPass : 0
-                                    Reserved : 0
-                                 System MGMT : 0
-                                  LINT0 Pass : 0
-                                  LINT1 Pass : 0
-[064h 0100   1]                       Handle : 00
-[065h 0101   2]        Source Used Device ID : 00A0
-[067h 0103   1]                      Variety : 01
-
-Raw Table Data: Length 104 (0x68)
+Raw Table Data: Length 100 (0x64)

-    0000: 49 56 52 53 68 00 00 00 01 43 42 4F 43 48 53 20  // IVRSh....CBOCHS
+    0000: 49 56 52 53 64 00 00 00 01 65 42 4F 43 48 53 20  // IVRSd....eBOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 00 28 00 00 00 00 00 00 00 00 00 00  // .....(..........
-    0030: 10 D1 38 00 10 00 40 00 00 00 D8 FE 00 00 00 00  // ..8...@.........
+    0030: 10 D1 34 00 08 00 40 00 00 00 D8 FE 00 00 00 00  // ..4...@.........
     0040: 00 00 00 00 44 00 00 00 02 00 00 00 02 08 00 00  // ....D...........
-    0050: 02 10 00 00 02 F8 00 00 02 FA 00 00 02 FB 00 00  // ................
-    0060: 48 00 00 00 00 A0 00 01                          // H.......
+    0050: 02 F8 00 00 02 FA 00 00 02 FB 00 00 48 00 00 00  // ............H...
+    0060: 00 A0 00 01                                      // ....
--- /tmp/asl-O4HPR1.dsl	2022-08-28 10:18:26.461848428 +0200
+++ /tmp/asl-2LMPR1.dsl	2022-08-28 10:18:26.453848437 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.ivrs, Sun Aug 28 10:18:26 2022
+ * Disassembly of /tmp/aml-3Z5OR1, Sun Aug 28 10:18:26 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002063 (8291)
+ *     Length           0x00002035 (8245)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x76
+ *     Checksum         0x07
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3245,44 +3245,25 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S08)
             {
                 Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S10)
-            {
-                Name (_ADR, 0x00020000)  // _ADR: Address
             }

             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-N3YPR1.dsl	2022-08-28 10:18:27.329847441 +0200
+++ /tmp/asl-XTDSR1.dsl	2022-08-28 10:18:27.327847443 +0200
@@ -1,67 +1,67 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/VIOT.viot, Sun Aug 28 10:18:27 2022
+ * Disassembly of /tmp/aml-JWDSR1, Sun Aug 28 10:18:27 2022
  *
  * ACPI Data Table [VIOT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
 [004h 0004   4]                 Table Length : 00000070
 [008h 0008   1]                     Revision : 00
-[009h 0009   1]                     Checksum : 3D
+[009h 0009   1]                     Checksum : 45
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
-[036h 0054   2]               PCI BDF number : 0010
+[036h 0054   2]               PCI BDF number : 0008
 [038h 0056   8]                     Reserved : 0000000000000000

 [040h 0064   1]                         Type : 01 [PCI Range]
 [041h 0065   1]                     Reserved : 00
 [042h 0066   2]                       Length : 0018

 [044h 0068   4]               Endpoint start : 00001000
 [048h 0072   2]            PCI Segment start : 0000
 [04Ah 0074   2]              PCI Segment end : 0000
 [04Ch 0076   2]                PCI BDF start : 1000
 [04Eh 0078   2]                  PCI BDF end : 10FF
 [050h 0080   2]                  Output node : 0030
 [052h 0082   6]                     Reserved : 000000000000

 [058h 0088   1]                         Type : 01 [PCI Range]
 [059h 0089   1]                     Reserved : 00
 [05Ah 0090   2]                       Length : 0018

 [05Ch 0092   4]               Endpoint start : 00003000
 [060h 0096   2]            PCI Segment start : 0000
 [062h 0098   2]              PCI Segment end : 0000
 [064h 0100   2]                PCI BDF start : 3000
 [066h 0102   2]                  PCI BDF end : 30FF
 [068h 0104   2]                  Output node : 0030
 [06Ah 0106   6]                     Reserved : 000000000000

 Raw Table Data: Length 112 (0x70)

-    0000: 56 49 4F 54 70 00 00 00 00 3D 42 4F 43 48 53 20  // VIOTp....=BOCHS
+    0000: 56 49 4F 54 70 00 00 00 00 45 42 4F 43 48 53 20  // VIOTp....EBOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 03 00 30 00 00 00 00 00 00 00 00 00  // ......0.........
-    0030: 03 00 10 00 00 00 10 00 00 00 00 00 00 00 00 00  // ................
+    0030: 03 00 10 00 00 00 08 00 00 00 00 00 00 00 00 00  // ................
     0040: 01 00 18 00 00 10 00 00 00 00 00 00 00 10 FF 10  // ................
     0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 30 00 00  // 0............0..
     0060: 00 00 00 00 00 30 FF 30 30 00 00 00 00 00 00 00  // .....0.00.......
--- /tmp/asl-RNCQR1.dsl	2022-08-28 10:18:27.354847412 +0200
+++ /tmp/asl-WFUPR1.dsl	2022-08-28 10:18:27.344847424 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.viot, Sun Aug 28 10:18:27 2022
+ * Disassembly of /tmp/aml-8TDSR1, Sun Aug 28 10:18:27 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000024A7 (9383)
+ *     Length           0x0000247B (9339)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x83
+ *     Checksum         0xD7
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3578,59 +3578,40 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S08)
             {
                 Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
             }

             Device (S18)
             {
                 Name (_ADR, 0x00030000)  // _ADR: Address
             }

             Device (S20)
             {
                 Name (_ADR, 0x00040000)  // _ADR: Address
             }

-            Device (S28)
-            {
-                Name (_ADR, 0x00050000)  // _ADR: Address
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-V1YPR1.dsl	2022-08-28 10:18:30.333844023 +0200
+++ /tmp/asl-Z57RR1.dsl	2022-08-28 10:18:30.326844031 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.ipmismbus, Sun Aug 28 10:18:30 2022
+ * Disassembly of /tmp/aml-OU7RR1, Sun Aug 28 10:18:30 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000020AB (8363)
+ *     Length           0x0000207D (8317)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x55
+ *     Checksum         0x0A
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3257,42 +3257,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-4JVHR1.dsl	2022-08-28 10:18:31.241842990 +0200
+++ /tmp/asl-7GIJR1.dsl	2022-08-28 10:18:31.211843025 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.xapic, Sun Aug 28 10:18:31 2022
+ * Disassembly of /tmp/aml-3FIJR1, Sun Aug 28 10:18:31 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00008B35 (35637)
+ *     Length           0x00008B07 (35591)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x8C
+ *     Checksum         0x41
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -11666,42 +11666,23 @@
                     0x01,               // Alignment
                     0x0C,               // Length
                     )
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

-            Device (S08)
-            {
-                Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

--- /tmp/asl-IMCJR1.dsl	2022-08-28 10:18:32.151841955 +0200
+++ /tmp/asl-BFSIR1.dsl	2022-08-28 10:18:32.148841959 +0200
@@ -1,105 +1,95 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/DMAR.dmar, Sun Aug 28 10:18:32 2022
+ * Disassembly of /tmp/aml-GGSIR1, Sun Aug 28 10:18:32 2022
  *
  * ACPI Data Table [DMAR]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000   4]                    Signature : "DMAR"    [DMA Remapping Table]
-[004h 0004   4]                 Table Length : 00000078
+[004h 0004   4]                 Table Length : 00000070
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 15
+[009h 0009   1]                     Checksum : 2F
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   1]           Host Address Width : 26
 [025h 0037   1]                        Flags : 01
 [026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

 [030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
-[032h 0050   2]                       Length : 0040
+[032h 0050   2]                       Length : 0038

 [034h 0052   1]                        Flags : 00
 [035h 0053   1]                     Reserved : 00
 [036h 0054   2]           PCI Segment Number : 0000
 [038h 0056   8]        Register Base Address : 00000000FED90000

 [040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
 [041h 0065   1]                 Entry Length : 08
 [042h 0066   2]                     Reserved : 0000
 [044h 0068   1]               Enumeration ID : 00
 [045h 0069   1]               PCI Bus Number : FF

 [046h 0070   2]                     PCI Path : 00,00

 [048h 0072   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [049h 0073   1]                 Entry Length : 08
 [04Ah 0074   2]                     Reserved : 0000
 [04Ch 0076   1]               Enumeration ID : 00
 [04Dh 0077   1]               PCI Bus Number : 00

 [04Eh 0078   2]                     PCI Path : 00,00

 [050h 0080   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [051h 0081   1]                 Entry Length : 08
 [052h 0082   2]                     Reserved : 0000
 [054h 0084   1]               Enumeration ID : 00
 [055h 0085   1]               PCI Bus Number : 00

-[056h 0086   2]                     PCI Path : 01,00
+[056h 0086   2]                     PCI Path : 1F,00

 [058h 0088   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [059h 0089   1]                 Entry Length : 08
 [05Ah 0090   2]                     Reserved : 0000
 [05Ch 0092   1]               Enumeration ID : 00
 [05Dh 0093   1]               PCI Bus Number : 00

-[05Eh 0094   2]                     PCI Path : 1F,00
+[05Eh 0094   2]                     PCI Path : 1F,02

 [060h 0096   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [061h 0097   1]                 Entry Length : 08
 [062h 0098   2]                     Reserved : 0000
 [064h 0100   1]               Enumeration ID : 00
 [065h 0101   1]               PCI Bus Number : 00

-[066h 0102   2]                     PCI Path : 1F,02
+[066h 0102   2]                     PCI Path : 1F,03

-[068h 0104   1]            Device Scope Type : 01 [PCI Endpoint Device]
-[069h 0105   1]                 Entry Length : 08
-[06Ah 0106   2]                     Reserved : 0000
-[06Ch 0108   1]               Enumeration ID : 00
-[06Dh 0109   1]               PCI Bus Number : 00
+[068h 0104   2]                Subtable Type : 0002 [Root Port ATS Capability]
+[06Ah 0106   2]                       Length : 0008

-[06Eh 0110   2]                     PCI Path : 1F,03
+[06Ch 0108   1]                        Flags : 01
+[06Dh 0109   1]                     Reserved : 00
+[06Eh 0110   2]           PCI Segment Number : 0000

+Raw Table Data: Length 112 (0x70)

-[070h 0112   2]                Subtable Type : 0002 [Root Port ATS Capability]
-[072h 0114   2]                       Length : 0008
-
-[074h 0116   1]                        Flags : 01
-[075h 0117   1]                     Reserved : 00
-[076h 0118   2]           PCI Segment Number : 0000
-
-Raw Table Data: Length 120 (0x78)
-
-    0000: 44 4D 41 52 78 00 00 00 01 15 42 4F 43 48 53 20  // DMARx.....BOCHS
+    0000: 44 4D 41 52 70 00 00 00 01 2F 42 4F 43 48 53 20  // DMARp..../BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 26 01 00 00 00 00 00 00 00 00 00 00  // ....&...........
-    0030: 00 00 40 00 00 00 00 00 00 00 D9 FE 00 00 00 00  // ..@.............
+    0030: 00 00 38 00 00 00 00 00 00 00 D9 FE 00 00 00 00  // ..8.............
     0040: 03 08 00 00 00 FF 00 00 01 08 00 00 00 00 00 00  // ................
-    0050: 01 08 00 00 00 00 01 00 01 08 00 00 00 00 1F 00  // ................
-    0060: 01 08 00 00 00 00 1F 02 01 08 00 00 00 00 1F 03  // ................
-    0070: 02 00 08 00 01 00 00 00                          // ........
+    0050: 01 08 00 00 00 00 1F 00 01 08 00 00 00 00 1F 02  // ................
+    0060: 01 08 00 00 00 00 1F 03 02 00 08 00 01 00 00 00  // ................
--- /tmp/asl-6W1BR1.dsl	2022-08-28 10:18:32.995840995 +0200
+++ /tmp/asl-9TYDR1.dsl	2022-08-28 10:18:32.986841006 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.bridge, Sun Aug 28 10:18:32 2022
+ * Disassembly of /tmp/aml-0SYDR1, Sun Aug 28 10:18:32 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000021CD (8653)
+ *     Length           0x000021D2 (8658)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x5D
+ *     Checksum         0x4F
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -929,57 +929,32 @@
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
                 Name (ASUN, 0x02)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }

-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S18)
-            {
-                Name (_ADR, 0x00030000)  // _ADR: Address
-                Name (ASUN, 0x03)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
                 Name (BSEL, One)
                 Device (S00)
                 {
                     Name (_SUN, Zero)  // _SUN: Slot User Number
                     Name (_ADR, Zero)  // _ADR: Address
                     Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                     {
                         PCEJ (BSEL, _SUN)
                     }

                     Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                     {
                         Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                     }
                 }

@@ -1606,32 +1581,47 @@
                     }

                     If ((Arg0 & 0x80000000))
                     {
                         Notify (SF8, Arg1)
                     }
                 }

                 Method (PCNT, 0, NotSerialized)
                 {
                     BNUM = One
                     DVNT (PCIU, One)
                     DVNT (PCID, 0x03)
                 }
             }

+            Device (S18)
+            {
+                Name (_SUN, 0x03)  // _SUN: Slot User Number
+                Name (_ADR, 0x00030000)  // _ADR: Address
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    PCEJ (BSEL, _SUN)
+                }
+
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                {
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                }
+            }
+
             Device (S20)
             {
                 Name (_SUN, 0x04)  // _SUN: Slot User Number
                 Name (_ADR, 0x00040000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S28)
@@ -2028,32 +2018,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x08))
+                {
+                    Notify (S18, Arg1)
+                }
+
                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))
                 {
                     Notify (S30, Arg1)
                 }

                 If ((Arg0 & 0x80))
@@ -2174,22 +2169,22 @@
                 If ((Arg0 & 0x40000000))
                 {
                     Notify (SF0, Arg1)
                 }

                 If ((Arg0 & 0x80000000))
                 {
                     Notify (SF8, Arg1)
                 }
             }

             Method (PCNT, 0, NotSerialized)
             {
                 BNUM = Zero
                 DVNT (PCIU, One)
                 DVNT (PCID, 0x03)
-                ^S18.PCNT ()
+                ^S10.PCNT ()
             }
         }
     }
 }

--- /tmp/asl-MO6FR1.dsl	2022-08-28 10:18:33.792840089 +0200
+++ /tmp/asl-R186Q1.dsl	2022-08-28 10:18:33.787840094 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.ipmikcs, Sun Aug 28 10:18:33 2022
+ * Disassembly of /tmp/aml-YP86Q1, Sun Aug 28 10:18:33 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000017AB (6059)
+ *     Length           0x000017B0 (6064)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xF7
+ *     Checksum         0xED
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -940,52 +940,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1400,32 +1390,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-8HE9Q1.dsl	2022-08-28 10:18:34.627839139 +0200
+++ /tmp/asl-HLA9Q1.dsl	2022-08-28 10:18:34.620839147 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.cphp, Sun Aug 28 10:18:34 2022
+ * Disassembly of /tmp/aml-LNA9Q1, Sun Aug 28 10:18:34 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001933 (6451)
+ *     Length           0x00001938 (6456)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xD3
+ *     Checksum         0xC9
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -1069,52 +1069,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1529,32 +1519,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-G6YOR1.dsl	2022-08-28 10:18:35.419838238 +0200
+++ /tmp/asl-YZWOR1.dsl	2022-08-28 10:18:35.413838245 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.memhp, Sun Aug 28 10:18:35 2022
+ * Disassembly of /tmp/aml-NYWOR1, Sun Aug 28 10:18:35 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001CB2 (7346)
+ *     Length           0x00001CB7 (7351)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x61
+ *     Checksum         0x57
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -1228,52 +1228,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1688,32 +1678,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))
--- /tmp/asl-U0BJR1.dsl	2022-08-28 10:18:36.154837402 +0200
+++ /tmp/asl-SRTIR1.dsl	2022-08-28 10:18:36.147837410 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.numamem, Sun Aug 28 10:18:36 2022
+ * Disassembly of /tmp/aml-0TTIR1, Sun Aug 28 10:18:36 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001769 (5993)
+ *     Length           0x0000176E (5998)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x19
+ *     Checksum         0x0F
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -924,52 +924,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1384,32 +1374,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-EKGMR1.dsl	2022-08-28 10:18:39.036834123 +0200
+++ /tmp/asl-YWXLR1.dsl	2022-08-28 10:18:39.031834129 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.nohpet, Sun Aug 28 10:18:39 2022
+ * Disassembly of /tmp/aml-IVXLR1, Sun Aug 28 10:18:39 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000016D5 (5845)
+ *     Length           0x000016DA (5850)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x39
+ *     Checksum         0x2F
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -881,52 +881,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1341,32 +1331,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-FEJGR1.dsl	2022-08-28 10:18:39.811833242 +0200
+++ /tmp/asl-QJ1FR1.dsl	2022-08-28 10:18:39.804833250 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.dimmpxm, Sun Aug 28 10:18:39 2022
+ * Disassembly of /tmp/aml-2MZFR1, Sun Aug 28 10:18:39 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001DD9 (7641)
+ *     Length           0x00001DDE (7646)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xBD
+ *     Checksum         0xB3
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     External (_SB_.NVDR, UnknownObj)

     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
@@ -1322,52 +1322,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1782,32 +1772,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-8348Q1.dsl	2022-08-28 10:18:40.597832348 +0200
+++ /tmp/asl-56IBR1.dsl	2022-08-28 10:18:40.592832353 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.acpihmat, Sun Aug 28 10:18:40 2022
+ * Disassembly of /tmp/aml-2TIBR1, Sun Aug 28 10:18:40 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001C90 (7312)
+ *     Length           0x00001C95 (7317)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x2C
+ *     Checksum         0x22
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -1222,52 +1222,42 @@
     {
         Scope (PCI0)
         {
             Name (BSEL, Zero)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (ASUN, 0x02)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
-                }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
-                    Return (Zero)
+                    PCEJ (BSEL, _SUN)
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (Zero)
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S18)
             {
                 Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1682,32 +1672,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x04))
+                {
+                    Notify (S10, Arg1)
+                }
+
                 If ((Arg0 & 0x08))
                 {
                     Notify (S18, Arg1)
                 }

                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))

--- /tmp/asl-ZUPPR1.dsl	2022-08-28 10:18:41.453831374 +0200
+++ /tmp/asl-62LPR1.dsl	2022-08-28 10:18:41.448831379 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.acpierst, Sun Aug 28 10:18:41 2022
+ * Disassembly of /tmp/aml-U5POR1, Sun Aug 28 10:18:41 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001742 (5954)
+ *     Length           0x00001747 (5959)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x66
+ *     Checksum         0x5F
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -928,56 +928,46 @@
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
                 Name (ASUN, 0x02)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
             }

             Device (S18)
             {
+                Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
-                Name (ASUN, 0x03)
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    PCEJ (BSEL, _SUN)
+                }
+
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S20)
             {
                 Name (_SUN, 0x04)  // _SUN: Slot User Number
                 Name (_ADR, 0x00040000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1377,32 +1367,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x08))
+                {
+                    Notify (S18, Arg1)
+                }
+
                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))
                 {
                     Notify (S30, Arg1)
                 }

                 If ((Arg0 & 0x80))

--- /tmp/asl-DXBQR1.dsl	2022-08-28 10:18:42.350830353 +0200
+++ /tmp/asl-WL3PR1.dsl	2022-08-28 10:18:42.343830361 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.roothp, Sun Aug 28 10:18:42 2022
+ * Disassembly of /tmp/aml-1M3PR1, Sun Aug 28 10:18:42 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001833 (6195)
+ *     Length           0x00001807 (6151)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x1A
+ *     Checksum         0x73
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -917,51 +917,32 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S18)
-            {
-                Name (_ADR, 0x00030000)  // _ADR: Address
                 Name (BSEL, Zero)
                 Device (S00)
                 {
                     Name (_SUN, Zero)  // _SUN: Slot User Number
                     Name (_ADR, Zero)  // _ADR: Address
                     Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                     {
                         PCEJ (BSEL, _SUN)
                     }

                     Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                     {
                         Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                     }
                 }

@@ -1590,22 +1571,22 @@
                     If ((Arg0 & 0x80000000))
                     {
                         Notify (SF8, Arg1)
                     }
                 }

                 Method (PCNT, 0, NotSerialized)
                 {
                     BNUM = Zero
                     DVNT (PCIU, One)
                     DVNT (PCID, 0x03)
                 }
             }

             Method (PCNT, 0, NotSerialized)
             {
-                ^S18.PCNT ()
+                ^S10.PCNT ()
             }
         }
     }
 }

--- /tmp/asl-HPDHR1.dsl	2022-08-28 10:18:43.229829353 +0200
+++ /tmp/asl-5OLHR1.dsl	2022-08-28 10:18:43.205829381 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.hpbridge, Sun Aug 28 10:18:43 2022
+ * Disassembly of /tmp/aml-UWMHR1, Sun Aug 28 10:18:43 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001742 (5954)
+ *     Length           0x00001747 (5959)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x66
+ *     Checksum         0x5F
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -928,56 +928,46 @@
                 Name (_ADR, Zero)  // _ADR: Address
                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
                 Name (ASUN, 0x02)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
-
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
             }

             Device (S18)
             {
+                Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
-                Name (ASUN, 0x03)
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    PCEJ (BSEL, _SUN)
+                }
+
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Device (S20)
             {
                 Name (_SUN, 0x04)  // _SUN: Slot User Number
                 Name (_ADR, 0x00040000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
@@ -1377,32 +1367,37 @@
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
+                If ((Arg0 & 0x08))
+                {
+                    Notify (S18, Arg1)
+                }
+
                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))
                 {
                     Notify (S30, Arg1)
                 }

                 If ((Arg0 & 0x80))

--- /tmp/asl-U4ZLR1.dsl	2022-08-28 10:18:44.032828440 +0200
+++ /tmp/asl-BFWLR1.dsl	2022-08-28 10:18:44.028828445 +0200
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.hpbrroot, Sun Aug 28 10:18:44 2022
+ * Disassembly of /tmp/aml-WEWLR1, Sun Aug 28 10:18:44 2022
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00000BFD (3069)
+ *     Length           0x00000BCF (3023)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x02
+ *     Checksum         0x9C
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -816,40 +816,21 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
-                {
-                    Return (Zero)
-                }
-
-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
-                {
-                    Return (Zero)
-                }
-            }
-
-            Device (S18)
-            {
-                Name (_ADR, 0x00030000)  // _ADR: Address
             }
         }
     }
 }

--- /tmp/asl-SR9OR1.dsl	2022-08-28 10:18:41.435831394 +0200
+++ /tmp/asl-M4POR1.dsl	2022-08-28 10:18:41.424831407 +0200
@@ -1,517 +1,517 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20220331 (64-bit version)
  * Copyright (c) 2000 - 2022 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/ERST.acpierst, Sun Aug 28 10:18:41 2022
+ * Disassembly of /tmp/aml-V5POR1, Sun Aug 28 10:18:41 2022
  *
  * ACPI Data Table [ERST]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
 [004h 0004   4]                 Table Length : 00000390
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 13
+[009h 0009   1]                     Checksum : 83
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]  Serialization Header Length : 00000030
 [028h 0040   4]                     Reserved : 00000000
 [02Ch 0044   4]      Instruction Entry Count : 0000001B

 [030h 0048   1]                       Action : 00 [Begin Write Operation]
 [031h 0049   1]                  Instruction : 03 [Write Register Value]
 [032h 0050   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [033h 0051   1]                     Reserved : 00

 [034h 0052  12]              Register Region : [Generic Address Structure]
 [034h 0052   1]                     Space ID : 00 [SystemMemory]
 [035h 0053   1]                    Bit Width : 20
 [036h 0054   1]                   Bit Offset : 00
 [037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
-[038h 0056   8]                      Address : 00000000FEBF3000
+[038h 0056   8]                      Address : 00000000FEBFE000

 [040h 0064   8]                        Value : 0000000000000000
 [048h 0072   8]                         Mask : 00000000FFFFFFFF

 [050h 0080   1]                       Action : 01 [Begin Read Operation]
 [051h 0081   1]                  Instruction : 03 [Write Register Value]
 [052h 0082   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [053h 0083   1]                     Reserved : 00

 [054h 0084  12]              Register Region : [Generic Address Structure]
 [054h 0084   1]                     Space ID : 00 [SystemMemory]
 [055h 0085   1]                    Bit Width : 20
 [056h 0086   1]                   Bit Offset : 00
 [057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
-[058h 0088   8]                      Address : 00000000FEBF3000
+[058h 0088   8]                      Address : 00000000FEBFE000

 [060h 0096   8]                        Value : 0000000000000001
 [068h 0104   8]                         Mask : 00000000FFFFFFFF

 [070h 0112   1]                       Action : 02 [Begin Clear Operation]
 [071h 0113   1]                  Instruction : 03 [Write Register Value]
 [072h 0114   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [073h 0115   1]                     Reserved : 00

 [074h 0116  12]              Register Region : [Generic Address Structure]
 [074h 0116   1]                     Space ID : 00 [SystemMemory]
 [075h 0117   1]                    Bit Width : 20
 [076h 0118   1]                   Bit Offset : 00
 [077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
-[078h 0120   8]                      Address : 00000000FEBF3000
+[078h 0120   8]                      Address : 00000000FEBFE000

 [080h 0128   8]                        Value : 0000000000000002
 [088h 0136   8]                         Mask : 00000000FFFFFFFF

 [090h 0144   1]                       Action : 03 [End Operation]
 [091h 0145   1]                  Instruction : 03 [Write Register Value]
 [092h 0146   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [093h 0147   1]                     Reserved : 00

 [094h 0148  12]              Register Region : [Generic Address Structure]
 [094h 0148   1]                     Space ID : 00 [SystemMemory]
 [095h 0149   1]                    Bit Width : 20
 [096h 0150   1]                   Bit Offset : 00
 [097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
-[098h 0152   8]                      Address : 00000000FEBF3000
+[098h 0152   8]                      Address : 00000000FEBFE000

 [0A0h 0160   8]                        Value : 0000000000000003
 [0A8h 0168   8]                         Mask : 00000000FFFFFFFF

 [0B0h 0176   1]                       Action : 04 [Set Record Offset]
 [0B1h 0177   1]                  Instruction : 02 [Write Register]
 [0B2h 0178   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [0B3h 0179   1]                     Reserved : 00

 [0B4h 0180  12]              Register Region : [Generic Address Structure]
 [0B4h 0180   1]                     Space ID : 00 [SystemMemory]
 [0B5h 0181   1]                    Bit Width : 20
 [0B6h 0182   1]                   Bit Offset : 00
 [0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
-[0B8h 0184   8]                      Address : 00000000FEBF3008
+[0B8h 0184   8]                      Address : 00000000FEBFE008

 [0C0h 0192   8]                        Value : 0000000000000000
 [0C8h 0200   8]                         Mask : 00000000FFFFFFFF

 [0D0h 0208   1]                       Action : 04 [Set Record Offset]
 [0D1h 0209   1]                  Instruction : 03 [Write Register Value]
 [0D2h 0210   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [0D3h 0211   1]                     Reserved : 00

 [0D4h 0212  12]              Register Region : [Generic Address Structure]
 [0D4h 0212   1]                     Space ID : 00 [SystemMemory]
 [0D5h 0213   1]                    Bit Width : 20
 [0D6h 0214   1]                   Bit Offset : 00
 [0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
-[0D8h 0216   8]                      Address : 00000000FEBF3000
+[0D8h 0216   8]                      Address : 00000000FEBFE000

 [0E0h 0224   8]                        Value : 0000000000000004
 [0E8h 0232   8]                         Mask : 00000000FFFFFFFF

 [0F0h 0240   1]                       Action : 05 [Execute Operation]
 [0F1h 0241   1]                  Instruction : 03 [Write Register Value]
 [0F2h 0242   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [0F3h 0243   1]                     Reserved : 00

 [0F4h 0244  12]              Register Region : [Generic Address Structure]
 [0F4h 0244   1]                     Space ID : 00 [SystemMemory]
 [0F5h 0245   1]                    Bit Width : 20
 [0F6h 0246   1]                   Bit Offset : 00
 [0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
-[0F8h 0248   8]                      Address : 00000000FEBF3008
+[0F8h 0248   8]                      Address : 00000000FEBFE008

 [100h 0256   8]                        Value : 000000000000009C
 [108h 0264   8]                         Mask : 00000000FFFFFFFF

 [110h 0272   1]                       Action : 05 [Execute Operation]
 [111h 0273   1]                  Instruction : 03 [Write Register Value]
 [112h 0274   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [113h 0275   1]                     Reserved : 00

 [114h 0276  12]              Register Region : [Generic Address Structure]
 [114h 0276   1]                     Space ID : 00 [SystemMemory]
 [115h 0277   1]                    Bit Width : 20
 [116h 0278   1]                   Bit Offset : 00
 [117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
-[118h 0280   8]                      Address : 00000000FEBF3000
+[118h 0280   8]                      Address : 00000000FEBFE000

 [120h 0288   8]                        Value : 0000000000000005
 [128h 0296   8]                         Mask : 00000000FFFFFFFF

 [130h 0304   1]                       Action : 06 [Check Busy Status]
 [131h 0305   1]                  Instruction : 03 [Write Register Value]
 [132h 0306   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [133h 0307   1]                     Reserved : 00

 [134h 0308  12]              Register Region : [Generic Address Structure]
 [134h 0308   1]                     Space ID : 00 [SystemMemory]
 [135h 0309   1]                    Bit Width : 20
 [136h 0310   1]                   Bit Offset : 00
 [137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
-[138h 0312   8]                      Address : 00000000FEBF3000
+[138h 0312   8]                      Address : 00000000FEBFE000

 [140h 0320   8]                        Value : 0000000000000006
 [148h 0328   8]                         Mask : 00000000FFFFFFFF

 [150h 0336   1]                       Action : 06 [Check Busy Status]
 [151h 0337   1]                  Instruction : 01 [Read Register Value]
 [152h 0338   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [153h 0339   1]                     Reserved : 00

 [154h 0340  12]              Register Region : [Generic Address Structure]
 [154h 0340   1]                     Space ID : 00 [SystemMemory]
 [155h 0341   1]                    Bit Width : 20
 [156h 0342   1]                   Bit Offset : 00
 [157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
-[158h 0344   8]                      Address : 00000000FEBF3008
+[158h 0344   8]                      Address : 00000000FEBFE008

 [160h 0352   8]                        Value : 0000000000000001
 [168h 0360   8]                         Mask : 00000000FFFFFFFF

 [170h 0368   1]                       Action : 07 [Get Command Status]
 [171h 0369   1]                  Instruction : 03 [Write Register Value]
 [172h 0370   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [173h 0371   1]                     Reserved : 00

 [174h 0372  12]              Register Region : [Generic Address Structure]
 [174h 0372   1]                     Space ID : 00 [SystemMemory]
 [175h 0373   1]                    Bit Width : 20
 [176h 0374   1]                   Bit Offset : 00
 [177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
-[178h 0376   8]                      Address : 00000000FEBF3000
+[178h 0376   8]                      Address : 00000000FEBFE000

 [180h 0384   8]                        Value : 0000000000000007
 [188h 0392   8]                         Mask : 00000000FFFFFFFF

 [190h 0400   1]                       Action : 07 [Get Command Status]
 [191h 0401   1]                  Instruction : 00 [Read Register]
 [192h 0402   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [193h 0403   1]                     Reserved : 00

 [194h 0404  12]              Register Region : [Generic Address Structure]
 [194h 0404   1]                     Space ID : 00 [SystemMemory]
 [195h 0405   1]                    Bit Width : 20
 [196h 0406   1]                   Bit Offset : 00
 [197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
-[198h 0408   8]                      Address : 00000000FEBF3008
+[198h 0408   8]                      Address : 00000000FEBFE008

 [1A0h 0416   8]                        Value : 0000000000000000
 [1A8h 0424   8]                         Mask : 00000000FFFFFFFF

 [1B0h 0432   1]                       Action : 08 [Get Record Identifier]
 [1B1h 0433   1]                  Instruction : 03 [Write Register Value]
 [1B2h 0434   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [1B3h 0435   1]                     Reserved : 00

 [1B4h 0436  12]              Register Region : [Generic Address Structure]
 [1B4h 0436   1]                     Space ID : 00 [SystemMemory]
 [1B5h 0437   1]                    Bit Width : 20
 [1B6h 0438   1]                   Bit Offset : 00
 [1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
-[1B8h 0440   8]                      Address : 00000000FEBF3000
+[1B8h 0440   8]                      Address : 00000000FEBFE000

 [1C0h 0448   8]                        Value : 0000000000000008
 [1C8h 0456   8]                         Mask : 00000000FFFFFFFF

 [1D0h 0464   1]                       Action : 08 [Get Record Identifier]
 [1D1h 0465   1]                  Instruction : 00 [Read Register]
 [1D2h 0466   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [1D3h 0467   1]                     Reserved : 00

 [1D4h 0468  12]              Register Region : [Generic Address Structure]
 [1D4h 0468   1]                     Space ID : 00 [SystemMemory]
 [1D5h 0469   1]                    Bit Width : 40
 [1D6h 0470   1]                   Bit Offset : 00
 [1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
-[1D8h 0472   8]                      Address : 00000000FEBF3008
+[1D8h 0472   8]                      Address : 00000000FEBFE008

 [1E0h 0480   8]                        Value : 0000000000000000
 [1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF

 [1F0h 0496   1]                       Action : 09 [Set Record Identifier]
 [1F1h 0497   1]                  Instruction : 02 [Write Register]
 [1F2h 0498   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [1F3h 0499   1]                     Reserved : 00

 [1F4h 0500  12]              Register Region : [Generic Address Structure]
 [1F4h 0500   1]                     Space ID : 00 [SystemMemory]
 [1F5h 0501   1]                    Bit Width : 40
 [1F6h 0502   1]                   Bit Offset : 00
 [1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
-[1F8h 0504   8]                      Address : 00000000FEBF3008
+[1F8h 0504   8]                      Address : 00000000FEBFE008

 [200h 0512   8]                        Value : 0000000000000000
 [208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF

 [210h 0528   1]                       Action : 09 [Set Record Identifier]
 [211h 0529   1]                  Instruction : 03 [Write Register Value]
 [212h 0530   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [213h 0531   1]                     Reserved : 00

 [214h 0532  12]              Register Region : [Generic Address Structure]
 [214h 0532   1]                     Space ID : 00 [SystemMemory]
 [215h 0533   1]                    Bit Width : 20
 [216h 0534   1]                   Bit Offset : 00
 [217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
-[218h 0536   8]                      Address : 00000000FEBF3000
+[218h 0536   8]                      Address : 00000000FEBFE000

 [220h 0544   8]                        Value : 0000000000000009
 [228h 0552   8]                         Mask : 00000000FFFFFFFF

 [230h 0560   1]                       Action : 0A [Get Record Count]
 [231h 0561   1]                  Instruction : 03 [Write Register Value]
 [232h 0562   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [233h 0563   1]                     Reserved : 00

 [234h 0564  12]              Register Region : [Generic Address Structure]
 [234h 0564   1]                     Space ID : 00 [SystemMemory]
 [235h 0565   1]                    Bit Width : 20
 [236h 0566   1]                   Bit Offset : 00
 [237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
-[238h 0568   8]                      Address : 00000000FEBF3000
+[238h 0568   8]                      Address : 00000000FEBFE000

 [240h 0576   8]                        Value : 000000000000000A
 [248h 0584   8]                         Mask : 00000000FFFFFFFF

 [250h 0592   1]                       Action : 0A [Get Record Count]
 [251h 0593   1]                  Instruction : 00 [Read Register]
 [252h 0594   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [253h 0595   1]                     Reserved : 00

 [254h 0596  12]              Register Region : [Generic Address Structure]
 [254h 0596   1]                     Space ID : 00 [SystemMemory]
 [255h 0597   1]                    Bit Width : 20
 [256h 0598   1]                   Bit Offset : 00
 [257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
-[258h 0600   8]                      Address : 00000000FEBF3008
+[258h 0600   8]                      Address : 00000000FEBFE008

 [260h 0608   8]                        Value : 0000000000000000
 [268h 0616   8]                         Mask : 00000000FFFFFFFF

 [270h 0624   1]                       Action : 0B [Begin Dummy Write]
 [271h 0625   1]                  Instruction : 03 [Write Register Value]
 [272h 0626   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [273h 0627   1]                     Reserved : 00

 [274h 0628  12]              Register Region : [Generic Address Structure]
 [274h 0628   1]                     Space ID : 00 [SystemMemory]
 [275h 0629   1]                    Bit Width : 20
 [276h 0630   1]                   Bit Offset : 00
 [277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
-[278h 0632   8]                      Address : 00000000FEBF3000
+[278h 0632   8]                      Address : 00000000FEBFE000

 [280h 0640   8]                        Value : 000000000000000B
 [288h 0648   8]                         Mask : 00000000FFFFFFFF

 [290h 0656   1]                       Action : 0D [Get Error Address Range]
 [291h 0657   1]                  Instruction : 03 [Write Register Value]
 [292h 0658   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [293h 0659   1]                     Reserved : 00

 [294h 0660  12]              Register Region : [Generic Address Structure]
 [294h 0660   1]                     Space ID : 00 [SystemMemory]
 [295h 0661   1]                    Bit Width : 20
 [296h 0662   1]                   Bit Offset : 00
 [297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
-[298h 0664   8]                      Address : 00000000FEBF3000
+[298h 0664   8]                      Address : 00000000FEBFE000

 [2A0h 0672   8]                        Value : 000000000000000D
 [2A8h 0680   8]                         Mask : 00000000FFFFFFFF

 [2B0h 0688   1]                       Action : 0D [Get Error Address Range]
 [2B1h 0689   1]                  Instruction : 00 [Read Register]
 [2B2h 0690   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [2B3h 0691   1]                     Reserved : 00

 [2B4h 0692  12]              Register Region : [Generic Address Structure]
 [2B4h 0692   1]                     Space ID : 00 [SystemMemory]
 [2B5h 0693   1]                    Bit Width : 40
 [2B6h 0694   1]                   Bit Offset : 00
 [2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
-[2B8h 0696   8]                      Address : 00000000FEBF3008
+[2B8h 0696   8]                      Address : 00000000FEBFE008

 [2C0h 0704   8]                        Value : 0000000000000000
 [2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF

 [2D0h 0720   1]                       Action : 0E [Get Error Address Length]
 [2D1h 0721   1]                  Instruction : 03 [Write Register Value]
 [2D2h 0722   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [2D3h 0723   1]                     Reserved : 00

 [2D4h 0724  12]              Register Region : [Generic Address Structure]
 [2D4h 0724   1]                     Space ID : 00 [SystemMemory]
 [2D5h 0725   1]                    Bit Width : 20
 [2D6h 0726   1]                   Bit Offset : 00
 [2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
-[2D8h 0728   8]                      Address : 00000000FEBF3000
+[2D8h 0728   8]                      Address : 00000000FEBFE000

 [2E0h 0736   8]                        Value : 000000000000000E
 [2E8h 0744   8]                         Mask : 00000000FFFFFFFF

 [2F0h 0752   1]                       Action : 0E [Get Error Address Length]
 [2F1h 0753   1]                  Instruction : 00 [Read Register]
 [2F2h 0754   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [2F3h 0755   1]                     Reserved : 00

 [2F4h 0756  12]              Register Region : [Generic Address Structure]
 [2F4h 0756   1]                     Space ID : 00 [SystemMemory]
 [2F5h 0757   1]                    Bit Width : 40
 [2F6h 0758   1]                   Bit Offset : 00
 [2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
-[2F8h 0760   8]                      Address : 00000000FEBF3008
+[2F8h 0760   8]                      Address : 00000000FEBFE008

 [300h 0768   8]                        Value : 0000000000000000
 [308h 0776   8]                         Mask : FFFFFFFFFFFFFFFF

 [310h 0784   1]                       Action : 0F [Get Error Attributes]
 [311h 0785   1]                  Instruction : 03 [Write Register Value]
 [312h 0786   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [313h 0787   1]                     Reserved : 00

 [314h 0788  12]              Register Region : [Generic Address Structure]
 [314h 0788   1]                     Space ID : 00 [SystemMemory]
 [315h 0789   1]                    Bit Width : 20
 [316h 0790   1]                   Bit Offset : 00
 [317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
-[318h 0792   8]                      Address : 00000000FEBF3000
+[318h 0792   8]                      Address : 00000000FEBFE000

 [320h 0800   8]                        Value : 000000000000000F
 [328h 0808   8]                         Mask : 00000000FFFFFFFF

 [330h 0816   1]                       Action : 0F [Get Error Attributes]
 [331h 0817   1]                  Instruction : 00 [Read Register]
 [332h 0818   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [333h 0819   1]                     Reserved : 00

 [334h 0820  12]              Register Region : [Generic Address Structure]
 [334h 0820   1]                     Space ID : 00 [SystemMemory]
 [335h 0821   1]                    Bit Width : 20
 [336h 0822   1]                   Bit Offset : 00
 [337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
-[338h 0824   8]                      Address : 00000000FEBF3008
+[338h 0824   8]                      Address : 00000000FEBFE008

 [340h 0832   8]                        Value : 0000000000000000
 [348h 0840   8]                         Mask : 00000000FFFFFFFF

 [350h 0848   1]                       Action : 10 [Execute Timings]
 [351h 0849   1]                  Instruction : 03 [Write Register Value]
 [352h 0850   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [353h 0851   1]                     Reserved : 00

 [354h 0852  12]              Register Region : [Generic Address Structure]
 [354h 0852   1]                     Space ID : 00 [SystemMemory]
 [355h 0853   1]                    Bit Width : 20
 [356h 0854   1]                   Bit Offset : 00
 [357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
-[358h 0856   8]                      Address : 00000000FEBF3000
+[358h 0856   8]                      Address : 00000000FEBFE000

 [360h 0864   8]                        Value : 0000000000000010
 [368h 0872   8]                         Mask : 00000000FFFFFFFF

 [370h 0880   1]                       Action : 10 [Execute Timings]
 [371h 0881   1]                  Instruction : 00 [Read Register]
 [372h 0882   1]        Flags (decoded below) : 00
                       Preserve Register Bits : 0
 [373h 0883   1]                     Reserved : 00

 [374h 0884  12]              Register Region : [Generic Address Structure]
 [374h 0884   1]                     Space ID : 00 [SystemMemory]
 [375h 0885   1]                    Bit Width : 40
 [376h 0886   1]                   Bit Offset : 00
 [377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
-[378h 0888   8]                      Address : 00000000FEBF3008
+[378h 0888   8]                      Address : 00000000FEBFE008

 [380h 0896   8]                        Value : 0000000000000000
 [388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF

 Raw Table Data: Length 912 (0x390)

-    0000: 45 52 53 54 90 03 00 00 01 13 42 4F 43 48 53 20  // ERST......BOCHS
+    0000: 45 52 53 54 90 03 00 00 01 83 42 4F 43 48 53 20  // ERST......BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 30 00 00 00 00 00 00 00 1B 00 00 00  // ....0...........
-    0030: 00 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0030: 00 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0040: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0050: 01 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0050: 01 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0060: 01 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0070: 02 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0070: 02 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0080: 02 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0090: 03 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0090: 03 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     00A0: 03 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    00B0: 04 02 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    00B0: 04 02 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     00C0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    00D0: 04 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    00D0: 04 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     00E0: 04 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    00F0: 05 03 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    00F0: 05 03 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0100: 9C 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0110: 05 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0110: 05 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0120: 05 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0130: 06 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0130: 06 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0140: 06 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0150: 06 01 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0150: 06 01 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0160: 01 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0170: 07 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0170: 07 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0180: 07 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0190: 07 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0190: 07 00 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     01A0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    01B0: 08 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    01B0: 08 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     01C0: 08 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    01D0: 08 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    01D0: 08 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     01E0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    01F0: 09 02 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    01F0: 09 02 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     0200: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    0210: 09 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0210: 09 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0220: 09 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0230: 0A 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0230: 0A 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0240: 0A 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0250: 0A 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0250: 0A 00 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0260: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0270: 0B 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0270: 0B 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0280: 0B 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0290: 0D 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0290: 0D 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     02A0: 0D 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    02B0: 0D 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    02B0: 0D 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     02C0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    02D0: 0E 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    02D0: 0E 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     02E0: 0E 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    02F0: 0E 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    02F0: 0E 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     0300: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
-    0310: 0F 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0310: 0F 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0320: 0F 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0330: 0F 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
+    0330: 0F 00 00 00 00 20 00 03 08 E0 BF FE 00 00 00 00  // ..... ..........
     0340: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0350: 10 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
+    0350: 10 03 00 00 00 20 00 03 00 E0 BF FE 00 00 00 00  // ..... ..........
     0360: 10 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
-    0370: 10 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
+    0370: 10 00 00 00 00 40 00 04 08 E0 BF FE 00 00 00 00  // .....@..........
     0380: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  39 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 5987 -> 5992 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 5954 -> 5959 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7312 -> 7317 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8653 -> 8658 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6451 -> 6456 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7641 -> 7646 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5954 -> 5959 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3069 -> 3023 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6059 -> 6064 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7346 -> 7351 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 5845 -> 5850 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5993 -> 5998 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6195 -> 6151 bytes
 tests/data/acpi/pc/ERST.acpierst            | Bin 912 -> 912 bytes
 tests/data/acpi/q35/DMAR.dmar               | Bin 120 -> 112 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8274 -> 8228 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8291 -> 8245 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9599 -> 9553 bytes
 tests/data/acpi/q35/DSDT.applesmc           | Bin 8320 -> 8274 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 10988 -> 10944 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8738 -> 8692 bytes
 tests/data/acpi/q35/DSDT.cxl                | Bin 9600 -> 9502 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9928 -> 9882 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8349 -> 8303 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8363 -> 8317 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8291 -> 8245 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9633 -> 9587 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9404 -> 9358 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8568 -> 8524 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8132 -> 8086 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8280 -> 8234 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 8375 -> 8329 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8880 -> 8834 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8906 -> 8860 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9383 -> 9339 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35637 -> 35591 bytes
 tests/data/acpi/q35/ERST.acpierst           | Bin 912 -> 912 bytes
 tests/data/acpi/q35/IVRS.ivrs               | Bin 104 -> 100 bytes
 tests/data/acpi/q35/VIOT.viot               | Bin 112 -> 112 bytes
 40 files changed, 39 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 37369aed63..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,40 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/ERST.acpierst",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/IVRS.ivrs",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/VIOT.viot",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.ipmismbus",
-"tests/data/acpi/q35/DSDT.xapic",
-"tests/data/acpi/q35/DMAR.dmar",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/ERST.acpierst",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index e80bef30317b5ef3bf0d2fb7aaabd6def109adb6..7c9e75d5b29890717d0ace8d4e000963d06fb79b 100644
GIT binary patch
delta 91
zcmaE?_d<`$CD<h-L!5zuF?A!CBQK}#!kGAAr+5L^$sxQJVoof<h6eE*@xh^fTudDC
tjxIqw3=B+@-|-r5zRkOVUBp$!CCo2`X#r1l1{VuM8%S~H=1HO#83A$V87Tk&

delta 126
zcmaE%_gIh1CD<h-S)74^F@GbMBQK}N!kGAAr+5K}$sxQJUS2H0h6eE*@s2J*JPZs>
z3>=QZp?+LUBI5Bb!M;380)S*jW>&USu&WP9Mua0i*wBSx2?K~>1Y;P37@N=WZe?fp
Qkah|43t`$kUGyR&01Xo$;{X5v

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index d5a2ca51652dfc3637a817bac4a02d6ff6dc8ac2..9bac3fbdac1525cc28d409c0a3adc40c6a9559c0 100644
GIT binary patch
delta 100
zcmX@4cU+IlCD<jzU7Ue|F@7VLBQKZF{FwM)r+5LE`IAF=%^CG3_wnjVL^nCH1RGk!
zbHoRS`f)LH#5=kK@h~tjPnP2|+RVe3%`W00?Gok}!nA;=I)jUYp$()sb90^O5k>$d
Cni<;w

delta 132
zcmX@EcSw)RCD<jzNt}U!F>NE4BQKZx{FwM)r+5MXd6PqV&6&JdCin8{dWdku2OGLD
zEMWjKj9?675F@%tFWAr`o+IATC5VTCfti8BF*wwZi&;cG-X++VXGs8%%*f2jb_#a&
Yaoqfyw}hSDTgoNOFNA4xv*-~<0KCK^XaE2J

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index f86c743c4d64041c7fbd9999cc700e88416770b7..740f050993a89908acc9d6687ff61f5484a2cd1f 100644
GIT binary patch
delta 91
zcmbPWIn|QOCD<iostf}IqtZsMJRwfsg)#BLPVoY+lN*IB#GF`y4GrQs;)6r|xR^NN
t9bJNW7#Nr)#|s;7<`CY%F5)WV66P1ew1B5NgNucs4Wu}8^M0v|i~uX$7svnr

delta 107
zcmbPgIl+?4CD<iof(!!#qs~UIJRwexg)#BLPVoW`lN*IB#JyO84GrQs;vHRrco-O%
z7&sh*L;bjzCeIg=kQU*H4>ojRSi%5e7{M6EAjan3LR;C{J)~X2{6d&EACbDq2mpkz
B8u<VK

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 14ed0d995a9f6540deae5a25a7853ed4493a6e06..abb28b5c8e670969fc40ff12ae8e2d866ab83992 100644
GIT binary patch
delta 75
zcmV-R0JQ(jL()SEL{mgm(jfo<0Z*|CK@AFrNC8}5Q$k-5j+0dlIRZ_plaLK9vk4A^
h3bWY`um=Z78$?!4R06ZM7P0}8q#+{)FketZPE>Fq7aafq

delta 132
zcmccQeAb!ECD<k8tRe#gW9&vQM_#Tb55}1IV5fM2&dH&?mP}qOlPB=%nuu`32OGLD
zEMWjKj9?675F@(DcU7>VMLb8mqe~DE0|PSyhhuQ49~blF0zQ$=J9*o=Hn&LRu(Nwh
axrF(JFl{auTgo_jrJ^#MMSOs>UkCsaTO#uS

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index c653302a84a42d063a74a22c6adf910beeba7c60..1540ff2d5f6edc1107ac7c4859026ef48cb92e7a 100644
GIT binary patch
delta 91
zcmdmNw8MzYCD<jzLXv@j@#ID>L4Ho(g)#BLPVoY+lU4XF#GF`y4GrQs;)6r|xR^NN
t9bJNW7#Nr)@8dVzyqbRlyNIidOPF5>(*mCA3@#RiHjv`X%}L@H838@Q7$E=v

delta 126
zcmdmCwAqNuCD<jzSdxK(@$yD4L4Hn;g)#BLPVoW`lU4XFyu4U~4GrQs;vHRrco-O%
z7&sh*L;bjzM8xA=f_-_G1OUm5%&csuU{@cIj0i`3u%QdX5(W^%2*xl5F*eWR-^$MJ
QA?*_87s9kTUHl>=0MHm92><{9

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 247a1796b1cf31c24b1a981e48937609f84fe2cb..4b147361167578340587e851015b932dc0de3fac 100644
GIT binary patch
delta 91
zcmca<eb1W9CD<k8o-6|c<K~TA+l4uO7skW~JH-pQPCg}UA?CyqY-kYA5g#1t$Hl}E
u@8}Z5!@$5a*+A5AbD+oub`e(@moUE&rUg9J8C)z3Z6L*&n>l1IG6Dd~!WlIH

delta 111
zcmca-ebbuDCD<k8rYr*k<KB&2+l4tj7RJN}JH-n)Og<%SA@0QzY-kYA5%1^{#KXYA
z#K7Sg9O}o#G`T=TL>|Nx;fN15bYWP+0Ad)y7{(yRW*3pI?Cc)WE@6HlOq+RSE;0fD
DsDm7y

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index d5a2ca51652dfc3637a817bac4a02d6ff6dc8ac2..9bac3fbdac1525cc28d409c0a3adc40c6a9559c0 100644
GIT binary patch
delta 100
zcmX@4cU+IlCD<jzU7Ue|F@7VLBQKZF{FwM)r+5LE`IAF=%^CG3_wnjVL^nCH1RGk!
zbHoRS`f)LH#5=kK@h~tjPnP2|+RVe3%`W00?Gok}!nA;=I)jUYp$()sb90^O5k>$d
Cni<;w

delta 132
zcmX@EcSw)RCD<jzNt}U!F>NE4BQKZx{FwM)r+5MXd6PqV&6&JdCin8{dWdku2OGLD
zEMWjKj9?675F@%tFWAr`o+IATC5VTCfti8BF*wwZi&;cG-X++VXGs8%%*f2jb_#a&
Yaoqfyw}hSDTgoNOFNA4xv*-~<0KCK^XaE2J

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index ec99b1622934a0fd8bc316291c33231e4c57dce0..c18132a340b0f4a877e14c19aba6d6b599638c9b 100644
GIT binary patch
delta 62
zcmew>eqNl*CD<k8JU0Ua<D89Lv$?gjV&a3H;sulgoIMSqo4A7w4B|QB9bJMLqMP`G
M4WS$!1_mYu05wAo(EtDd

delta 108
zcmX>v{#TsKCD<k8FE;}NBhyB%+1wExtTFMyPVoW`tO3rR2GLF2!3GBL9Py4WK@8DN
pTET`;4i5tZ6N3mxe6XPl!xAvV2*xl5F`}FJgAFYp8i8t=835Nu82<nO

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index f0d9e75841ea3d69fed9384e439bc4e94c7a4c4e..1f2536a0232b65b79b2e6265c6682e3c75e813b0 100644
GIT binary patch
delta 91
zcmZ3jzd@hNCD<iogE#{N<J*l~oxGgB3uEGgo#F*tC(q%v5OZP)HZ+Lmhz}0+<6`27
ucXSEjVPIgIypPXtvohZXb`e(@moUE&rUg9J8C)z3Z6L*&n{SC;WCQ?~m>GQl

delta 126
zcmdm>zgnNmCD<iowKxL<<M)kRoxGeL3uEGgo#F)?CePuu@bY2_HZ+Lmh<9`e;$dK5
zV&HHL4)x<=5)qGg3HIe#5&$GKGPAOsf?a(;G9n!D!G<mjOBg^5BN)RN#Mmsxx0RjU
QL)s<GFNA6HebI}I0AgbyW&i*H

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index d0a7c462094fea9a457cbf537784735e74f7d7d5..07a0082c563b16e67d60e6aed62b003c18148358 100644
GIT binary patch
delta 91
zcmdmFx!sb>CD<ioy9@&ZWB5j{2|}E{3uEGgo#F*tCodMV5OZP)HZ+Lmhz}0+<6`27
ucXSEjVPIgI+$e0gSxa~WyNIidOPF5>(*mCA3@#RiHjv`X%@3t6G6Dd3kQogC

delta 107
zcmdmPxyh2tCD<iolMDj`W8y}x2|}D63uEGgo#F)?CNCDU5cgsUHZ+Lmh<9`e;$dK5
zV&HHL4)x<=ntV`5LRy3)KG@KOVF?3>VFY6sgBY7-g}1V^dq}&4`GqiTekOI15dhDp
B8$SR5

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index cb7bf7d850f340e12a7237c987f570300fd9c92b..a8e8942bff1ba6eeb796cbe83f8f3a4d43171d19 100644
GIT binary patch
delta 91
zcmcbrdrOzgCD<k8mKXyAqy9#&%{-jG3uEGgo#F*tCm-Xn5OZP)HZ+Lmhz}0+<6`27
tcXSEjVPIgIoWN_i*_U?%yNIidOPF5>(*mCA3@#RiHjv`X%`Bo983B<r7=8c%

delta 111
zcmcbmdsUaqCD<k8su%+Uqvb}f%{-hQ3uEGgo#F)?CLiOm5cgsUHZ+Lmh<9`e;$dK5
zV&HHL4)x<=n!JHmL>|Nx;fN15bYWP+0Ad)y7{(yRW(VG_?Cc)WE@6HlOq)4HFERoE
DW=tFS

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 2f512cfbe158f1739803c0c7009fe5e907bdec54..ae43f0c82f75f7f70364a06153eaa3678a02211e 100644
GIT binary patch
delta 91
zcmaE<_fC(?CD<h-Pn>~)k$)qXJ1?j2!kGAAr+5L^$x*x(Voof<h6eE*@xh^fTudDC
tjxIqw3=B+@5AYdoe#pClUBp$!CCo2`X#r1l1{VuM8%S~H<{6?F839}=7|;L!

delta 110
zcmaE-_fn6`CD<h-Q=EZ;QF0@fJ1?il!kGAAr+5K}$x*x(;$AGlh6eE*@s2J*JPZs>
z3>=QZp?+LUllVmBK`arD_+Ud9h9wLjh7pWm3}S4)!n>87-9y?X%rAs#^IXx3i~!O#
B8#w>~

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 46e03d39e00ea70e55d6a12333ca2b98c5e5bb53..d9fb2b09222907527d2aee7089db22719576093f 100644
GIT binary patch
delta 76
zcmdmN&~Cux66_MfF2TUSSiF(TkypoObxeG)Q@nu7>Hud?gXkviU;~4Aj(A6xAcp8B
azZJoTP#zBh1JmZkyj@&u2Jr#TejxxD?-Y0d

delta 120
zcmZoS*lfV%66_LUEWyCQD7BHxkvGC)T}*tiQ@nt~x&UWSgXkviU;~4Aj(A6xAcp8B
ztzbhahlhcIi9v)TKG@KOVF{RF1Y;P37|~6BD}oIzAUc7HnKzg7c5$&;#0NP0g#Z8-
CMICqm

diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
index 7965ac2562e7b23bf1dc2caaf00ef66453c4f47a..4d4082180564445360fbf961230cda5bd635ac7c 100644
GIT binary patch
delta 191
zcmYkytqp)M6ae9t3KA9|sbK^>o&^BaQEFMB1lLh&*rSR$D)@O91SdXqp$>I3PV*9s
zQhME*UZ300y*R-OQAk1-%FAxGIG{t15ff%CXe)kn=rLl#j0LUXM`ybBJTCR?{(1l}
C>qUtG

delta 191
zcmYkytqp)M6ae9t3KA@Wq=ped<5>Vu9i>y0;5teTdvufve%=MaiBDaqL*2~Fx&@<@
zZue%;<39B-PVhn$l8}Y+a#$@+=+I-tgc%FkiXR<%jF>QEL2LNYnZ6s(OZ~dP9-?zH
Ai2wiq

diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
index 0dca6e68ad8a8ca5b981bcfbc745385a63e9f216..19bb12878d5712a0efa75c104860318cfcb7c696 100644
GIT binary patch
delta 24
fcmb;@;BxVG3@Tt?U|`gr$fdz(G0|9gVw@BJM>Peb

delta 26
hcmXS@;BxVG460yYU|<xT$fd#PFwt0<k#VBGA^=av1(N^(

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 2cd8d5fc470fc3159fbc464af97e76c8de2136e3..5793e9eebf67d733b7d20f5f7b0ab4e04c755259 100644
GIT binary patch
delta 52
zcmccQu*8AOCD<iIMS+2Vv3n!eFL?!pnD}6)cmc@(XHSFZChlMZgLsa3N0%T55w-wl
HzYqohh3yT0

delta 98
zcmZ4DaLIwoCD<h-NP&TY@!CeNU-Eu_EHUxHPVoY6ECJ4*2GLF2!3GBL9Py4WK@8DN
jTEPYu5DpJe1A_=he6XPl!xAvV2*xl5GuQ&0{X!T35wRDo

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index 0bc5de80652ae7328fdc07ccda34afff39ade56f..4cff3d4704ccc90bd4e6d9c084244e0694f34e8c 100644
GIT binary patch
delta 69
zcmaFtu+@RfCD<jzRDpqkk$ofAFL^`5nD}6)cmb^dXHSFZChlMZgLsa3N0%Um=qCPP
T0}BX;2dJDuge}0?FN6UAjMxye

delta 115
zcmdn$@YsRNCD<h-S%HCpv1}vPFZp<X)|mKUr+5K()&OTugXkviU;~4Aj(A6xAcp8B
vtzZKS2!{u#fkA{LKG@KOVF{RF1Y;P37|~7q!G=(cK($N^B5VQ9ejyA1!$KP1

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index af10345e8806c78a0074b3a8819b5cfca4d70c01..da9bdff05ce20d78d80fe7321c38a3fbec613b55 100644
GIT binary patch
delta 52
zcmezGb<vB<CD<h-P?dp!(PJZ*x~hUgOnk6YyntkYv!_9H6L+wIK|Dviqe~Ej2wQ-&
HUkC#LekBbL

delta 98
zcmccU_1}xjCD<jTUX_7?aq>nkbyYt<mYDcpr+5K3mH=l@gXkviU;~4Aj(A6xAcp8B
jtzZKS2!{u#fkA{LKG@KOVF{RF1Y;P38EgU0ejyA1^|}{5

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index 00092aacc6ce44dd8792b00a0fa183e5b06d33c6..a4bff7627ccfb0be59c32db7370bd6884fb7960c 100644
GIT binary patch
delta 52
zcmZp0yyU>;66_KZq`<(yShJB!LqS0yCO+6HUO+Oy+0!7pi96W9Af6-M(ItpMge}0?
HFN6UAXJ8Df

delta 98
zcmccQ(BR1B66_MvpuoVuczh$5hJv3TOH6#QQ@ns1OMtVdL39&$uz^85N4%p;5JPm6
jR<MBugu?^Wz#zgAA8hEtumsF7f-#K247LDgzYqoh&CM3r

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index d820098355e0b79dc69d714817fe906064852f4d..732a8fd19eac4a3453ba3ec082f0125a12cc69c1 100644
GIT binary patch
delta 77
zcmaD8dLWd`CD<k8fEEJ-qvA%cU-CLWt7GDWo#F*tRtGqH8bmj72OAi~bHqEk1TjQ6
a`K<^xuz>J*fI2qED0FhM14ROy{Xzh<>lT6l

delta 121
zcmX>Q`X-diCD<k8jTQp~<AaS{zvLr4*2TmJJH-n)tP61VG>C5E4mL1|=ZJT731WzD
z(h4@PfN*$#8W==4;)4xc7?yw;Mlgmkh!Nf7w<6dOsuQS~X|sVsCl@<VB*57(1OSLP
BAc6n@

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index ac8456a43d54209d77917163b282954d7429b331..3bb95f4e78701be057843b654c120e2082a21e12 100644
GIT binary patch
delta 52
zcmZ4F^2M3UCD<k8iy{L9<A;r0rxX<wV&a3H;sqoFoIMSqo4A7w4B|QB9bJMLMA!nH
H{X!T3xcCmP

delta 98
zcmez3yvT*iCD<iINr{1h(P|^tDMdd&mYDcpr+5K3mH=l@gXkviU;~4Aj(A6xAcp8B
jtzZKS2!{u#fkA{LKG@KOVF{RF1Y;P38EgU0ejyA1&mk7v

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 369ae90196113ec666a4acec7bb7a93be5b60e75..76721b15cca0dc2e41ab4e0aa4e26aded90e4171 100644
GIT binary patch
delta 343
zcmZqhp6A8o66_Kpr^>*<$i9(FS0Q1+-~a#b|78FJ2ZnZW1_mBR2v6zX|NqMWAZ#WS
z83&+DJygblp@Wx!i3h0c9>W75$;?p6AmFGR6CdmpAKm1kw0XM19Y%967A`krvmXF$
zRfL-0gkp9B(Cqy%vnL->vJ`WajL`#`7U1k@z!C2p6fEe+$MtHmh;ohXe5k`0*diOQ
z0yM%NYJ?1m;Rk>+|Nle0<god<vL>UmGYi<M0@fhoqno&c4GiKr;vHRr7^0i_gAFVo
Y9H9Rg!2*U*S)c$Dg9uxIvtI}U07D;AZvX%Q

delta 429
zcmbQ|)!@zL66_Mvpvu6&cyA+@u0jIC-~a#Z|1yAq14Fww0|O5ugs1TD|Nr=Z*kl$1
zWtKo?m>4>E8JKv0%I+~d0FulMl?(#jDlzfFPVv!APAZ$HE8Jn6tgay7=m4~-9;;0W
zK=bBfwP_(xW)aM$$*Yts#eJk=^gw0@IC~m!#5)HC3wjE0voKEnsZ<mG{}05q47SMr
zXaL$P4>e-}iVqh6O<w?&VMLKx3Y7W(A7Wbc=1t0)j0FztU_S|Xuz{?OZsHC$Fo@@f
zcXSD2h;GsfHn4zjfFZ%iAi@zJZ0N$U1k5mkF^oZs=qCPPL#RfeS|*49LNhai2+#t*
G5C#B|sb}E;

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bb0eadf869fe366fc139f8b0fd2ed811d3b16814..ace51f026e31c9c928b93a1702fcb81f283920aa 100644
GIT binary patch
delta 52
zcmX@%JIj~LCD<iomKp;C<IRm+1!@WkG4a7p@dA<o&YlL*P29l-2Jsy6jxIqAB5VQ9
HejyA1m3Ixy

delta 98
zcmbQ`d%~B?CD<k8gc<__qsm6E0yRHBmYDcpr+5K3mH=l@gXkviU;~4Aj(A6xAcp8B
jtzZKS2!{u#fkA{LKG@KOVF{RF1Y;P38EgU0ejyA1+X5E)

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index bb258279506e78b50545f6f9030bd25afe433c29..b2e47d49f0c90e271cd5c249bd2bfda4c4438f31 100644
GIT binary patch
delta 52
zcmbR1_}+obCD<h-Ux9&val=L~R|N%ynD}6)cmc@(XHSFZChlMZgLsa3N0%T55w-wl
HzYqohgM1BA

delta 98
zcmaFwFxQdGCD<iot^xxC<L`}Jt_psBEHUxHPVoY6ECJ4*2GLF2!3GBL9Py4WK@8DN
jTEPYu5DpJe1A_=he6XPl!xAvV2*xl5GuQ&0{X!T32q+hT

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 15000c357fdabf1bceef6f860bd35e9a33024927..5d41e68c366298d1aa3e9d1f6775637b1776230b 100644
GIT binary patch
delta 52
zcmZ4O_}78UCD<jTR)K+mk!vGYu!4d@Onk6YyntkYv!_9H6L+wIK|Dviqe~Ej2wQ-&
HUkC#Lbg&HM

delta 98
zcmezCu-cK!CD<iowE_bJW9UY%U<E%vmYDcpr+5K3mH=l@gXkviU;~4Aj(A6xAcp8B
jtzZKS2!{u#fkA{LKG@KOVF{RF1Y;P38EgU0ejyA1<%t&(

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index 0bc5de80652ae7328fdc07ccda34afff39ade56f..4cff3d4704ccc90bd4e6d9c084244e0694f34e8c 100644
GIT binary patch
delta 69
zcmaFtu+@RfCD<jzRDpqkk$ofAFL^`5nD}6)cmb^dXHSFZChlMZgLsa3N0%Um=qCPP
T0}BX;2dJDuge}0?FN6UAjMxye

delta 115
zcmdn$@YsRNCD<h-S%HCpv1}vPFZp<X)|mKUr+5K()&OTugXkviU;~4Aj(A6xAcp8B
vtzZKS2!{u#fkA{LKG@KOVF{RF1Y;P37|~7q!G=(cK($N^B5VQ9ejyA1!$KP1

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 663456fc0d3c71a51b541f5ab952e05c9dac01e6..aa8a96a4d13429b9c5defa0bdc7df2a1eedbeee2 100644
GIT binary patch
delta 52
zcmZ4J{n?AlCD<jTSe1c+v34Vur>cTNOnk6YyntkYv!_9H6L+wIK|Dviqe~Ej2wQ-&
HUkC#LgdPn|

delta 98
zcmezDwa}Z(CD<iop(+Cd<B5%2o~nL+EHUxHPVoY6ECJ4*2GLF2!3GBL9Py4WK@8DN
jTEPYu5DpJe1A_=he6XPl!xAvV2*xl5GuQ&0{X!T32jmxf

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 91afd01d598c7c2c733387dfb5140d0fcad54adb..9e09b99e7836000bd7b02efa5ebe660366330634 100644
GIT binary patch
delta 69
zcmdnv+2_gS66_Mvr^3L%D7uj=SjEsVCO+6HUO+3r+0!7pi96W9Af6-M(Ito>x`{v7
TzyiYI0V-z@VGD5f3t<2Nbh8jY

delta 115
zcmeD4+~djR66_MPM}>ibv1KDyuu8l?YfOBwQ@nsXYk;$-L39&$uz^85N4%p;5JPm6
vR<MBugu?^Wz#zgAA8hEtumsF7f-#IijOZr*U_+=zpjsvd5w-wlzYqohmU9|y

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index afde339a181628ae9153251eee026b437ab685bc..b4ed0a18c38d444d6f413284f94b14ed115d4ccd 100644
GIT binary patch
delta 51
zcmez2bjFFxCD<jzN0EVn@%TorU-D8OA~Es7PVoW`A_2~x2GLF2!3GBL9Py4WL7Tl4
G^cVq}?+&B@

delta 95
zcmX@(^uvkECD<jTLXm-iF>52&FL^f?@tF8vr+5J$u>faJgXkviU;~4Aj(A6xAcp8B
itzZKS2!{u#fkA{LKG@KOVF{RF1Y;Nj8Jp!4^cVr%%NL{o

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 0fb09121cf8f6ad8810587c8b77df9552dd31f42..c1ff2794f7949d872690d770a9538c5bee4923b7 100644
GIT binary patch
delta 52
zcmX?NKh2)YCD<ionmhvoW9UY%9C-zWnD}6)cmc@(XHSFZChlMZgLsa3N0%T55w-wl
HzYqohcY_TM

delta 98
zcmbPcf5e{4CD<k8h&%%W<ARM`Ir4sfEHUxHPVoY6ECJ4*2GLF2!3GBL9Py4WK@8DN
jTEPYu5DpJe1A_=he6XPl!xAvV2*xl5GuQ&0{X!T3?&=pj

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index e537669949a07adbaa4255021ea14bb4a9dc672f..3408b879bf1d5bbcac465f96d3b88d072d50dc07 100644
GIT binary patch
delta 51
zcmccNu*!kUCD<iIOM!ub(R3k~f`UR!e6UlzfMkHPr$KZRcd&s$JV(5vOAvzyTY$4)
G2m=69%nULB

delta 97
zcmZ4GaKnMiCD<h-LV<ySv0)*Xf}bBtOnk6Yynq`^fU~DTbQ5>5fk8Y+yrWAHLv)i?
iuz>}H!vj>$Ai@zJZ0N$U1k5mkF^s_swg6|p5C#CFG8SL}

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index cc545b5d2505246d33f83d2482273968aa1be032..f7fd73af1e1cdbe69aecc1e174910afb76d36d80 100644
GIT binary patch
delta 52
zcmdn)*y+gS66_MvsldR%Xtj|mUO_=2CO+6HUO+Oy+0!7pi96W9Af6-M(ItpMge}0?
HFN6UAYjF(4

delta 98
zcmeBl-0sNb66_MPU4emtv2`O?yn>$}OH6#QQ@ns1OMtVdL39&$uz^85N4%p;5JPm6
jR<MBugu?^Wz#zgAA8hEtumsF7f-#K247LDgzYqoh)w&k*

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index a97d884c50485f848054c6ac95ecfa055ff59e5b..7d5544daf9f067ee4a8331fa7c60ad4ca45a3491 100644
GIT binary patch
delta 52
zcmdns+T_aR66_Mvq{P6$_;@2%gpz_nOnk6YyntkYv!_9H6L+wIK|Dviqe~Ej2wQ-&
HUkC#Lfx``6

delta 98
zcmZp2-QddQ66_MPL5YEZQEwwxgp!{hOH6#QQ@ns1OMtVdL39&$uz^85N4%p;5JPm6
jR<MBugu?^Wz#zgAA8hEtumsF7f-#K247LDgzYqohvx*js

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 1f5392919b5ea69696b49ff13aab5c37d0615919..deb0be9b2d449daded2968e476f30027df79432b 100644
GIT binary patch
delta 52
zcmX@*I>(jECD<iojuHa{W7kHmA|(ZdnD}6)cmc@(XHSFZChlMZgLsa3N0%T55w-wl
HzYqohhSd#i

delta 98
zcmbQ^ddii{CD<k8loA62<JFB^MM{2tEHUxHPVoY6ECJ4*2GLF2!3GBL9Py4WK@8DN
jTEPYu5DpJe1A_=he6XPl!xAvV2*xl5GuQ&0{X!T34_z0V

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index e20e4ee5e92e11ccf890a18fbdd78181c43f3b5c..73eb017fe757491b5c6f3add90edea63ef495649 100644
GIT binary patch
delta 75
zcmZ4P`P+lbCD<jTT7`ju@%lzCZWV1ewwU-}r+5KB)&OTugXkviU;~4Aj(A6xAcp8B
Z{$K+O2!{u#VRE#J3A+eefU{o+0{{s#5{Li*

delta 119
zcmezEvD}l(CD<ioxe5aVWAjEXZWT8t&Y1XMr+5J`jsRy*gXkviU;~4Aj(A6xAcp8B
ytzZKS2!{u#fkA{LKG@KOVF{RF1Y;Nj8Iv7UOeCV4_=AlQ>RA~?*aDpWLKpxE0UMbB

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 3cab5956eee60363251a6fab0cc981bbbda64443..6d73a9b4fc7b9f4d5593282ca210a85930519649 100644
GIT binary patch
delta 54
zcmdlwjj4Sa6PHV{O9*>60|TSuMy|VE3JNjt!A|i4k^#=12GLF2!3GBL9Py4WK@1{n
J0nUCQ3;?WX4o3h0

delta 100
zcmZpl#<X=B6PHV{ONePV0|R5vMy|VEets-5@xe~<0&Xk;&YlL*P29l-2Jsy6jxIqA
l(M?*x1{M$w4^RVx2uFOdp$o$jFvAGOFa|T&0-XIq7yw)D7<B*u

diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
index 7965ac2562e7b23bf1dc2caaf00ef66453c4f47a..4d4082180564445360fbf961230cda5bd635ac7c 100644
GIT binary patch
delta 191
zcmYkytqp)M6ae9t3KA9|sbK^>o&^BaQEFMB1lLh&*rSR$D)@O91SdXqp$>I3PV*9s
zQhME*UZ300y*R-OQAk1-%FAxGIG{t15ff%CXe)kn=rLl#j0LUXM`ybBJTCR?{(1l}
C>qUtG

delta 191
zcmYkytqp)M6ae9t3KA@Wq=ped<5>Vu9i>y0;5teTdvufve%=MaiBDaqL*2~Fx&@<@
zZue%;<39B-PVhn$l8}Y+a#$@+=+I-tgc%FkiXR<%jF>QEL2LNYnZ6s(OZ~dP9-?zH
Ai2wiq

diff --git a/tests/data/acpi/q35/IVRS.ivrs b/tests/data/acpi/q35/IVRS.ivrs
index 17611202e53a32f7da8e4925d6955b384670b8b1..2a3f55e2cc7422c3724b87fe5c78f4a887174dfd 100644
GIT binary patch
delta 67
zcmc~u;qnX%3Ql2QU|>w0$faRq!ob1c0OZ~H2PDA21xPZ1Fb5F-0ODUj{F{Nn10=hE
Gfe`?NKnhp@

delta 52
wcmYev;PMO$3eI3)U|@8f$fcoR!63lk0OZ~H2PDA21xPZ1Fb5C|O!N~20PnB|UjP6A

diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index 275c78fbe8e93190321d957c91c3f17551f865d4..a2b1ad95fb800f684af9cb83ebd27031f4a873ed 100644
GIT binary patch
delta 21
acmXRY;0p8f4=G>(0@sOLI*c3>%`E{qW(2bU

delta 21
acmXRY;0p8f4=G>(0^5mPI*bAn%`E{qJ_NG>

-- 
2.37.2


