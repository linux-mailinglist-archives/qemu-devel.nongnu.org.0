Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0C61840A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcuP-0000fM-04; Thu, 03 Nov 2022 12:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcty-0000Y5-8V; Thu, 03 Nov 2022 12:17:27 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqctw-00082x-6u; Thu, 03 Nov 2022 12:17:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkc0+ofeamu5kvOiL7OEu+euxi1ipilyl5WAMIxFvyNZ5sUvMPBGpxwa8z5nK1QIrw1+7N1vkBZ9d7EctrswZh5oVEIfZabWMl4JTUVbgNzzM1G+lfKn9ggdJeMPgBUcg62B3fyDQts46RXOWcfYH+1EGXXNwxC3V53YIsXpV0/8eS/YTa+RFR7GXnRtrPzd95LR8vOYvcZ3NhTOQPTbvAwEGcHSfBz8AoRmQpllb/1/kTQ4N68J/nR21tgin+4R3RbOBdjbh2Csli36aTkEp19IU9qLo3ClnED51uTdTWUJcAbUGYm0RTqfb19S+zxVNZCdm4M96j0dVjxGhFiPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPdIohi9gxDAuW35g8Jox4V3qjITSs+uCSD4oJi0QDo=;
 b=Inzy5Uuc5fI2g7p0cTOgdpizGygc++1swC0Yz0t3MVFZXM/X7WPAJ5WHUJGrvvV5B5b+X3/N+rf+gOvjuVsK6ex8YkjZwC1qz6RE90Qqi5j08jQGgwm6BPHx8I37t0Nxop+ULpMPWd03kVmr91JT0KvVAviV2v04S0VwFfpwBloyvnuiomaGopyuvObPhGwlGmhmBHberlslKaRRn8TfekXzgz9LvxarUtWqM5Sa38E9NkrCZvscA101eSZgRk99mzcen34kF2sA9YoJqV4hJ4fbocCi3FApgrd0N4jxlhzbp3CYnYe9hXdGCI7Ugs6eTJhcSfVnzqIZ+IkjdW01Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPdIohi9gxDAuW35g8Jox4V3qjITSs+uCSD4oJi0QDo=;
 b=S3l1lOm4ziijzoP7aNpDqq/i3pbLkhUOLU3+5/wl46BvzphQcY97dB4qxMndLcy/xDienNJouG4uciV7Wnlu+3H74sjWSF9pV5mKXXGRHe9QYzIGlJiXRbN73sDFsXsiOpVXPKYyGqiXpEcTIglnXUn35ttw/BDv3i/lXzrgsdTsTnnZmSBPQDLzZloS85SFInr34GFKX0KjOcPLpXm4zpL5cnLi/q85mKZf97prU5Yun9oRmHDZG6QE/EGoao+fSCdjLij8Do4TzH4Sgz+8M+MOD4mx4/iHdqf+nggPelXJZ9oiqIvmlcJXGs8Lo54U4l5+bCVs+5J6w4u6d6WQWg==
Received: from MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::29)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 16:17:04 +0000
Received: from CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::78) by MW4P222CA0024.outlook.office365.com
 (2603:10b6:303:114::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT098.mail.protection.outlook.com (10.13.174.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:16:53 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:16:52 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:16:44 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 03/17] migration: Block migration comment or code is wrong
Date: Thu, 3 Nov 2022 18:16:06 +0200
Message-ID: <20221103161620.13120-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: 253da080-8a79-4157-f802-08dabdb6d830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygYOKWfWIzFqn6f23qAk1ooZstPudZidfwPy/vvsIpZNl1JBedsIy9NXulNq3ijnk90K/QfPnLGfSBtHf3t5fE84la97aIrPAHqQOVGiD5V+8y4gBG7wr3lZ3HNXLtZaGSYUBizZ+FGmd7cDZdKralBTXAQ2nWUmYFHqegghElGkYlbe2FHOMLKyfC2ldbBA9sJfSPtybDvwz3Dn9wpWA6D0h6uoe45iB0f1V/hxo/E8Zp+Rjrza+pQ3MkLnGC408DA5ti1qxoOMcatPnwfyduHEyWIf+/hYWbtNfKCqpB6cjCGyWvWbMbVgdNzxxKL9YdPbz3sp68zze9tQyJx3EqGZtwbm+8lvVJPdwhBClM2Ah6pS/cx3kwyxxFuFCoD/8myD/VXqb+2rVdzCUn0K70xMxE348yAWBtN5brIY52M01vBfqN2Hn6+kR1D5Du9a2gJ/2BO+814x4a+ODp/pQJ5Ps+hUre7OFA2s63Q6ce0RH7qGndXttVj+7ft+XpRIO8e71HQbpmRpqWi6/duh43ZWmYT7xyWMVyZ0lXqTQ+e5kwONtRhkFcOB0nOWKziCWBCjiboFOn6mDlcu/QalrWQbJsh+uFEJVwPrSIvFzAH1xyzmNpJStm+ENpyTKTtv6GHxWCpFSyyfC+FNerImMM2Qy/KqWgJFmwaaSwN86/ZZR2t/bilnXtqyv9TRI/2ZODT1guGBHber53ecvjOwJZ1XFM3JIQTJr9bVFXk1m+qdkeayEKGWAYzhr9ukRbhtxDr8eqKAAnSSHv55sWnjqA==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(4326008)(4744005)(336012)(6666004)(478600001)(70206006)(426003)(70586007)(47076005)(8676002)(186003)(1076003)(7416002)(2616005)(40460700003)(5660300002)(316002)(6916009)(2906002)(82310400005)(36860700001)(41300700001)(356005)(83380400001)(54906003)(7636003)(82740400003)(36756003)(7696005)(8936002)(86362001)(26005)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:03.4194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 253da080-8a79-4157-f802-08dabdb6d830
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Juan Quintela <quintela@redhat.com>

And it appears that what is wrong is the code. During bulk stage we
need to make sure that some block is dirty, but no games with
max_size at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 migration/block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index b3d680af75..39ce4003c6 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -879,8 +879,8 @@ static void block_save_pending(void *opaque, uint64_t max_size,
     blk_mig_unlock();
 
     /* Report at least one block pending during bulk phase */
-    if (pending <= max_size && !block_mig_state.bulk_completed) {
-        pending = max_size + BLK_MIG_BLOCK_SIZE;
+    if (!pending && !block_mig_state.bulk_completed) {
+        pending = BLK_MIG_BLOCK_SIZE;
     }
 
     trace_migration_block_save_pending(pending);
-- 
2.21.3


