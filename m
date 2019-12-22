Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD1128DB9
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:43:35 +0100 (CET)
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iize2-00004w-EP
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZ8-0003La-SU
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZ7-0006nn-K8
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZ7-0004Uk-6K; Sun, 22 Dec 2019 06:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=7yEjOZlUVJ7jHicAcELr1+Yiz+TxR8WDeHeO6wbNjdo=; 
 b=RqYFzZt3wyGDyp0iwR5FojAIGOn7SVGmqCQMuTEA8nJqMMLJSn2vNOhi/BRGumWeW0+zej3axuYRQYSdUu70V5ubGCUuQ7m4KRB9eWayLZNpdHyDwwwotWvfNgcb32yeHNRFKAAvx3Jc+O0iG28FylgcOUvfOy3JDHUgrGNybAgbGpiStOSnRhxaJciB1UDe5E4JRcATx3ikZP9i/+Ziay18NWvzgQhL28eLgKFaRksp1HjmWO2m2+5e3KJnsgqYZRjZb8gAjbZIGEY00boZ5LdGhpjXZEI012paytWWllu+Q4eEGNsixpZTOwXPV/WSZk247/Ia3x/XxK+ZPlI5nA==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dN-W8; Sun, 22 Dec 2019 12:37:51 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001W9-S6; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 21/27] qcow2: Update L2 bitmap in
 qcow2_alloc_cluster_link_l2()
Date: Sun, 22 Dec 2019 12:37:02 +0100
Message-Id: <4e1c4c2994470119889e8f602b9c98f4d3457e8b.1577014346.git.berto@igalia.com>
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

The L2 bitmap needs to be updated after each write to indicate what
new subclusters are now allocated.

This needs to happen even if the cluster was already allocated and the
L2 entry was otherwise valid.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 0a40944667..ed291a4042 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -986,6 +986,23 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
 
         set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_COPIED |
                      (cluster_offset + (i << s->cluster_bits)));
+
+        /* Update bitmap with the subclusters that were just written */
+        if (has_subclusters(s)) {
+            unsigned written_from = m->cow_start.offset;
+            unsigned written_to = m->cow_end.offset + m->cow_end.nb_bytes ?:
+                m->nb_clusters << s->cluster_bits;
+            uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
+            int sc;
+            for (sc = 0; sc < s->subclusters_per_cluster; sc++) {
+                int sc_off = i * s->cluster_size + sc * s->subcluster_size;
+                if (sc_off >= written_from && sc_off < written_to) {
+                    l2_bitmap |= QCOW_OFLAG_SUB_ALLOC(sc);
+                    l2_bitmap &= ~QCOW_OFLAG_SUB_ZERO(sc);
+                }
+            }
+            set_l2_bitmap(s, l2_slice, l2_index + i, l2_bitmap);
+        }
      }
 
 
-- 
2.20.1


