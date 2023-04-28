Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4316F1E98
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:13:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWJ-0004t1-GZ; Fri, 28 Apr 2023 15:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWG-0004qL-H1
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWC-0002zv-QN
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4sv46wwHMZHoYs6QFZax8TYeOmxvB56IfSEwn1UIhU=;
 b=jHwHv05LBSM7pOYGhmWft8c034a/88WSTyC5hR4fRRHSUVvRltnpmPLf0VP4WxRwMewfFP
 fGdArwqmoBaHoFks79rtL7e5DLqQf2SHPtbseyOOiGALZmCbbSd1hhDdev4EIq1Nyn/1Oh
 Ai28YU7s9S+SaljtwZ4nVdiqtvHXKVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ysCqC1yMNy6Yg9U5I8XgDw-1; Fri, 28 Apr 2023 15:12:30 -0400
X-MC-Unique: ysCqC1yMNy6Yg9U5I8XgDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B700D185A78B;
 Fri, 28 Apr 2023 19:12:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649C12166B5E;
 Fri, 28 Apr 2023 19:12:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 14/21] ram.c: Do not call save_page_header() from compress
 threads
Date: Fri, 28 Apr 2023 21:11:56 +0200
Message-Id: <20230428191203.39520-15-quintela@redhat.com>
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

save_page_header() accesses several global variables, so calling it
from multiple threads is pretty ugly.

Instead, call save_page_header() before writing out the compressed
data from the compress buffer to the migration stream.

This also makes the core compress code more independend from ram.c.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b0b11f37fb..53aba37be9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1465,17 +1465,13 @@ static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
                                            RAMBlock *block, ram_addr_t offset,
                                            uint8_t *source_buf)
 {
-    RAMState *rs = ram_state;
-    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     uint8_t *p = block->host + offset;
     int ret;
 
-    if (save_zero_page_to_file(pss, f, block, offset)) {
+    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         return RES_ZEROPAGE;
     }
 
-    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
-
     /*
      * copy it to a internal buffer to avoid it being modified by VM
      * so that we can catch up the error during compression and
@@ -1515,9 +1511,40 @@ static inline void compress_reset_result(CompressParam *param)
     param->offset = 0;
 }
 
+static int send_queued_data(CompressParam *param)
+{
+    PageSearchStatus *pss = &ram_state->pss[RAM_CHANNEL_PRECOPY];
+    MigrationState *ms = migrate_get_current();
+    QEMUFile *file = ms->to_dst_file;
+    int len = 0;
+
+    RAMBlock *block = param->block;
+    ram_addr_t offset = param->offset;
+
+    if (param->result == RES_NONE) {
+        return 0;
+    }
+
+    assert(block == pss->last_sent_block);
+
+    if (param->result == RES_ZEROPAGE) {
+        len += save_page_header(pss, file, block, offset | RAM_SAVE_FLAG_ZERO);
+        qemu_put_byte(file, 0);
+        len += 1;
+        ram_release_page(block->idstr, offset);
+    } else if (param->result == RES_COMPRESS) {
+        len += save_page_header(pss, file, block,
+                                offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+        len += qemu_put_qemu_file(file, param->file);
+    } else {
+        abort();
+    }
+
+    return len;
+}
+
 static void flush_compressed_data(RAMState *rs)
 {
-    MigrationState *ms = migrate_get_current();
     int idx, len, thread_count;
 
     if (!save_page_use_compression(rs)) {
@@ -1537,7 +1564,7 @@ static void flush_compressed_data(RAMState *rs)
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
             CompressParam *param = &comp_param[idx];
-            len = qemu_put_qemu_file(ms->to_dst_file, param->file);
+            len = send_queued_data(param);
             compress_reset_result(param);
 
             /*
@@ -1563,7 +1590,6 @@ static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
-    MigrationState *ms = migrate_get_current();
 
     thread_count = migrate_compress_threads();
     qemu_mutex_lock(&comp_done_lock);
@@ -1573,7 +1599,7 @@ retry:
             CompressParam *param = &comp_param[idx];
             qemu_mutex_lock(&param->mutex);
             param->done = false;
-            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file, param->file);
+            bytes_xmit = send_queued_data(param);
             compress_reset_result(param);
             set_compress_params(param, block, offset);
 
-- 
2.40.0


