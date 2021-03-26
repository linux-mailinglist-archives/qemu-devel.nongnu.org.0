Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39334B0EA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:54:04 +0100 (CET)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtT1-0007W0-Jc
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPse5-0000eD-24; Fri, 26 Mar 2021 16:01:25 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:9409 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPse2-0006bj-2m; Fri, 26 Mar 2021 16:01:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR2JSeCPO1AE4oSQAucNWa0hgniH0eBH2tsp5Z2kcMBrN+B2W4dYvhmvji25ElETW775JnWYXKf0AzcdPy+I+dGmo4Z5FIiyq1zPq7T0nOIR3SlUG2jUQZ+su7FPrbN39vG8k55c3Q2q5qe5YHNLxNlrMz54sM+ltan9vGRp4U0WhgvCVUPmEKSybSJRQB4BEcJaTuyBnWmO116HoIow5n+R/IyKLOH3ZW+oWHaxXz91kiitLY0H2WU4HQenMmln+g9VEPtGegmdsvZLe1bcxPnIUTWyEZOToQmOZlDJOvVdWTy2lk3UAijOeHgywODYF3Mee3+IzwZXMo28iOKNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6ijyMV7owrdu6Qudm1dmU5n0V73jH0NckzEGrJpVJg=;
 b=Lndf8RjFhdAYMQXoWlz5waQz0mRkNiiraOzwaso4Y7hxDRQmVQy7xfgVhi4aPwokRSrXaNyNBp/fnyVr/+2iNuNNP6rNmVxM5ASY+I2INpRn2xcYqvAOjI6hHyUSh96Dl5XkxZizhACkiSomkNcX7yaKAbYdfeA+eYs1VDsTyTfzSi9f0zxFnuqxvErC2OhkK0ofDcrANYPMYrNicANANLEj322wlVjX5gbO78KzwHYK1BMtjNKVXgN63ErA2JL4R4U540GhEsqapxxUuoBgEtD2viDXZrmglbsBuRwTmf4q0QGD60rLGfNB+95cD1PJg/9XfU0lGVCQN7xcLs69Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6ijyMV7owrdu6Qudm1dmU5n0V73jH0NckzEGrJpVJg=;
 b=F2DYdcLWLFg3THhTbtP+sRX0DAzAgZDjDV9Xs+t9Ppyq3gcXiRN7t2TDArNtE9O1nOXaVRxn85VxhvodDwOe4LPPgzalOgj45zRW4zi8MgDKYanZrzvvGzRDCiGn4L2XSm3yjqzydkXi7j9aoMsZEcdJ8zTIrlIMIYtFQdCChhI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 5/6] qcow2: consider in-flight-writes when freeing clusters
