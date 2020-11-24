Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E02C2163
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:29:56 +0100 (CET)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUe3-0006ZQ-Ud
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khUck-00060U-VY
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khUci-0007c3-1w
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606210111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F6oB62woV2/H0Bouf5DIufnr8m8Sr5ov1E9QASCjDdU=;
 b=FnRigdGqGPbqLyLqOkJ39E/R1PpKbp4QqJSyd1jdiacaQ8IU4iB5IEVj8oO3XGNitYPw13
 zldpxh5W1DSfr2z5sYuSx/GuRjcFvL2vAcZFvRczvLHD0rGvM2geleracl5OMu2C4PdEH1
 8P8plpYoBUKBZdXsMIkp3btNzUKJsl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-IPoPglumMzGvpbyBij3Crw-1; Tue, 24 Nov 2020 04:28:28 -0500
X-MC-Unique: IPoPglumMzGvpbyBij3Crw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F7951005E59;
 Tue, 24 Nov 2020 09:28:27 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-111.ams2.redhat.com [10.36.114.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E81D5C1A3;
 Tue, 24 Nov 2020 09:28:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.2 v2] qcow2: Fix corruption on write_zeroes with
 MAY_UNMAP
Date: Tue, 24 Nov 2020 10:28:15 +0100
Message-Id: <20201124092815.39056-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 zhang_youjia@126.com, qemu-devel@nongnu.org, mlevitsk@redhat.com,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Commit 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
introduced a subtle change to code in zero_in_l2_slice:

It swapped the order of

1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
2. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
3. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);

To

1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
2. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
3. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);

It seems harmless, however the call to qcow2_free_any_clusters can
trigger a cache flush which can mark the L2 table as clean, and
assuming that this was the last write to it, a stale version of it
will remain on the disk.

Now we have a valid L2 entry pointing to a freed cluster. Oops.

Fixes: 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[ kwolf: Fixed to restore the correct original order from before
  205fa50750; added comments like in discard_in_l2_slice(). ]
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-cluster.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 485b4cb92e..bd0597842f 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2010,14 +2010,17 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
             continue;
         }
 
+        /* First update L2 entries */
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
-        if (unmap) {
-            qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
-        }
         set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
         if (has_subclusters(s)) {
             set_l2_bitmap(s, l2_slice, l2_index + i, new_l2_bitmap);
         }
+
+        /* Then decrease the refcount */
+        if (unmap) {
+            qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
+        }
     }
 
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
-- 
2.28.0


