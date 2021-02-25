Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8F324DAD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:12:44 +0100 (CET)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDdT-0008QW-Kd
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFDcC-0006uV-MU; Thu, 25 Feb 2021 05:11:24 -0500
Received: from mail-eopbgr10128.outbound.protection.outlook.com
 ([40.107.1.128]:44612 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFDc8-0006il-TO; Thu, 25 Feb 2021 05:11:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHEKuZPfiRO54JiiMQkjM7oZ+Fk8Lf8mQLA+7RpmccAGFcsG4Z5FROexLst71iPRUgpUDGCWcIZz9rXNbmH3k6vq9zztRMgeDi8QPRyC8HMb/hH1pcnENy0HWWWX0o+tMqb/XJkRmClY0YyNg/b26leaXTcdSjxeKNgwfnwQY3KFd6XFKmtXEJpeegb6WlBYXGBSpHz8TSQoLr30kc8ZPDf5AoJ9/h5wT2Q3zu3ftddTlZhQ9fCAqojoIqGYBBh/Xu1kr/JnnAc7NqSxgJUBtcSdhKg8opUbND2ORhyN9As+tG3Tzj/ygYBjhhCC2U6gwZ6APMc3zC2i2vgT2UIsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SENpLR1zLCwx7IKnue8NyWS7oqMyV+3GSbfHu0BITM=;
 b=kejMhgvCsuEgpbb4BF9/pWsAz2U934Cbx/dHE06jKx2KFRuIbdqXp3rdZpVJX76+2VPgDITehJ201dUWU75dOW7suRW/AyevPU94bYpR9GFzKENOJSyLU0T2jdkwDwogse+0umprTo7AOyOEq7gykVFErGWejb5O+FxQL8/n/ZDm9CWD+2CKUi32fJzAaUB1un2ClYZA2E0ToeydpcgZ3g99YUpcDpEuw35+kC/NBAWeHSFCwj7zadWLkKANIwQlLug+uK8n5R1RlXkrNwsksFD/FqHDifIvKFySZS/qeJaSLjtL6gmhgMveAHH1t/FE2oBKHYW94DpVPFL8Irh7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SENpLR1zLCwx7IKnue8NyWS7oqMyV+3GSbfHu0BITM=;
 b=vaXgFuEQTb+/R8FZAOadZ/q1Zq1rckOwdVGuwTbM/eDnuTM+fWR8OX71GBQTceyqw37X0AtYwH0VMm7VBt0nNDFI+VVEm3qcaxFLODoga7eSpjIzCwS2qIzrAMvAzW7Qj8EuAmQJXPVq7sHMJRw+qkk/Ift+2wT1NZhdnBaRxVg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 25 Feb
 2021 10:11:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 10:11:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v1 2/2] block/qcow2: introduce inflight writes counters: fix
 discard
