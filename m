Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDD474F35
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:27:44 +0100 (CET)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI91-0007jU-7d
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHqK-00073d-B5; Tue, 14 Dec 2021 19:08:24 -0500
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com
 ([40.107.93.76]:5600 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHqH-0005Gt-KD; Tue, 14 Dec 2021 19:08:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQf+PVunSroV+6CfdN6g9I0xyEkm10wuFf+N1mfJ6ECqpsaNMWnBRn3V+McC7MGpjLjsnSOtGUjhCpLK7d3zHgMkQfBUHp3Ddiisu8/qnQpe6ueoxjIZrv3yiIfXi8WyHR9kfGQzEvDTOC3NTsD3+DeFgn8oShwxMG1HafLGEoCyBB7kIsNRr9hBOu3S4kUASLgIFXnn0jJqJg7ZQinE8CogLIQJx6o3Fjdk3mWT3tUFwIJUs8cKKn4e++9syM0YNrDZZqYl6CPZckj+/KcBl3mh+A7Q24VjoLU0dfOR4wfCODUlGZ84X5yNEh89sl+1tKawg1kdTGCAvJFbFfbb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4izxwDlccvM/JuaIGtof56N7mFc5Hp/oNB80yeNv6PQ=;
 b=Bl5pFMdcCQn4bIHD2+/PZm4lKXdc6gg+MgE7BCJLe8PgB3Nr1PgecQ8M5JnN2fx1NtksrwUqgYqmGcslUlSYbp5h1fEi9ZUWbBOlPWrnpXJOPkNXtOJ0jIGURxWyGVgboVWRkvvlRHL5frOAraUpgIGZyoCILcNN6NX0QQbQXtX+2Dyihh/OA9I4rmSWanV4MAPiebI2IoOY+75q5VHR3xlH3lAGqPrwDZQSbrKg8fgSnpSQkSyN9n91JibeZRLOtytJ8Zd+DXdr6J14X8hGHgj6qhUcj+K0ew2D95DqGJJcw8B3k6AfYZwP+wuxGZsZ8e0yAQnBtoKLmurGSuVjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4izxwDlccvM/JuaIGtof56N7mFc5Hp/oNB80yeNv6PQ=;
 b=bZ2vyWQij3yFP0FqJHz0HnCOPpz8UjTOp/kqjOjev7ik9Ksloquth+oPLPqXa7oWkcJWZbDMsyj39Zfwgzb0i4mi2BHvS5a07XUUJeeEUaaJuT6biMMOecGK5LFiRis3tiMWtcYhouanUQKSSDlBJAsoQT/vn+7sHdxaXjNy4ZM=
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by MW2PR12MB4681.namprd12.prod.outlook.com (2603:10b6:302:12::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 00:08:18 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::4c) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17 via Frontend
 Transport; Wed, 15 Dec 2021 00:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:08:17 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:08:17 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Ani Sinha <ani@anisinha.ca>, Igor Mammedov
 <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 21/47] bios-tables-test: Update ACPI DSDT table golden blobs
 for q35
