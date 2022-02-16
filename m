Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5A4B91E4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:56:10 +0100 (CET)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQPI-00043r-Cn
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:56:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG3-0003jT-QX; Wed, 16 Feb 2022 14:46:36 -0500
Received: from [2a01:111:f400:fe08::723] (port=55682
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG1-0006EC-3t; Wed, 16 Feb 2022 14:46:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmppisS7Ip/+zrx4YsdYW4MiWGzmUndzMP5cyeppHlrfr2vSNGHxWEfGVhfTCo7+bjx8SMP6lPE20oKV3p+ZusSo+Vas/kyK2oIdWZpz/rnEjnVROQMSIGlx6oMloP0vZEc0ZW9vdHha3rshekcXEJn/gCgtgZC6ja+Cw6RACkTz/oNSrx2g/MnAnN2s7I3cFTm/NbjfLfOd1jR0AcM5fPI+pJKzmq0VM9/VRwTrvMNsSXMI97MHroiK/vuRp9cz9hxP+wdeoXT2EzV/8ip2iyUd/V9pmxKqWJQPXpbdz08Ivx+gRwVJZLLmBZ3BmBwx7xT3lv7GkvdAwzvEPOY0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROBLmUnjTfEeaaULPZCviV08zafu2jajs93fHjc5LNg=;
 b=ECjDE6vPuraf+uiQxVhE6LqaQcmr21kmY3WsDCnnI/qIPpfpEWJyQqtag1LuOhGDg0qddlH9OzyaTPSk/9YuYglCqQlGm1+kjeWrzKZrlpAeO9W5cguBX/Zsy4ax6sMz+CN5QIHajMynbadcC/F4JgkpI/vaJ3EV/wseMAJi8aC5Z/iODcUb/BtS8kyFjtzJQ4DR7/T54LHTtR7OucFMVqvjboZKdNsbj5+OQqgPtT8Vk+avvgk1iMsfnFtyN45/V9kyHRj2cBKa0DoyG8UoLJ3OeKUOqRFNWKfmKV/7Eo+puNVTPLNc6FjQVNRtV3kcSSjoyAywB/gUwMFuYkXYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROBLmUnjTfEeaaULPZCviV08zafu2jajs93fHjc5LNg=;
 b=isWbSKqvnzhK+900enMdcJdRMx1QLzNqKMhj+WchBhFQZ95n7gX0A6HDrzlMIcFqfDgim+9fjpwiqy7JpIctcVdeb9/liNKHhoqanxlxeWkBjxaUCBADK/UcyAuZr7vPfHoFTeZ7bbb5JW2lAWBPCppgXm/1Le97zNsmxS+sqe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:27 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 01/18] block/block-copy: move copy_bitmap initialization to
 block_copy_state_new()
