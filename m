Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D630820C784
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 13:12:15 +0200 (CEST)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpVEM-0003Zs-6O
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 07:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV64-0006y3-Mh; Sun, 28 Jun 2020 07:03:40 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV5x-0000WZ-VG; Sun, 28 Jun 2020 07:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=x44WykpORUb7jKPsPZokuc5MU7JgoaeSdWXwYoNGUz0=; 
 b=lsk0/TMqHOHLkoV/eVCBo7690IotqousTYlwxI/aaGaownTjjpX95yvW+B/GdWynqjSQ3sZwZmkwwSGQB3rWXMzf93ITnAjtAmgZo1ZU1DoLfSHY5qxSSHPsRcDbvFjOkEblso3crkYegVThTMwLuVLFTpGYX0qLQ4itU2t/ckMq9/vA2ii8ZWvJ5e+lOjPuelMgXOQxps/u5xWi48EEgU/bW45u3ZNs4j4AuVkFg+103owweKecrG8miiHKBBbHBFTzaaQpGSvYY8DNNu4tuAoOHoma1+GoRTNMvAhMcKcaqhab5KMbCxxFVz4WhPRrBxNhKc/N4Sejx8reEtHuYQ==;
Received: from 26.red-79-158-236.dynamicip.rima-tde.net ([79.158.236.26]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jpV5X-0002gO-Db; Sun, 28 Jun 2020 13:03:07 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jpV5H-00038F-I6; Sun, 28 Jun 2020 13:02:51 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/34] qcow2: Split cluster_needs_cow() out of
 count_cow_clusters()
Date: Sun, 28 Jun 2020 13:02:13 +0200
Message-Id: <f01d5a9b6daff61e672a580ad1ec259e88291d01.1593342067.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593342067.git.berto@igalia.com>
References: <cover.1593342067.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 07:03:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to need it in other places.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-cluster.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 61ad638bdc..80f9787461 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1087,6 +1087,24 @@ static void calculate_l2_meta(BlockDriverState *bs,
     QLIST_INSERT_HEAD(&s->cluster_allocs, *m, next_in_flight);
 }
 
+/* Returns true if writing to a cluster requires COW */
+static bool cluster_needs_cow(BlockDriverState *bs, uint64_t l2_entry)
+{
+    switch (qcow2_get_cluster_type(bs, l2_entry)) {
+    case QCOW2_CLUSTER_NORMAL:
+        if (l2_entry & QCOW_OFLAG_COPIED) {
+            return false;
+        }
+    case QCOW2_CLUSTER_UNALLOCATED:
+    case QCOW2_CLUSTER_COMPRESSED:
+    case QCOW2_CLUSTER_ZERO_PLAIN:
+    case QCOW2_CLUSTER_ZERO_ALLOC:
+        return true;
+    default:
+        abort();
+    }
+}
+
 /*
  * Returns the number of contiguous clusters that can be used for an allocating
  * write, but require COW to be performed (this includes yet unallocated space,
@@ -1099,25 +1117,11 @@ static int count_cow_clusters(BlockDriverState *bs, int nb_clusters,
 
     for (i = 0; i < nb_clusters; i++) {
         uint64_t l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
-        QCow2ClusterType cluster_type = qcow2_get_cluster_type(bs, l2_entry);
-
-        switch(cluster_type) {
-        case QCOW2_CLUSTER_NORMAL:
-            if (l2_entry & QCOW_OFLAG_COPIED) {
-                goto out;
-            }
+        if (!cluster_needs_cow(bs, l2_entry)) {
             break;
-        case QCOW2_CLUSTER_UNALLOCATED:
-        case QCOW2_CLUSTER_COMPRESSED:
-        case QCOW2_CLUSTER_ZERO_PLAIN:
-        case QCOW2_CLUSTER_ZERO_ALLOC:
-            break;
-        default:
-            abort();
         }
     }
 
-out:
     assert(i <= nb_clusters);
     return i;
 }
-- 
2.20.1


