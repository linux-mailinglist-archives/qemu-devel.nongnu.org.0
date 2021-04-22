Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D23368516
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:42:25 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcPI-0000eQ-53
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEl-0007Xn-33; Thu, 22 Apr 2021 12:31:31 -0400
Received: from mail-eopbgr40129.outbound.protection.outlook.com
 ([40.107.4.129]:3204 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEf-0003yB-QX; Thu, 22 Apr 2021 12:31:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPvAnOFWy4xtK3wLY1jg/oWSK6vyFhLn9BzwkLEBkg5crHkW3ICyoP9RRtorYThkKMTWpWYTP5e4HPa8QH+tit45E1lZuttPRIbGK4Hug8wN/XG24dFoQ6aaCpTbGBHhd7ZUZW7NGHWzb770v0hlua7DnmHZUExTmkIYS6hoyXFRy4JZ1XlnxyDdpO73wB4cTvrYs+5HqxEettGY6jh9dSr5klrbFarw6SrD/dUOsSnZBIvGakqlLUeDyt7wT3ufIEv/junSJ+cHF2NB19g0PnENVrsO67qZhtEs03nilvu96UCkVRmCwhtod8RopLaR5nAsQIN4L7o7wtE3ZnjDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj4labnwvQrnwJQ4BNr7LDuBcGJktYmuL7QjRTR6Pjw=;
 b=GQOYPVrmU1C2Kz7FfUpZV0rovvyYS5fFHFdbpyeodhKrnwEMPtYy0PejF2xhdzZIM+WOD+Ii+vT0EtA3GJV1QzYlSO1ZwW6wdY4FxXDakX+k8spnsAb1CBN++yqS/fua6fCvmtRT51R6bBTEF7buAOO49+y6kfoWgeoDmh3hS0BDDNgL1i5jc9/F3K6FxpX/4Km/bJaSHoLfqvxUcw+x9Ffjc4hZbtf6nerA8Lb2zCRUjuIhttZIUhMSTI97cEwPlVALHxLJED6lOPZEQGO04nVDSBKySmOnXV+t9MzSPv7h/gQMJorn9VwNkGX94uhBat9CZ4KnqXZqMJDTrFgPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj4labnwvQrnwJQ4BNr7LDuBcGJktYmuL7QjRTR6Pjw=;
 b=h1KwhllhOnvWNNmtVASLLjms7qb2/hey3WRNR0oA5bP5v185q8UG/TPyAtuAV2/fGcMSwzVMPpSH0cUJJ/FiuuCDqEOhFwpmaDAIRgJeyptByC/rUC5t6kHH/rAG55Cfk+qgpTvFXm11CFP/mQMqpXtSlM7FXUKrs+ooIcKmxOg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 09/12] qcow2: introduce host-range-refs
