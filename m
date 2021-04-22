Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6036854A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:54:22 +0200 (CEST)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcar-0002wW-5U
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEk-0007Uy-1j; Thu, 22 Apr 2021 12:31:30 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:34309 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEg-0003vI-3t; Thu, 22 Apr 2021 12:31:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsh6UcFFHubaONnOIZeNxzx4R9BIvNCBnMNHo/X73LrM9KCbOebYMa9wky6x1cHgva3oTsNGERS6b7XVAs/FGk//7zrEiotYLjTvhTx2FTM0q9bdUBKKROgRb16rgropNtLNp6W73yc93aTJo7tuMZNgBHxE6Ru3Gi1zXzTggjBG+OfSgSDmeWyFD9cd9g76TCYhhSc4Ywskun5tWXtKwhwwe7lY+XgmgqfvTqAZF0H7vER//LoAfGEYCKzUkDG5RZ77JcvkUO8KwZoRUjIlGPjsHCzftmflk0CYxefNd9Vj9Ggn++y2UT80ctPk1pvJgGleJF3Z++LfsNXScQ362g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rv7/OtbdWG3EbhVWssajxwiy60oAc+13NztIjp34s2s=;
 b=DL9P28ewMHh3BhmtouGT751mVCQ70BDnzDxJICA9C2joli2mI5rtnTiJawQJrGzFHv2HAD2d1XoGa7T/lQ+j9E3+rqkwZez64CffC6vR5sAZ6oT8CfrN1Trcr79R4k+4yQL96H9SJHzES8nXS+WMCmwNGN2m7FdHEyp74ZImzBZxS4yPNewfasysnJbL9Yv1YwExil3F71bSZmQnrlHpb+tjbYB1dOtKYG8WW/T4c+wRbJoMmWK+ivP2N+rwICfHT4iVXXMYQYOyAuhuf8h6s3R9VAMqOwM/s+7PJNa02+7ikjXmsC3zJYuU3wt4vL85r5lqDOzhjhtb4xoqMjXTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rv7/OtbdWG3EbhVWssajxwiy60oAc+13NztIjp34s2s=;
 b=iGXYTxWNbJDc8rE0xsycHR5cmECcS8MR5WnB5ug9niNfou61aSAk9RtEnr4Vtygy7Lp2bH6ZX76pWsIKp5azqVWVlRWpYGbqRAW/w09fnyBoe8VGOuVzkyN6pm+t3HGAJ0no8TT89npuTp1eFDPtjtI1b5hv2q3OyA4prWqPKLc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 10/12] qcow2: introduce
 qcow2_host_cluster_postponed_discard()
