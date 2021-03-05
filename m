Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55032F2E3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:40:28 +0100 (CET)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFND-0005ax-59
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMZ-0004rV-86; Fri, 05 Mar 2021 12:35:43 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:32132 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMW-0005C4-Ll; Fri, 05 Mar 2021 12:35:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFlAWi6+qMQyZPP4C/wrajV0kMwdQk2klpWUTledoMuiEU1My9EDcAgnuyxG0KoSA+6wDydz55Q1IBcLEWfCqcVPdbsOfr+r7wpB+l8+3vUJRW5UcBUJ6dt7yopmWHHsAd7Mp3hUiSxXZLDGhytJaeAFZXNKuvmKfSd62iEyeTQuyJ9cxcHPYi5l7J926aq3nS0LIJeZOnyL1Ul/+5IU7qmbGb/ObuSmYEBOkXmjahozQmLf0oG+kPydEeSsrnBOgd85mOLARBG4kIfTZ+bJSPSgOEzWeLF78eaLMOyBOQ+50B2RXAHavQ/I21F1nZOGsZFICiRrzrFgcK3GwmmiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlYMDCEtFyErQ51N92hVFCzADbE3xM2AY8XpqIQu35g=;
 b=UIx5bwjur00+b1fgDJA0JZI1pbGUj7BYmXGihgY944Iv2MNRxhu9GdhvwVhX0ED43WIOItUURjezPLq1RWNouIC71IcMr8Si73s1xAtbuOl6PBa/PbXv+kTBit8iLCe48sxY6N14gDsmyg6MG4FnnWVgd9UgSbQN+nHqPvDPqCVXjR3gLhh6iZpTYgBGMq5PM9z0wjOl6y1VMrqTMBxwR2vgklVKyzEi4cUsv+FBUsUgGiakC5uKcu5qNJETpS8v3rnR4G74BtKm7R/bo2bQ9HeVJLFC81IgJZivFVhmkIplzC2UOwfmdQufwt9Rt5xYl38XC23J6yvJVKMf83yN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlYMDCEtFyErQ51N92hVFCzADbE3xM2AY8XpqIQu35g=;
 b=XKsiwTnRQ/2B5EKKj0t+VSCP6LyN5bIClvrfOLGF2rcEpGbUf6/o62o31B+kkG7blrrSwm+3mVQ8Bs0ghmWyoxiQ4+Cp5rxo9ObUfL0CNGNlF+JZU91dFvAsqnHJZqINPqEfnkEDFp41SOir4MQUTKhXxhgk2xsR4mB0KtB2srg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 17:35:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters: fix
 discard