Date: Thu, 22 Apr 2021 19:30:43 +0300
Message-Id: <20210422163046.442932-10-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85d3cbd1-61ff-433c-e7df-08d905ac097e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3861F22D41C3B565E8BFD322C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:217;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: saWOGiruVQx4HWvRarD9ZAfTLqVasCLMHTSZclUL4YM2g9RJETcEyD2kROdsyYI4SnOrxRFABkTJnYFXXIS2JbyH7MHF9/ZlrAa5dnaL19S4MsqG8utF3ze43v9CouE+Eo/w4JUBL2mf9fK2Q62P9Ud396htRYm93aZ4vmPH6awWQRYeCOdMduWl9SsYg+B1SRr9X6OjuMnIsI4zGJoF90hg6mysb7k5xri1AynhkecyE7YkPrrEYb3PgkCyUnGUw5F0A6klOHCZw3IrvywPr/uPbVMFTnFtYgKP416SQJPY4WfR9dtSYYxltMLj2AL1PcNV5y57sQIWFHofh74dtHPlmicvIk5Ez6/p6ZR/ECED90iouruPzOelVTXwzs+7pG4MmSwQ+G/9gmGM8s011LSsO/gRAKMDB7wJ1ROKitvWLOsZseF9DQAVUzD//TD3P1hodzW14ct0fyxQF52Z166abj5jct69tfGf2dEls+YvxgH1NKpC2HKKta3fP7OG2RYw/DoIAZQ3n3ZK1aJX/Fi43mc5ckN7wuAa7SNNpVuF8pdXjGk/8G8aiAkux6l8DosJfqwj/+aH9gP69DpaPxmxJ/EAxqtXL6xDoZnhYt9MyDjJqkhnaK9zqyUjrfzPc9/Czx7/LO8rd08gsSBjxR5h4rvDWp9WBYxIrvf2S0m4t2NIL1OK3C1E5ZTRoqNb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(19627235002)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YDPtMbtudC3Zfe6fLN0TqgFv1U3C9Ri9IPzfUWpFBrKDccuILxgyvo6I/0xQ?=
 =?us-ascii?Q?sbj/vfIy1+dnx/z4sdxZYO2OqsFvM0drDgLQokerGjvs3DYsyEkayua/HwPE?=
 =?us-ascii?Q?3AWVpKzg2jjYBFSUxx456hOIY31GjOB8IBZ9VzUhwL6XMiuoqGfrM59oXu3o?=
 =?us-ascii?Q?3ui4HZ0ZMBoCaTisoEf+j8c2srewmGRY6ldtwZbUTijKvoKuwIdqDGeHN/OV?=
 =?us-ascii?Q?6BXLlTLTEtKuHbr/aNme99+Hgr/BaYC3Gg8p5OAPydlBS8Zor+U1fJ+FJ6VG?=
 =?us-ascii?Q?LBHsHiHRsIK1ZoRY+EWnyf0sz8DqL+FY880+oiqqv22SH4z59Qu6AhISa+i3?=
 =?us-ascii?Q?E1fRsvSn51Vhaxzb2K3FPXSjceTBuGFJ528GI6Pv58BFy0UWTztiMR5lM677?=
 =?us-ascii?Q?OGeaMHBO6aynCrVBISvGwF9fhUjI850KBKIb7JzQaJ2eX8yzf0bNEoP1OsUG?=
 =?us-ascii?Q?9cM9sZ5RFXs58PfFbVAdXElVZ5/4QwGhawhC2MPurpVqzGCPV/VG41nR2Xb+?=
 =?us-ascii?Q?lf8vXtFEvcXzBfjg0YT2V3zdVvZ2InHO61rXoGdgFPWFOKKb3tIykUEhK6je?=
 =?us-ascii?Q?DrgOW+Syq1ThqNOtMZ0RR7NfOFnezl8KdVJGi7dUHXlCdUq0rU8KsHx1UxU4?=
 =?us-ascii?Q?l2U74a0u/gApP0TB+EZPWN6Euxm0RhO+S8jMip8uSGdophj4handXDeILDc5?=
 =?us-ascii?Q?8rbDXwxWKBsWfMNcjxuCZKG4MocH9T/ZXWR3EwPgXrp5ue+E47PUwzxtxKEF?=
 =?us-ascii?Q?NdQB72Mlp8AAV/dV79zPlkd1uJHDBZr8SyVUX/cxAy3Uw3aS/HPvfGyBKeOU?=
 =?us-ascii?Q?PzOb4lWwEOQSZ6pABbCqjrFHbDpCgO1O45DRmIF46jo0Lp6XSkDnBkkbSkF3?=
 =?us-ascii?Q?lqQSZ77GJM+M30fCAviMdO+hMdV4B2FfCWF0EpDBCNXmVe78myg84KsQs4H4?=
 =?us-ascii?Q?U6olUiQquulFAiPYRvLcTGbsbP2svguKSRGA7mvnBiKxYnNNGFPIkp/bHGb8?=
 =?us-ascii?Q?xwrIeDMh9Aioq0WibmWiPeHJoVxIt007r0qQOk8ypoPiJx2wXjOMNNwJnil8?=
 =?us-ascii?Q?zNUmTnMgckHVLjesxgFbBuisiPuDqtYHsCoxC02pHoRUyUFmhRQMnxw934Tq?=
 =?us-ascii?Q?lCuGHJPDE2zPgdhxe+kZ6+UBTTODzBMwepjGYE28rBnhHyotrTHsb907HYTQ?=
 =?us-ascii?Q?JcwQbgH26Y75DW5fVhVD2AcxiLRrc+TbUx8m8/FpkaNcSfez2GHAIFlmNeRT?=
 =?us-ascii?Q?1QFZvU0+OD/pklwfDE3SlPwv9jGkcHRFQX5Iz2WR84/uBMZPutzpw1MHjBEc?=
 =?us-ascii?Q?9njgwyFKQqGP3v74tdf8j5d1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d3cbd1-61ff-433c-e7df-08d905ac097e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:10.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnaXBXztDSNuqc39rOorgZb1oBKTQTOMfoKqsahQ4fCi6PgMMZM71Sc1B7+2bOKBx/rnn2ORzdol4crqbDz2a852PcA+5E57c5VHqVO5Xjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.4.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
and our in-flight write become a use-after-free. More details will be
in the further commit which actually fixes the bug.

For now, let's prepare infrastructure for the following fix. We are
going to track these in-flight data writes and other operations. So, we
create a hash map

  cluster_index -> HostCluster

And for each HostCluster we calculate number of in-flight operations on
it (which does qcow2_host_range_ref() of course).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                 |  12 ++++
 block/qcow2-host-range-refs.c | 127 ++++++++++++++++++++++++++++++++++
 block/qcow2.c                 |   3 +
 block/meson.build             |   1 +
 4 files changed, 143 insertions(+)
 create mode 100644 block/qcow2-host-range-refs.c

diff --git a/block/qcow2.h b/block/qcow2.h
index 511db948ec..d6de9543c4 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -420,6 +420,9 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    /* For qcow2-host-range-refs.c */
+    GHashTable *host_range_refs;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
@@ -899,6 +902,15 @@ int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 void qcow2_cache_host_discard(BlockDriverState *bs,
                               uint64_t offset, uint64_t length);
 