Date: Thu, 22 Apr 2021 19:30:44 +0300
Message-Id: <20210422163046.442932-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dbc1996-1b0a-4384-6854-08d905ac0a0d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3861F14D89C30E64C6D46A47C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJGqmh7lxd9zlxaf8qbBEin0BBmLUcEIZJyNRda+Kubezsi7ik8tJrA67oCxpZNcD4fEHuvfmeLPj4eaSQD5r8B1JXp1w+v0uCQD8l6WXHPOLvjscAsh7y+zI9qRd6HiWgU5RipWpRavZhGolctdAetEwN3fs1YIttRf2//dpHLwe7+pjd9CarQbzmLOvCZ2y6eTWwZZk3o4wLfdkGED1oVfVpr3ccfYCRhJ94Cq7T+mbKQH/yHixjjN514s3wgKTauRWh7wpZw+rcPbRGhVbjjVg27xu1l3LdYDCpIQfccQ6eTMs7SWSBASyP+3oFUhBxQ7rBpCiqAfbFBGRi1C2pb9r8PtkEUe0RCqW7gvOyVequztF0rz0zY1PydXG7D2cVAChgkjdmTJMgrCDIxgrGlNmsqdUCS0i56LtQSRbIuvWa2ukNOmyLIzoH/kJKR4ORVMKEt+exkWiiwBANMoTd7BtkCL3EGsDSPgZaAyz7Vv98+fnMClbCoKWmuON3aG948ERLybKvWQVqG43nVYrt5mwM8xhFnUDcuG9hmjqsQFMYDfHFe/8WBmm7Yv4+1y6s0ltXJLCh3HpBEJxHkdgpJvLVTv5aMAM7IwGmu6yUCbBTMFa/olJ9W0NG0gf6WjoGIW5IeTm76SppVATXVBkQa+Cg5IY8vaVIp2lawIogtbnrDI/6cx7ClsUyqe4TKI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xJsxeGk9UGSYhyxCdZMQQVfD7/jerluGDpXwSvHE47URVeU1wYAd44OjF8u9?=
 =?us-ascii?Q?7WWa/JXlqsiWcot7HmsRk6PS3cWlfEY8QBSwn9wVOwkdzwFS7rgHlSwclV9+?=
 =?us-ascii?Q?EbgSASg+p7HP8vEgzp/2IyXjowEPpWIkeyLuWSCKIM++tmwdLrZyRTYKCjkq?=
 =?us-ascii?Q?OEBuIimeA+j5BeNJpsGV05Q+LaqYnp1/zv2+wUIw/yuB9CbdXIrXY5qdD9XA?=
 =?us-ascii?Q?Q2t905ehI0p7V8V1M6TKq6LgebBTrfmVysDEhSGlKBpRYe88l2MhJmP+Bhcw?=
 =?us-ascii?Q?ppt0rRFnTjjCsjLHyDh24734e6JygDg8EjuEuj0Ff7Rbh79Gc8cBhlStpKcF?=
 =?us-ascii?Q?6jH292iydt24nh/T8hrmQyZ70EpVIkOHiQ0zr8oHTW4yjDisIFQcklDcgh46?=
 =?us-ascii?Q?wcgcR2snhtyG4ELxK2k18KMHKAa8BARpTHrOpTGe/YuGlxau9mKXaCwYzkOk?=
 =?us-ascii?Q?KcQpDv+WpSXeWTlwVfGncjyMHT9OycQDv3ULd4L32MWop9enxjwUdvkSlIgS?=
 =?us-ascii?Q?z+w3i/kbe8kTk/plTc60WZl9ICvV3t2ADUhWsTRvhOd1hTGadvAeqWgGuoES?=
 =?us-ascii?Q?ucvCKGRmxpWxjVrVcr4cWJKsA3eK1LHjWnZAMov3mEn0Pj2U54XGQfSaxarF?=
 =?us-ascii?Q?FRvtL885NjsyHUeIJkop8eAHMzLb2IyKts+2P93EWQp82scIHqz+3kJfP8GZ?=
 =?us-ascii?Q?IOeBUuuJy6Dp33gMxyotVBXeDjaB68kBC3rrq3EPe+pTwo5ZixjtN5pjs1Vo?=
 =?us-ascii?Q?21eKk5scqvLUeyKfddKsTsxRoQLSQDOmODq6fLX8uskMzs8KMR+J/FMDYV+A?=
 =?us-ascii?Q?l0Z4ZRepKmr+Lml3SMbJ/usMV9h+Na9g+VKZRhw1NyfsxNG3BK86a9m1t693?=
 =?us-ascii?Q?c87iDMzas0U5J9IOBAy9Ao3mb4l2oKoQkFLX4Vz3Uwd9WCQh0y9jJUdzgBnU?=
 =?us-ascii?Q?sK8tw6pepxBaeKOP/g6tRK7q69yJ5FJVCQcG7XSJruINl9aC7oPH9viMwJUx?=
 =?us-ascii?Q?ZfbksQwee9rYar6FSlZB6GDdk891qcBUOqrBbUd80tKu48bYrXRgDgKWJ1Hf?=
 =?us-ascii?Q?zsboIoGVw6J4vsBlHtSlFMb6yCem+Yt3SrnmpWmTuCdXfxVBL1fSmJLEPtcn?=
 =?us-ascii?Q?rZCeXh5TfyKjFqfG3ofuva6CYWSvn6RYK1YzzlU/E+oVya0q/ejgnPNxQP0D?=
 =?us-ascii?Q?yJYLV9rNPQ33MuD3quf2D/QppOMx4WtQ2hIC9eo9eTyugSm1OWoDr8EMDrIL?=
 =?us-ascii?Q?jJ4uwMYFrpvo1nweQ0j6GSjasgmyoNUihcrW4NGlcYN1Hg3aByfEU1R7WrFl?=
 =?us-ascii?Q?bkFXZpzot74zJKXQ5JMRoT7S?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbc1996-1b0a-4384-6854-08d905ac0a0d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:11.2035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5ZWH1yUWSIDuHyUAZSci9Aczf70dTTAK447zBDVoo/GmBKoJXhPCF6AytsR7NjrceV189xx91MmE5rXgVrgP/ADfIcKJJmX7FSuhzVCBuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We have a bug in qcow2: assume we've started data write into host
cluster A. s->lock is unlocked. During the write the refcount of
cluster A may become zero, cluster may be reallocated for other needs,
and our in-flight write become a use-after-free.

To fix the bug let's do the following. Or better, let's start from what
we have now:

Now we consider cluster "free", when its refcount is 0. When cluster
becomes "free" we also update s->free_cluster_index and optionally
discard it on bs->file level. These two operations are done in same
s->lock critical section where refcount becomes 0 (and this all is in
update_refcount()). Calling update_refcount() wirthout s->lock held is
wrong. It's ofcourse done sometimes, as not everything is moved to
coroutine for now..
Still, it's out of our topic.

Later, we can reallocate "free" cluster in alloc_clusters_noref() and
qcow2_alloc_clusters_at(), where is_cluster_free() is used.

OK, to correctly handle in-flight writes, let's modify a concept of
"free" cluster, so that cluster is "free" when its refcount is 0 and
there no inflight writes. We are going to track in-flight writes (and
other operations with host data clusters) with help of
host-range-references recently implemented. So cluster would be "free"
when its refcount is 0 and host-range-refcnt is 0 too.

