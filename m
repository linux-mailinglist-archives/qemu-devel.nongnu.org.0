Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572303DDFA8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:57:29 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAd7w-0006SJ-CE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5Q-0002cZ-5t; Mon, 02 Aug 2021 14:54:52 -0400
Received: from mail-he1eur04on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::709]:64771
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5M-0001rV-2D; Mon, 02 Aug 2021 14:54:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1pRthDrZNMsPwAk1+vdseKS8b/9IVEwiaT3LtzZpHOdiGZJNxHbaeRbdTQCIS1VlTbmRq2FfIPO+4dbLsy2ZZu50rgxtP+MREHDrJBJZ/Jig+AuHlSc9cRfpM5VP0xcg/AHLSTvk9azoRu0WuyuN0e5CSribmczy8xNQmcK6kXM2geBFe7I9NGA0GRsJfLt/2gxdcO9qrfrXR1301I42RpUK0mUOCSzVmPLR4pDobg3yxNjkYoH1wAlR/RbKAHtc+tcITVnFeyPrQKY4VnrO1bFIVQLIJX5dLIdEZawKgeKV4YUuf3f/vG++DWASuF0Ecp68ru/9t6wGJMWDipkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffpkirzSCCWLj7e4nn7vsg0yC/54tILlNC5ywR/NLDA=;
 b=ACYV6BHtj5ZG9l/OD36ltROlaHbAA+SSAhtTpXcz3OhQJOUo3f4hQmIz67+w8vxF7pTftepBHhmKofQDJVM1+uuR0RFbZ+7nsc1lVMKMaKJjl0fH6usJaHFWrGRKhG2CGhT33XuY07iqBHPdQ9KlTyUlFWWnBTOc34wmBDhspjdnQlSME5cN/alkueS+SojUuhXjS7I+6awN575fOWfU8eSmEfKyzL4rIA6g9kEQ5ZYwWhCZ4UUzXMKAm92PwKNXZbX8m5L6G3g8JX+3Gp1XBJip1bQH57DqyY3CjHOJkWeG2Mi6M+LxgH7BLLN2Qtqyo1/5zcmnJUUgcvN/qnpR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffpkirzSCCWLj7e4nn7vsg0yC/54tILlNC5ywR/NLDA=;
 b=q96OvIlURJUTV+PUpOmAZsN2zWKqe2Ya8UuzdTfTBOaOfa7eSHkCb0nsOAfVv+aG7HrgB/PGy0RyHm+OuxREWMN7QRMja/PNxeINLg6GPPCql6rk3xWEk2JCLwyUqr9YGpbeRTIReQtK/tWdrtO4ZSYJQnZKJIk1aqexh3T2uxc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 18:54:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 3/8] block: realize BlockParentClass for BlockDriverState
