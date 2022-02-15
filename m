Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A274B743B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:56:59 +0100 (CET)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK24Q-0001ea-1s
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:56:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK21B-0006Zb-Vj; Tue, 15 Feb 2022 12:53:38 -0500
Received: from [2a01:111:f400:fe0c::71d] (port=64834
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK219-0007aW-DY; Tue, 15 Feb 2022 12:53:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsseF7LdjbXgmS2a3e56EPCigigOo2WvZ374BF6EejgkLG5BLywoWTUltZZiPBWW6uwDVR+zxVo7QXkCLWUqItqx6GQFYKiNB7vq9ZOSICEl1Mm/Lljc3QYBK+Jh5JAMcCHMqYHJREqmPWAPrOmkiJzlxoq6d99NHGNhejC+xGLX0XxZTfZAoT4HrVeR0XWsq3c3ukGtj+RCZCyH0PmelHOTwUwffE5zUIG+dSJXHqAznyKGVyU1l9x1o+5ODpBub0ETWCkYgN5A44JppnB2GcYVaZkKc12sInPcqRhmDGdTCtYcWce5stnjp3Ni2jZHiyYI8U5fHMHFEptSTWgRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk9jL0/pXLmWd43wu4XSjKyQM8QImMC3DNQPDp/BIoE=;
 b=h2Mn3EXq3UoS2ahwgk5GpskrZcRYZRVEI0cQ51BEQ8Lv8RYPviAaDGCvvXWJkQkHWBwJTw+HFfq4bJQkTehqmLphra50tj93mPAjAWhvv7HOJBG8H5ho9x58IbRGaFDjIu3mZwisdB8mSmQayXlvWJf+iaoS6ZtMg5MWhxn/8cT8muhzv6Q/7P9vJnt8DYUHh3rzF3p5keuUgBr53dTOuyR4LoyzWYRkelChsgtZn/TR4jZlPSOxWgrlL4EDgRg1GD2BZehljtknQO4dJjRc/N7zkjo+nFqSujDcO390XrCizpsw6JJelqcCbficvZsDl9NrqBKNpr8D9Oszd6lbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk9jL0/pXLmWd43wu4XSjKyQM8QImMC3DNQPDp/BIoE=;
 b=hgU5jOBVAeUO0sfWiqx9t9eLta08cSe9+Wp9tVB+G8TF94DnFFZckObTMnQI/Kb/mEVZxvPQxP8/ZnBXbL2qtxdy21Sr/HId8ukzoabqD9eK8S7yo2I+f4ZkU3IoB/yljg7A+ldQE9/FkKQDxY4lrWcR/K3k0L1ssRG5X3EA0pI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0802MB2235.eurprd08.prod.outlook.com (2603:10a6:3:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:53:22 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 17:53:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 4/4] block: simplify handling of try to merge different sized
 bitmaps
Date: Tue, 15 Feb 2022 18:53:10 +0100
Message-Id: <20220215175310.68058-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220215175310.68058-1-vsementsov@virtuozzo.com>
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc906c23-7e91-4822-14ea-08d9f0ac0e47
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2235:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2235D879D4BEE00198EAB52AC1349@HE1PR0802MB2235.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LTSCcVkiAY3gbxbQS5HO9F+TmHWLClHCk10g7JRBITH0opSTkGlQyCuvT4UOumoG8Hbkc1FSYSVobhFEnB4YBzbfPNHSgBY6CCVp6wlN36RR0aXvBcorpYpxRbzYwLvldyNGRIJ1uW4W6flRkeeGm4gdZRmqiPS5dlDO0cOV0JvZZ0Kca2Qf6VuWqDFfBbLs+c/mp/TdcTG+DKSUOU4W1GUztu1HFRPKydXQiojfEPY7iXkR9Hvs8IGORMivVL1bIqzyrKQfQx50MDEL5nvP0UdMnD+oZu2OX1noYkjTIpL4jYCBt9cVPNt1RZdNXXRtRsAFYkGxhhPjNKaXJYVcWZmlBlyVuOyYs0bkEGKyPLVvhMieyaOz9mYi6gTMHdX9NODcleancxwztHJ2oWDNqZ6T6xm80ApoRAuny6P1vR66oBhfbQ0mEJuU86P3w01G6eezMyigwoRkqSv+pF3rvxVNr6ICOn8HWgCVgErs0ppfIX60g44U3elI08uPdllTXG3/Apcw3UvClFlzJ62URv4vtsBmlP5ySrVfNbI4kKO6PfvfRt4vnc0FH42pRfFoDlkMQL6AxujME/CrEcf35zFjfwt19WP9rCG9n15OuTtIHI3CACLPe0BYUmpwWswIOrtFZevmx7bA931yp0mM9Pl/BypPA7rF9ubkv04EAHnSWds8LJ9c7c/ddc3TKVwihsCzu5J9clevnUIhooEUEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6512007)(66946007)(4326008)(8676002)(66476007)(6666004)(6916009)(66556008)(38350700002)(86362001)(38100700002)(26005)(1076003)(36756003)(5660300002)(6486002)(316002)(508600001)(52116002)(6506007)(8936002)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EWHRjMo8/ZR3RrJCtrr2Hjv4xGuS7S5X8GujslZBtBsPZFkyUGlXxZgNWbgi?=
 =?us-ascii?Q?xYaOuWtdKV0lwTZTEUunqt4ag6jMnHlmf3CSxFP1KjCbSUjeC3QSjv+6p9II?=
 =?us-ascii?Q?x9JoDIejnHzMw2fZKsNOAxKOkmdwaQqp0puvZd/JeKV1V4HhwCenV0d7I85P?=
 =?us-ascii?Q?/ptLpTcCOIK4W46nSdifmnYsOp6DYyolWunyTLoM4vpfbnW3v5iWGEJM5vPA?=
 =?us-ascii?Q?x5PyzXUaOKRlKk8iYhaP4EntP/SS1W0/7vkFjwkMzwCOjjh2Jl7RUpe4jLco?=
 =?us-ascii?Q?vfCBSgcvwY0DoGmUFoewhC7609M8Y8vzu36eMQ7CUtE50XwqFUoJEqI32V6r?=
 =?us-ascii?Q?ItI3bseAP+yLvdvQj+/ce6LlH8sOCsH5A2/DOj0suQjFNH/EoLUEp4S9Lt/A?=
 =?us-ascii?Q?09Qhcfcc+ap0jzd7LgCsXKfvBPIWATKiKFiMTo+1znVQOwCB7WCDdVMGwMK1?=
 =?us-ascii?Q?6jo7t+meN3vgqkTvnwWGQOFEKFKr//Z0+mI/+q9acTbZOcWpcwvG5yEyH1hN?=
 =?us-ascii?Q?en329E0iiBNxjYIjFC8MaZoj87isAO1gGkQj6UqAYFPXhnrokTdnvy66o/+r?=
 =?us-ascii?Q?VrJXScDqUZJnBb39EjHu2NyIflS+luW9SEm7/24IlaEIWRytapejGX8unegP?=
 =?us-ascii?Q?7b5gUYKZyj58dY43ZrEGoRa5TZjmXVtya8QSTDOFbmbMcK3E43XDstNWpd42?=
 =?us-ascii?Q?SMEfQzuPZFUYBKYFRZBfLCCaQih/eKjh2kp0PabSPVFPlZCLGUnJXCD+03Sm?=
 =?us-ascii?Q?bUv9baHMXHYV+nIYrGNbXpzgHWLXrbEXgCPiaoBSle7mTFJ+dZqzKQEqwsHW?=
 =?us-ascii?Q?YbxmoPjeEQ4mzHFNQSupC2e6Ac68rY9pJ6fuNnG2EMOAQILrj8aajm8xMM0L?=
 =?us-ascii?Q?/n3UpsM6FM4EaaafGCLSZU8J8omCoBuzotawOaeXJpFIbwQQJ4kT0ct5/Zzf?=
 =?us-ascii?Q?x5AStHLZflhPjvKTfPQuRO9CbMXAcgVbhd+GEi7PKvMPC4yXXslu4/3a8+pl?=
 =?us-ascii?Q?kLfAinDjMfZ3HWfJXPZZOVA51DJOQYSgrEYKdrAsilDL8PiANtm+2wOLxM5G?=
 =?us-ascii?Q?uFHGJ+K2OFjHwQNEZn7c8RSGiXdTU3v/N6NoUZXZ5ntvTR/dxF3se7uBi+Xh?=
 =?us-ascii?Q?NmYBWialviuFqEr6f37JLXXi65K77fLeDtzvEo/wCSXAs6QtWEzyd7kPsFVN?=
 =?us-ascii?Q?gjye/zCDG4PICVfe0h7gjYYxbaY4ySLcnSv8yX1FSP+x55xYl/qG2UQTNiJR?=
 =?us-ascii?Q?SWPUllIB0oom1URRpfyHWYNK+uEkTuzwRjhgtiQ9jieny9W4sSjW0ssLJPoJ?=
 =?us-ascii?Q?2uk22R3SMQGqY+r5lHfAUIh7Uyx4AMhg5roLgcnFrZWQ9Jq+3VZRX4y9Qc3A?=
 =?us-ascii?Q?C7IdAY9doTMaGmLlzCSDxsexWU50LExQSRlafmvXtILs3slw0gjLDGngLneh?=
 =?us-ascii?Q?ChMTe02VGizS5Lpk8QrhdTyRmx8ROOiIa1BrdPcp2xrb1rqBwXCymPIb4fvU?=
 =?us-ascii?Q?wPNtMVv3hg5KGxBd0352LeINDUGH5Ka4sYY5/EdoSazraE3TdCdJm4NXLsVD?=
 =?us-ascii?Q?OPR+03tJ1IpS4PI9KCM2sCD80OHEeDHhzhp5Uy8vuUv93MBjGAuI66Rg0umF?=
 =?us-ascii?Q?H/a6ZPYeidLiWksK1eTBwF/ahyICtNKzP9EJyIxble2SqzhjzACua55iBpWF?=
 =?us-ascii?Q?Um3sjg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc906c23-7e91-4822-14ea-08d9f0ac0e47
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:53:21.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gGGDNoUdOQf8fHaacS1+C+SVMvJmAEnqfP50hq6nh5wQYuirZFyBrayti1eaxFPFAtvE8NOtWCnGbKpDqV3Vv7Vy6sJ1vVfbV5/A8+yrbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2235
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

