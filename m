Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A3331355
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:26:31 +0100 (CET)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIiE-0007PB-8Q
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lJIhO-0006zk-0C
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:25:39 -0500
Received: from mail-co1nam11on2059.outbound.protection.outlook.com
 ([40.107.220.59]:60384 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lJIhI-0003Ef-WA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:25:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTB0Pn/sK69OZAYiUAD7+nWGH9gElTvhPxwu/s4zIEpavgSJMMYzdtDGF6tZAstFYcZGnQTfn+et1t6DFsdRJZI9vFOol2jxNzz6OVHNm1MHN/43LTBm/m7866TpTChQpjJikD3wX70qbhxlYifu6EQOWNRu3yniI6DSE+gsLy9QZL4w/5KtZaQ0QY95JbB8wj386PgZdSBiU959PeSW71zfkMEkpUtI2VcfC183uCMLG3igQY0JwKeIBp718KzPlI5GcsiIx9YNvQirMCEc0naRvxgFdma2Fqo8axixfHjTtU2pzFmYjwFtVAkaK5EQ7sJ6/bdw67lfDhgjf0ABQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QUOTHA8mlGcBk7sAVyDsCKEp6QcbCC30ji2mWywHyc=;
 b=hkm/6wzEyIdtZo2edj9QZUJQzhcbuiDQDlPV4F7BlkMqQjgEOPQXW3Qb+2iVb0rAa/Z25e1hHVSRzQ7mPrJpQUa+UAUrKcy6CWmY/zaOil7/2Ci9dxCdD9Ki+llyVOampKpiTs4aORAd75/SOSq3cYtAfqASDn/un2EtlI1STBXOethTbRLPcsBsxXsNt22MptUvsa1BKnEAUUBeQRnYQT3EmM74Ug2XFEbWYzxjvomb3bvbix2kC5sm4BDcPaf5BDaowRQkhDexVfTomBCw6xg0JMzQ1b2u3+h7irrt6XbGsWFYiQsZXyYehff6a/i3BYh4K5tKZSBYus48yvDZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QUOTHA8mlGcBk7sAVyDsCKEp6QcbCC30ji2mWywHyc=;
 b=TsQ5UNExLXJxjVpV1DcaCCr3JCd8gAmdhDRmRodjc6ngRX6Q1ZzZeQ06+Btwwyjb0uQtdKlt2cJnJUS0GB3oGlU0KK/xDaw0uBGeJa3cAT8VDm7zvuCodex6YELtw80FphMiR3DdlFzbQyjLYK2Dg7nf+BiR7WUPRVcKV0SMMQ8=
Received: from DM3PR14CA0143.namprd14.prod.outlook.com (2603:10b6:0:53::27) by
 BYAPR12MB3014.namprd12.prod.outlook.com (2603:10b6:a03:d8::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Mon, 8 Mar 2021 16:10:23 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::70) by DM3PR14CA0143.outlook.office365.com
 (2603:10b6:0:53::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 16:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 16:10:22 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 8 Mar
 2021 16:10:21 +0000
Received: from dhcp-10-24-130-144.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 16:10:18 +0000
From: Tarun Gupta <targupta@nvidia.com>
To: <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Date: Mon, 8 Mar 2021 21:39:49 +0530
Message-ID: <20210308160949.4290-1-targupta@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a75f47e9-263b-401c-a496-08d8e24cad49
X-MS-TrafficTypeDiagnostic: BYAPR12MB3014:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3014C64F64E9BF3671444707B8939@BYAPR12MB3014.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BopwoO/Mb6fYwkAMtwfD3OU6rDGiQbqBfSu2OtNAnNjqoQsptDRFbBEBy2OdRwEa3APzYGzYKaoBDFRa0+5AxSQT7WCT1TY+X1h1aQtTgTW8ehuZPN6KaNeELMXJPeL0seIHBVd5NGSYH6MhVUzmgU1GXPtv1ILaGgTBP2FOSgv1Sc0VVwHoLQ5FqAR9CoiEk5m1QgwXfHHOesRaoWNWWi4Os8ciLpb6aKVmBqIhCKLp0XOtlL+gyLLYBQk3bztpeHWdpw5RaE1F853NvykkN3VVy2aHF6UQ1o9GcgjP8RUL5f+lX+G/g0gABpsCq246BfkgEyudzyyOP/uXjRhDxW9eQv2kE++XpuorLdmwWacRfMdFtal5iUKDVwzVnLLORqZckf5JZMK76T+T86yUGmKDWiEvKjrnRPWIgz9ZGZZAmroB9MLK5bndXdhubNj+XX/7y637XmTT8xbWnOdw4M2GiEHb74gRuIa+Hh2JFmmYskCLQu+yDw4WD7w7M6/Hjz8dWY41WX08FhnSeH0dZXPhH8UJpcp6AXBXn4SXp0tvneAmnJiLGuKSWcWC4mCoZGPRLffbcbHd4g0CIskjdLHblVSADI23HPmyWLxbvCZiC6adh9B8vxujNoRwVORr2sZI4g+RjkdqQbgnFoQoPrDVrb050Bwp0xBP6UjH7RCrZn3jyVAsI8+PHm+5X75/s/u63czBvss7dDz+6x2e7e+JDu2p1wgJUpU1pLpUUw9WEQHN2k5LwaplBFIm7Xbyrtk8hZk9HMr7FWOBzilVCg==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966006)(36840700001)(356005)(36860700001)(86362001)(70206006)(2616005)(107886003)(8936002)(70586007)(83380400001)(7636003)(316002)(426003)(26005)(36906005)(966005)(7696005)(336012)(82740400003)(36756003)(8676002)(186003)(82310400003)(5660300002)(110136005)(2906002)(4326008)(54906003)(47076005)(1076003)(478600001)(34020700004)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 16:10:22.4302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75f47e9-263b-401c-a496-08d8e24cad49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3014
Received-SPF: softfail client-ip=40.107.220.59;
 envelope-from=targupta@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: cjia@nvidia.com, quintela@redhat.com, cohuck@redhat.com,
 dgilbert@redhat.com, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, dnigam@nvidia.com, philmd@redhat.com,
 Tarun Gupta <targupta@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VFIO migration support in QEMU is experimental as of now, which was done to
provide soak time and resolve concerns regarding bit-stream.
But, with the patches discussed in
https://www.mail-archive.com/qemu-devel@nongnu.org/msg784931.html , we have
corrected ordering of saving PCI config space and bit-stream.

So, this patch proposes to make vfio migration support in QEMU to be enabled
by default. Tested by successfully migrating mdev device.

Signed-off-by: Tarun Gupta <targupta@nvidia.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f74be78209..15e26f460b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
                     VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
     DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
-                     vbasedev.enable_migration, false),
+                     vbasedev.enable_migration, true),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
     DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
                      vbasedev.ram_block_discard_allowed, false),
-- 
2.27.0