Date: Mon,  2 Aug 2021 21:54:11 +0300
Message-Id: <20210802185416.50877-4-vsementsov@virtuozzo.com>
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
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e45cc2d5-c794-4b18-af52-08d955e6fb21
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42786681C5D9FD739382777CC1EF9@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OmyPB8g+hKtwY9WQLyy/8rSv+F7/LnqSSEoLQ9B2zT9L8jFKKylIxRMExPbyE8XsJXmVoZAWgCsMNk+ilcGYmfXhfGVX1QLnemB3St248i7cCyjND5iTUZclpwGjQeofJ8uDRm0O8/WJQQtVr5NCkUDL+kmRfLb7Da6l+jr+KdvXWQmnB1oB2wASscr+Dk+SpxOfRP4fiIobLTRqYnUXQyjfM1kowjLJCj4qFCD0d+2yJ4qtTJgO+wWLHBo+djUSMcvIIYm/peXnsOwEPgdZGBPd6DMMFgS2QC7aP4vTkh+Y0D7HKd4bmlv6Q56Hu+1yvHJdoLo1wTXz6ld12+yyIjkJkswhDaWOLagYJOSgb3BAoeY4ses1eBLpDSREGOa4WO0MILscyqh2pIOCW5JYIykW2rIq4MYDRUni49vEUGqr8FqD64ogdFkrFtF4XWv/et8DJWwgJdiO3BViXDQD6ha3xhVFERfY4py4Hv+4kgH4XUTuSbx9bCmXcYaUOVGso0a9JIFAwxbuemAyk1jGFQphMAxahvPMf27GhLNsJSWnPSBcCCr7Nv/A9q6sqSQG9zttO2hTNJGrWD5+I5p2og3goR8TyRbZWBqqWcjEq/s27nvzdAotI23Go3RzZ0SSTX7PN1MEEYPzLjb6k6e3/x1j2FBVkuAm08Z6+Xc0tHIbtS/aBaG71l/3iEGu2eONYJEFS0RRyNjwmBrT6FvvYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(186003)(6916009)(52116002)(1076003)(83380400001)(8676002)(6512007)(38350700002)(38100700002)(2906002)(7416002)(6506007)(2616005)(478600001)(6666004)(36756003)(5660300002)(8936002)(956004)(4326008)(86362001)(26005)(316002)(6486002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iIZqbLNbEcFcWpARwLAytnW+ElzI8nBhI8ijBvty2zeFhswpFpI8gN5cgAFW?=
 =?us-ascii?Q?ChnoWzXE7yB5kYoZjox4Hvo0+dxbUA9Xz5P+4jCquTqTb0hHDcwdcKC0yJkY?=
 =?us-ascii?Q?txQ16NzoCmxeLzTtApPEPk/qfci5iMxEaDeR/y8Fcvjh/KmGe8/CtEHyKtRq?=
 =?us-ascii?Q?HGFAkUlHLRqXwy0quvtJBh1xdwj0QwTK/80uXIcUR9cR4+wxLC/8eRW0fHrR?=
 =?us-ascii?Q?1VIKcRloZn5c8DQl24EMIwpYH9DM+FNcpdYaQ+mF9Iile+rC76k6oN8FC1GD?=
 =?us-ascii?Q?PMooZkicOvNnNDHwQaLE7mEMAI1CE/Kz2426ePcifemRvMma9MVbNXCMFJzC?=
 =?us-ascii?Q?nSoGFfNuxkPZUD7k1OvZCALet9rgcb0fZpxrQNSHUZhkXNYlqxIPDTKqks46?=
 =?us-ascii?Q?bLJ51vII/CLtYHQTqUkM53uygzLEYckP55oySRBozkVgx695eB98wc1RMNFS?=
 =?us-ascii?Q?CuQJEnQfsVJE0m9040ijvw2N9Rf6HjCjdKeXru/3QrtJ1lc+kAbM6DNY9WGv?=
 =?us-ascii?Q?zQjE0XK6ziYUmsJCuBmDVp6jAgmcvsiA+CsDrnOoWmCuKdQxos1LWD+haz8G?=
 =?us-ascii?Q?OH2iHmZDHySQr+/JvRxvOJ4JsDxDAZcg6+bhW5lgP2CwlVNspBkoVrehQ36L?=
 =?us-ascii?Q?WF3Pvlf1+ktZgfFu3hf7YWadlbwmOxsxm0h4Qbe8OfsstcBDf5LNk6Qb1LtO?=
 =?us-ascii?Q?/T3gpFA+MBfOuhtRKlcXP6EOAwCWshNIJt5+77qi1l22k8WPvjG2lXZh3tOe?=
 =?us-ascii?Q?xVJNPyRC5LhQu0ja3qsrzm47HlO1yNTQjPCvHykswoPgfx5x/oQNQJFB71AS?=
 =?us-ascii?Q?+oEbiYtFHkNpMan2wm8DbnSSG9JgYbQWhNFzdm5ZYSvQz94cpzFKrGfI+j/E?=
 =?us-ascii?Q?x5og8vkO7TYERs2oGlqitC9n13E8PzXB/ZcUCHOU3STtncqVQv/IWfIqMRC6?=
 =?us-ascii?Q?WcyScS9NFmRZDbyHz+Fnoiyrh0CtiBTHJ+f5Dxzsee1ALa3G2llMv6OtmQJ/?=
 =?us-ascii?Q?euDIOolAnNlI3PZhDUgekti2nUnUtbwlJiG4tSuWENuqOlbkvV32GTHEUt9c?=
 =?us-ascii?Q?piscaRq6hPUpJvdBBrYQQw7LEUsvrDl2kJz/KU2cGNA/Zb9WdMGJ31wNqiGR?=
 =?us-ascii?Q?VQ7ITlLhOkP50emcxfhYAIjvnkco80Dr4/VpHyAzfaCI0Zjmk1AH+6FF/Hol?=
 =?us-ascii?Q?4axhSAp4anPVOFJ1zO04lFwGliBZO61ccaROdAeRqgV64yusazbQgcC9Daz6?=
 =?us-ascii?Q?AMks7AnuPaeWFHz4nLGu4UEDUXx5f4M2LmSHGSWMtqmHBzExI3INAST1yWvG?=
 =?us-ascii?Q?bIlMvmFUWKqSKunF3foiTZ/T?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45cc2d5-c794-4b18-af52-08d955e6fb21
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:39.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZHBhgQNyE6PZAeEv9K6/PnNT5Pg4SPQwU08bLsjAE9csTyWs4yBMbfs1bdnV9YCMFiztTXf6jCTG5ovmifeyjEXvc5efk1Hu5DN2jqihYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=2a01:111:f400:fe0d::709;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
 block.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/block.c b/block.c
index e97ce0b1c8..449f933661 100644
--- a/block.c
+++ b/block.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "block/trace.h"
 #include "block/block_int.h"
+#include "block/block-parent.h"
 #include "block/blockjob.h"
 #include "block/fuse.h"
 #include "block/nbd.h"
@@ -7501,6 +7502,47 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     return 0;
 }
 
+static int bdrv_find_child(const char *parent_id, const char *child_name,
+                           BlockDriverState *child_bs, BdrvChild **child,
+                           Error **errp)
+{
+    BdrvChild *c, *found = NULL;
+    BlockDriverState *bs;
+
+    bs = bdrv_find_node(parent_id);
+    if (!bs) {
+        return 0;
+    }
+
+    QLIST_FOREACH(c, &bs->children, next) {
+        if ((!child_name || strcmp(c->name, child_name) == 0) &&
+            (!child_bs || child_bs == c->bs))
+        {
+            if (found) {
+                error_setg(errp, "node '%s' has more than one matching child",
+                           parent_id);
+                return -EINVAL;
+            } else {
+                found = c;
+            }
+        }
+    }
+
+    if (!found) {
+        error_setg(errp, "node '%s' exists but it doesn't have matching child",
+                   parent_id);
+        return -EINVAL;
+    }
+
+    *child = found;
+    return 1;
+}
+
+BlockParentClass block_parent_bdrv = {
+    .name = "block driver",
+    .find_child = bdrv_find_child,
+};
+
 /*
  * Return the child that @bs acts as an overlay for, and from which data may be
  * copied in COW or COR operations.  Usually this is the backing file.
@@ -7653,3 +7695,10 @@ BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
 {
     return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
 }
+
+static void block_c_init(void)
+{
+    block_parent_class_register(&block_parent_bdrv);
+}
+
+block_init(block_c_init);
-- 
2.29.2