Date: Fri, 26 Mar 2021 23:00:44 +0300
Message-Id: <20210326200045.363290-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210326200045.363290-1-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 282cf3e1-ef7c-4a1f-97d7-08d8f091e4fc
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB587731A22EDAAC8263E4456FC1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EafrZdyHtXbTo0uFUHNke5br1qmVGCV5qY+fWmI+VsVrYgKr6iR+WPgpV9wAf2ZGuLFn1gCfU3HQ6laKDwYIz05N9VHLQOyanskjTescb916OhNITDsFhYcwmmuEWf3GJKDUBAseaECP4sWSYivv5LA/+/OD1QCJ6IhWCRGipANbGVMLrJj8edJSKhEUtr0tVpEX5NdvVUgw7CcNOgwwvCKGICE21d4GB4s+pJy9TTRo4Cwit5fibxksZf3CUT/v7R137PBttwR9Th47TAdPXrTVEz0eMm1K6szu1UtVU0J6qYpX4588fS1+LXV7ks4yNTG04HhFNqnrempM20bZx0GpPaVVL7FHVLodsAd881b18Gmo04L89MGJnacK9qfDkTZEty+rO/7wMAVO7wSVwPaAtRBi5gw7WW03kuc9MzqNCQJtoSrno1I/YYlBCmrQFf8htg9P8/AckynKVAxv/aYRFYN+2l5h/UCg3Ju1PsIjKhh7Gj0QEf3uDCWH6fbeBl2LsaYhUV/9s5suNfjCgufMyFui0/UwzqWXoah6hmSx1NEnQtfPBPMOekr101SLjptNngKBuGswdM0hG1zpD30+yuBl0UAQy9Ti8MI7jzOi6pvrsZeEhcnzTgN6vCjnUUE+Tsbx3kV2UVJHefYMMC8jRPR3CXeArPFmyjZagrMr06X0EKeN6eFM2X0rRnj+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(52116002)(19627235002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xpeG7hzO3sAczYjyN/7/WPote5+KtCDYkK977ZTTsAmM252mB3fbR5W+PH0J?=
 =?us-ascii?Q?cNTb3Cu4T9p7xn/9JyX9qiiXJzigpUR4D4gztfSDKOcqtP56bXodCvzLcZdl?=
 =?us-ascii?Q?P3knzNQ8VZFxGbm7hAaOiSNRT6xerqgQ7lX2YXGgVsnF7LOVGAHkqmwgZUAW?=
 =?us-ascii?Q?YRO1vm/SCVOWb8WF0Cr4gyw+UjMtSsqu+lrdpKekqp5H0iGp4/Wvt5AjuIPb?=
 =?us-ascii?Q?/81Rb5htBNlOgu+lJYE3n9NFrRzBUK9peyZITbAd/PCb8TgWWAfe6vEC1Z6+?=
 =?us-ascii?Q?Z9/SwEvy8vT33ZY1cMrXuugGAlrvynzgPj12n0xvrr9JzWPkddftjhwf8SG6?=
 =?us-ascii?Q?BtE7FGT3h1so9v04sVNHjzsB4AXG6HCJsQ9zPKRwGqgd4wxRMySSN6WN/b3+?=
 =?us-ascii?Q?aWMIGFHNx8u1nOeGLzbrgWcz1vajUKe2OZ8XKMkVVUWRjSwgh6WzTcizg2Qz?=
 =?us-ascii?Q?Ny2v/UcbV0Vdhv4cvlBOXaRrQlv4i8tUsWCE9kgW+Ts1bp2QqM25iGZfBKKM?=
 =?us-ascii?Q?h54/7AU6bTs2LhyqrJnEVi7lI+hfVaCXN3sG6Zt4xa3b70Cq98mKd31zsbFN?=
 =?us-ascii?Q?SgHFf8MsMag/MOzLkp+gXc13VOZj9mt4+yOsozN1/df1RoQKAqBkK9WRWN61?=
 =?us-ascii?Q?uKPWTk7i7yCfAbn/j3rnPZaBCmcU0tzmtOIQBUpAGChNro9vBsKPT18DrEI3?=
 =?us-ascii?Q?QDNJbALETO63yWFXnWLGQCWPlQ0GLWhFh2WP+kHt2JMXHGeK/bd+dbUjny+/?=
 =?us-ascii?Q?Efv64izw3ymzYi0K9JCWB8RhpUCj4wDps8P+9w/PXjyuQJ5XLzQU+WXkhyt5?=
 =?us-ascii?Q?Z4Ep6UKLJAAnO992A8GoQKA7COIAU1fYSaQcUvqyW8UPmhwgY1uboygCVXUe?=
 =?us-ascii?Q?VvWa2Y/GELlQJPYcsHE4beEeOxAgCPBpK1sbl/zBKskaN0/Hjf4iA4/Bgkfl?=
 =?us-ascii?Q?owiLDJNYpTqxSw0RvN8LLTQw94pLrU1NN13mB2ryt3T8G1MxsxeSZPOEdSEA?=
 =?us-ascii?Q?QksABgcwzQlnmHiPd1o7xEmjcKuNBEwx2oH8gzbnqKxpAce58/2uHYB/cCiA?=
 =?us-ascii?Q?VflHSoxJeo2hdyykRkyAN62oFtU1/C6XawntKA2KPETE/pAwjMsJ2pBXIM+Z?=
 =?us-ascii?Q?EG9id2fQ+Tz6VzUnDY9fJmiCYHhzujmibLTHlc/0EIiurb1VsQbWOJA/D8vF?=
 =?us-ascii?Q?HGolVkjJ2CPqoIFzyB3j4PMGH+TRI4JjF6VCgT3yBwa7fKaF7QJaJs+bImAk?=
 =?us-ascii?Q?9Bqc1a6Od7Sjrxg4KgyCGJbrTdVyS/rjHMbnuQOBzLnumrFGta2d/tJ3ItoF?=
 =?us-ascii?Q?9Ax1SakdoOtYVBMrJriyreZh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282cf3e1-ef7c-4a1f-97d7-08d8f091e4fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:07.7470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWGuWY47jN5v6k6GCW9Q02s2w/9782vQPP71dlESjSZnPnYNaRAyG6zEezSmoXYMI2rXKNsMj1Ga5Kt3PNRISCw7q1Qniqc7rYg46ifKW7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
update_refcount()). Calling update_refcount() is wrong. It's ofcourse
done sometimes, as not everything is moved to coroutine for now..
Still, it's out of our topic.

Later, we can reallocate "free" cluster in alloc_clusters_noref() and
qcow2_alloc_clusters_at(), where is_cluster_free() is used.

OK, to correctly handle in-flight writes, let's modify a concept of
"free" cluster, so that cluster is "free" when its refcount is 0 and
there no inflight writes.

So, we discard the cluster at bs->file level, update
s->free_cluster_index and allow reallocation only when both refcount
and inflight-write-cnt becomes both zero. It may happen either in
update_refcount() or in update_inflight_write_cnt().

Consider update_refcount() first. Here we update refcounts metadata we
must be under s->lock. So, if we catch a situation when refcount
becomes 0 but there are in-flight writes we change a behavior so that
we don't update s->free_cluster_index, and do not discard the cluster.
This will be done by update_inflight_write_cnt() later. So, we save
needed information into Qcow2InFlightWriteCounter structure, so that
further update_inflight_write_cnt() do not need to load the refcount.

