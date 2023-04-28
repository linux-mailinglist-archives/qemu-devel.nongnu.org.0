Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B3F6F1EA8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:16:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWN-0004uw-Hg; Fri, 28 Apr 2023 15:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWI-0004rG-2q
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWF-00030w-Ia
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQ8no8yXnvZofbPeEvNkFyfsWU+Bd+oHB7XDIuJq5kU=;
 b=jPc4nTOdevs56bkahCyJoEjurERiuxH5LqtAp/TNbwF0DPaPkiOaH1LSnvc+3fa7fllQ4E
 IemFxSVL+gZfaa53iNpGgHL/P91ZGj8yId8KG9s0Rjim+2zQ8MFGQADsK21VGf52RhDJmM
 SwzCDcunpgVN2XEgb+k0wmr9e6H4D2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-Ru6IZWIzOVi9761Gslufzg-1; Fri, 28 Apr 2023 15:12:33 -0400
X-MC-Unique: Ru6IZWIzOVi9761Gslufzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 252631C06914;
 Fri, 28 Apr 2023 19:12:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B61C72166B4F;
 Fri, 28 Apr 2023 19:12:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 16/21] ram.c: Remove last ram.c dependency from the core
 compress code
Date: Fri, 28 Apr 2023 21:11:58 +0200
Message-Id: <20230428191203.39520-17-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Make compression interfaces take send_queued_data() as an argument.
Remove save_page_use_compression() from flush_compressed_data().

This removes the last ram.c dependency from the core compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f17f6581ff..3671912b58 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1545,13 +1545,10 @@ static int send_queued_data(CompressParam *param)
     return len;
 }
 
-static void flush_compressed_data(RAMState *rs)
+static void flush_compressed_data(int (send_queued_data(CompressParam *)))
 {
     int idx, thread_count;
 
-    if (!save_page_use_compression(rs)) {
-        return;
-    }
     thread_count = migrate_compress_threads();
 
     qemu_mutex_lock(&comp_done_lock);
@@ -1573,6 +1570,15 @@ static void flush_compressed_data(RAMState *rs)
     }
 }
 
+static void ram_flush_compressed_data(RAMState *rs)
+{
+    if (!save_page_use_compression(rs)) {
+        return;
+    }
+
+    flush_compressed_data(send_queued_data);
+}
+
 static inline void set_compress_params(CompressParam *param, RAMBlock *block,
                                        ram_addr_t offset)
 {
@@ -1581,7 +1587,8 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
     param->trigger = true;
 }
 
-static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
+                                int (send_queued_data(CompressParam *)))
 {
     int idx, thread_count, pages = -1;
     bool wait = migrate_compress_wait_thread();
@@ -1672,7 +1679,7 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
              * Also If xbzrle is on, stop using the data compression at this
              * point. In theory, xbzrle can do better than compression.
              */
-            flush_compressed_data(rs);
+            ram_flush_compressed_data(rs);
 
             /* Hit the end of the list */
             pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
@@ -2362,11 +2369,11 @@ static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
      * much CPU resource.
      */
     if (block != pss->last_sent_block) {
-        flush_compressed_data(rs);
+        ram_flush_compressed_data(rs);
         return false;
     }
 
-    if (compress_page_with_multi_thread(block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset, send_queued_data) > 0) {
         return true;
     }
 
@@ -3412,7 +3419,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
              * page is sent in one chunk.
              */
             if (migrate_postcopy_ram()) {
-                flush_compressed_data(rs);
+                ram_flush_compressed_data(rs);
             }
 
             /*
@@ -3507,7 +3514,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         }
         qemu_mutex_unlock(&rs->bitmap_mutex);
 
-        flush_compressed_data(rs);
+        ram_flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
-- 
2.40.0


