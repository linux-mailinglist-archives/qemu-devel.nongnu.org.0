Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CDB38CCC4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:55:16 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9Mh-00081i-0R
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HW-0005iJ-8t; Fri, 21 May 2021 13:49:54 -0400
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:27182 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HS-000645-Ri; Fri, 21 May 2021 13:49:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT91Y5xwe7ZHVxkA84vxvf3x0jker3hxQSNP3QZli4tJ+OaJIsXWMg6LzSfAyM7r/CVqd6qBO72rv88zPh0mNYJv9xxzjS16Sk4L4GuG9K9PGvIOI4i6XR2OZJ/fKs47OYXxlZz5iG0ZftfjL9s1ZBZq0nFeMpMHbkVVaIKjCKtsKgqDzYfx6wV/yONnNtmCIX0ntwbv08SucAi+uBnKX6hiqY8fWvnc1JT2n28oUxWknYGNXlel1J8IsPpIGSnSzzjAIgJUEfPk1aJrSa9/m+PgmHLdAFCfrmMsplNjhYLxQPpkADdV7xOZI3QknVOLgnFi/zUqa/IYDKd22pYtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxcCg79ZmiqHPfn0nCt2eDBVCitSrAUSW9e/jJ0L55w=;
 b=mrV26ASXWKES6L04HPrsrQLpbnqmtfMzDBk/wnR8W9SKSzlQ8+KjmgYZmO/wu8WuzNa7vDKPwxf26TXURtEnihmPbbBUXxQ7AomRnGGHXDUwtomD7IekyQIPB/T4sl37zoVK8E5LmfWL3CoqoJ6f9nY2Krs8uc+slNu3j5DNkufqsWmajSWLuc5dNzt+W/EQZDWgC190jhPgnCaKz5byGoMBBocP6+cIU7emt0WYj8sBMfpve0uAY3oLuF3mEgrM31wdakEcpHMt4sD8+6ASu573VEWC8vrly3aj6WUUitBiWqhF7I925qa9RwR8bPsvogujVLLYBiqpxG1nmohAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxcCg79ZmiqHPfn0nCt2eDBVCitSrAUSW9e/jJ0L55w=;
 b=Fi/yedrHgkGWunF2/79g2YyuLrM3PHAK8Avz+1A2JvGW46g5SY7G2XTkQSRd409aqh3GJmMyqekpDeakbrsyqkv2j6qYIpG5jWNvqhtnK1qlzPojejN01fTzZpDivby1+FtneWyGrLB2ICrXylfgnW5YAk44Wvp3xcZOUD6LxXM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 3/6] block: share writes on backing child of fleecing node
