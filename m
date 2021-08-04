Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465673E01D4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:20:52 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGpG-0005tF-7i
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmm-0002Cs-86; Wed, 04 Aug 2021 09:18:16 -0400
Received: from mail-eopbgr50129.outbound.protection.outlook.com
 ([40.107.5.129]:62785 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmk-0005RX-M1; Wed, 04 Aug 2021 09:18:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHwXwdL+3LCx0O0eR00n6fStTDVmsTSx9yyV/MqOoY0mD5vni6DAamgzbswYWugRsIQU+BqWvcPSHioqU442zCzJ/zBwt/KzhAgI4AtO7iBqoTXsvaA3kHoA0VEX5M9mVf3dfAd6BmKUF+RfCvjzDD/EiRV11F2SRL9ZKbu/JT5pVtJRxrgkDj5ofhizusNXbPhStw1kb11Lvcaz2vESmR0eWuDHA0Mecms7er9oi400owPjAsg8Jz4ia3bY6bUniitKZiSRMUrI7za5TfrX6L09LEa1sh7Pnzodq2KMZ80IiS3zA0brmRxghsuE5mpobVx3uoF5y3GDqtZrE3dAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/NmArt4aal5i/fcjTiKjWcZ2yfuBVVs7DVvz4p0kro=;
 b=OqeoMf7zGxLKzNG4dhKOGlo+//TiKlW0e7YoP1PrwCNMQpbg4+WvpTKEwtbcr2D9kXlWe0XRPENY1Aprg2MFfy3FjwNjqOTsEG7XmepcLpE5emcaRllX3tqhmt0I170r9A51NU4IU9PQyS9j++C24pRexg2df78MHizoIgU4RuveU5/OsYtkfv+LMkSLFNW97p3edrfiaF05mkEJAvHZhynJuDcirDNqXi6vhBPJCm984qfnkCnNKsUV51F5v95OHukBbukd1I8veOdvRVgkOCH2Pu2DsDCmvQd6ChKpUP32CfStvV61YoHayIzbSnrxkMFDo5hnPKbJkklVTZ42UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/NmArt4aal5i/fcjTiKjWcZ2yfuBVVs7DVvz4p0kro=;
 b=EvlH6lE82ABreaIwu+fg1yi7i9wgXcvLAYMKmTA9e84SN/niRUc64vRZ0zXSggXGtjEOhZc4w94jMu6kmKa+a+ySTKKpPwumYj3bB93NFPVRfHJGBZFDW9OKRTFpP1iTa9jCzCOXdLPDO/xdcgElnFrlZKSRKCM3NeZaDfdSUnM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 13:18:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 05/11] block/block-copy: add block_copy_reset()