Date: Wed, 16 Feb 2022 20:46:00 +0100
Message-Id: <20220216194617.126484-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0f73111-40b2-41a6-ce3a-08d9f1850540
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28511598A83680DCE0ECAF3EC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:48;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEaNmx+uS04F11kBbWOf1HUwhHB8WMuIpGHyaK98GdaIm3WQT1I9cYHPaGuoetKZhDDmJRnc9XRrXJEoYFkHCpMx0lLph7zi5ras2/JtCxPpdbGZt+JfXNm3ipAoA857E/WsNf7AAF3MR8ywSCricRol5zpzbFki+VcV1ExbPjPUv91lUAbTdpXAw0j6EH4PEdO6LUkxql78zwMT3UvfywypspM6WBJoW7HZkEqHPowRvSLCjFkCbPDh4Yfc/gWqetVMIxd8z9lzyV9K8vZbUWxUnMFTLjppT+bTGWRxRII36uFclxN9AQxpno1OypEq+f+PG1F7JBuBjIRaouaBi5HZ+bB9puw6gTr3VhozQUCUBOpqEaKwt9sctNxmRwgEuVB0rVsyadvkUc/apXvdv2kDxOelrk9U9ZZ+1nOlgeDTxFr4tsL9pJaz1TpGtDnMMClgNPOG5Uecig0ubkV/35VuJead9IJ5KV4jaTpurU3dNUo/r1JZ38ybWiDgWtcg+Qtbugb0xtQTGkfv2W6Ox0JkUhlVZZmhdP3XQM4N7X/2uWMHeffksMbl5u8kHORvekXpk9ydSs0GIjTtd5SmZzjeG/iqyNotxgs0n/gEUiMMJuMIgMqj62IWhR/nmQ5GqbB7ORI0KAf/we5d8AGgJ05KCFehsW/XJiM9skTMaLa3kEYInVJpIQKOVgs4RlM8IuF+usAdSedllWnA1qJ9Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iLZzBw5j5Wj0USU3y3qhGkK+G3cKa/ctcUr3/fngPYvNHcHecB5QiO7qvI6s?=
 =?us-ascii?Q?WkasXkGYCAWPNQHVr6cllB+n1v3G0MFOfrYQaVOTrRtXbuXegnWT+uXoWUyZ?=
 =?us-ascii?Q?CK7onhWZ0tfKYGvVcshxrmtHpFa+8b5vuLDjF3Js83fLvq5OzHy/rDhcdvXG?=
 =?us-ascii?Q?u6WTbRVtIfekbrWB3xOVi6HFVsPkLxTfZZFSHomMx4QwMCfbqYP9IzDuPAFF?=
 =?us-ascii?Q?WJsACuPhJ3MK2cJmjdj48nIbKA2rTcN3sTVOlu2nFSHIZ0lYEpTH0RW51lCn?=
 =?us-ascii?Q?hvoVMPI9QdwIhD4iDP4YbbB2jIsXOIN//+IXtpBRFMcrz4FGaSPr5QH3B52I?=
 =?us-ascii?Q?tpZeTkgYnjG7RBIwioRX8dEHKvjURUhTXG/UMOHxhIbOHuaiw3RmMzzprhJN?=
 =?us-ascii?Q?gHzuON3DPG9BRPXCc3muXAkr6PKkpe/w5s8TpMau3JNZIWzrg2cUjU582Abc?=
 =?us-ascii?Q?sn8umXL+xixqspFQL/ZVZvapHbOT7xcbhQ7ZIhfFTR4vXPOQSeR70cpykNb5?=
 =?us-ascii?Q?kaLiua/EOcUnWzZngXc5f9rsZYwyqCDSq0jqDZ5wqyHxb3qHR/A7CTly5YRE?=
 =?us-ascii?Q?OiO9wb9AJ12+VI9D5nCF0vlvyJO0MYRlztgXlplbC0cFEFGQeDMvzvoyyguO?=
 =?us-ascii?Q?sq3rdBADgqrZPD3uD6p1s8mNDSH0Eb6P8Sv8SoUAV7IBcUHhvyxZHuqUtTXN?=
 =?us-ascii?Q?cvZffRWhFJj1w6wISWWLzAqSWQyfeuQWAENllSySkRTMVJBAgBCjvRV2XFtb?=
 =?us-ascii?Q?JLeJc8HpOxm0LqUl3xXWP8ttYrYy+AE/IlhzoPkbJuqIxj6EreWcYyB8VkRP?=
 =?us-ascii?Q?q+bLTpmngZnzvePuXMfNTpyiwpqc2FiksAwJQ1s2bxnRoHIabVRUkhomJO8f?=
 =?us-ascii?Q?Uv/djFC8a79G5g+NXSvBRR8Alw/1TR2wfMO1XKqXjMSHxkUas0jVCw8lGthZ?=
 =?us-ascii?Q?HOnpXy0uiAwlpNK/6K2vlkFUsD1l0bifljLVLcLysE8ZgvBnI+BhjRnYxXgr?=
 =?us-ascii?Q?OFhWTk1lkVZRbrMAr1QcU6uYDIBGZEYSCEH/ypfJSaBsClC2cSNHvfV9ITMl?=
 =?us-ascii?Q?OiZ7wmZOyZ5BFc8+gBgPu+Bz/IRcv1zio5v/8qDQWWcyWY40RtYS1LmkMmcV?=
 =?us-ascii?Q?naNK1SWGD/gxqv1B5tE+EqDpQWiUD3ubi8t4X8BskJavCPmRn1tMBU5+Dvt3?=
 =?us-ascii?Q?9GhEG2nlGJYVYMB/1t0nhmSxXZNeTMGZOP/24JeqhsdPiKxN2VyGhu4f8dTY?=
 =?us-ascii?Q?/iN9D/a7RDOAqabHtw1lDnjtxQkP/pJo5iO8ehfo4Ev2BLU1PtHdxOieitv4?=
 =?us-ascii?Q?B0YZh7kEj0P2iRRvDxoTbj4HX9Jg+8jDKJVY2XKTtFSK22zRrX/M3jHOQ9iF?=
 =?us-ascii?Q?NNdVETWCPhRlol0v8AOU01GNA8CpAtns0sRl3FXgO3TRFJ1oRoV0sbJ9JdMY?=
 =?us-ascii?Q?NMN7DVCDthe6lHargqiiYDBk77+i0EEIkumrfazzg/O3IvX9EB8ZQCwg8gB5?=
 =?us-ascii?Q?xAIFqmQXXMSa6LfSXriIiOdhVq974maQ3EKdqR+s2y2U9YBs5XGeW1LS3T0f?=
 =?us-ascii?Q?Ocy/1KawoperF4h2ot8AzNdMGCstVqQI3N8rvu659ki3tmA3H5XvHLsDUKsu?=
 =?us-ascii?Q?RFUoo48FZtbdXFCVgItwTyp/EXFmd32tUVkRnNUA3dYu0WF7eTRiJ3JNk2Qt?=
 =?us-ascii?Q?uIZ1Og=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f73111-40b2-41a6-ce3a-08d9f1850540
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:27.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAJ/+cLz7/K6COLrx34rnwhtYW1U5XfzGfOaly+VqXfqdNT9pLihnFjrAVhLIj7oCzEHqQJcMjGCqRu8XkWfB5zpHpB/qqpqUg69ZOhOVxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We are going to complicate bitmap initialization in the further
commit. And in future, backup job will be able to work without filter
(when source is immutable), so we'll need same bitmap initialization in
copy-before-write filter and in backup job. So, it's reasonable to do
it in block-copy.

Note that for now cbw_open() is the only caller of
block_copy_state_new().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-copy.c        | 1 +
 block/copy-before-write.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ce116318b5..abda7a80bd 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -402,6 +402,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..5bdaf0a9d9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,7 +149,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
-    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -177,9 +176,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
-
     return 0;
 }
 
-- 
2.31.1


