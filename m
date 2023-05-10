Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5836FE3A1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:10:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoG8-0002Oz-Ef; Wed, 10 May 2023 14:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoG6-0002LB-E3
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoG4-0000hf-LJ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683742187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNSclBZXhxDxDy/DGSigditt2TN1w7TvNTjMre5f+dY=;
 b=RCrZiufjdabTpNVFsdNzP7CM/5LVWtKCsGRCWtSV/6UdllJadgZVg+NZEpePanT0OP1GkS
 0d4DQ3IGGgil6C91K6b2cKQ4lRaed9yhD5QdTRr1Z8PoKEEXtT9sH4z3HhSgkrSETcBT1+
 X9dopkfrMbJLtyjOhrniWtye945/tKw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-kv1zpGSQMXuDDrb1d5rmGA-1; Wed, 10 May 2023 14:09:46 -0400
X-MC-Unique: kv1zpGSQMXuDDrb1d5rmGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC58C84AF33;
 Wed, 10 May 2023 18:09:45 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CF1C14171BC;
 Wed, 10 May 2023 18:09:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 01/10] ram: Add public helper to set colo bitmap
Date: Wed, 10 May 2023 20:09:29 +0200
Message-Id: <20230510180938.6338-2-quintela@redhat.com>
In-Reply-To: <20230510180938.6338-1-quintela@redhat.com>
References: <20230510180938.6338-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lukas Straub <lukasstraub2@web.de>

The overhead of the mutex in non-multifd mode is negligible,
because in that case its just the single thread taking the mutex.

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <22d83cb428f37929563155531bfb69fd8953cc61.1683572883.git.lukasstraub2@web.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h |  1 +
 migration/ram.c | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 6fffbeb5f1..ea1f3c25b5 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -82,6 +82,7 @@ int colo_init_ram_cache(void);
 void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
+void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint32_t pages);
 
 /* Background snapshot */
 bool ram_write_tracking_available(void);
diff --git a/migration/ram.c b/migration/ram.c
index f78e9912cd..b5d03f85ab 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3408,6 +3408,18 @@ static ram_addr_t host_page_offset_from_ram_block_offset(RAMBlock *block,
     return ((uintptr_t)block->host + offset) & (block->page_size - 1);
 }
 
+void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint32_t pages)
+{
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
+    for (int i = 0; i < pages; i++) {
+        ram_addr_t offset = normal[i];
+        ram_state->migration_dirty_pages += !test_and_set_bit(
+                                                offset >> TARGET_PAGE_BITS,
+                                                block->bmap);
+    }
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
+}
+
 static inline void *colo_cache_from_block_offset(RAMBlock *block,
                              ram_addr_t offset, bool record_bitmap)
 {
@@ -3425,9 +3437,8 @@ static inline void *colo_cache_from_block_offset(RAMBlock *block,
     * It help us to decide which pages in ram cache should be flushed
     * into VM's RAM later.
     */
-    if (record_bitmap &&
-        !test_and_set_bit(offset >> TARGET_PAGE_BITS, block->bmap)) {
-        ram_state->migration_dirty_pages++;
+    if (record_bitmap) {
+        colo_record_bitmap(block, &offset, 1);
     }
     return block->colo_cache + offset;
 }
-- 
2.40.1