Now what about update_inflight_write_cnt()? Here things become more
interesting, because we can avoid s->lock. If
inflight-write-cnt + refcount is still positive, we don't have any
yield point, just update inflight write counter and we are done.
If inflight-write-cnt becomes 0 and refcount is already 0, we just need
to keep inflight-write-counter=1 during the discard operation (if it
is needed) and then drop the counter and update s->free_cluster_index.

Note, that at this point we only implement the whole infrastructure for
in-flight writes handling. Nobody now call qcow2_inflight_writes_inc()
or qcow2_inflight_writes_dec(). It's a deal of the following patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 70 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index eedc83ea4a..9a0d6570a5 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -805,6 +805,15 @@ typedef struct Qcow2InFlightWriteCounter {
      * 0 the entry is removed from s->inflight_writes_counters.
      */
     uint64_t inflight_writes_cnt;
+
+    /* For convenience, keep cluster_index here */
+    int64_t cluster_index;
+
+    /* Cluster refcount is known to be zero */
+    bool refcount_zero;
+
+    /* Cluster refcount was made zero with this discard-type */
+    enum qcow2_discard_type last_discard_type;
 } Qcow2InFlightWriteCounter;
 
 /* Find Qcow2InFlightWriteCounter corresponding to @cluster_index */
@@ -845,6 +854,7 @@ update_inflight_write_cnt(BlockDriverState *bs, int64_t offset, int64_t length,
         if (!decrease) {
             if (!infl) {
                 infl = g_new0(Qcow2InFlightWriteCounter, 1);
+                infl->cluster_index = cluster_index;
                 g_hash_table_insert(s->inflight_writes_counters,
                                     g_memdup(&cluster_index,
                                              sizeof(cluster_index)), infl);
@@ -857,10 +867,40 @@ update_inflight_write_cnt(BlockDriverState *bs, int64_t offset, int64_t length,
         assert(infl);
         assert(infl->inflight_writes_cnt >= 1);
 
-        infl->inflight_writes_cnt--;
+        if (infl->inflight_writes_cnt > 1) {
+            infl->inflight_writes_cnt--;
+            continue;
+        }
 
-        if (infl->inflight_writes_cnt == 0) {
+        if (!infl->refcount_zero) {
+            /*
+             * All in-flight writes are finished, but cluster is still in use,
+             * nothing to do now.
+             */
             g_hash_table_remove(s->inflight_writes_counters, &cluster_index);
+            continue;
+        }
+
+        /*
+         * OK. At this point there no more refcounts and no more in-flight
+         * writes. Cluster is almost free. But we probably want to do one more
+         * in-flight operation: discard. So we keep inflight_writes_cnt = 1
+         * during the discard.
+         */
+        if (s->discard_passthrough[infl->last_discard_type]) {
+            int64_t cluster_offset = cluster_index << s->cluster_bits;
+            if (s->cache_discards) {
+                update_refcount_discard(bs, cluster_offset, s->cluster_size);
+            } else {
+                /* Discard is optional, ignore the return value */
+                bdrv_pdiscard(bs->file, cluster_offset, s->cluster_size);
+            }
+        }
+
+        g_hash_table_remove(s->inflight_writes_counters, &cluster_index);
+
+        if (cluster_index < s->free_cluster_index) {
+            s->free_cluster_index = cluster_index;
         }
     }
 }
@@ -970,6 +1010,7 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
         s->set_refcount(refcount_block, block_index, refcount);
 
         if (refcount == 0) {
+            Qcow2InFlightWriteCounter *infl;
             void *table;
 
             table = qcow2_cache_is_table_offset(s->refcount_block_cache,
@@ -986,8 +1027,24 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
 
-            if (s->discard_passthrough[type]) {
-                update_refcount_discard(bs, cluster_offset, s->cluster_size);
+            infl = find_infl_wr(s, cluster_index);
+            if (infl) {
+                /*
+                 * Refcount becomes zero, but there are still in-flight writes
+                 * to the cluster. update_inflight_write_cnt() will take care
+                 * of discarding the cluster and updating s->free_cluster_index.
+                 */
+                infl->refcount_zero = true;
+                infl->last_discard_type = type;
+            } else {
+                /* Refcount is zero and no in-fligth writes. Cluster is free. */
+                if (cluster_index < s->free_cluster_index) {
+                    s->free_cluster_index = cluster_index;
+                }
+                if (s->discard_passthrough[type]) {
+                    update_refcount_discard(bs, cluster_offset,
+                                            s->cluster_size);
+                }
             }
         }
     }
@@ -1049,7 +1106,7 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
 
 
 /*
- * Cluster is free when its refcount is 0
+ * Cluster is free when its refcount is 0 and there is no in-flight writes
  *
  * Return < 0 if failed to get refcount
  *          0 if cluster is not free
@@ -1057,6 +1114,7 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
  */
 static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
 {
+    BDRVQcow2State *s = bs->opaque;
     int ret;
     uint64_t refcount;
 
@@ -1065,7 +1123,7 @@ static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
         return ret;
     }
 
-    return refcount == 0;
+    return refcount == 0 && !find_infl_wr(s, cluster_index);
 }
 
 /* return < 0 if error */
-- 
2.29.2


