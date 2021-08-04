Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766C3DFE55
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:47:12 +0200 (CEST)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDUV-0005Sj-J2
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMX-0004fX-4y; Wed, 04 Aug 2021 05:38:57 -0400
Received: from mail-am6eur05on2137.outbound.protection.outlook.com
 ([40.107.22.137]:38809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMT-0006Af-H0; Wed, 04 Aug 2021 05:38:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCLD11BO+fZHEvPTm+6chvwrSR8wKNtIOaIFGy0y6yoWpleb77PJO2vTp9MeZo9XczJjNIWbEWi2joIldDFBS2CyALQW+ihOEebVxDR8zCTNHtbcu1hSBMETuaqh+UedqDGMNE5GbsFsnHoVMfGWxS5FbxNDXbt+n2/s4KLJLUM037blb8fc5fvi9g4MRCRui5uBzZbErKwRoho8vD9TEGXQV8TIn5doInIU/CGhk0S1/YEurT8q3sANyQTaXbmUtWXh73peJAjWAmVfzCTNhdEb8rOMayf5qpTm+5pKRBFW4tskIaHeJmny7zOsl6baiYWbRHBxoB3sG1uNTCZZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=dIVsW2lW8uyqRQXQGiWAYsaxMrtuhXOiKmwNaToe22HjmPE6ayrWB9FM1AfjmZBK+osi4ajhTOV4df4lC8B42OdEUmstWbMpfm5RkMKrD8iSuc8gUseRFpSS6UNJeGZ6loSu0HLLzDveQc4qliamFiZUgkxsOzXkfXxojfygp5GOCuQdZV66/yOlVNJ9i8G6Li4QZohsT81VFjuTt83hmGHg+ZtIGCptk51x4YRVn4mOleAXquMbSU7sXjmShrhjG8cKh2IsRL181vPlNKq5iucFKiS6AIDB7cuYzjDASNpcwCFlgP9NTiH9pSkLg3jKTKyrlUXaVUN8cdy4zKbG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=AGNnI0kFmcaQdWJfrY49QC+nhvKKNzySndly2TSzZFBUyPCfcjcQsUCae8b4bHUAW6dAaYtwOABWsRvNTH0ZoKGXfzX/n9Xx8Wk6assnVD2+hvDwBuFlFJMQTg11Q3vNIh98i7DFrHuh/pAiBCCWSiFA3tXRpOW45pNy/hxzCa8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:38:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 10/33] block/copy-before-write: relax permission
 requirements when no parents