Date: Fri, 21 May 2021 20:49:22 +0300
Message-Id: <20210521174925.62781-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210521174925.62781-1-vsementsov@virtuozzo.com>
References: <20210521174925.62781-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1PR09CA0083.eurprd09.prod.outlook.com (2603:10a6:7:3d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 968fce33-3d97-4323-9ce8-08d91c80d02b
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591186FD840281B44667D6E2C1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HutEyuE7f8gko5UrWbgJBBI0dMJ5sH8ca6zzcmlWQVNMj9qiWJY7LXAiumKRcuM6J40nR185iUOjkc/adzAUbYIT/GZJ1SljG3HLjGubv8/p72eBXnZIurDCK9wwdUe5yvefEVxmaMyUCxetFTKDBAyyCiiwmBCrotD5WbyfBasi83ALT8Uble3UVOvW5peqAQTo6Q4JOvYQ3IABiNSaE8IF9zTHqdvqLn2XZz0wEZ7eFcAHYNe50IfuDZzFHuWOWYDfOtRDt4VYR2CtUZJCf+f/HSfyLHWEzf7trQsG69aik9/pu7wxbO2zMKC6RZSFGaElqANGELlb+xsDCp/HiFX1n0ZurSfky2S5CLO6SKuGfYMc/5Ds9vHRI35RTLypLy1/eReMAvseG4RXIfUmmi2xUsB3dO/OIlaRXPvwdyQkQwqAzkVbMXlf9XTV1ID+i6UIaHk9YKJXI4pi05yuFjx40GJ3R/qpOZiU4WgXOSWWzDnsPoxm486rNjCIoLGOGaztr1BvZUY3G58QV/Uymv/ZUz2iltTRJ2RbQc3w+n9neK10y4EMluZmT8uf5rpmccFhi5pVU2fAiEVqsMeDmPbg8FCEYG+L/nZ1GyHw/73WVWx5isK/loWr3iEHNAUR2HQrAltxuwONmE7UPMeObT3GGcURM+v7pkjIhJRxMb+CH6FM69Qo2+G43H2HnIy8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CENN+CfjgHNndNMgAR4LwsgjmDOHmCiGGo4nIkQx8wZ3bc2CqKlpugm599bm?=
 =?us-ascii?Q?UxATNVimrWYxVFmi10Xa50OPEaN2nV4mVkb2akI6J7mL5FZzhgnHnruhEET0?=
 =?us-ascii?Q?kzFF5XF/QB9nw1nirFWGEPeHtP+8pj/Tg772w/2zRKwUlwE+MPCjFi9Qqfjd?=
 =?us-ascii?Q?OZb3fMMkGGQDpd0GUJZvGHsKly/dB4dhIx5Vpr9IxEjkCkeiQ43dlpFlZdvc?=
 =?us-ascii?Q?/HhowQl+2H3Nyl79tp+eTwcQaZJi9o6RZS3FNchuo6C17HcXgAdV/dcyeo8f?=
 =?us-ascii?Q?+kCqG8OYxLsVD4JCzBWBNuF9pjGAV9C55DV0nDBBwvzPVfUjmTxzQuGzheWe?=
 =?us-ascii?Q?s6/8CVSenUdUskrzVpsYxpasR3RzXzDZdgriJugy6o0goQXm1L2TRriVqBfX?=
 =?us-ascii?Q?AsXICqPT14xjyJo7mI1tynD+CWVupJscu2eorKiKL3xeYM3r9hebzEfBhdCF?=
 =?us-ascii?Q?wrjj5anILcwKUyhfSSwp+Yzl9G9NCi/k7TGR/Z2KyeY9qXSh66vxk8oOTk7l?=
 =?us-ascii?Q?DRqB2gI4WB0482SdkbYIPcbn80NUc7GVRpqmP0o8kGGhjevOllF2++6LeC7R?=
 =?us-ascii?Q?EtP+HNCEIHS09fmyN6jUpJ+PN8/agOsftqrz7TVQpXmv+PtC6rMBuQv81AyR?=
 =?us-ascii?Q?PFmcddrwYq7FO0Vo9R1XIYLzfWcKQ5Tq5hKHFPK7mc/K0mfK4CCrBfP04hDr?=
 =?us-ascii?Q?sM76eeBEaXxIQbIiL/yiUHNZJMKHOd8H8ZsBZckBChEw50ztm9Cb4VWiT8k5?=
 =?us-ascii?Q?onqNELxHV+OBpw5KbTqYnIm0C/6JTXiipOdV6d5isi3ZCpu69lVgtj7bA9WJ?=
 =?us-ascii?Q?1MXGlp6Yk59kwBqpPzmcYP2PKkK31d1O5jCmwUlYzSimEaKFANFxRiuDi7cd?=
 =?us-ascii?Q?dNWxHFF4OU47FVWXnMa8A9fl/TFT2CCBM7OwculU3ktW6Ejw+tATiCq7yt39?=
 =?us-ascii?Q?et7lixqWbK4BRKqz/0NLlbQZjDR7oZVrTNK4V5L+RHwbLe13J8t6IlIaZ5OY?=
 =?us-ascii?Q?uAjpxHhsKO952ViZnPNl4w6jjkVuqziTcNgQIsOrmn6Yjmq2Ox2TU/8FfouI?=
 =?us-ascii?Q?gQ4mri8rNIdFrV+x0eV7BAhu9d4cDbXlXyATvghMkSG9mdQKUmVo/xgsfleo?=
 =?us-ascii?Q?uwgtzNSTHCMS0+xKFKytGjY5EYJ47CiyurSzmEaqHIib4qyiEHYkovivm+oS?=
 =?us-ascii?Q?RsxlCjrrZNOnOjAIfDZ3UF52xzKzYZI09oRxQQufxh0Aavplzji6HOjCdaBO?=
 =?us-ascii?Q?BnVPDuspN79xROGrUdGZkUUlH5NH+Oinx3IQQT4RdG2u2MIkG1L7fUnFvXON?=
 =?us-ascii?Q?VFBgZ+2iBTLAIh2RpscG/AAl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968fce33-3d97-4323-9ce8-08d91c80d02b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:42.4751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ihx7IIDl4lV+I9wvZ3dCSjOxWDp/d1pqyxdSQ/WCVWzb93fkZzmLJK8LXrJARCAbHq2bjuOHHOqmZRwow5ctOYU/YK2Qt3/iQxpgapFtMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

By default, we share writes on backing child only if our parents share
write permission on us.

Still, with fleecing scheme we want to be able to unshare writes on
fleecing node, which is a kind of immutable snapshot
(copy-before-write operations are write-unchanged). So, let's detect
fleecing node and share writes on its backing child. (we should share
them, otherwise copy-before-write filter can't write to its file
child).

With fleecing scheme we are sure, that writes to backing child goes
through copy-before-write filter, so we are safe to share them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h |  1 +
 block.c                   |  3 ++-
 block/copy-before-write.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..ca47af732a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -36,5 +36,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
+bool bdrv_is_fleecing_node(BlockDriverState *bs);
 
 #endif /* COPY_BEFORE_WRITE_H */
diff --git a/block.c b/block.c
index 39a5d4be90..c03810e8fa 100644
--- a/block.c
+++ b/block.c
@@ -50,6 +50,7 @@
 #include "qemu/cutils.h"
 #include "qemu/id.h"
 #include "block/coroutines.h"
+#include "block/copy-before-write.h"
 
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
@@ -2502,7 +2503,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
      * writable and resizable backing file.
      * TODO Require !(perm & BLK_PERM_CONSISTENT_READ), too?
      */
-    if (shared & BLK_PERM_WRITE) {
+    if (shared & BLK_PERM_WRITE || bdrv_is_fleecing_node(bs)) {
         shared = BLK_PERM_WRITE | BLK_PERM_RESIZE;
     } else {
         shared = 0;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1b104545bd..88c9bb0a91 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -269,6 +269,43 @@ void bdrv_cbw_drop(BlockDriverState *bs)
     bdrv_unref(bs);
 }
 
+/*
+ * Detect is bs a fleecing node in some fleecing sceheme like:
+ *
+ * copy-before-write -- target --> fleecing-node
+ *   |                               |
+ *   | file                          | backing
+ * active-node  <---------------------
+ *
+ * In this case, fleecing-node can (and should) safely share writes on its
+ * backing child.
+ */
+bool bdrv_is_fleecing_node(BlockDriverState *bs)
+{
+    BdrvChild *parent;
+    BlockDriverState *parent_bs;
+    BDRVCopyBeforeWriteState *s;
+
+    QLIST_FOREACH(parent, &bs->parents, next_parent) {
+        if (parent->klass != &child_of_bds) {
+            continue;
+        }
+
+        parent_bs = parent->opaque;
+        if (parent_bs->drv != &bdrv_cbw_filter) {
+            continue;
+        }
+
+        s = parent_bs->opaque;
+
+        if (s->target->bs == bs && cbw_is_fleecing(parent_bs)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static void cbw_init(void)
 {
     bdrv_register(&bdrv_cbw_filter);
-- 
2.29.2