So, we discard the cluster at bs->file level, update
s->free_cluster_index and allow reallocation only when both refcount
and inflight-write-cnt becomes both zero. It may happen either in
update_refcount() or in qcow2_host_range_unref().

In update_refcount() we just discard if host-range-refcnt is 0 and
register postponded discard if it isnt.

We implement postponed discard functionality so that
qcow2_host_range_unref() doesn't have to load refcounts.

So in qcow2_host_range_unref() we just do postcponed discard if it is
registered in HostCluster struct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                 |  4 +++
 block/qcow2-host-range-refs.c | 47 +++++++++++++++++++++++++++++++++++
 block/qcow2-refcount.c        | 23 +++++++++++------
 3 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index d6de9543c4..c40548c4fb 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -911,6 +911,10 @@ void qcow2_host_range_unref(BlockDriverState *bs, int64_t offset,
 uint64_t qcow2_get_host_range_refcnt(BlockDriverState *bs,
                                      int64_t cluster_index);
 
+bool qcow2_host_cluster_postponed_discard(BlockDriverState *bs,
+                                          int64_t cluster_index,
+                                          enum qcow2_discard_type type);
+
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
diff --git a/block/qcow2-host-range-refs.c b/block/qcow2-host-range-refs.c
index 54f0be27a4..e07cb06184 100644
--- a/block/qcow2-host-range-refs.c
+++ b/block/qcow2-host-range-refs.c
@@ -30,6 +30,13 @@ typedef struct HostCluster {
 
     /* For convenience, keep cluster_index here */
     int64_t cluster_index;
+
+    /*
+     * Qcow2 refcount of this host cluster is zero. So, when all dynamic users
+     * put their references back, we should discard the cluster.
+     */
+    bool postponed_discard;
+    enum qcow2_discard_type postponed_discard_type;
 } HostCluster;
 
 void qcow2_init_host_range_refs(BDRVQcow2State *s)
@@ -122,6 +129,46 @@ qcow2_host_range_unref(BlockDriverState *bs, int64_t offset, int64_t length)
             continue;
         }
 
+        if (!cl->postponed_discard) {
+            g_hash_table_remove(s->host_range_refs, &cluster_index);
+            continue;
+        }
+
+        /*
+         * OK. refcnt become 0 and we should do postponed discard. Let's keep
+         * host_range_refcnt = 1 during this final IO operation.
+         */
+        if (s->discard_passthrough[cl->postponed_discard_type]) {
+            int64_t cluster_offset = cluster_index << s->cluster_bits;
+            if (s->cache_discards) {
+                qcow2_cache_host_discard(bs, cluster_offset, s->cluster_size);
+            } else {
+                /* Discard is optional, ignore the return value */
+                bdrv_pdiscard(bs->file, cluster_offset, s->cluster_size);
+            }
+        }
+
         g_hash_table_remove(s->host_range_refs, &cluster_index);
+
+        if (cluster_index < s->free_cluster_index) {
+            s->free_cluster_index = cluster_index;
+        }
+    }
+}
+
+bool qcow2_host_cluster_postponed_discard(BlockDriverState *bs,
+                                          int64_t cluster_index,
+                                          enum qcow2_discard_type type)
+{
+    BDRVQcow2State *s = bs->opaque;
+    HostCluster *cl = find_host_cluster(s, cluster_index);
+
+    if (!cl) {
+        return false;
     }
+
+    cl->postponed_discard = true;
+    cl->postponed_discard_type = type;
+
+    return true;
 }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 72e6d1efd7..7f238649db 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -878,9 +878,6 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
         } else {
             refcount += addend;
         }
-        if (refcount == 0 && cluster_index < s->free_cluster_index) {
-            s->free_cluster_index = cluster_index;
-        }
         s->set_refcount(refcount_block, block_index, refcount);
 
         if (refcount == 0) {
@@ -900,8 +897,20 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
 
-            if (s->discard_passthrough[type]) {
-                qcow2_cache_host_discard(bs, cluster_offset, s->cluster_size);
+            if (!qcow2_host_cluster_postponed_discard(bs, cluster_index,
+                                                      type))
+            {
+                /*
+                 * Refcount is zero as well as host-range-refcnt. Cluster is
+                 * free.
+                 */
+                if (cluster_index < s->free_cluster_index) {
+                    s->free_cluster_index = cluster_index;
+                }
+                if (s->discard_passthrough[type]) {
+                    qcow2_cache_host_discard(bs, cluster_offset,
+                                            s->cluster_size);
+                }
             }
         }
     }
@@ -963,7 +972,7 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
 
 
 /*
- * Cluster is free when its refcount is 0
+ * Cluster is free when its refcount is 0 and there is no in-flight writes
  *
  * Return < 0 if failed to get refcount
  *          0 if cluster is not free
@@ -979,7 +988,7 @@ static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
         return ret;
     }
 
-    return refcount == 0;
+    return refcount == 0 && qcow2_get_host_range_refcnt(bs, cluster_index) == 0;
 }
 
 /* return < 0 if error */
-- 
2.29.2


