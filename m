Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9B6FCE66
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:18:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSq9-0003zY-ES; Tue, 09 May 2023 15:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSq7-0003yS-Sq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSq6-0006Rt-DK
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9ljSb2eKK7vwZQKYVCSNx7jRq8NEWLsTxmxseTS694=;
 b=hev68dvsD+fhxh09+gb19xNS3Sgn8DCYQbhCj/F7IABMHpB57c3aKX0SV40XkwKslwZ6qU
 RFaT+GZlFwwoUHm9trhGw8HwNroz5cezQ7A+oN5K9YAWMK9icS2IgSzx+rVtfyNaU6iL6x
 aWhRNsMnsxiRlCgxTv6+2esvfGEzpLQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-kZyDeBBROG6P0f_yYW59Mw-1; Tue, 09 May 2023 15:17:31 -0400
X-MC-Unique: kZyDeBBROG6P0f_yYW59Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672C03806710;
 Tue,  9 May 2023 19:17:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45D2D63F84;
 Tue,  9 May 2023 19:17:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 01/10] ram: Add public helper to set colo bitmap
Date: Tue,  9 May 2023 21:17:15 +0200
Message-Id: <20230509191724.86159-2-quintela@redhat.com>
In-Reply-To: <20230509191724.86159-1-quintela@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 migration/ram.c | 17 ++++++++++++++---
 migration/ram.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f78e9912cd..0346c1c1ed 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3408,6 +3408,18 @@ static ram_addr_t host_page_offset_from_ram_block_offset(RAMBlock *block,
     return ((uintptr_t)block->host + offset) & (block->page_size - 1);
 }
 
+void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_num)
+{
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
+    for (int i = 0; i < normal_num; i++) {
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
diff --git a/migration/ram.h b/migration/ram.h
index 6fffbeb5f1..887d1fbae6 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -82,6 +82,7 @@ int colo_init_ram_cache(void);
 void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
+void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_num);
 
 /* Background snapshot */
 bool ram_write_tracking_available(void);
-- 
2.40.0


