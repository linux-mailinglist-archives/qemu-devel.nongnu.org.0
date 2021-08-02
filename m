Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC13DDFCA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:04:44 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdEx-0002oj-LF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5T-0002pt-Py; Mon, 02 Aug 2021 14:54:55 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:42689 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5S-0001pD-6F; Mon, 02 Aug 2021 14:54:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJW3FzjRbdc60QT4jExJdpVyoHl4EsN2XxJ2zhllCLfgpmi2BPhrF7ZrEEQP4Zl1NchR99sUIkBSyN33YhgSr0rtfI1OFfvWdX+kd8WeFSfhcdznvgBwQy8orl6KK8u8HvqxLBxKNYashdQ+qwXwxk+pwCjIe5NtFiac7Vi9zckFRnQTCbqxWKCm8g4JEOsIQbSBHdYQbXJS5vKaSwVZ9cIS9w+x3Nf0XJbi/t2s2ABCw0qOVUGDZ3GdK++yq7c4peU7ppeBYW3vustXyCMIGuV02k3sCWrtPMUipbBI5ksfKR6TEsfvtmwYt2lqOFT1p2QMBFNTZK+itpY1Uo1ZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APkx10sGp24qUsE6aHVfJ5jK3kCI3J8FmfAVjY7OJF8=;
 b=axAqAFqbFVEQSu89KQ+qEeCOXk/RK16450NARHjAZve8d++vVpQigKchGfD++dqPIH9wa9RiECZhxEbG2UgUK9yBcpvBSF3bWPwUZ8sQNyr/mGeyaZE8oPzF10td2eWAQgGjAaWVsIgrOu/Wij5HhNNv+s5xxSTc244DSe07NBRfeimXPOA5CnVtd5BvYdOE1ybLC5j0416usCl2y0SNYvcMqyPNQctIAyGe0k9Hm4txS7tss2KE7tWT+4LvGRWoXHWX1fZGoLi9y8Ri/cMWVnCp4OYIJ1XsfphTI3Gy8VyaZ/nuntR/cPjBUfCHR9NkAauEch9HxOWkQjLgTUoeig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APkx10sGp24qUsE6aHVfJ5jK3kCI3J8FmfAVjY7OJF8=;
 b=ZZaTLeNBp6T1todlNC2TfoOYAeStRl72KOlfVR5xo23Kk6FhBzhAcc+wCrK0hSfY5iH9rc5JXNOewIaexe77mMr7gozKbaHAjizN2kQYKTtWiJ0I6Ky98sKqbNFNgA0GTzkzIuiYbGHA9GKX+bOssLl1nJ82d0d7PQVekQOfkrs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 18:54:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 6/8] qdev: realize BlockParentClass
