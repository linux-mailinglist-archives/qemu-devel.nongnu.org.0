Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29282C0F43
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:52:10 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khE8P-0002lM-H2
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khE67-0001NH-2H
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khE65-0001me-AR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606146584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEOGyJmGKUKsyGlXa7iWyGR4KW1LgZOGoEcIsMrdP3w=;
 b=M2MyrqgkDr4p2wDm7lfRGR+Nkf7doXodr23Ay5TKU3QBISQXyuylcu5NtPrPadvV718/Jg
 AsYkAJLHnS8/jCsqoFYiomYAQf5N8cxyN2poCsLKbYT4lbD40TLbgM7lXXCxhElBKOnzDf
 OHOo6EV2b3IHgREseOJtV7PuGQIhZ/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-nKA3qtLaMVaHm3oT25aP5w-1; Mon, 23 Nov 2020 10:49:40 -0500
X-MC-Unique: nKA3qtLaMVaHm3oT25aP5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22646106F6E8;
 Mon, 23 Nov 2020 15:49:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67DF760864;
 Mon, 23 Nov 2020 15:49:35 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] Fix qcow2 corruption on discard
Date: Mon, 23 Nov 2020 17:49:29 +0200
Message-Id: <20201123154929.330338-2-mlevitsk@redhat.com>
In-Reply-To: <20201123154929.330338-1-mlevitsk@redhat.com>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org, zhang_youjia@126.com,
 Max Reitz <mreitz@redhat.com>, andrey.shinkevich@virtuozzo.com,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

It seems harmless, however the call to qcow2_free_any_clusters
can trigger a cache flush which can mark the L2 table as clean,
and assuming that this was the last write to it,
a stale version of it will remain on the disk.

Now we have a valid L2 entry pointing to a freed cluster. Oops.

Fixes: 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/qcow2-cluster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 485b4cb92e..267b46a4ca 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2010,11 +2010,11 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
             continue;
         }
 
-        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
         if (unmap) {
             qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
         }
         set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
+        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
         if (has_subclusters(s)) {
             set_l2_bitmap(s, l2_slice, l2_index + i, new_l2_bitmap);
         }
-- 
2.26.2


