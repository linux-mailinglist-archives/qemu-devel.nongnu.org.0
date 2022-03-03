Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864954CC673
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:09 +0100 (CET)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrRk-0003or-L2
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrMy-0003g2-Ll; Thu, 03 Mar 2022 14:44:12 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrMw-0004Wu-S2; Thu, 03 Mar 2022 14:44:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQbTkrb6z6b2lFwJjb+3iUB7XFCDa4alGB6JOk8nnA1hYWF6R5aYxcJb/YBnNqfPPXg3TWVyiF0G/NPvkizEiJsAs2WIEVhpYpn2zP9axsHmz9vCs6tP33/U5r3LBvzCzNZvam/Nz4oqNPkT1jPpodsKKCq01NM95fZ7KCNo1z4KoTqJHTxOdXfgz9fHvYNyp8pUVKTgHLFyGzP60u2EJEthcozV4bDSH6PPgElMpECWODloZDoRjaYy6yCyVfp0I13USjkoQg7cPnwy5VAqivvVOLmuroW8UZyxWQFNM7baXPbOCZMN9dmSak9o7aYC9v8sSHSsdBUFJV7Jx1NbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROBLmUnjTfEeaaULPZCviV08zafu2jajs93fHjc5LNg=;
 b=f0if0FrD2Rq0dNVXMxc/TbXBUrSrD0qqzqqA4Z5OroHwX7fwmwmbPBOKTA0xIWJrG/VBzGGW4JQwq1LKcJvX+k4t3LwR02mavA8idRbzPDS1aFaiISqVRIOjyB0fup4NSSKc4KT9sU3P6GYBYQQJDVRzUmwX+vb8gUIvFK+HJ8/5lbYHjFtVvT9H9ez3pGz/s725On6DJhaR/lSJXSA1cjyCrJIY57k0YzPT5KT1/9xAukzhDZAiYndu5HcB1XeojhHbHwGd+3pWaTpBvY5a3zVsKc9N5djsAmQvVl23RLX3hJ+k9C+mbwC7AMKsk8p4hA7ITeMm4N1drQQh05CMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROBLmUnjTfEeaaULPZCviV08zafu2jajs93fHjc5LNg=;
 b=BNeX4YrfPoSPfKJcnJJNxF4v9+Uk/V17IIvvKQPeBaFGFAFgzjiDz5tQA2bZRr7O0YfWoPYdjfzPHtqfP+DJl4ysM1mXKURGsmeWHEltWDv0emdc6hvjGp0ROo7aZ7NiR6oPIqGuEUjs9T6vP83iyEVXQro7+yc3UHloJ3l3UXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 01/16] block/block-copy: move copy_bitmap initialization to
 block_copy_state_new()