Date: Fri,  5 Mar 2021 20:35:04 +0300
Message-Id: <20210305173507.393137-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305173507.393137-1-vsementsov@virtuozzo.com>
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb1eeca8-41f8-4f14-4ffc-08d8dffd10a0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4408A8C6D7E330B173565825C1969@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcIa60XTATVjwJPWcdGNFF6ioafiQ7/04V7Nqv9Ki5bGjR1RerXMkKPmR2Lri+tIWeWdn5NbbptSuM/gabGASkMIGVkO0BAo7BAUzDSM+qfGAzP55C2E8pzr01EdrDZBGXzxJ+UKnq5I9S2DIYuVGBu+sY/IhBkZc9b/Gi5CBDczuXGRTSgT6Gwbos3bqWHx19VQ/5TG8qCoXs6DOvloDfRHduOqAM85gMmhZ//qx1ZnRHZuKdFSilutjT9sCZRMwKWq6Z8AJ3Fw4frP+JNjrGp53KI7CjRlZ5BwoD59gzC1riEJnx+kiXYaUAso701gm7WA3ugwcFFMOot5/4q+wZwRIzwYJPw4VufIjvSXmsXC1v04OkPaJJfjSxdenLtxYJBnplMZKNTqPICt8jss7xAcwcC8nwVEQz0d2md8p4JmWgRqPRF88fgcT0kdE64Yfjb2S25Sg5/kZ0j/dZSCG+uZMUcul6G/flOscf9hCyC1r+1vtSPVejDrvcyxu1ZW0IBfEwJr8U7k4KOR1mS6gTsLQ5gfyraivGNslV5ynDNx+xvjhysvusJUXJ4E1gsOOnl11DmucMrr7/R3xzAPX666t5qVkcKhfqFD4PnVHfEX5CE8Ey2lldnlJrncvObr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(16526019)(66476007)(478600001)(186003)(8936002)(8676002)(6916009)(1076003)(956004)(6486002)(83380400001)(19627235002)(69590400012)(52116002)(26005)(6666004)(6506007)(2906002)(2616005)(4326008)(66556008)(316002)(6512007)(36756003)(66946007)(86362001)(5660300002)(21314003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JcB6kDMbQrAZtJkUNNVCrV11ub6bF170wu2PMjwwnKUZ5ASZeKuvuca66yLd?=
 =?us-ascii?Q?6FgNAUj9njXsJHnZUyqJXNjrbBKcOLQboJP8VAL+IZW3n71ss8p+lwAjGx2E?=
 =?us-ascii?Q?SKAmaq1eqrCw8A14zZZrFfcIxLCoYPyq2YAlnyuuMmOGiPNKOIbwlNc6NqL1?=
 =?us-ascii?Q?ayNenOE6dPv2pwhY3QX4gy78RpNVSWa/kObi6/meIJ3WBaGFNoOuVgKB2Vn9?=
 =?us-ascii?Q?Zy3rUXBjhW8GtWUd9WksEwyU25OC5Qca6qEF+jGfhAnJvxLOQLLLpXwVtrvr?=
 =?us-ascii?Q?/0jBGg8+WSPNVKJUaD72mXQ9mQYY4Hqm/jLfEa9NmT1trssq1zBrQjwpUsG6?=
 =?us-ascii?Q?liOGIHo/Ut2TlwCDVefimSzTbwTRHzYhqZLZ3z0MAkKzXuCzKtSecKZN34kt?=
 =?us-ascii?Q?ddKO1TVUmuOplikingDj4knwOm2UJqOy2mfN+RavIxF+dYrn9rTU7qKi7pTs?=
 =?us-ascii?Q?wBCrNZmKOFO99qdNWJ9HR1sOBiGhQJiisb8jDfvAPIwyEZdlaZiK2gnpgGLR?=
 =?us-ascii?Q?2RekddL3vrFDgOfwQpItIl/4ZnLUhPCJ6hdb5s15xW81ec1YiqwbkF6b/x9d?=
 =?us-ascii?Q?5pFvfdQ+mNmxX55KO8a8Hp2jBCT/a3dKtlVQB/pdOETdEnJQonvXjrHmlKxc?=
 =?us-ascii?Q?N+rDgiWSJhSEZqfok+/AjT1XKU7geKPD9DIccnNrBqAwOyt0BBqpN9dBXfVE?=
 =?us-ascii?Q?SqM5SQa3rRKxc13anlLHqv/uDNkLtuZ21MEpSqi03xgz57LCUcA9J1z7XTdY?=
 =?us-ascii?Q?zT3oCwM8X6UpPvi7Q4OOhzpeUfaPisv7jJcEg9Gqz7SfZdpBrDaWRo0ok9iD?=
 =?us-ascii?Q?T5AEespOtmL/WEpoZ/fHXX6I5sLH/Ug+saVQKGCCjseMwEwzpw02egQTgu16?=
 =?us-ascii?Q?nbUxMzIMAMr8HrFmmEUWgrTT91rcF6QjC9/1XZuiSkq/nWHMMDGAbpXV/0v/?=
 =?us-ascii?Q?3rwVSCH32MezEXZb5qnAfH4OjZMUxP/xOcm2d55mAKDXXnC/NJUnecTCrHw1?=
 =?us-ascii?Q?mM5hzCHz6uhcz0hIEEgwGC1KU4qkfEDsAYh2fgcz25CpOWrv8aozyTemcTYU?=
 =?us-ascii?Q?oojMxNtfb/onKVJe61xgDmz/TBnayVpQpexGkcLeSCmqImrmCd04N1wRhRoB?=
 =?us-ascii?Q?6495Obekzv9yKpQPAXZzRzacwjP9OCFYR4CMYzjxZ+PNT0drNW135rLn5YaU?=
 =?us-ascii?Q?LFdiQxilyZQwzVk8ytFFSxhMHqJXgE5ttu4VkVnEt50ONQb+yQivF3AHHp73?=
 =?us-ascii?Q?FYFr6OAr8UvYgMVp/DbxKTxAcicWcoo08zsXOz+7NwrWnCoe7dG1PVatcB1e?=
 =?us-ascii?Q?6ehjn2cjBLDKkVP1Z4JLkz2/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1eeca8-41f8-4f14-4ffc-08d8dffd10a0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:27.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axmasRP71YQJ4oiX3vFzrJLtAlg00MkjP+tX/h3yMFjvEUsAioKsiKjdsXq5wK8S9jhQdDoHmCjAFNBB4HKQ9X4HLdjnW9WjN1vx39ED9NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.3.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