Date: Tue, 14 Dec 2021 18:00:59 -0600
Message-ID: <20211215000125.378126-22-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ac13a32d-3865-42a4-44a6-08d9bf5eff48
X-MS-TrafficTypeDiagnostic: MW2PR12MB4681:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB4681CBCA350055B45373657C95769@MW2PR12MB4681.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDPYhp5Mgc314bi4jrIon1/lbEZagczmw1vmG5ZfyW5NCJsq+QC8Waiu1AupK9jgs69Yh8qx3ErXrtzXNgrpI6zAi/8dkEg8f1aXYTQBhJVnCwfnIVxpp0kFv8RDksPhBzviGZ5USelurjPUmJswvvp4Y0HXI9DTSLrIr4pX06Bj3W53rmblSBXp01yAQh5mxxNLS0080Z/xhxMnSPxgMMRWftPlae47IJJqTJlHaSzmfgXepKOKbPQBcP48ZfqI+fdwWepX9b3MGk739FWB9b5MfETVWJIAoL+dBDD0t0omOg4Lb+Hho9xmaq2/7BucfdVWJUcWharx1SmOg8bs0CM4c+bTvRcfiRUFbni/GD0xyos7wQ/o5SX5A5A0+SCBuFIdBrcYsxNIsw7zSGvrHWRkYYXsI7PNVs17HXq7H5r1PV3U2XQ63J+wFEB2i9TPvZOiqK5l09lZzpEkQMjyhXqHUwNpxKeb9P/2xtbmNeF9AFvMOb1A7MJlJqDUI6vNn3EP5u4g7SAXzGG+vTEBl++jlTwhFDJ2K2W4yeCTePaFGn/k4a692KSinBOKX4ZToffAivRr+kbqG0W87ee54Z/JfzHJRfxksdLzqQDQwEWHCOSu0L/a6ZhUSfjHeLY2LbJykDqStb8AwQn3YjiJopi/ygQQp0gz0uSP2bNaKZLmSB26BAlBofkqzI/+Zv+MNDNjYylOQ5TMpa75hsHPvk5LWJNNCgtfa+s/ymlmOQ/PqbdF7IRnW34SQURcCgBlQ790kK+6wp9oSrEPs88ZDQ360hgUdUmD3V74ExrJiSY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(19627235002)(70206006)(5660300002)(86362001)(8936002)(336012)(6916009)(316002)(83380400001)(15650500001)(6666004)(186003)(70586007)(2906002)(16526019)(26005)(426003)(1076003)(54906003)(47076005)(4326008)(44832011)(508600001)(40460700001)(36756003)(82310400004)(36860700001)(81166007)(8676002)(2616005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:08:17.8830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac13a32d-3865-42a4-44a6-08d9bf5eff48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB4681
Received-SPF: softfail client-ip=40.107.93.76;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

We have modified the IO address range for ACPI pci hotplug in q35. See change:

5adcc9e39e6a5 ("hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35")

The ACPI DSDT table golden blobs must be regenrated in order to make the unit tests
pass. This change updates the golden ACPI DSDT table blobs.

Following is the ASL diff between the blobs:

@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Tue Sep 14 09:04:06 2021
+ * Disassembly of /tmp/aml-52DP90, Tue Sep 14 09:04:06 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00002061 (8289)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xE5
+ *     Checksum         0xF9
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

@@ -226,46 +226,46 @@
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 IO (Decode16,
                     0x0070,             // Range Minimum
                     0x0070,             // Range Maximum
                     0x01,               // Alignment
                     0x08,               // Length
                     )
                 IRQNoFlags ()
                     {8}
             })
         }
     }

     Scope (_SB.PCI0)
     {
-        OperationRegion (PCST, SystemIO, 0x0CC4, 0x08)
+        OperationRegion (PCST, SystemIO, 0x0CC0, 0x08)
         Field (PCST, DWordAcc, NoLock, WriteAsZeros)
         {
             PCIU,   32,
             PCID,   32
         }

-        OperationRegion (SEJ, SystemIO, 0x0CCC, 0x04)
+        OperationRegion (SEJ, SystemIO, 0x0CC8, 0x04)
         Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
         {
             B0EJ,   32
         }

-        OperationRegion (BNMR, SystemIO, 0x0CD4, 0x08)
+        OperationRegion (BNMR, SystemIO, 0x0CD0, 0x08)
         Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
         {
             BNUM,   32,
             PIDX,   32
         }

         Mutex (BLCK, 0x00)
         Method (PCEJ, 2, NotSerialized)
         {
             Acquire (BLCK, 0xFFFF)
             BNUM = Arg0
             B0EJ = (One << Arg1)
             Release (BLCK)
             Return (Zero)
         }

@@ -3185,34 +3185,34 @@
                     0x0620,             // Range Minimum
                     0x0620,             // Range Maximum
                     0x01,               // Alignment
                     0x10,               // Length
                     )
             })
         }

         Device (PHPR)
         {
             Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
             Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
             Name (_STA, 0x0B)  // _STA: Status
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 IO (Decode16,
-                    0x0CC4,             // Range Minimum
-                    0x0CC4,             // Range Maximum
+                    0x0CC0,             // Range Minimum
+                    0x0CC0,             // Range Maximum
                     0x01,               // Alignment
                     0x18,               // Length
                     )
             })
         }
     }

     Scope (\)
     {
         Name (_S3, Package (0x04)  // _S3_: S3 System State
         {
             One,
             One,
             Zero,
             Zero
         })

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210916132838.3469580-4-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 500eb21cff08dfb0478db9b34f2fdba69eb31496)
*drop dependency on 75539b886a ("tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs")
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8894 -> 8894 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  12 ------------
 12 files changed, 12 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 842533f53e6db40935c3cdecd1d182edba6c17d4..281fc82c03b2562d2e6b7caec0d817b034a47138 100644
