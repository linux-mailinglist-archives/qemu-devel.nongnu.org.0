Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570DD79EE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 17:38:39 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKOuE-0000rv-5S
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 11:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iKOhL-0003Lr-AT
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iKOhK-0003sK-4S
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:25:19 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:47178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iKOhJ-0003cG-Fq; Tue, 15 Oct 2019 11:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=qXgsAald1HN18K4PjYyZkFp86Cdh28uAfxzOQSyjqE4=; 
 b=TXRRh3pYjsNeCxnDCncAgJHmrZiuSoIs6hR9ORd/ZYgnQBaxMa6pNS5f6iNvm4Yinry9G7AQ+85yTP0aRdv0gd98crvQHhvZsVs9MKjuA5CrG+M1UU6T0juJfCAeeMs6fTFjP8dSMiVkRE+zzXjgjEg8vqE5MwjVlGbUIk7eIeVFLxBU58Qkw+I5RUHX2sdXQGKVa8IHEYayVhMvJKkZto0EYEwKfcy0T5xFSk6DPBdRnFg+4rIFKW7Heq0vFtzsIWlUhIWu8ZinyAKgbyG1Mqgr69DZcAd1pemTP8YaZZJFeeK4fYzHPhRcA4xuYlPzUxU527/bs0I432jmnrzV9w==;
Received: from 82-181-115-92.bb.dnainternet.fi ([82.181.115.92]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iKOge-0003ah-7B; Tue, 15 Oct 2019 17:24:36 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iKOfn-00061v-42; Tue, 15 Oct 2019 18:23:43 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 20/23] qcow2: Update L2 bitmap in
 qcow2_alloc_cluster_link_l2()
Date: Tue, 15 Oct 2019 18:23:31 +0300
Message-Id: <f159e1e12ab75c7510424449cf7d560969c730ca.1571152571.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1571152571.git.berto@igalia.com>
References: <cover.1571152571.git.berto@igalia.com>
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
 Max Reitz <mreitz@redhat.com>, "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The L2 bitmap needs to be updated after each write to indicate what
new subclusters are now allocated.

This needs to happen even if the cluster was already allocated and the
L2 entry was otherwise valid.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 75579c1470..9a4bf672b3 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -980,6 +980,22 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
 
         set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_COPIED |
                      (cluster_offset + (i << s->cluster_bits)));
+
+        /* Update bitmap with the subclusters that were just written */
+        if (has_subclusters(s)) {
+            uint64_t written_from = m->cow_start.offset;
+            uint64_t written_to = m->cow_end.offset + m->cow_end.nb_bytes;
+            uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
+            int sc;
+            for (sc = 0; sc < s->subclusters_per_cluster; sc++) {
+                uint64_t sc_off = i * s->cluster_size + sc * s->subcluster_size;
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