We have too much logic to simply check that bitmaps are of the same
size. Let's just define that hbitmap_merge() and
bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
same size, this simplifies things.

Let's look through the callers:

For backup_init_bcs_bitmap() we already assert that merge can't fail.

In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
that can't happen: successor always has same size as its parent, drop
this logic.

In bdrv_merge_dirty_bitmap() we already has assertion and separate
check. Make the check explicit and improve error message.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  2 +-
 include/qemu/hbitmap.h    | 15 ++-------------
 block/backup.c            |  6 ++----
 block/dirty-bitmap.c      | 25 ++++++++++---------------
 util/hbitmap.c            | 25 +++++++------------------
 5 files changed, 22 insertions(+), 51 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..cc40b6363d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1382,7 +1382,7 @@ void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
 void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup);
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup, bool lock);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..4dc1c6ad14 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -76,20 +76,9 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size);
  *
  * Store result of merging @a and @b into @result.
  * @result is allowed to be equal to @a or @b.
- *
- * Return true if the merge was successful,
- *        false if it was not attempted.
+ * All bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
-
-/**
- * hbitmap_can_merge:
- *
- * hbitmap_can_merge(a, b) && hbitmap_can_merge(a, result) is sufficient and
- * necessary for hbitmap_merge will not fail.
- *
- */
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b);
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
 
 /**
  * hbitmap_empty:
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..fb3d4b0e13 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -228,15 +228,13 @@ out:
 
 static void backup_init_bcs_bitmap(BackupBlockJob *job)
 {
-    bool ret;
     uint64_t estimate;
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
         bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
-        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
-                                               NULL, true);
-        assert(ret);
+        bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap, NULL,
+                                         true);
     } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
         /*
          * We can't hog the coroutine to initialize this thoroughly.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index d16b96ee62..9d803fcda3 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
         return NULL;
     }
 
-    if (!hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap)) {
-        error_setg(errp, "Merging of parent and successor bitmap failed");
-        return NULL;
-    }
+    hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap);
 
     parent->disabled = successor->disabled;
     parent->busy = false;
@@ -899,13 +896,14 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
         goto out;
     }
 
-    if (!hbitmap_can_merge(dest->bitmap, src->bitmap)) {
-        error_setg(errp, "Bitmaps are incompatible and can't be merged");
+    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
+        error_setg(errp, "Bitmaps are of different sizes (destination size is %"
+                   PRId64 ", source size is %" PRId64 ") and can't be merged",
+                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
         goto out;
     }
 
-    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
-    assert(ret);
+    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
 
 out:
     bdrv_dirty_bitmaps_unlock(dest->bs);
@@ -919,18 +917,17 @@ out:
 /**
  * bdrv_dirty_bitmap_merge_internal: merge src into dest.
  * Does NOT check bitmap permissions; not suitable for use as public API.
+ * @dest, @src and @backup (if not NULL) must have same size.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
  * @lock: If true, lock and unlock bitmaps on the way in/out.
  * returns true if the merge succeeded; false if unattempted.
  */
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup,
                                       bool lock)
 {
-    bool ret;
-
     assert(!bdrv_dirty_bitmap_readonly(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(src));
@@ -945,9 +942,9 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
     if (backup) {
         *backup = dest->bitmap;
         dest->bitmap = hbitmap_alloc(dest->size, hbitmap_granularity(*backup));
-        ret = hbitmap_merge(*backup, src->bitmap, dest->bitmap);
+        hbitmap_merge(*backup, src->bitmap, dest->bitmap);
     } else {
-        ret = hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
+        hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
     }
 
     if (lock) {
@@ -956,6 +953,4 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
             bdrv_dirty_bitmaps_unlock(src->bs);
         }
     }
-
-    return ret;
 }
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..d0aaf205ed 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -840,11 +840,6 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     }
 }
 
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b)
-{
-    return (a->orig_size == b->orig_size);
-}
-
 /**
  * hbitmap_sparse_merge: performs dst = dst | src
  * works with differing granularities.
@@ -868,28 +863,24 @@ static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
  * Given HBitmaps A and B, let R := A (BITOR) B.
  * Bitmaps A and B will not be modified,
  *     except when bitmap R is an alias of A or B.
- *
- * @return true if the merge was successful,
- *         false if it was not attempted.
+ * Bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 {
     int i;
     uint64_t j;
 
-    if (!hbitmap_can_merge(a, b) || !hbitmap_can_merge(a, result)) {
-        return false;
-    }
-    assert(hbitmap_can_merge(b, result));
+    assert(a->orig_size == result->orig_size);
+    assert(b->orig_size == result->orig_size);
 
     if ((!hbitmap_count(a) && result == b) ||
         (!hbitmap_count(b) && result == a)) {
-        return true;
+        return;
     }
 
     if (!hbitmap_count(a) && !hbitmap_count(b)) {
         hbitmap_reset_all(result);
-        return true;
+        return;
     }
 
     if (a->granularity != b->granularity) {
@@ -902,7 +893,7 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
         if (b != result) {
             hbitmap_sparse_merge(result, b);
         }
-        return true;
+        return;
     }
 
     /* This merge is O(size), as BITS_PER_LONG and HBITMAP_LEVELS are constant.
@@ -918,8 +909,6 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 
     /* Recompute the dirty count */
     result->count = hb_count_between(result, 0, result->size - 1);
-
-    return true;
 }
 
 char *hbitmap_sha256(const HBitmap *bitmap, Error **errp)
-- 
2.31.1