GIT binary patch
delta 65
zcmaFp@X&$FCD<h-QGtPh@#jV^erCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
VF>+tn9LO9j!+e0}z~trfy8v~b6W9O%

delta 65
zcmaFp@X&$FCD<h-QGtPh@##h`erCoalckttrOxnhu|zj=2fKR3J3AS;dMQLVIQjVo
VF>+to9LO9j!+eD2$mHeny8v@q6W9O%

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 8d00f2ea0dd78f962e136273d68cb0c568e43c27..8c1e05a11a328ec1cc6f86e36e52c28f41f9744e 100644
GIT binary patch
delta 65
zcmeD4?(^ny33dtTQ)OUa+_sU6pPBK%WGQA@sS`Y0EYXeJ!LDBM&Q1odUJB6-PJX^Y
VjNBJC2QoJ(G9TbMF!_qgE&x%Q6Po}4

delta 65
zcmeD4?(^ny33dtTQ)OUaT(pskpPBK<WGQA@sWUuWEYXeJ!LDBM&Q1odUJB6-PJX^Y
VjNDf?2QoJ(G9TeNGWm+iE&xwf6Po}4

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 55ad4bd7ab4759d68031b2f1d0307355a7332fe7..6f1464b6c712d7f33cb4b891b7ce76fe228f44c9 100644
GIT binary patch
delta 66
zcmewz`a6`%CD<k8w-y5fBlAWserCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
WF>+tn9LO9j!+e0}z~<%hA>06yixa5;

delta 66
zcmewz`a6`%CD<k8w-y5f<NJ+V{LG9;CQC8PN}b{1Vu^0#4tDj5cXl#x^-_p#aPspF
WV&uNEIgmM6hWQB3k<H8HL%0FOM--_5

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index ccde2add9f87db0c0eaf0cc155717d5744e4ef40..f8337ff5191a37a47dcf7c09a6c39c4e704a15bf 100644
GIT binary patch
delta 65
zcmdn!veAXhCD<jzP>F$oF?J&tKQrTj$x_U+QYU!0SfU%bgI&Giot+F^y%eGwocw%)
V7`ZQO4rErAV?MxhU~;+QE&wzZ5?TNN