Date: Thu, 25 Feb 2021 13:10:39 +0300
Message-Id: <20210225101039.165730-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225101039.165730-1-vsementsov@virtuozzo.com>
References: <20210225101039.165730-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:3:76::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:3:76::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 10:11:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dc1e576-4322-41fa-7b1b-08d8d975ab7f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB538138C61D1E133D2184149AC19E9@AM7PR08MB5381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbmffsoxxGQTTKejQI1KRZwmJTHrUXk0YNzLJL1MmDuq7WsZs4vWbWvcF3XcgbJuzH+brjLsSxLsk15L4J/B7o64bGut79HED6jyQQ80VajF8eAtEGOZ60kgZk2hLHVLf3QVVhUXeCFcYU4aXlyJuMpu3ChRrj8OBecjj5NxmClElNvtRGfhnSLU5un+vtjJpg8ldwexK7FSNmJJrpkgSd+QjjbYDXlIXxfe/HtW5ceB9rRTb9TdNTiSDMYGiVPoACQYn1c8hfLn7Gn/brtaZfuMrVVE162xr2aFPDqUa6TaPX0luQDuTWJisYP571gDYfzuLKnyMDvQhC5jSAVAmQU9VMU5EsjhMbZN3en6PXH4JCeQOwsBPw3lhnXpUy2wR757VLb/patizGaV+sYP15UQtu4MtY2kYE11bouFoWLdwXUeIn0QXLh/o1tTTfBBnV2oUPOPXrjWHn0+IMibVEL/Zt4uMFskDsjjf3lX9oNrouwUcTlh0mB6E7bVd1Y4gb8sGliy/ZLM3sCxM+Djy2UlXeQjqLCFoaE7UWjucyc6GABmEVwziZJcVnKcUe0Yt67ZUN2v82VmZOVk1WXtHANVlV/YAX3inA7dKMYMZp4v0KW/GQD8obbANF2L32AN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39830400003)(376002)(136003)(8936002)(186003)(86362001)(107886003)(19627235002)(956004)(52116002)(8676002)(6486002)(5660300002)(1076003)(83380400001)(478600001)(2616005)(16526019)(66946007)(316002)(66476007)(26005)(6916009)(66556008)(6666004)(6506007)(69590400012)(2906002)(36756003)(6512007)(4326008)(21314003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k+7NeP/BequMp4fMn/XzyZn1NSsE2L07LynaU4DDrjsom0s/nE03NX4KAhJf?=
 =?us-ascii?Q?ECXWw5vPNJJvziPWY3vzeyZMx4UyneSUPUI2yzGbWAzZGE+j4L8Hfr9VRZNv?=
 =?us-ascii?Q?hcUnS9HtTTWSwpIJL8tS01WfS38DzbBr+D++7JiGi6p0eN9b7UbdvTbw4V+M?=
 =?us-ascii?Q?4XctQCTyTnDg4tFdZRlMq+oFAePm4TZe5Q2SQA0sXhXTVDZ2KHN7kq9dEPMn?=
 =?us-ascii?Q?mYBsPNRYt9gs9L7UkIIXm9LRaHWGcw+LuPQkKobEJTd95F77OxsuVKUh4PBI?=
 =?us-ascii?Q?GmrmH6twXONDYEuwkGXOYJXFJlmg/SsCzlkPJe2lOJ5lv6i9s0ymBF1xGjhc?=
 =?us-ascii?Q?XiF5mne0osV0mRIGDOdX328gbfg6iPwUFGgXZP88jTPYeca6Igi1shxqnLsr?=
 =?us-ascii?Q?22tCV5RMC27D4AXPc7BbDFWVmzEphojebHQV40BMJUWvQoaOgJGFTFwBYejG?=
 =?us-ascii?Q?M6xvsdl06G3e4IEZntOCe6FnRDT0u/LcIg0734ck4MqjZ7AW6WLX0vlxlYUk?=
 =?us-ascii?Q?2iWOmFCejo7B65TlFcBbnUxs1no5iXzWZGJ2DAx0Po7PmZO3zU4HuRybhon8?=
 =?us-ascii?Q?jKFknC9gKjcm7/zV3HB7chXmii+ODsyK4QU3w5syjVoaIwGXwRb9kUMeTHbP?=
 =?us-ascii?Q?msFkl8N5t4kebDGfSXEEkdHgJWkctxPJBQ2MlDmcM51QhBSM3no4HEg4LQXf?=
 =?us-ascii?Q?H06nVM0Q693q3CtT1+R36bkbg7rS3D+GH1kUin4AwSg36FmvLixXrAkhLZGq?=
 =?us-ascii?Q?c9+2sISCfRt6lt1fRocDouVedIxLDmNt7OFXo8H1OYC+hSP0iD9u4EhVT6Jb?=
 =?us-ascii?Q?7Bnk7Mn/SXPvsazHhYnYCbUaa9aIw0v4mbfXyrYNLdUiT2AVkztkGwEpnnYH?=
 =?us-ascii?Q?ULhe/5FZav7jqohvQnctqubQWJbeg4H0g0c0jciKRzofdrua5vsprnLE2cNO?=
 =?us-ascii?Q?k0o9pRkgtQicKq5hDQqgQQTnNEZpB7QeP5DrF/UG9+8riUFxQwqjkz0r3o6w?=
 =?us-ascii?Q?d0c72hJV1cRsRRdibN/vZ7NeoAZ3xP3oI7BkCwMSdbeCtJ1ocI6fgF9g6Lgs?=
 =?us-ascii?Q?HgcAOiGPPDLypG8vdrXdcE96tbK8mjz+xjg9QijMjtmVudLOhxXOkUs72Kze?=
 =?us-ascii?Q?6OWBJXJpN1WX+J0JUJDTNlu3FloOm7u45o24b68GcXKx2Pgdgq5C93iHKsLF?=
 =?us-ascii?Q?aOiC9/aH7f5ZDI2lnPrewMmuRe7UQj/54xF/0aC9Y7QHJNOpDJa7MUIEkexQ?=
 =?us-ascii?Q?lB137hbF/ADNWtQTuLDlk8Ult6otb/J3bA1fVoFoWIlWbihnWkksNDnQhmpw?=
 =?us-ascii?Q?YTJlnHUaB9QR4zQ+Iq9vAknl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc1e576-4322-41fa-7b1b-08d8d975ab7f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:11:08.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3Q7C4J1t5wG+njd9Me5J0kJY5hlvJK25SNYkTss12AQ4GBXA51/Xd+uFVfPORF8aYkkZzYrX289OYNJeBUWHL04frSYZ5lcgTucgk4gEbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Received-SPF: pass client-ip=40.107.1.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

There is a bug in qcow2: host cluster can be discarded (refcount
becomes 0) and reused during data write. In this case data write may
pollute another cluster (recently allocated) or even metadata.

To fix the issue let's track inflight writes to host cluster in the
hash table and consider new counter when discarding and reusing host
clusters.

Enable qcow2-discard-during-rewrite as it is fixed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                                 |   9 +
 block/qcow2-refcount.c                        | 154 +++++++++++++++++-
 block/qcow2.c                                 |  26 ++-
 .../tests/qcow2-discard-during-rewrite        |   2 +-
 4 files changed, 186 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0678073b74..fea2525a76 100644
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
 
+int qcow2_inflight_writes_inc_locked(BlockDriverState *bs, int64_t offset,
+                                     int64_t length);
+int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
+                              int64_t length);
+int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t offset,
+                                     int64_t length);
+
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..0ecb1167a6 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -799,6 +799,145 @@ found:
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
+/*
+ * It makes sense to call qcow2_inflight_writes_inc() only in same s->lock
+ * critical section where corresponding region was allocated (or taken from L2
+ * table).
+ */
+int qcow2_inflight_writes_inc_locked(BlockDriverState *bs, int64_t offset,
+                                     int64_t length)
+{
+    return update_inflight_write_cnt(bs, offset, length, false, true);
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
@@ -885,6 +1024,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
 
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
@@ -983,7 +1129,7 @@ retry:
 
         if (ret < 0) {
             return ret;
-        } else if (refcount != 0) {
+        } else if (refcount != 0 || has_infl_wr(s, next_cluster_index)) {
             goto retry;
         }
     }
@@ -1046,7 +1192,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
             ret = qcow2_get_refcount(bs, cluster_index++, &refcount);
             if (ret < 0) {
                 return ret;
-            } else if (refcount != 0) {
+            } else if (refcount != 0 || has_infl_wr(s, cluster_index)) {
                 break;
             }
         }
@@ -2294,7 +2440,9 @@ static int64_t alloc_clusters_imrt(BlockDriverState *bs,
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
index d9f49a52e7..00a5a2eca0 100644
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
 
+        qcow2_inflight_writes_inc_locked(bs, host_offset, cur_bytes);
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
 
+        qcow2_inflight_writes_inc_locked(bs, host_offset, cur_bytes);
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
 
+    qcow2_inflight_writes_inc_locked(bs, cluster_offset, out_len);
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