Date: Thu,  3 Mar 2022 20:43:34 +0100
Message-Id: <20220303194349.2304213-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fee51d89-38a8-4d23-3407-08d9fd4e2ccb
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736C8ED4E3FBC9DDF5C2BFEC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eo9u46HgJrTeJD0biXY8IEQa3uIB8JzxsWHy64g7ZvNS7Ve9J+i0W+pqigOTdjLWvYQohxUM3p0x1iYceabTAGO3R0xYr7cO8cXHpJagO8lOO3LLyi3EfZj2izlSr2HESLoUWamrBDvCNlrqHzXdCbWnp/RIBaGdRzdg/jM9CLdk9dhW19HLb0absr9YLbM+SFCy4uYIPa6tvCSP2ib/Jm4y26gBx0BwThQM00EVIoG+1d2EXRLyMZU5fDdwOIT2VF97EjFQmMstjA+A1auKE4s2hZyUTT9f31f/Cj/aoUsQz3+oNGdu0Jag4nth6LrPWwE+8E+NCWrhklbRWzbGI6cGCde66TdI717LSeaYbOYClgH1DvC2Obyzkow3ACAVrxB/RTHxMsoyIUGXi4EcC02LA7a5nFLC9aLVzKXrxMmuGk5z3xJgxAMq7b3ESGn8V3mg0P9QfT3XgnythpLyTIe3dQpl4p/glCTjjUX2aJL5Jmnm6KfAqdCkCD4j0IxjnGKxA1B/eOujXRxWurOHkgTGZTHTBiBch1qQfg2tNiCTxrv7hwZQrOO8f/buuB/zBGtdsppcwrtx0Lk2KGnvR0Z59qrEOhgHLb4fTzk4RA96rP7O7NygfFVT6lTfqZ568jVxgEqJPlT4YrNoJp5rrEQDxDf0ejpddvs1GxjGcledyf6NvQ2cdUVw/jkcDQA/+ImC34qnvYE5QIHMYSgdWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aRJ/K+i6fpiMZCyBoUvjX0wxXjOcLRPFxw9SVIm1ZBUQ0nKax7Z4VchRTemR?=
 =?us-ascii?Q?R36so6i/f7lNrVlDZyDNgdNf7pfl1N4LtDnMsE18o+z3BbARNyf9xHDhAGgc?=
 =?us-ascii?Q?Q4aVQJus8Opx4BALW9nFuYIJiPmMiKmDmz5wdc7HjYvXKouKWVkYWsf477iB?=
 =?us-ascii?Q?qXEIa5N4A3UGtJMocsOKWwnLbEW0SqazivfwInmHqvVoq/pqtW2CyE1KnB77?=
 =?us-ascii?Q?7Q+O70pIaDbTu052KJVcxD9fdwyrOQoFopTRGBrwnUyaGXhpKHoxdCXWZQk1?=
 =?us-ascii?Q?al9jd4t6z9NYZav/kX39MtuN8mOUssARHNcTmpPA9knSnd3w9dyk6XkLnD+j?=
 =?us-ascii?Q?QjSSrRF1kSypO15OX68g9SYniJvRmYqll+idZO4lfEPkqgEo4ehcVip4gN6g?=
 =?us-ascii?Q?WgzDA3ZZ+5T1/40l2wRBqvJLJnYY3l5IKm8WEBbrXQ/YOz4cVKoYR9bftPR7?=
 =?us-ascii?Q?Ua6vKnU627n7tzHxodpXaJkKSay+OZQEu6SU4ij61VUAxQxbadmuZ0Eu3DS3?=
 =?us-ascii?Q?XNslZhZ301s1VXIYltebvq80jBwpMoOCyEFoNUa+zepUV5zfY1W4Lr5HbWlK?=
 =?us-ascii?Q?ALsN5pojdXePlj2UcKzTE+7S8wz7e36mg9DwHbIqgfOBAACGxrFjfu8R+Vr8?=
 =?us-ascii?Q?q1M0Zf4N0vhbEMp2dJ2dCzk7qXp5i4ad8nHyncrlZUSh5nI4cmLGUo05IRjv?=
 =?us-ascii?Q?Xa1Iou6eEX8kzi3RLzqBS0qbIbQJROIqqojGqPM0naPO1UUKBBZEs2w5JLZ1?=
 =?us-ascii?Q?r6wqmWNxxGP5tS8DVAKIeD9LWKe4T56XIpyPZMHinJwUrGo7la40LrsB+Ld2?=
 =?us-ascii?Q?cePUpb9B1Aq6E89XEBZP7AJINXNC/G8wM9CR5Yqpt4tivopTvJgTTfW19KqT?=
 =?us-ascii?Q?RdNMEO1ezdiBdNalBh3tzVISDMeUUhRZEEAq1CvNr7DjJG5sva3WLGaH1GCy?=
 =?us-ascii?Q?EX37FrIw8Dz+qWnhwBBpEFr+g+uNazQNCCMouT4CESw/xaO3cHNJjGvQz04k?=
 =?us-ascii?Q?utL6OXXeIjC/GDsdA/8Wl6H/CVPymVWQNhFB8RIWpTYIaxXS+KpV8Y4rhcEN?=
 =?us-ascii?Q?tEwCD8jH6rT+8r9YY3XNPZTGN+P0PzXSKzGe7GE+VnjVdwwVLrQuzH5RBOL5?=
 =?us-ascii?Q?McJARnRQJfsPFemMLrd7A+3Lt31jA3exKFfNmd5mq2lhi0PFTURCg1cwpqUs?=
 =?us-ascii?Q?PelNipuEJtvLzkhSnO/CFwSsYDFDpEnzKzV40GlQPL6dsctLcLPATgssf4w5?=
 =?us-ascii?Q?w3KIxsYkKMiVaN5Gj2l5tR7lHKcqKB0kVAc3AKd9sytEdrs4vEAXDlUUkkUd?=
 =?us-ascii?Q?OhxCDHej+pr4V3TrXADyL3y0/VKwMBtcaZ0a9mgQxEfrBntF/T8DhOw3n40L?=
 =?us-ascii?Q?roua/anhM/+QFIBqrEELz7+/2hVQTLUq46QyJ70mE+p6dX3tim1KO8aHm/Ut?=
 =?us-ascii?Q?cBtz8iwIYoTnMLFBd7dqZ1YwG7a+5rnuepQJlKVAu86HAiWzszb7JGZl2M2j?=
 =?us-ascii?Q?RI8hhltLi0YxbEKLbo0XDTPXFbykFPklpARDS7NCILJWM/q8BHTYr28Kts55?=
 =?us-ascii?Q?ZNFbDCsfHoVteaBFbXRy1a+EWdsuHb15Oxn/y46htf3M2J/BVH4gupYUd+Tn?=
 =?us-ascii?Q?EpYeTodOqplKeDxDmyC4iE6gz7gFZLm8JVC4Np9nsiEHpK5mwznQBHcTyzAE?=
 =?us-ascii?Q?wppQwQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee51d89-38a8-4d23-3407-08d9fd4e2ccb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:05.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKrksIFvbjfC+1Av2zdGE7js2g0iBouDpaoX29tQe+f4Gl1AOR10E5V+KbyfuN0mdvDO/DJ+dly/1pvsoHhG6xjncnc7rc2lFzLM0yCfg6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


