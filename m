Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344B474F59
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:34:31 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIFZ-0003xn-Tw
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:34:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHrh-0000u8-Fn; Tue, 14 Dec 2021 19:09:49 -0500
Received: from mail-mw2nam10on2055.outbound.protection.outlook.com
 ([40.107.94.55]:57381 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHrf-0005Ms-0P; Tue, 14 Dec 2021 19:09:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv2fsucRPzWwsytMGflu4yAWmtJv69B4VhKz2YDezQecjSKmYb+ZxK7t9GNNS7swwcjULgae71PsuDOk2zV6eohevc5/O95AGNphVvn5O8PRvU31OeTUvjjCQKK7RyRfjFiP5mE3/ulgUvoUL5ydFb6SzLjBlLclu+1m/mgQOusHeXvtSLW9udLNg6HOGBrjAcAnc5+F4gqJhZlbnXkGwOUvUYFB7oeBd3+SGj/hVk+SYWE6J/3itTOmh8K9wxIdFemobIAr63ZA0UtIWoIB8sboRV7U/LVINdb1OZokl8bv774CF7STHNhx8A+pJ/A6faHs8Q02Dtq3BR67hnNepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUGJVy9MKFAadviJiXnIN5zeOpHz4uyFhM3aDK2Bh4Y=;
 b=Vu4dppB4SQK4sQK9lMafIncL8e/67/kH5nKPtH/R8/hPjxHiWKrHKHESvj8fhtwxxxf+e70f7+ySzAaVSnkufKVJUaEEjZQbDd3B0YXi1NW/VY2epG0yR5KfgorbolsgHjSUAeDLQxqsjmi4u0xDEWqXWH2RkJJwnW6HlLQxrr4EhoL3GfNg65Hm0H1gI79lqAQcJYezPN2o0MAj3HLWdW0DG68ib/MwPq2WcCrIKndzJvPrfbt249q9u0HC6kK37sQo1rKW/QhI2sBHEbDFL9BFOiK2rKTEpzOrh4de2T/2NfVR9WotI1c6kfmLeFB1Tfg3SxtveM1PCS28CyJEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUGJVy9MKFAadviJiXnIN5zeOpHz4uyFhM3aDK2Bh4Y=;
 b=Qasxhf/Gr/ozi/keBbgzZyD8BrdUCVfamhog9oHtMStMk53SQHo/9FVaAjmxoUk/icbUZqOoOeum8AFpVeDN2Iwf+gtpVkbJ4EPqDweSMeovXF1KqWTGdnPCdbcwfQQqSGf+7VDDY9TSV8VwkI5Npfjji9h7iLSH/Ed7FHFw6Yg=
Received: from MW4PR04CA0157.namprd04.prod.outlook.com (2603:10b6:303:85::12)
 by DM5PR12MB1626.namprd12.prod.outlook.com (2603:10b6:4:d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Wed, 15 Dec 2021 00:09:42 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::27) by MW4PR04CA0157.outlook.office365.com
 (2603:10b6:303:85::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17 via Frontend
 Transport; Wed, 15 Dec 2021 00:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.16 via Frontend Transport; Wed, 15 Dec 2021 00:09:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:09:40 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Ani Sinha <ani@anisinha.ca>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 25/47] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Tue, 14 Dec 2021 18:01:03 -0600
Message-ID: <20211215000125.378126-26-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0587d17-faa0-45fb-c32d-08d9bf5f3123
X-MS-TrafficTypeDiagnostic: DM5PR12MB1626:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB162651ADC7D5173D0A172FE895769@DM5PR12MB1626.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2088tey2ViL2BD9AHEGjItw1sphPrKVIhznu5rTBXSGgE+PJVgr9eyYbQgzJNfJOsiw1IcufpyFvHowZgNnwyA6P4eifI/4PnNdq7pufiTqrJv7ds19bZyneLNYpIOYXAVLhvOSTorXYmW23ckbfLZ8kMuRj54Xk07i9kaWHv8KqyiZANd+XWzvRPZoDC80aCmnFRVInfL0Zcpq8mxkhLEzW3HR5v+b+e1xDjf3ZAbeYTCw9bXEAkBhDJdQhPugEEG1UpUbmLnHbpNHOOVlY+6/FkrCcXHVn0oBUtSD4H5EmHLBBNeLgfB9MQAl1r34gnPPj1zrHJxccxWPBvRyCJyVxtOpQtflRjs1gY7XQo5GCFT7zRaX8mcn08qdBYWC8dONiPsvWEHkFIkudJMuka8x5Uvp6BUUhD7q3ClOJFLK/g2Mh0sXXiS/jJrWq1jCG4pFCplZUmXvwB5Uwb2vv3Ttw4fje1obP/M6Pq6Klkiz9e7oDDHPQDVwfcwCPI4bPrHcFdPfRoJKMy6ns0iv6YoP+hG0yw7YEnyyJcXG10rLuvho12nkyfpDyT7b++jRXGpoyr1RY7an/Wtl18S4eZyB7d0zME32PZ3UoQEh+iHf3Je7IKmb174SERrbJJeQpgpYgm0QrpJ1Cgt9xi1GsAiG0tErPMFp4jkomu3pku+Sr6ASF8F5SSg3/J+EaQ4zUzcpNsyxiIlsN7aUnvpS2lpVqk6QYTroetdUfGDvkZHqtysC4KINAwmwR/yXoILO/ArKBjnxMqEwWZjKZiJLz7G+0w4TyzKoUip7FuJ3T+g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(336012)(508600001)(86362001)(2616005)(81166007)(186003)(5660300002)(6916009)(36756003)(16526019)(70586007)(44832011)(70206006)(426003)(47076005)(26005)(83380400001)(356005)(8676002)(1076003)(4326008)(82310400004)(54906003)(2906002)(8936002)(6666004)(316002)(40460700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:09:41.5142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0587d17-faa0-45fb-c32d-08d9bf5f3123
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1626
Received-SPF: softfail client-ip=40.107.94.55;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ani Sinha <ani@anisinha.ca>

commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
added ACPI hotplug descriptions for cold plugged bridges for functions other
than 0. For all other devices, the ACPI hotplug descriptions are limited to
function 0 only. This change adds unit tests for this feature.

This test adds the following devices to qemu and then checks the changes
introduced in the DSDT table due to the addition of the following devices:

(a) a multifunction bridge device
(b) a bridge device with function 1
(c) a non-bridge device with function 2

In the DSDT table, we should see AML hotplug descriptions for (a) and (b).
For (a) we should find a hotplug AML description for function 0.

The following diff compares the DSDT table AML with the new unit test before
and after the change d7346e614f4ec is introduced. In other words,
this diff reflects the changes that occurs in the DSDT table due to the change
d7346e614f4ec .

@@ -1,60 +1,38 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.multi-bridge, Thu Oct  7 18:56:05 2021
+ * Disassembly of /tmp/aml-AN0DA1, Thu Oct  7 18:56:05 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000020FE (8446)
+ *     Length           0x00002187 (8583)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xDE
+ *     Checksum         0x8D
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
-    /*
-     * iASL Warning: There was 1 external control method found during
-     * disassembly, but only 0 were resolved (1 unresolved). Additional
-     * ACPI tables may be required to properly disassemble the code. This
-     * resulting disassembler output file may not compile because the
-     * disassembler did not know how many arguments to assign to the
-     * unresolved methods. Note: SSDTs can be dynamically loaded at
-     * runtime and may or may not be available via the host OS.
-     *
-     * In addition, the -fe option can be used to specify a file containing
-     * control method external declarations with the associated method
-     * argument counts. Each line of the file must be of the form:
-     *     External (<method pathname>, MethodObj, <argument count>)
-     * Invocation:
-     *     iasl -fe refs.txt -d dsdt.aml
-     *
-     * The following methods were unresolved and many not compile properly
-     * because the disassembler had to guess at the number of arguments
-     * required for each:
-     */
-    External (_SB_.PCI0.S19_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
-
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

         Method (DBUG, 1, NotSerialized)
         {
             ToHexString (Arg0, Local0)
             ToBuffer (Local0, Local0)
             Local1 = (SizeOf (Local0) - One)
             Local2 = Zero
             While ((Local2 < Local1))
             {
@@ -3322,24 +3300,60 @@
                 Method (DVNT, 2, NotSerialized)
                 {
                     If ((Arg0 & One))
                     {
                         Notify (S00, Arg1)
                     }
                 }

                 Method (PCNT, 0, NotSerialized)
                 {
                     BNUM = One
                     DVNT (PCIU, One)
                     DVNT (PCID, 0x03)
                 }
             }

+            Device (S19)
+            {
+                Name (_ADR, 0x00030001)  // _ADR: Address
+                Name (BSEL, Zero)
+                Device (S00)
+                {
+                    Name (_SUN, Zero)  // _SUN: Slot User Number
+                    Name (_ADR, Zero)  // _ADR: Address
+                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                    {
+                        PCEJ (BSEL, _SUN)
+                    }
+
+                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                    {
+                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    }
+                }
+
+                Method (DVNT, 2, NotSerialized)
+                {
+                    If ((Arg0 & One))
+                    {
+                        Notify (S00, Arg1)
+                    }
+                }
+
+                Method (PCNT, 0, NotSerialized)
+                {
+                    BNUM = Zero
+                    DVNT (PCIU, One)
+                    DVNT (PCID, 0x03)
+                }
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
-                ^S19.PCNT (^S10.PCNT ())
+                ^S19.PCNT ()
+                ^S10.PCNT ()
             }
         }
     }
 }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211007135750.1277213-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
(cherry picked from commit 04dd78b9e85720226a148eef54b45cb02b463034)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 51d3a4e239..921f676e4c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -859,6 +859,23 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_multif_bridge(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".multi-bridge",
+    };
+    test_acpi_one("-device pcie-root-port,id=pcie-root-port-0,"
+                  "multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x2,bus=pcie.0 "
+                  "-device pcie-root-port,id=pcie-root-port-1,"
+                  "port=0x1,chassis=2,addr=0x3.0x1,bus=pcie.0 "
+                  "-device virtio-balloon,id=balloon0,"
+                  "bus=pcie.0,addr=0x4.0x2",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_mmio64(void)
 {
     test_data data = {
@@ -1528,6 +1545,7 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-- 
2.25.1