Date: Wed,  4 Aug 2021 12:37:50 +0300
Message-Id: <20210804093813.20688-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55bbdabd-06c4-466d-5351-08d9572baa17
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46893C264DD684A220F89DEFC1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmBoPDebP6lvBUAnBMUwQirw0UggT3UN9ayEpKRlQuUNJ7FTMsM8eqbso285aqfJxGQqNOjfNheWNMtKAqyv06Z87PPtmexzVJkE9xd1Asnl9UCjsRulCrsGa+9XqeU2400XM3Zt9DjKC7k141FJjBs2hQXBjDimMfdVdN6PJeh/sukVscOX1nUWNHEbeefjImjen2KugYgpg5Hp0okER6XG5EQmg1YisbCdo6yIbJbN53QY+FD1lKd4Dcci3yrPK5Vz/6Hn+twkcnBh0hBL2plZe69X79EjKMSIz9U/FPy422CIAqXDjnkq+2fuoz7mgCQ4+dbCDB7thQdhH+cn47uFLmrtpmv+XYkfxPd70KegKH02E+PacbG45ujuZ1PVuBkiWXZ5MNbF8hAf9Fe+vy3l9Pupkj9CHjlTSSz7wEcU1CfAFRGNUtwm8M8S7BOErPZQqp0imbK0wjYtQY9KOJHJ+f2a/W9dfb0L56ViDp08g58QqrUFGJC9ExKK8ZJiFN60PBzOcO1mLSG9E5kIn1zHvE6rKt/+XUur74CQw+6O0RO1V4nmhDBxOPnT5aPU7M1WzXDUITzKMbmUdfGwTyJml0zByGgjmgpJQYnbsbASQXDebRhqMlfio+Pw9tdsg/DVjYuEttTPrV6bxSRdBMmOdK2EKJk5MJZJBKLf3TEIsuszee1NM6EK3yjOCIEBrFKYJ6M95/1l84/U2+mtRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOMza1X+6HT6FiMO6pefXPsyMv1MEcGFnluWoHhDufqpriYFpqG2dSaNYzFU?=
 =?us-ascii?Q?7Uaf8NSAnGjqBXJWwj9eisTXCv4CIiG9FNfJct34Zf0TGCpkLRhL0s66QVSk?=
 =?us-ascii?Q?+/WvtTV6Tg2dbRK6BTqlmI3XS2ytyrhobY2tN01x8Inr8ADgJGI6rXQgSSEB?=
 =?us-ascii?Q?djquvX3EG8vmWKhqgH+BNDCJr9kYNkvdHkKFoluNkmefZ/nG77v367AizH02?=
 =?us-ascii?Q?BLpxC6M9+Db78QX+ifHNpoBnR0dFscYHls2dR+qdmKUhBgS6XdxW/swbCR9y?=
 =?us-ascii?Q?aDZoEMxHqEMYPlA/+Yml32dII3ke2gtarjtk6S7qnwtBJJyvine6NUHDaRbD?=
 =?us-ascii?Q?UH+vGcE6omvnCBlkbkRBIcmRoFVJGrH+ZfFXL5Gx+fCcH1VwP9CYpMrsTM7S?=
 =?us-ascii?Q?6yB6rCYebZpkn55NU1QVKOQaQedprwLSQ3pc6nLaoe4E1lijjLaBnBBorP8z?=
 =?us-ascii?Q?qcCp/q2RkujisHVR2o3ZXp9ccQ2bmbiIyH1zsiU+7KNLa/9DWDgkKa9wflSl?=
 =?us-ascii?Q?FjcG/1BQYV94m4H9ZYOMEu3LspJiRrLKPEIGOj8QmQSsKyAD+I5Ehn+a592m?=
 =?us-ascii?Q?VOJyQqgrqjc2ROP1XF1HOcH2FENA7KuS76PYHxt/B92h31G5q5NWexh7Dmco?=
 =?us-ascii?Q?YrohJMcXbszaI3ABnpqRfgjcMCNsci6w8pGoWaOn7S45ZxuboCDy3tAVGjQI?=
 =?us-ascii?Q?7rlegJ9d8khMKQHzKQQ0UZYH/wFQ7HZRP1GYdmcjwpnvNQNH5m4ysss4ovve?=
 =?us-ascii?Q?AR50mlFVmRv/EfWaSntfihS5/DWUieAlwAr+GyRQPmadM4oupcWWJPe9vaG/?=
 =?us-ascii?Q?ShQAU2EQrSwZAKN1XTxMI5M4yaBznNi7bH5S/IO9GnrInDAOh7csYMI5T/PQ?=
 =?us-ascii?Q?1IzPMzTPsBKlXwGp9bJmbr2kZ9gfa7f6qn6EQVR2ScCauuHkIJSvEwHfenxt?=
 =?us-ascii?Q?EVzeqP0Sn9rHrkhlIIJtqmJ21zzD4Uhj+gMxOyW43D/sbrKEgLB4TBAbgP1X?=
 =?us-ascii?Q?7leSVlaAC+cUr1uj9DhDkzcCPjUCZKnsWlMQWwdwNpPq4KQ8hq1FVsDhAp8k?=
 =?us-ascii?Q?14cnx/npxlImHBLa03ZMj7ixpO4Jxe7LXwGgxIZmTk8m/ozcbvo5SwJ6SaWi?=
 =?us-ascii?Q?fBpaSiHfRQ9MLEvKrG7MOQFrSLM7PnKWp8E/MAUEE4bvrgh6LDj6h0Nn1sYH?=
 =?us-ascii?Q?uAqrucDqy/RamKsyrE8OBlzSKOA/G1P4rtOsvBcSZMnbekVTIReTgOeQCN7y?=
 =?us-ascii?Q?henTFG+CaejS8dBT6/FNwZMHvF33wwKs+Wp+fScHfuQEZhq7L+iGHidL4tec?=
 =?us-ascii?Q?qq8XVRxqaKFvvpiW8LVaSBhF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bbdabd-06c4-466d-5351-08d9572baa17
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:50.0572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+LFOQPZh0mRBoMe9C0oWS36lB1OpAc1CJcptNnLG3Qa8ha0I+LJ23dI+E/QTIIKV6nV7wQ4YT+vPGmnptok7g6Ol+huw9grKWMfOH3Hnx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter. So, user should be
able to create it with blockdev-add first, specifying both filtered and
target children. And then do blockdev-reopen, to actually insert the
filter where needed.

Currently, filter unshares write permission unconditionally on source
node. It's good, but it will not allow to do blockdev-add. So, let's
relax restrictions when filter doesn't have any parent.

Test output is modified, as now permission conflict happens only when
job creates a blk parent for filter node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c  | 8 +++++---
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a7996d54db..2a51cc64e4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (perm & BLK_PERM_WRITE) {
-            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        if (!QLIST_EMPTY(&bs->parents)) {
+            if (perm & BLK_PERM_WRITE) {
+                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+            }
+            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
         }
-        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index f2b7219632..5bb75952ef 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


