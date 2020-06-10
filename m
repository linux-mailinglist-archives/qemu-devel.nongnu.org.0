Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D71F5777
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:14:59 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj2RO-0000It-P3
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gy-0002lB-6Y; Wed, 10 Jun 2020 11:04:12 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gs-0006wT-E3; Wed, 10 Jun 2020 11:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=cG/kSuGs/5TWLvRsT9afV2CDEwmEMC+5Mg1THYxNdFE=; 
 b=cHEclqyCz5UubdNWqPzhokV90FUGITEQsQUYdfx62aBJIKtOqjyRmuSLoAZdS4IhSsyHNNOxmpWVNT8n/o/bxxGCZFCQucRg3YcrapjGZifkexz/awnbbafDyKPDB4H/eZ09o0eI1fPEsfvh2wzfitueuyWbbDdh4TsCkv8Di9/xM4+zImxWwCLWG9BmdaBEFWBrG+gChX/m4OSq6JobgHJKSi98wbo9VcnscmYYf5aYCxjsfTJNahoeQwLD+HeP+WpnwTJJjgEvlwXMdWsIIJV9+8WVkyx5nDCyTKwbpJZnG4+rhj9gcgVYwn6WiCqjWd5Ihxf5omZNlHTlIRirww==;
Received: from [81.0.38.199] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jj2GR-0007hB-Oc; Wed, 10 Jun 2020 17:03:39 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jj2GC-0007NZ-Dd; Wed, 10 Jun 2020 17:03:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 25/34] qcow2: Update L2 bitmap in
 qcow2_alloc_cluster_link_l2()
Date: Wed, 10 Jun 2020 17:03:03 +0200
Message-Id: <21dd7e4b3673541d488d59a40e6580138c401a4b.1591801197.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1591801197.git.berto@igalia.com>
References: <cover.1591801197.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 11:03:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

The L2 bitmap needs to be updated after each write to indicate what
new subclusters are now allocated. This needs to happen even if the
cluster was already allocated and the L2 entry was otherwise valid.

In some cases however a write operation doesn't need change the L2
bitmap (because all affected subclusters were already allocated). This
is detected in calculate_l2_meta(), and qcow2_alloc_cluster_link_l2()
is never called in those cases.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-cluster.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index edfc8ea91c..2276cee6d6 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1061,6 +1061,24 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
         assert((offset & L2E_OFFSET_MASK) == offset);
 
         set_l2_entry(s, l2_slice, l2_index + i, offset | QCOW_OFLAG_COPIED);
+
+        /* Update bitmap with the subclusters that were just written */
+        if (has_subclusters(s)) {
+            uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
+            unsigned written_from = m->cow_start.offset;
+            unsigned written_to = m->cow_end.offset + m->cow_end.nb_bytes ?:
+                m->nb_clusters << s->cluster_bits;
+            int first_sc, last_sc;
+            /* Narrow written_from and written_to down to the current cluster */
+            written_from = MAX(written_from, i << s->cluster_bits);
+            written_to   = MIN(written_to, (i + 1) << s->cluster_bits);
+            assert(written_from < written_to);
+            first_sc = offset_to_sc_index(s, written_from);
+            last_sc  = offset_to_sc_index(s, written_to - 1);
+            l2_bitmap |= QCOW_OFLAG_SUB_ALLOC_RANGE(first_sc, last_sc + 1);
+            l2_bitmap &= ~QCOW_OFLAG_SUB_ZERO_RANGE(first_sc, last_sc + 1);
+            set_l2_bitmap(s, l2_slice, l2_index + i, l2_bitmap);
+        }
      }
 
 
-- 
2.20.1