Date: Wed,  4 Aug 2021 16:17:44 +0300
Message-Id: <20210804131750.127574-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31c4b85d-1e9d-4c95-d0ed-08d9574a4daa
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40231D2D36EF59D3BA421312C1F19@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HNNCLUMuiPsdVKThVLhYMvVTxbkfqOQw8kchpoGkpUaOTdu5MmR1ouu+eRK37ABfaZUBEqFUT5okCGCe8Nb7jywmG1cHw+qRAAoPIkamZTGgsEmg4bhSyCW/y9jfniv/VEBqrdC11C1agqQpqT0yRgrjPH0V4Spw81XS1MUGLagORDNbv5tJKHuPA3nEqb7wr9ry1ROylo6k4elWVrMjxz3xcqFlvPUO/8N1DDeer6/Xqz6Lbhdn+9sS9lOWv0M2OtKBEzaA2Uh5EjNwKgeosLg//SKCOn6KqGbNTRIj6bdFt/Lx5X+B+k4e5sJBe1rNIGWroNngmP8w6SIXK+PFkspEuuOsqbJPS8HgE7Ej4beO6RKQgU8H9ny0J7aVmDAscv+fN2+ty/wzqZ6rkX37JHxsbZYVbhPRvzK9bLsM3y9fKTayDp5kSwAZlCWT2I6q2i0OqCK8/taQIu8YqROlq8LxiBgyr2Jlp3M7fyhRgD1KY7Q6PRVofzzCBbc8rbnFgVIWZz+kXR+jXoOk3quRhZ7YsEk7HLk8hxa+wpTYF0SMGVvvndIyqacTrtJ6zNLK3Hg2dTGJ/Xjgj1UG5fzGE2I4z3ycwVJ6fBGBBZZ4IUKCXY/Byk50ckt16JXiVJrwDtj1NK5/lJ/9Xui2a7xwAo8eVZORRq4Qf1V4+/P4Y7LbONMdaHOZohgbgOkVRxuoRp+391rrg0sF2gxr+ZI1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39830400003)(8936002)(38100700002)(6666004)(186003)(38350700002)(6506007)(478600001)(26005)(86362001)(1076003)(6916009)(83380400001)(8676002)(5660300002)(316002)(6486002)(6512007)(66556008)(66946007)(4326008)(66476007)(52116002)(956004)(2616005)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dLi4uobMNqlm50GMlJBxAEKOrQsUMcPofvkEk4NuFqb8s9zyIuO8IlTd9CRk?=
 =?us-ascii?Q?01G2mWXbDMz0rjQs4+jci8quTjEnaZzsMLvE/T6w9VheH6wTzpTY7rS55g7J?=
 =?us-ascii?Q?WcaWcZmBHnXERGTQEqTMg/rnOLhpCTx775clf6cQY0wXcVflYvbu9c5eAL84?=
 =?us-ascii?Q?6sGKspwNTRCbI6scoxlL9O32ivAFaYpgU3GcfPIrrvyJyntdXNQyg8t7sbws?=
 =?us-ascii?Q?hB98xH2YQpwximUKxdpmDTs072aXR1vxqvzYELU3+OKGWWaJPEQNO9n5DZ3G?=
 =?us-ascii?Q?pX1Ig9gz2lp0mXlkXoplkXY8kc4Si7shf8NghyrnOG5vCOfri961ApB0oZU3?=
 =?us-ascii?Q?JJbA1TSdE4OOgrVSARlopuAykqZzDw0L/265+sPqIJPG6X04xJhgKHigDWg9?=
 =?us-ascii?Q?HnzLV/rNQxF77TXYyvvYWuSxvPeNw2XKoUeboaPdY31gLurV4wY7Cm27V6BJ?=
 =?us-ascii?Q?szeu1+tz0T1SwoT2bYWMb5Wzs+A5k5Y3y3o0tq8JW2+yvFiad8MCxdLam616?=
 =?us-ascii?Q?YAvtNrWqSBzGchExyvh4qXmnCpQS8rcWCQInla2OCmNS488h6sq6oLwDDBqa?=
 =?us-ascii?Q?COsohLem3d+RojQhfEHfIqozaCOj2c87NXEVW3VW/jzV6pCPoiflPzFP18S8?=
 =?us-ascii?Q?dPyBhwtOIbSFR37rrqk6S7lmKCJDe66DEZlKc3x7ai+5WTvg0daP8fGM3z56?=
 =?us-ascii?Q?uCuhOOueX4N/bkoP+rhMti9SO4z2tuVUy+ruxKsAD2pqDqc1jgX1vvkkwpkJ?=
 =?us-ascii?Q?91Ku0DfTY0RaGZLCIdUNds/CqLGDrSVh379UhyAPt77qZxc+iFIbf52ggmv1?=
 =?us-ascii?Q?8sdtJRnIlAhkqmmKsYGB1I8GZr6Hk5sIU2YHGnYINAd5247tGd7ATnxyfBcZ?=
 =?us-ascii?Q?KzHmMWKTom9m5sjy/U3JVplrjXAry6yGQMQuTWW0FttxwcVCh3pIZ2pTvZZC?=
 =?us-ascii?Q?PTRXKNkFHF1VvRmYRU1N/3dtD7CIYOdDFnP4L/fzK1fFr0kfQZrWPxnlyBpd?=
 =?us-ascii?Q?jWKdFjMeFKRz2y4Y3f/XNAgs8X/YUGXvBPk4GHQyE7ypbHeSFjEPoZ3PTXQL?=
 =?us-ascii?Q?8iUZMILYGoiKpztfXKj/+8tsSq+/LRK44vPJl7NFT/xQbYGPzJvRRuE3MMz3?=
 =?us-ascii?Q?x+gEja19aK72ViEPixqNCeI02uxoni4QEqfJcOwp0OwOmO7woJw0+r+j+0W2?=
 =?us-ascii?Q?p7r1/gJSmnVAFWAWLjSoKUdtPfG/K6JvnyTopcHUCvpyNDJbaoyPI5irDO3U?=
 =?us-ascii?Q?TurmKvhPfooisSsdWsiVU2s0zCz5pgUFV6ZYWIZ4xsejJada+RWPFXUaj9kq?=
 =?us-ascii?Q?1qHnAaqAkzSjR/pbOr140rDh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c4b85d-1e9d-4c95-d0ed-08d9574a4daa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:09.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ3xWWV8ns4ucYd2D8zJxErNe1uefJv6/GH/7mU7OUBzTYtPzoOg/PGv8yXr08PnChptY18Vsqan4rhqrNl7CU9/QgKy+Nv1LUtfDrsZotI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.5.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Split block_copy_reset() out of block_copy_reset_unallocated() to be
used in separate later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 7d40bf2ac2..599af02bef 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -34,6 +34,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index ec6a39b2ed..5cd291727b 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -689,6 +689,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     }
 }
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+    if (s->progress) {
+        progress_set_remaining(s->progress,
+                               bdrv_get_dirty_count(s->copy_bitmap) +
+                               s->in_flight_bytes);
+    }
+}
+
 /*
  * Reset bits in copy_bitmap starting at offset if they represent unallocated
  * data in the image. May reset subsequent contiguous bits.
@@ -709,14 +721,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
-        qemu_co_mutex_lock(&s->lock);
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        if (s->progress) {
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
-        }
-        qemu_co_mutex_unlock(&s->lock);
+        block_copy_reset(s, offset, bytes);
     }
 
     *count = bytes;
-- 
2.29.2