Date: Mon,  2 Aug 2021 21:54:14 +0300
Message-Id: <20210802185416.50877-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87fa98a8-076b-4859-a4e3-08d955e6febf
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB440501FDB5B0DBE4013EC051C1EF9@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:67;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3LN01duDr1wqYvzHu1S0cb9I4ExbftLxLAC6behCK9SwsUFUiAQol3LC0XsDzWH0R7L5uoRzb+s/eDFyyDK3PmNd6kGUfLTsIi5CO3xcmGlYQPKxRYK0KJEM/7HhDaDyjjwXJbCQgZMN6+JXdrh8TBinCkNCNEZfnt7cG9oJCCw5BYht0LJo5cTedzFsP1r4QjleEsvdvzJZsdsNmGl81yTp+dh9o6mbqAKyiRrxbHhex6Ip5SN5s3WO9x+eJzRJ5PqW9zyhdGh051oLy5ZwbkTBbV0dVaRV7PiNbWwOg0+DRpk3cvEk+kNqSRyM13ZN6O+q/f3oynfHTvwRfB/3EE+GzQR1LXBlp6GPg+bUvbdCPbzXwc5y6sscqvbWLyLXeFYFZFGqItN0s+sDNrLPXGCXH1IEUTs0ey7mexQiZNcstl5NI0lLD86GlK1iWEOK+ofcdSbquwP/4mpTNIE0qnrcH3P+QRKGR4MwvrKmAMGlwj9Yx0v0Xlzesenik+ZTxxVW5CXOWfzg4tfX7eItPWGpy2A03qQjWXYKyORT8epnABmSrTkCEoDLnQlP1azqJPuzCbHm2CHV/NV/pNeZO2yMbDlqLrpv80t6DyIvk0PTfI8g7+to2wWAItrnMEKb1spkz1GVHIUwo0T3qutvRCaEb1c8ZBU38q/9F+qkNVEbDQjr6NKlub8E3C6JLuopjDlF+5dwtpW0LF6FFgmKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(376002)(346002)(186003)(2906002)(316002)(5660300002)(26005)(6916009)(2616005)(956004)(38100700002)(7416002)(38350700002)(4326008)(36756003)(86362001)(6512007)(66476007)(66946007)(66556008)(8936002)(6486002)(478600001)(1076003)(6506007)(8676002)(83380400001)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7cjuttQYME3HuPbR3hjmvvEXb0Be4WSan+a+uKBRMQVYxUByvRgbKLHD6X3?=
 =?us-ascii?Q?ZEHa9fcvFOMypSK5mRyZkhXOky9s3PHxGrMO/DVrnUGOSjCUpeB5K0Z94HRf?=
 =?us-ascii?Q?XQVg/zlvrWsXrvwaDpsXaOpyT+mPHt8E8vDSKLiSMbrGrziT4q1iUMcIDkqP?=
 =?us-ascii?Q?jOhE/zE2Y4Vi44wTXaYRYMdlF2tWMXFHZT6C2eaMshadU8nUVF0espsOqYAc?=
 =?us-ascii?Q?2Bd8O1x7D86Y/uWLMshhrAXRVaSa+tMQ+jO4a03DBpYwZGCDLHAsp2KLoeOB?=
 =?us-ascii?Q?XJkoWQWgzwVeY/Xu+xvjSCKq6dI6WcplIkRHdEs5e5yawo1yMcrYTS0+xAAb?=
 =?us-ascii?Q?kE31sRqI230n2Gn/0lYTBqY38/Las01QuCmnTwsI0BP14/utxTvPa9wMDmFy?=
 =?us-ascii?Q?5+gZxZnG0Wlkn5VMQw1WWG5Fl711SLw2SI8Er+llGCt74GZNmddCPg5yK0qq?=
 =?us-ascii?Q?A6/afGJLBLIt7AKTkeLGEFFa8yVRy/4k/9we9BctO8ZQH8NkPBH03pwe1zk2?=
 =?us-ascii?Q?1bySYvb3Xbqh6bjrIjW6kfBVnwKE0VM4sXclAr6KVuubEann3EewSLTx/8Lm?=
 =?us-ascii?Q?v1w5UIDASEjG/gfSbvG9izEfOhJH5aB2yD4uMqPggkUdbrhTUYw4MOaHkBoY?=
 =?us-ascii?Q?Evt35CxkVxp7Lw3IYPSwUxUbsEacZY+JHu/cLHdlvyUggkpQRZi5L+ZW6h8X?=
 =?us-ascii?Q?DZhPryRCqdrCTp8qefGAynnxszpoKPYn3+jaVEbq+i6tcqRxL7PMFUYipG8F?=
 =?us-ascii?Q?U1uIjl2oHHxPvFnf3Rh4gkxgEIO76OThHKaEAvtRS5CAR+HljnDQGQ38YNhZ?=
 =?us-ascii?Q?UeeLre4QomVhUVVW2EwdxLlpTc7mEOlNy9ilNbJydSqPS5Clkfl13ogJITFC?=
 =?us-ascii?Q?6DPChtPLi/149+TFPDfxGN9BPNZWkWBVnd9N7X6bzL+BOAT8jEIqFopOEk7P?=
 =?us-ascii?Q?0v8cHsvufX7n1ArFqftYEe9/DT+xFQRJuNcEQjvaeAdWU64nmJRhZUYQdd6x?=
 =?us-ascii?Q?h4FC/TrwA7gQPr5Kt5ctwflgv9LaTDibJhfKQkfYscAI/MM6nNWobE17oVpW?=
 =?us-ascii?Q?nJU5UWnQFwIkIpqmgyLLWU3w0vDw+h3S2Ncyak2CqcHepwlHxRnpAr+tVsSN?=
 =?us-ascii?Q?qJ2aF1MDcHD/OYHS+aNbzfXEgIDRdKcyC3BUsjKCgxBcaTFvPIkMScscdFa7?=
 =?us-ascii?Q?ANW3vS+aOxoWAR4aBEe17OwFRCa9a5aH+6ds7BTiqsL/07I468yrTbJwqg1/?=
 =?us-ascii?Q?dFscGpSCS7OwvGt7ApEbVR0fxeuXjfJe47ci3hC3D8vHJeNoxCdxLwuYFrYs?=
 =?us-ascii?Q?7vmA4lFC7rzyO1E1JHKDJg5q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fa98a8-076b-4859-a4e3-08d955e6febf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:45.5920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGRb8buyq0atvgmNbRudFTh64FsO2SS1y1buDpSfmt0c001Tn47gcnQuPLiOWi0GHl4PJpNm5LVR/auzxccwfULPE88TS4wU/by3sVUHBBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 softmmu/qdev-monitor.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0117989009..2e149aa9b8 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-parent.h"
 #include "hw/sysbus.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
@@ -1023,3 +1024,44 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+static int qdev_find_child(const char *parent_id, const char *child_name,
+                           BlockDriverState *child_bs,
+                           BdrvChild **child, Error **errp)
+{
+    int ret;
+    DeviceState *dev;
+    BlockBackend *blk;
+
+    ret = find_device_state(parent_id, &dev, errp);
+    if (ret <= 0) {
+        return ret;
+    }
+
+    blk = blk_by_dev(dev);
+    if (!blk || !blk_root(blk)) {
+        error_setg(errp, "Device '%s' does not have a block device backend",
+                   parent_id);
+        return -EINVAL;
+    }
+
+    if (child_bs && blk_bs(blk) != child_bs) {
+        error_setg(errp, "Root child of device '%s' doesn't match", parent_id);
+        return -EINVAL;
+    }
+
+    *child = blk_root(blk);
+    return 1;
+}
+
+BlockParentClass block_parent_qdev = {
+    .name = "qdev",
+    .find_child = qdev_find_child,
+};
+
+static void qdev_monitor_init(void)
+{
+    block_parent_class_register(&block_parent_qdev);
+}
+
+block_init(qdev_monitor_init);
-- 
2.29.2


