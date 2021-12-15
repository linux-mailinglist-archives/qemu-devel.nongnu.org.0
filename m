Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA953474F41
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:30:50 +0100 (CET)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIC1-0006Vn-WE
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:30:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHrJ-0000n4-W7; Tue, 14 Dec 2021 19:09:26 -0500
Received: from mail-dm6nam11on2073.outbound.protection.outlook.com
 ([40.107.223.73]:12957 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHrH-0005Kn-Rt; Tue, 14 Dec 2021 19:09:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT/uZTthpWOYVHuQXSeftcaklFBsyrkkxJ/8jAxzMWXQH6zmw8gZB4NwxABHK0JvsOkDcJezLR8hMm1dTGYndYh4CpnMPx3KW6iFCSdPG9uTWA8Ro1saUYSEeYLcna0mttgX24VIA3TKSXLrcNmethxn2ipHBzNd3USgyErCmpYr5mPQOdhe9FCkrKhAHpHmyjQCVxCRc1fO8N8cp/l9N0COB6taiBdPvLtOXceg9WsSK2JsVucJt7kTlllcekPSCZj/8TZDV5CFbEFQrdSZeGH6BpE3oZnyRaDkupqaOJzrBxXvOT5xbH9dfWhXQGhF5CA9B3stcQ3wBW/uwXxiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PilaNm/eLzo+8DV5CCqH2aP8mI7kdYzWft/M9wReY3Y=;
 b=DwoV/7855wjexq457+Bcaz288h34kUxmrA0gcQh3zhIqpcwrZRKPLaMTyhn89FH9MutqPMb8E7zY+KTalUu5Ctf9F6TyJEC3tLRR2tDfC2FoyajK7+BNVuGyAxNDthPFHxKyk95hos9A1KncMli40XsuiIcz+TQXwr2q1byWfhq/zvZ7pv72nOYu7C7Hs691wgpwaG6ty6E2b0rFJC3iHWfTLtBfNLRoP19X5v8XAqyHShQ+I58AE/o5ez6JpbTV0JNEoHFHbK8j2Sd72Ako9jY0wLGrvd/31td5f6bcCrC1COkS3vy/v2djCDlOtkcrcxELeoO6Nkp2JEKtDZdg6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PilaNm/eLzo+8DV5CCqH2aP8mI7kdYzWft/M9wReY3Y=;
 b=XCXau5rskwDaQKBAN6S9OfvFym58K0/2ttRAq9LixmSVIP8dHdBsXs7q2l303O9CuEyipj6z60j69d46G8YtU/rR61a7AuVDuLtRuQk4YoppwffJMDmidL5Vm7YhqT7PdOALO2FsLvlLNI9EtJy1joCxc7P+rw0/3YLV/i6fmHM=
Received: from MWHPR10CA0058.namprd10.prod.outlook.com (2603:10b6:300:2c::20)
 by CY4PR1201MB2533.namprd12.prod.outlook.com (2603:10b6:903:d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:09:21 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::a8) by MWHPR10CA0058.outlook.office365.com
 (2603:10b6:300:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 15 Dec 2021 00:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:09:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:09:19 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Ani Sinha <ani@anisinha.ca>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 24/47] tests/acpi/bios-tables-test: add and allow changes to a
 new q35 DSDT table blob
Date: Tue, 14 Dec 2021 18:01:02 -0600
Message-ID: <20211215000125.378126-25-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 64717c27-b7d2-48ce-2578-08d9bf5f24aa
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2533:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25332155F2953AD0D5275F7095769@CY4PR1201MB2533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8ZIZ0Wv4x0u0Am7vbC52xGdvcgYgq/TBB/cRVSZ6qYer7ggzAH3wc1HQljNDIGpRNvXAzsrfnOLzW0bHBsFABr0m2vUjcMu7N7HhpSMYPt8TlrX380Xrbn43/nyv5qoWk6ualZ/e0wjhpdhGdx8lXlKLgtBvoALBiwj+at1QCKvOtom4bZk4KiIv2nXcLeVXAQee8nX2WFOaasc0ED26U2wexuRwf5P8fmrFTsWwwAMqgQ4aT1msjrNsW4a0IlYy9dvHXBWqFO3BbcesN2asUZ6LKgwMepANSOrUdckAgvOc8zuX/CUTnxBu/2elPP1TuTbtmN517+GS2i0pEFJKIwBEqz82E1Ht29gWNONT6bzV8MCcTJCIx1m+LrzvGmR7YM/5yP1R63NkbKQSbTCL4tHZTTbhOWHV55UEYuigyo26kGBaJJzS0pwyKarhT1+EM1qSZ4kXKlkQ6XIWBIaCMAFx5gGz3mnDIbcS5LtthLO2w0/Rn+Y2JQNiXVbG5KrSnCIPxgLnGoW9G1pkpc2DrpeK1a7cEOnDxVKGEYp1vO9G5ENCSPNjrO/GKpIHNiPZn8Z0S/+ngiITQHfJ4AVQV+IHtK/wJPCtQKohaIWsWJYAYCz89vdwjQgbV0nLx2nFHIh56p5pvh9Dm6IAYQVzQtNBF4K04NXW3LjSwhOhLlIWa+QjHqcnPFDd17aMM/YT4zh1GXucDOlX9QbtIVqEcXX8gg+snaAdFrFzQkHu6Wq9GZKZiEBI0pr7dB8c+EgkqBIjILJ6EWD3dkWVQW8x4HUqfbLsOTX/JbmJ3k93g8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(2616005)(336012)(4326008)(316002)(44832011)(1076003)(86362001)(5660300002)(54906003)(508600001)(426003)(40460700001)(8936002)(36860700001)(70586007)(6916009)(356005)(186003)(70206006)(16526019)(83380400001)(26005)(82310400004)(8676002)(81166007)(2906002)(36756003)(47076005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:09:20.6002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64717c27-b7d2-48ce-2578-08d9bf5f24aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2533
Received-SPF: softfail client-ip=40.107.223.73;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

We are adding a new unit test to cover the acpi hotplug support in q35 for
multi-function bridges. This test uses a new table DSDT.multi-bridge.
We need to allow changes in DSDT acpi table for addition of this new
unit test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211007135750.1277213-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
(cherry picked from commit 6dcb1cc9512c6b4cd8f85abc537abaf6f6c0738b)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/data/acpi/q35/DSDT.multi-bridge       | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dabc024f53 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
2.25.1