delta 65
zcmdn!veAXhCD<jzP>F$o(Q_jgKQrTz$x_U+QfGL$SfU%bgI&Giot+F^y%eGwocw%)
V7`d-(4rErAV?M%jWOBLUE&wso5?TNN

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index b062e30117f955c7a2ac9629a0512324bbd28bf2..fe5820d93d057ef09a001662369b15afbc5b87e2 100644
GIT binary patch
delta 65
zcmccad)=4ICD<k8x*7umqx(iKerCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
VF>+tn9LRi9iTMD}fyuIJy8v<O6QKYA

delta 65
zcmccad)=4ICD<k8x*7umqwz*AerCoalckttrOxnhu|zj=2fKR3J3AS;dMQLVIQjVo
VF>+to9LRi9iTMc6k;$@Zy8v&d6QKYA

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 1c5737692f56fc678e685a4ad0bb1df38d487a14..631741065860fd5036aa303904dabd1d2839f9c6 100644
GIT binary patch
delta 89
zcmZ4ExW<voCD<iojRFG$qwYqoC}xWTJX{>njRFDA!6D88&YqzPK*B{Kx*^!rE1r@2
p1P>QWbR##2<LqSM>IIZ=^79R1<i4<Z4s);!^8ua%lRwGt0sv3%8ejkb

delta 89
zcmZ4ExW<voCD<iojRFG$qvS@eC}xWzJX{>njRFDA!6D88&YqzPK*B{Kx*^!rE1r@2
p3=bDebR##2<LqSM>IIZ=^79R1<i4_b4s);!^AVmSlRwGt0su@a8ejkb

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 7b6f6487b229cac3424a5215c8f1755c0c85310c..9bc11518fc57687ca789dc70793b48b29a0d74ed 100644
GIT binary patch
delta 65
zcmV-H0KWgQOR!4{L{mgmuq6Nh0qd~}4+8<flNtjZ8psR^1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnNxQ3IkO1HcTxllCOKc2g93

delta 65
zcmV-H0KWgQOR!4{L{mgmuq6Nh0oSn#4+8<jlNtjZ8q5p|1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnZ#Q3IkO1H=r(llCOKbPp7I

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 2e0a772a85275c9c3b4c9317d98cc7c3d27417f3..713288a12ef2b70a20b4e8836c036ba4db3a57a8 100644
GIT binary patch
delta 64
zcmV-G0KfmsNy|wJL{mgm%On5*0jIGF4+8<flNtjZ8psR^1Y3a%Q$<Q&Lqae`N+4T+
WLQYLm0SnNxQ3I?X1HcTxk|fJz%oC*m

delta 64
zcmV-G0KfmsNy|wJL{mgm%On5*0h6%`4+8<jlNtjZ8q5p|1Y3a%Q$<Q&Lqae`N+4T+
WLQYLm0SnZ#Q3I?X1H=r(k|fJxh!dp%

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index ceb61f4115c2ccf4bcbb0d529551236933ecee15..e8202e6ddfbe96071f32f1ec05758f650569943e 100644
GIT binary patch
delta 65
zcmV-H0KWgzKhr-7L{mgm(;ol;0mHEhfdT=*lZ*l#8psR^1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnNx!va$r1HcTxlNlenr{@&9

delta 65
zcmV-H0KWgzKhr-7L{mgm(;ol;0k5$NfdT=<lZ*l#8q5p|1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnZ#!va$r1H=r(lNlenrK1$O

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index a3f846df541a70ce0730d0351954b78818bbcdd0..151e7cf42953f3f5fe61ff0140ab7b976fe9e5b8 100644
GIT binary patch
delta 65
zcmaFv@Z5pRCD<h-U4emtaq&hjerCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
VF>+tn9LO9g!+e0}z~r^^y8vk#6QBS9

delta 65
zcmaFv@Z5pRCD<h-U4emtv40~MKQrTz$x_U+QfGL$SfU%bgI&Giot+F^y%eGwocw%)
V7`d-(4rGp$VLrlhWb#`1T>xg*6QBS9

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index d1433e3c14570bbd17b029a9aec6bc53134c3b7d..c92d4d29c79352a60974ea9f665d0b9a410a4bac 100644
GIT binary patch
delta 66
zcmdnzy3du%CD<iopArKD<HL<y{LG98CQC8PN}b^0Vu^0#4tDj5cXl#x^-_p#aPspF
WV&uNCIgmMChWP-`fz6xcxtRfqZWC_+

delta 66
zcmdnzy3du%CD<iopArKD<JpZ|{LG9;CQC8PN}b{1Vu^0#4tDj5cXl#x^-_p#aPspF
WV&uNEIgmMChWQB3k<FXsxtRfoDid!2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index c06da38af3..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,13 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.25.1


