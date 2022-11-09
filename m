Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C181862225F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 04:01:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osbJj-0004OJ-IQ; Tue, 08 Nov 2022 21:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1osbJh-0004O7-93
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:59:53 -0500
Received: from mail-dm3nam02on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::60b]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1osbJe-0003w6-VJ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:59:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9fbacrUjIoYH/KMcJyesOk6iGOTOT4CYvziKugKuu7dtN1ux6alTEfTekvWPGy58C6OVvBlfy+VtCpt4hPRCQusZhmiVxC8QjoJETtHUh+zWomcYDuEneuDlOhWCddHN9Uwf5umxTcT52830Lled3dYC5++mfg150q0kJaavjYD+rDUcuoaTAKQwtZ9fPWee5LzqM9Z05orGuxd6roOiZmOBVfVXt27wkEGSVw3C/dbWsNVogLUsDg5JfVA56/GjXBR8WeU4/6hfQEOtKgmYDWz2eFSu8j0KLtTPpwutIwln+nivazgEN9SPU1nc938zmxUryNkH9XWqmZKuVb7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8dZBCDt9j1dVZKgwv3LTAhBWWMOhw64DX2nf/HRfKQ=;
 b=WlIetUljznw3xBJt7kr0t/15WH61FaiW4lJzPt2ngb0FUi3geYzwejmbIc81tp0b9NhfuAa2ao+u5QvcE+O82uZlaHdbhLEGhNS0sObtAssPNL34RmIGPlc+IO63odW/T3BxnUVLlVguNkkK5PUnhMTrpIgcy/0HL5HejPEdnk9yJZS8hxdkvbLhnwOgTCLdLCSobCbV77XMNcji9QJfgyd3vSeD1Kkzy+Wm7yDlAbM11kemNA53IkoI78CcO3syQw8DC+sdh8K//vs/xLxuaDRFPZyVzA41Lve2dhqlnKqHgceyhLGRRPLFrU1XxP1AeSjZ7jwfTWg9ShfC8sl8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8dZBCDt9j1dVZKgwv3LTAhBWWMOhw64DX2nf/HRfKQ=;
 b=HiVnCKgwmFd8ut2PNFCZhXqybr3uylKfRtwv3cB++5KGU6pdjeyI4GkyO/3jqyx1TBdNlrp8i7YX+4XMv7tG5ZbbFaXndqEut9Qxkbp5VRt8K7FRuE69JHowm0u49vTL0GWz9hg5NU82NACePxLtJVSSd1rOkX/zHH7BiSKmzM4l2uT/5owQfeVtOAbEvSnrmpGD7ivS/CraZUQHhRDw45H1KkLfr4gXi4kOJSqNqUw2MpIljayEFl8Pgr1ECpaTQ2t5oZMYb5j4cVdGay5D8/+sr4pMTbAl5UCet8ev92WdJ3aSI8D1Y4FZqCDO80P69DA1YJ+hRhcO0CPdpEgxwg==
Received: from CY5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:930:1e::19)
 by SJ0PR12MB5421.namprd12.prod.outlook.com (2603:10b6:a03:3bb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 02:54:45 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::b1) by CY5PR04CA0010.outlook.office365.com
 (2603:10b6:930:1e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 02:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Wed, 9 Nov 2022 02:54:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 8 Nov 2022
 18:54:34 -0800
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 8 Nov 2022
 18:54:32 -0800
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH] vhost: set mem table before device start
Date: Wed, 9 Nov 2022 10:53:10 +0800
Message-ID: <20221109025309.1052342-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|SJ0PR12MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef054b0-ce13-45db-e8ac-08dac1fdc1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BkxHyVfU1qZf0qV6zpAaBDhODzoKSCM1QTa4mSKXEoHgyT8rgNTkFp6j8TOXMVPxhVgfVPOniG8Wq6S62PTqGKr0xV5XQckh7PZb0uNOOAS9G74Wf83p5m09RWY/OLdfNar8q80qoPV0KhcIsob3B412ff6oM5nKLfdnR3AJvDz1FFqSSyyWRpkH691k2ek1zmU/bjRG1tkxRZDDZ4bj5icUcMnaUb8KRLlM7GxjKdTIwZz+SsImJ1tyY4XKg1XRTV83Cdsf9pVTh11BtZd7bjAGg3k87uES9EfXaYHQ/NCizpXCkpROJuTcPC0zSl1QMbE797wewZLmJhftmooKNzlwGM7hPfn5pTekuZQE/Ow2UOg4r7kuuftqsbNO3R81iDrSe2hUSHh+UmFfI/WtY6fE2TDcx11sN1s8jSOTEuFOVymEZzxvtRl7SZScTL94eHnBoUHBM2dOLfJ3xHHwZedQGpsCFXgCwF+tuZupzN9EfxmswGZGCmZ4ncrWmhjpd30TlRKU3yrTP3paHd++5D+j4dIe8JG5rLa9khoTrFmd5meyfaCc/ttr+IRiTT+EBL16d41BNRQfjcFHfGJPTBEzLofvKBPk7PjLaMBxvdYHVMvlXTUdTeCg22JAyBF9amWw2i2koC6giTZLcKZgCigrxexC7Zf/h4nVMoeCmd+ovr7qowxc34erw5gq0nXRShmK7LaXwBjemqmy7sPcuFApKJZiwrUmn6btKVYAsEuZR6b6SflF2thA1n6zP47d7YCGv3Uy/Xi5v20XWOJvyA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(36756003)(356005)(7636003)(82740400003)(86362001)(6636002)(83380400001)(6666004)(40480700001)(55016003)(40460700003)(1076003)(2906002)(336012)(186003)(426003)(2616005)(26005)(47076005)(16526019)(7696005)(6286002)(316002)(70586007)(70206006)(110136005)(478600001)(8676002)(82310400005)(8936002)(5660300002)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 02:54:44.6381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef054b0-ce13-45db-e8ac-08dac1fdc1c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5421
Received-SPF: softfail client-ip=2a01:111:f400:7e83::60b;
 envelope-from=yajunw@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

Today guest memory information (through VHOST_USER_SET_MEM_TABLE)
is sent out during vhost device start. Due to this delay, memory
pinning is delayed. For 4G guest memory, a VFIO driver usually
takes around 400+msec to pin the memory.

This time is accounted towards the VM downtime. When live migrating
a VM, vhost device start is occuring in vmstate load stage.

Moving set mem table just after VM bootup, before device start can
let backend have enough time to pin the guest memory before starting
the device. This improvements reduces VM downtime by 400+msec.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
---
 hw/virtio/vhost.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..73e473cd84 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -539,6 +539,14 @@ static void vhost_commit(MemoryListener *listener)
     }
 
     if (!dev->started) {
+        /* Backend can pin memory before device start, reduce LM downtime */
+        if (dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER &&
+            dev->n_mem_sections) {
+            r = dev->vhost_ops->vhost_set_mem_table(dev, dev->mem);
+            if (r < 0) {
+                VHOST_OPS_DEBUG(r, "vhost_set_mem_table failed");
+            }
+        }
         goto out;
     }
 
-- 
2.27.0


