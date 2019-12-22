Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227E6128DAF
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:40:20 +0100 (CET)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizas-0004gz-30
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizYp-0002nt-22
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizYn-0005as-Py
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:10 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizYn-0004Uh-0l; Sun, 22 Dec 2019 06:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=3YI9V2tDlLRPz3CdTbTokSYxL9dcWurq4MZPIj1h9PU=; 
 b=a0nK9UqkTJEEolEtXiguVNDxZOEij7ax0tGwF7S3aj2fVvjc1QJ1Q/gVr25d/MdH8FgygvfBAFudPr9Kk8pZQvlnk4sdj9p2dKdnf7tHVNiClubhgCDN5e6lrCrKacJ3qxXEwTb8DVNVjfH7UKM9MCwodK4E6jJV5kkMTZCD2zJ0oyC+LrEkF8rr2Gvzk/qgmRyipoSUY9FCZ5W+fkyrboik3qaRr5Bq9adoNyzXBchlD5e4epwBd4u/VWQU4bfdKC+v9Z/EwTjsm7Y2NXn4SbZmZ8MxHpTeOU7aQ+axBn+1l8KSorMfjAdD6A0V/71TYOphQeibkn10lQ1EVesvmA==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dI-Sk; Sun, 22 Dec 2019 12:37:51 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001Vy-NS; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 16/27] qcow2: Add subcluster support to
 zero_in_l2_slice()
Date: Sun, 22 Dec 2019 12:36:57 +0100
Message-Id: <4ab32f6dfcfeb5a22e119b03e223ea198988538e.1577014346.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577014346.git.berto@igalia.com>
References: <cover.1577014346.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the QCOW_OFLAG_ZERO bit of the L2 entry is forbidden if an
image has subclusters. Instead, the individual 'all zeroes' bits must
be used.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index c10601a828..70b0aaa00a 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1870,7 +1870,7 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     assert(nb_clusters <= INT_MAX);
 
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t old_offset;
+        uint64_t old_offset, l2_entry = 0;
         QCow2ClusterType cluster_type;
 
         old_offset = get_l2_entry(s, l2_slice, l2_index + i);
@@ -1887,12 +1887,18 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
         if (cluster_type == QCOW2_CLUSTER_COMPRESSED || unmap) {
-            set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
             qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
         } else {
-            uint64_t entry = get_l2_entry(s, l2_slice, l2_index + i);
-            set_l2_entry(s, l2_slice, l2_index + i, entry | QCOW_OFLAG_ZERO);
+            l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
         }
+
+        if (has_subclusters(s)) {
+            set_l2_bitmap(s, l2_slice, l2_index + i, QCOW_L2_BITMAP_ALL_ZEROES);
+        } else {
+            l2_entry |= QCOW_OFLAG_ZERO;
+        }
+
+        set_l2_entry(s, l2_slice, l2_index + i, l2_entry);
     }
 
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
-- 
2.20.1


