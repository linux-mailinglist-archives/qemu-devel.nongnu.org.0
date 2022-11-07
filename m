Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4AC61EA1D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 05:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ortWJ-0002RI-AU; Sun, 06 Nov 2022 23:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ortWE-0002Q2-OH
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 23:13:55 -0500
Received: from mail-bn8nam12on20610.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::610]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ortWC-0005GL-Ck
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 23:13:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPsYNbjLFfxNGmmSLpMFe3jVvjFlQ2B7iO8nRlB0q7fTTXBy2ShtLz0S/otxs1X2LeGNkGFaxbWActsQ2LzT2jcODMeGrFEzMgvu1gSxrOnX2PwZCrMvxDYKDC7f8RoQm20kyapsgada6AdJQE+iDhfezn74Kw28TZRNfgsZX2FCXhakXYrJ7CLm4wGKfrdmQX+tVI5y2lhdojvWHotHPNOolkILipH6FnmKWsA2NCz+kQ69Bhmc043aafPDACsgnUEEn7tHy9vDLXUKjXaQA23fGUgkDB3hwe6ebqT8j9Kz08XvqRuxWxfqW8cfFUQzRTPS4C3RJnpk0A/rG7HM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRIrVzGyoncgmRz89jlH8TmeeDLTOqBdn1AEb6i8hwE=;
 b=C9id0YwHQNqrPPzukxINU4iHbomwMzugSgF+yyqOxVEcVN4FCXUz4uOpjZlDar46nkd7MKq+sSIK//V5ZDWefJVrw3fsvqiPb1Sr+7blCHEy34Gfm9ucBoqTDItu55mXREGqQe0b4mZb89LZVN3SFxiLv6auvgICoZf89GY3ycsvz6Q/Mo4y/gaDqEaeFcsBzbRt8BRNRFhWNs79RWoL+liQeF6uCiv4u8H2XceGoYg2Z0k7t0P4XtOsHOXMheCCnQb/jBbj8BsKnsQnnH/KOSDbJFUXtjGcmV2dk3rgycI/zoXFvJPiD3gwnfwPwk0WDIY9GqcEQVmN0tDTbdY8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRIrVzGyoncgmRz89jlH8TmeeDLTOqBdn1AEb6i8hwE=;
 b=i8IlnBco5y0YF1INIdrKz0aVaUlo1R9Cwd5TaL53Bqe+4ONHUxDMFEEV5UhZ50Kr45tjcvlRM1Fo1ifCoIhcFkiLEmITU6QHK1J0VyctQOLuMSv4UoTX9hJKfZF09SytmHHGj7JkWaWL+trChVWy3N41NbdvP/odJfwE3ZAVpgOHSwoaKhh4LSV9ywQjEY+r/6g+MLjg3jQ3RAH7eocBNs+ZnC337AA6bOx1n/gtRjqrkCRRNVz2wgZrhYN9zyQGIHj1I4E2LvSPhG7zz7s2vULGJ8Bt1Z96zOcFTtw8qxN5sQ3A9Q9qE3OfZYz9lpTwOSELmy1oo0el71qqRQwY+g==
Received: from BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 04:08:48 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::2a) by BN0PR04CA0042.outlook.office365.com
 (2603:10b6:408:e8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Mon, 7 Nov 2022 04:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 04:08:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 6 Nov 2022
 20:08:35 -0800
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 6 Nov 2022
 20:08:33 -0800
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v4 0/2] vhost-user: Support vhost_dev_start
Date: Mon, 7 Nov 2022 12:08:16 +0800
Message-ID: <20221107040818.619072-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220629022517.2600911-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: b783d5cf-ed6c-453d-2025-08dac075c527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yuSW3CVU9/oiOT37kNtYuSYbrAI9IaG+uMa1RLAz0fCQG+3PuoNpLm4tagJpqSso/Ue/815KTrSFK4OJkkjPq775s9MzhpH4TWi9ygo1h1/4y5Kld55Wo/j4bqkzuQq4217ETic4vA+FGwNStNJ+DzSqNnAanyA7oohbeUEa/c38m5jVHXW8WvVwtotN6u130DYJMUIhnmbY+DKu1whC0urAtbQXRlQtUK/7+jCYzChyKAARvKLBiHCGKPzpg89L1twzSB6HCvi/xW0XwBV3V7x/M4AgvZzdb/lH0MvmJXS3mmn5LAYWATm/YO3DvwuwJIL+vKt0nd4SgVUHPRPy93HLOBSpIiA/YJvm10uqbXrLaMwXs5oH4P3RVDP6Rj/sDHmr++qlF1XRcX6jWc98wzEoZqkTD6MBeBfvU9CsKD1G/eeDjhMNu/wfbrcXvlrvQUeBqPpg3imPydGYX3lj/a8lOx0KCFtAVTK49TGYNyieuub8qZZ1WtMvRV6uWBNT9e0uuVTr3HCzC9q2Pqt5ZvNcebHGO6YUxBicANgFd0QwPHcDFiFz+DvFxlTkbvaJXSFfBsvLSVEm/WNwHtuS+8TN5imZrQuP1YReUoo8+jBic9JyY9kEthbwtj6rNhb5B6jaY3Gbv2GCGIbvFfdyiaNRJ8NPDlYyeoE8r25Wfb1TGO6iUlujdpLKaMUu6DY8hxnsSl3bmHo4aOEWmaEPg3REiJeBsCg7LqrMqSG+p1w+6AuZHVQV1wOFyXD91QTHJS/lCpjk5GxQxvhXf0QaXA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(36756003)(5660300002)(41300700001)(336012)(8936002)(7696005)(6666004)(82740400003)(966005)(316002)(40480700001)(70206006)(70586007)(36860700001)(55016003)(8676002)(2906002)(110136005)(6636002)(83380400001)(356005)(7636003)(86362001)(40460700003)(26005)(6286002)(2616005)(1076003)(426003)(186003)(16526019)(478600001)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 04:08:47.5697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b783d5cf-ed6c-453d-2025-08dac075c527
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::610;
 envelope-from=yajunw@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The motivation of adding vhost-user vhost_dev_start support is to
improve backend configuration speed and reduce live migration VM
downtime.

Today VQ configuration is issued one by one. For virtio net with
multi-queue support, backend needs to update RSS (Receive side
scaling) on every rx queue enable. Updating RSS is time-consuming
(typical time like 7ms).

Implement already defined vhost status and message in the vhost
specification [1].
(a) VHOST_USER_PROTOCOL_F_STATUS
(b) VHOST_USER_SET_STATUS
(c) VHOST_USER_GET_STATUS

Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
device start and reset(0) for device stop.

On reception of the DRIVER_OK message, backend can apply the needed setting
only once (instead of incremental) and also utilize parallelism on enabling
queues.

This improves QEMU's live migration downtime with vhost user backend
implementation by great margin, specially for the large number of VQs of 64
from 800 msec to 250 msec.

Another change is to move the device start routines after finishing all the
necessary device and VQ configuration, further aligning to the virtio
specification for "device initialization sequence".

[1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html#introduction

v4:
- fix vhost_net_start_one fallback code

v3:
- rebase

v2:
- add setting status bit VIRTIO_CONFIG_S_FEATURES_OK
- avoid adding status bits already set

Yajun Wu (2):
  vhost: Change the sequence of device start
  vhost-user: Support vhost_dev_start

 hw/block/vhost-user-blk.c | 18 ++++++----
 hw/net/vhost_net.c        | 14 ++++----
 hw/virtio/vhost-user.c    | 74 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 92 insertions(+), 14 deletions(-)

-- 
2.27.0