There is a bug in qcow2: host cluster can be discarded (refcount
becomes 0) and reused during data write. In this case data write may
pollute another cluster (recently allocated) or even metadata.

To fix the issue let's track inflight writes to host cluster in the
hash table and consider new counter when discarding and reusing host
clusters.

Enable qcow2-discard-during-rewrite as it is fixed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                                 |   9 ++
 block/qcow2-refcount.c                        | 149 +++++++++++++++++-
 block/qcow2.c                                 |  26 ++-
 .../tests/qcow2-discard-during-rewrite        |   2 +-
 4 files changed, 181 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0678073b74..e18d8dfbae 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -420,6 +420,8 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    GHashTable *inflight_writes_counters;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
@@ -896,6 +898,13 @@ int qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
+int qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
+                              int64_t length);
+int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
+                              int64_t length);
+int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t offset,
+                                     int64_t length);
+
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..464d133368 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -799,6 +799,140 @@ found:
     }
 }
 
+/*
+ * Qcow2InFlightRefcount is a type for values of s->inflight_writes_counters
+ * hasm map. And it's keys are cluster indices.
+ */
+typedef struct Qcow2InFlightRefcount {
+    /*
+     * Number of in-flight writes to the cluster, always > 0, as when becomes
+     * 0 the entry is removed from s->inflight_writes_counters.
+     */
+    uint64_t inflight_writes_cnt;
+
+    /* Cluster refcount is known to be zero */
+    bool refcount_zero;
+
+    /* Cluster refcount was made zero with this discard-type */
+    enum qcow2_discard_type type;
+} Qcow2InFlightRefcount;
+
+static Qcow2InFlightRefcount *find_infl_wr(BDRVQcow2State *s,
+                                           int64_t cluster_index)
+{
+    Qcow2InFlightRefcount *infl;
+
+    if (!s->inflight_writes_counters) {
+        return NULL;
+    }
+
+    infl = g_hash_table_lookup(s->inflight_writes_counters, &cluster_index);
+
+    if (infl) {
+        assert(infl->inflight_writes_cnt > 0);
+    }
+
+    return infl;
+}
+
+/*
+ * Returns true if there are any in-flight writes to the cluster blocking
+ * its reallocation.
+ */
+static bool has_infl_wr(BDRVQcow2State *s, int64_t cluster_index)
+{
+    return !!find_infl_wr(s, cluster_index);
+}
+
+static int update_inflight_write_cnt(BlockDriverState *bs,
+                                     int64_t offset, int64_t length,
+                                     bool decrease, bool locked)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t start, last, cluster_offset;
+
+    if (locked) {
+        qemu_co_mutex_assert_locked(&s->lock);
+    }
+
+    start = start_of_cluster(s, offset);
+    last = start_of_cluster(s, offset + length - 1);
+    for (cluster_offset = start; cluster_offset <= last;
+         cluster_offset += s->cluster_size)
+    {
+        int64_t cluster_index = cluster_offset >> s->cluster_bits;
+        Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
+
+        if (!infl) {
+            infl = g_new0(Qcow2InFlightRefcount, 1);
+            g_hash_table_insert(s->inflight_writes_counters,
+                                g_memdup(&cluster_index, sizeof(cluster_index)),
+                                infl);
+        }
+
+        if (decrease) {
+            assert(infl->inflight_writes_cnt >= 1);
+            infl->inflight_writes_cnt--;
+        } else {
+            infl->inflight_writes_cnt++;
+        }
+
+        if (infl->inflight_writes_cnt == 0) {
+            bool refcount_zero = infl->refcount_zero;
+            enum qcow2_discard_type type = infl->type;
+
+            g_hash_table_remove(s->inflight_writes_counters, &cluster_index);
+
+            if (refcount_zero) {
+                /*
+                 * Slow path. We must reset normal refcount to actually release
+                 * the cluster.
+                 */
+                int ret;
+
+                if (!locked) {
+                    qemu_co_mutex_lock(&s->lock);
+                }
+                ret = qcow2_update_cluster_refcount(bs, cluster_index, 0,
+                                                    true, type);
+                if (!locked) {
+                    qemu_co_mutex_unlock(&s->lock);
+                }
+
+                if (ret < 0) {
+                    return ret;
+                }
+            }
+        }
+
+    }
+
+    return 0;
+}
+
+int qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
+                              int64_t length)
+{
+    return update_inflight_write_cnt(bs, offset, length, false, false);
+}
+
+/*
+ * Called with s->lock not locked by caller. Will take s->lock only if need to
+ * release the cluster (refcount is 0 and inflight-write-cnt becomes zero).
+ */
+int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
+                              int64_t length)
+{
+    return update_inflight_write_cnt(bs, offset, length, true, false);
+}
+
+/* Called with s->lock locked. */
+int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t offset,
+                                     int64_t length)
+{
+    return update_inflight_write_cnt(bs, offset, length, true, true);
+}
+
 /* XXX: cache several refcount block clusters ? */
 /* @addend is the absolute value of the addend; if @decrease is set, @addend
  * will be subtracted from the current refcount, otherwise it will be added */
