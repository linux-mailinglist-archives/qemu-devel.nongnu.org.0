Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F0407E98
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:26:53 +0200 (CEST)
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSJg-00030h-GQ
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mPSIP-0001q0-M9; Sun, 12 Sep 2021 12:25:35 -0400
Received: from mail-bn8nam12on20626.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::626]:45760
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mPSIN-00051J-FQ; Sun, 12 Sep 2021 12:25:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3AwuWJqfl7WdDvN1mMz6wm1hh18xw/Fp73gPp9/4ZNP+HsY0c97lF6ZV9YspZB8FxknXcKSKErVm4PKtvJPGq8youPfwA3I+90pb4Dx9LT8/Sv91U7G7KXG94lWxC8Ml2V2s/JXkyXdh0KSlK4bs23tSClEfH8t02BDb4j6ZX8di+Ey2AKhOLWLctNFnMVxA67g41BXwQkiX3NeHBSVE1EXSNUU4fXJjeZ4fxYL2Nhgh0+BRMuj6SaObAR2OS735+UGriEGJzQvoiH4wnj8B6368eHJg0oWDjfH0stVoXrpZhCczciJs3EceuoYoOSdzUxy5+e/GTmtupGqFwOGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qISc3Md4ly0XMmteKrjqsT8YOENcaJrou35JX0zC5ow=;
 b=i+BwQhZQ2ecwDQzqE9Je9uxj4/pbySDuJhYBgdXfm83Ma9pSNQfPQxOLxyvqyEutr5EB2kNS0QlU11jorK9NlyVLfRDBqm/I9gFroG0e0SLtmLGSDF3N5sxyU9sB13HGSfE4INv/Dx/e2VrxCySlST2L9p+XdgsV1Jzjm5+yOEItFKUcy9a4WknSLyYIAStJ4YhEFSjtonKzT1/doQiezDD00kFJApVp546xTCQPaB1WSw3ZRKyaLcEt/GAye4Yil/bsKzcKy2BppOJoIu+/4NwnH8szH27lZfcMoJcuJU8pKcx5/iei3JlfGkPmRCjUTG9hmDz/Cueh77SUm/H0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qISc3Md4ly0XMmteKrjqsT8YOENcaJrou35JX0zC5ow=;
 b=e7BRa6codehFNfqL5LKI0tRagy3kZJEtI2oysAKuwHP0qKORJNkmR1fBFJ02kXhYPAc14AWRHNQxdmmywIW5Npl0AKnzvxfT96N6ZGeZJVKwi7uG51h823kz4u1/JccUQ3LdVNq6Pju6QcJU8uK0Dr84PGUP2BJ/pY6HFRzM6RRyfGUPvD0fuc9dNPRy8/MJAbU++NLVee3KcKhAneWyJCFPDO+DsTjm0jJA9FHgUyI4JPDKbbumVsiZeVOBJr7sRFdNbnKXg9Dy/BXdYZUPLRHEI9v6bCe7DHN4tZyptvwVnIzX4EkUI+ipGYZad+nlFhJzPd/1MRdYGBaAojMB8w==
Received: from MW4PR04CA0063.namprd04.prod.outlook.com (2603:10b6:303:6b::8)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Sun, 12 Sep
 2021 16:20:27 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::aa) by MW4PR04CA0063.outlook.office365.com
 (2603:10b6:303:6b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Sun, 12 Sep 2021 16:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Sun, 12 Sep 2021 16:20:27 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 16:20:27 +0000
Received: from nvidia.com (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 16:20:25 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, <xuemingl@nvidia.com>,
 <qemu-stable@nongnu.org>
Subject: [PATCH 0/2] Improve vhost-user VQ notifier unmap
Date: Mon, 13 Sep 2021 00:20:12 +0800
Message-ID: <20210912162014.106704-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 501b7594-d2a3-4697-fa1f-08d976093b93
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2618C17A00E4EDC05CA7126FA1D89@DM6PR12MB2618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHTp1gP0+OjDrkUD3n2Bf7Hm38LKj8HPQ0ti8aGbqReCZ85k63gCKzFcdB0gJZcTp0zZWSZLKxjoU0UnYvA73htkmH8oenG93RC1zkFyRk963Gn62pdE5WnOddXhGRHfnfHI+L8Btp6V97aRIEVk5676hy0ZpvVlfvedAlX5B+vr7xOLv0E/Dya9glxRz4wTFT9OYminRFCPkpsQSu2CU9dL5LtbjDQzZYmBbVowXyvFrQgxruXbvUP1XkeXeXYhLbGhqmjKaIYplipAH/EjJIuIsMeVdjuQ026rOmMVeZpk8Pa4PCotL11mqSMU8Deo7PUdv7fm/IuU6O1ryTbTJS1HCJ+s7No1tzypa0k4T4T8pBICc8dJpKhQrFfTGKKYGdUmaktjaNHsmk9KU0Zmt8bR7AZ0kEipfYC1A2mljBR6ueVkHC3hegW+5Ry+L4Snfnm9+kuRuMuT1bEPo0N06YwdbFVJ6+nzpW4r7yiMBwkHJgzxA69+pAYrEz1gbsEMAumqOIvqacrowqWpDmYFKWBH13wCHtWuZlnstagLE1VpHA4VciVXV8rhwhSmnMWunsWVjDt/Ya6maZulcRKqXxwf6LtBs3MwJRSUutQbiNgMSbsu7qPjTfd45wLBzuXo7OgqEc+UWbJMWxSlBmTaEWWXhiYLBHdgj9lT5olyEyRUoX7A8j5rOdP4UOULlJCWCaT0wBqDKnbxYCbk0m/D4A==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(2616005)(4326008)(55016002)(4744005)(356005)(16526019)(186003)(5660300002)(26005)(6286002)(478600001)(82740400003)(8676002)(36860700001)(47076005)(82310400003)(6666004)(2906002)(70206006)(83380400001)(7636003)(6916009)(316002)(1076003)(54906003)(36756003)(36906005)(336012)(7696005)(426003)(8936002)(70586007)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2021 16:20:27.4903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501b7594-d2a3-4697-fa1f-08d976093b93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2618
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::626;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When vDPA applicaiton in client mode shutdown, unmapped VQ notifier
might being accessed by VM thread under hight tx traffic, it will
crash VM in rare conditon. This patch try to fix it with better RCU
sychronization of new flatview.

Xueming Li (2):
  vhost-user: fix VirtQ notifier cleanup
  vhost-user: remove VirtQ notifier restore

 hw/virtio/vhost-user.c         | 38 ++++++++++++----------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 13 insertions(+), 26 deletions(-)

-- 
2.33.0