+void qcow2_init_host_range_refs(BDRVQcow2State *s);
+void qcow2_release_host_range_refs(BDRVQcow2State *s);
+void qcow2_host_range_ref(BlockDriverState *bs, int64_t offset,
+                               int64_t length);
+void qcow2_host_range_unref(BlockDriverState *bs, int64_t offset,
+                               int64_t length);
+uint64_t qcow2_get_host_range_refcnt(BlockDriverState *bs,
+                                     int64_t cluster_index);
+
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
diff --git a/block/qcow2-host-range-refs.c b/block/qcow2-host-range-refs.c
new file mode 100644
index 0000000000..54f0be27a4
--- /dev/null
+++ b/block/qcow2-host-range-refs.c
@@ -0,0 +1,127 @@
+/*
+ * Block driver for the QCOW version 2 format
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qcow2.h"
+
+typedef struct HostCluster {
+    uint64_t host_range_refcnt;
+
+    /* For convenience, keep cluster_index here */
+    int64_t cluster_index;
+} HostCluster;
+
+void qcow2_init_host_range_refs(BDRVQcow2State *s)
+{
+    s->host_range_refs =
+        g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
+}
+
+void qcow2_release_host_range_refs(BDRVQcow2State *s)
+{
+    assert(g_hash_table_size(s->host_range_refs) == 0);
+    g_hash_table_unref(s->host_range_refs);
+}
+
+static HostCluster *find_host_cluster(BDRVQcow2State *s, int64_t cluster_index)
+{
+    HostCluster *cl;
+
+    if (!s->host_range_refs) {
+        return NULL;
+    }
+
+    cl = g_hash_table_lookup(s->host_range_refs, &cluster_index);
+
+    if (cl) {
+        assert(cl->host_range_refcnt > 0);
+    }
+
+    return cl;
+}
+
+uint64_t qcow2_get_host_range_refcnt(BlockDriverState *bs,
+                                     int64_t cluster_index)
+{
+    BDRVQcow2State *s = bs->opaque;
+    HostCluster *cl = find_host_cluster(s, cluster_index);
+
+    if (!cl) {
+        return 0;
+    }
+
+    return cl->host_range_refcnt;
+}
+
+/* Inrease host_range_refcnt of clusters intersecting with range */
+void coroutine_fn
+qcow2_host_range_ref(BlockDriverState *bs, int64_t offset, int64_t length)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t start, last, cluster_index;
+
+    start = start_of_cluster(s, offset) >> s->cluster_bits;
+    last = start_of_cluster(s, offset + length - 1) >> s->cluster_bits;
+    for (cluster_index = start; cluster_index <= last; cluster_index++) {
+        HostCluster *cl = find_host_cluster(s, cluster_index);
+
+        if (!cl) {
+            cl = g_new(HostCluster, 1);
+            *cl = (HostCluster) {
+                .cluster_index = cluster_index,
+                .host_range_refcnt = 1,
+            };
+            g_hash_table_insert(s->host_range_refs,
+                                g_memdup(&cluster_index,
+                                         sizeof(cluster_index)), cl);
+        } else {
+            cl->host_range_refcnt++;
+        }
+        continue;
+    }
+}
+
+/* Decrease host_range_refcnt of clusters intersecting with range */
+void coroutine_fn
+qcow2_host_range_unref(BlockDriverState *bs, int64_t offset, int64_t length)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t start, last, cluster_index;
+
+    start = start_of_cluster(s, offset) >> s->cluster_bits;
+    last = start_of_cluster(s, offset + length - 1) >> s->cluster_bits;
+    for (cluster_index = start; cluster_index <= last; cluster_index++) {
+        HostCluster *cl = find_host_cluster(s, cluster_index);
+
+        assert(cl);
+        assert(cl->host_range_refcnt >= 1);
+
+        if (cl->host_range_refcnt > 1) {
+            cl->host_range_refcnt--;
+            continue;
+        }
+
+        g_hash_table_remove(s->host_range_refs, &cluster_index);
+    }
+}
diff --git a/block/qcow2.c b/block/qcow2.c
index be62585e03..aa298c9e42 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1834,6 +1834,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 #endif
 
     qemu_co_queue_init(&s->thread_task_queue);
+    qcow2_init_host_range_refs(s);
 
     return ret;
 
@@ -2714,6 +2715,8 @@ static void qcow2_close(BlockDriverState *bs)
     g_free(s->image_backing_file);
     g_free(s->image_backing_format);
 
+    qcow2_release_host_range_refs(s);
+
     if (has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
         s->data_file = NULL;
diff --git a/block/meson.build b/block/meson.build
index d21990ec95..a9bf6fde0c 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -25,6 +25,7 @@ block_ss.add(files(
   'qcow2-bitmap.c',
   'qcow2-cache.c',
   'qcow2-cluster.c',
+  'qcow2-host-range-refs.c',
   'qcow2-refcount.c',
   'qcow2-snapshot.c',
   'qcow2-threads.c',
-- 
2.29.2


