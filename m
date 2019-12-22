Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B439128DC7
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:56:53 +0100 (CET)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizqt-0004iI-W8
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZ9-0003Lm-0J
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZ7-0006o6-Mp
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZ7-0004V1-A0; Sun, 22 Dec 2019 06:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=AkPLgWeXD8Sp8Vv4WDnQhlr8ICgxnf9zj64xPn9SawY=; 
 b=ozO1RPtFOyCCHRRi7ZUwrFjmlZZtZb5mDupZh0aPyv5ufp0csfCFDkoPHRnnfpXzXKNDuxctw6UTKMaD25gVv9uF50YmqjHg9tDooSUQpOYoXOLohrzjpWstJDDsL0ttLQVksdP4aFaIDuUyfLntG4GFDyMZ+hj2DgN0p0xSSMjRkhtC2Tqk6cKPmE4Nw3hpKVx39i5iB7Km7tnoT/HmEIyXIyjl6v6DoTDQZoab5Nn/wWX9bqoAEqeqti1UU54fgr/nNIJ2FN83GdA6YVbP4avnrV3X3lxlR9myVN5hwLELUaYKWEYCjSSY7i9K7iOny+8JN81zOoUrXgRLBFoTug==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dL-VE; Sun, 22 Dec 2019 12:37:52 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001W4-QE; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 19/27] qcow2: Add subcluster support to
 expand_zero_clusters_in_l1()
Date: Sun, 22 Dec 2019 12:37:00 +0100
Message-Id: <d7c9c2d54c7be83eda854db37e54dd7aabb1a1e1.1577014346.git.berto@igalia.com>
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

Two changes are needed in order to add subcluster support to this
function: deallocated clusters must have their bitmaps cleared, and
expanded clusters must have all the "subcluster allocated" bits set.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 207f670c94..ede75138d2 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2054,6 +2054,9 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         /* not backed; therefore we can simply deallocate the
                          * cluster */
                         set_l2_entry(s, l2_slice, j, 0);
+                        if (has_subclusters(s)) {
+                            set_l2_bitmap(s, l2_slice, j, 0);
+                        }
                         l2_dirty = true;
                         continue;
                     }
@@ -2120,6 +2123,9 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                 } else {
                     set_l2_entry(s, l2_slice, j, offset);
                 }
+                if (has_subclusters(s)) {
+                    set_l2_bitmap(s, l2_slice, j, QCOW_L2_BITMAP_ALL_ALLOC);
+                }
                 l2_dirty = true;
             }
 
-- 
2.20.1