@@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
 
         if (refcount == 0) {
             void *table;
+            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
+
+            if (infl) {
+                infl->refcount_zero = true;
+                infl->type = type;
+                continue;
+            }
 
             table = qcow2_cache_is_table_offset(s->refcount_block_cache,
                                                 offset);
@@ -983,7 +1124,7 @@ retry:
 
         if (ret < 0) {
             return ret;
-        } else if (refcount != 0) {
+        } else if (refcount != 0 || has_infl_wr(s, next_cluster_index)) {
             goto retry;
         }
     }
@@ -1046,7 +1187,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
             ret = qcow2_get_refcount(bs, cluster_index++, &refcount);
             if (ret < 0) {
                 return ret;
-            } else if (refcount != 0) {
+            } else if (refcount != 0 || has_infl_wr(s, cluster_index)) {
                 break;
             }
         }
@@ -2294,7 +2435,9 @@ static int64_t alloc_clusters_imrt(BlockDriverState *bs,
          contiguous_free_clusters < cluster_count;
          cluster++)
     {
-        if (!s->get_refcount(*refcount_table, cluster)) {
+        if (!s->get_refcount(*refcount_table, cluster) &&
+            !has_infl_wr(s, cluster))
+        {
             contiguous_free_clusters++;
             if (first_gap) {
                 /* If this is the first free cluster found, update
diff --git a/block/qcow2.c b/block/qcow2.c
index d9f49a52e7..6ee94421e0 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1831,6 +1831,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 #endif
 
     qemu_co_queue_init(&s->thread_task_queue);
+    s->inflight_writes_counters =
+        g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
 
     return ret;
 
@@ -2546,6 +2548,9 @@ out_unlocked:
 
 out_locked:
     qcow2_handle_l2meta(bs, &l2meta, false);
+
+    qcow2_inflight_writes_dec_locked(bs, host_offset, bytes);
+
     qemu_co_mutex_unlock(&s->lock);
 
     qemu_vfree(crypt_buf);
@@ -2605,6 +2610,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
             goto out_locked;
         }
 
+        qcow2_inflight_writes_inc(bs, host_offset, cur_bytes);
+
         qemu_co_mutex_unlock(&s->lock);
 
         if (!aio && cur_bytes != bytes) {
@@ -2707,6 +2714,9 @@ static void qcow2_close(BlockDriverState *bs)
     g_free(s->image_backing_file);
     g_free(s->image_backing_format);
 
+    assert(g_hash_table_size(s->inflight_writes_counters) == 0);
+    g_hash_table_unref(s->inflight_writes_counters);
+
     if (has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
         s->data_file = NULL;
@@ -4097,10 +4107,17 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
             goto fail;
         }
 
+        qcow2_inflight_writes_inc(bs, host_offset, cur_bytes);
+
         qemu_co_mutex_unlock(&s->lock);
+
         ret = bdrv_co_copy_range_to(src, src_offset, s->data_file, host_offset,
                                     cur_bytes, read_flags, write_flags);
+
         qemu_co_mutex_lock(&s->lock);
+
+        qcow2_inflight_writes_dec_locked(bs, host_offset, cur_bytes);
+
         if (ret < 0) {
             goto fail;
         }
@@ -4536,13 +4553,20 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     }
 
     ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, out_len, true);
-    qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
+        qemu_co_mutex_unlock(&s->lock);
         goto fail;
     }
 
+    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
+
+    qemu_co_mutex_unlock(&s->lock);
+
     BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
     ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+
+    qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
+
     if (ret < 0) {
         goto fail;
     }
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
index 7f0d8a107a..2e2e0d2cb0 100755
--- a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: quick disabled
+# group: quick
 #
 # Test discarding (and reusing) host cluster during writing data to it.
 #
-- 
2.29.2


