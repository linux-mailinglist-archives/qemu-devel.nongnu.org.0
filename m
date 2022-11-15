Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945FC6298ED
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouupM-0005aX-M5; Tue, 15 Nov 2022 07:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouupJ-0005UX-9N
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouupH-0004po-4C
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vtXCnDGaRnnyELakwPKO/beDwfFW1BQewDUw+d86FIM=;
 b=CVdiLAmS7nN8dcC7eC1PHRCjFSqIEXTiJu4hGRwnAy/EpxjLbRso5YR9jXVHUk7TzkaB0T
 xqBelIsrL/Bye37nSzKRa6phA+L4IlcACfexui7m5TTNu1mIlUja8n6jc+Yzz8387r6qDK
 3h4hI/mPy7F9HSqekpl3rjb9YBA6jcY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-nnnzQGFaMqePZKs3Rkxgqg-1; Tue, 15 Nov 2022 07:13:55 -0500
X-MC-Unique: nnnzQGFaMqePZKs3Rkxgqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB2B1C09041;
 Tue, 15 Nov 2022 12:13:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87287492B05;
 Tue, 15 Nov 2022 12:13:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 26/30] migration: Move last_sent_block into PageSearchStatus
Date: Tue, 15 Nov 2022 13:12:22 +0100
Message-Id: <20221115121226.26609-27-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

Since we use PageSearchStatus to represent a channel, it makes perfect
sense to keep last_sent_block (aka, leverage RAM_SAVE_FLAG_CONTINUE) to be
per-channel rather than global because each channel can be sending
different pages on ramblocks.

Hence move it from RAMState into PageSearchStatus.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 71 ++++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index bdb29ac4d9..dbdde5a6a5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -117,6 +117,8 @@ XBZRLECacheStats xbzrle_counters;
 struct PageSearchStatus {
     /* The migration channel used for a specific host page */
     QEMUFile    *pss_channel;
+    /* Last block from where we have sent data */
+    RAMBlock *last_sent_block;
     /* Current block being searched */
     RAMBlock    *block;
     /* Current page to search from */
@@ -396,8 +398,6 @@ struct RAMState {
     int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
-    /* Last block from where we have sent data */
-    RAMBlock *last_sent_block;
     /* Last dirty target page we have sent */
     ram_addr_t last_page;
     /* last ram version we have seen */
@@ -712,16 +712,17 @@ exit:
  *
  * Returns the number of bytes written
  *
- * @f: QEMUFile where to send the data
+ * @pss: current PSS channel status
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  *          in the lower bits, it contains flags
  */
-static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
+static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
-    bool same_block = (block == rs->last_sent_block);
+    bool same_block = (block == pss->last_sent_block);
+    QEMUFile *f = pss->pss_channel;
 
     if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
@@ -734,7 +735,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
         size += 1 + len;
-        rs->last_sent_block = block;
+        pss->last_sent_block = block;
     }
     return size;
 }
@@ -818,17 +819,19 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  *          -1 means that xbzrle would be longer than normal
  *
  * @rs: current RAM state
+ * @pss: current PSS channel
  * @current_data: pointer to the address of the page contents
  * @current_addr: addr of the page
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
+static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
                             uint8_t **current_data, ram_addr_t current_addr,
                             RAMBlock *block, ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
+    QEMUFile *file = pss->pss_channel;
 
     if (!cache_is_cached(XBZRLE.cache, current_addr,
                          ram_counters.dirty_sync_count)) {
@@ -893,7 +896,7 @@ static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
     }
 
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle = save_page_header(rs, file, block,
+    bytes_xbzrle = save_page_header(pss, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
     qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
     qemu_put_be16(file, encoded_len);
@@ -1324,19 +1327,19 @@ void ram_release_page(const char *rbname, uint64_t offset)
  * Returns the size of data written to the file, 0 means the page is not
  * a zero page
  *
- * @rs: current RAM state
- * @file: the file where the data is saved
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
+static int save_zero_page_to_file(PageSearchStatus *pss,
                                   RAMBlock *block, ram_addr_t offset)
 {
     uint8_t *p = block->host + offset;
+    QEMUFile *file = pss->pss_channel;
     int len = 0;
 
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
+        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
         ram_release_page(block->idstr, offset);
@@ -1349,14 +1352,14 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
  *
  * Returns the number of pages written.
  *
- * @rs: current RAM state
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
                           ram_addr_t offset)
 {
-    int len = save_zero_page_to_file(rs, file, block, offset);
+    int len = save_zero_page_to_file(pss, block, offset);
 
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1409,16 +1412,18 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
  *
  * Returns the number of pages written.
  *
- * @rs: current RAM state
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  * @buf: the page to be sent
  * @async: send to page asyncly
  */
-static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
                             ram_addr_t offset, uint8_t *buf, bool async)
 {
-    ram_transferred_add(save_page_header(rs, file, block,
+    QEMUFile *file = pss->pss_channel;
+
+    ram_transferred_add(save_page_header(pss, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
@@ -1458,7 +1463,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
-        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
+        pages = save_xbzrle_page(rs, pss, &p, current_addr,
                                  block, offset);
         if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
@@ -1470,8 +1475,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     /* XBZRLE overflow or normal page */
     if (pages == -1) {
-        pages = save_normal_page(rs, pss->pss_channel, block, offset,
-                                 p, send_async);
+        pages = save_normal_page(pss, block, offset, p, send_async);
     }
 
     XBZRLE_cache_unlock();
@@ -1494,14 +1498,15 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf)
 {
     RAMState *rs = ram_state;
+    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     uint8_t *p = block->host + offset;
     int ret;
 
-    if (save_zero_page_to_file(rs, f, block, offset)) {
+    if (save_zero_page_to_file(pss, block, offset)) {
         return true;
     }
 
-    save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
 
     /*
      * copy it to a internal buffer to avoid it being modified by VM
@@ -2321,7 +2326,8 @@ static bool save_page_use_compression(RAMState *rs)
  * has been properly handled by compression, otherwise needs other
  * paths to handle it
  */
-static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
+static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
+                               RAMBlock *block, ram_addr_t offset)
 {
     if (!save_page_use_compression(rs)) {
         return false;
@@ -2337,7 +2343,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
      * We post the fist page as normal page as compression will take
      * much CPU resource.
      */
-    if (block != rs->last_sent_block) {
+    if (block != pss->last_sent_block) {
         flush_compressed_data(rs);
         return false;
     }
@@ -2368,11 +2374,11 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         return res;
     }
 
-    if (save_compress_page(rs, block, offset)) {
+    if (save_compress_page(rs, pss, block, offset)) {
         return 1;
     }
 
-    res = save_zero_page(rs, pss->pss_channel, block, offset);
+    res = save_zero_page(pss, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
@@ -2503,7 +2509,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
          * If channel switched, reset last_sent_block since the old sent block
          * may not be on the same channel.
          */
-        rs->last_sent_block = NULL;
+        pss->last_sent_block = NULL;
 
         trace_postcopy_preempt_switch_channel(channel);
     }
@@ -2842,8 +2848,13 @@ static void ram_save_cleanup(void *opaque)
 
 static void ram_state_reset(RAMState *rs)
 {
+    int i;
+
+    for (i = 0; i < RAM_CHANNEL_MAX; i++) {
+        rs->pss[i].last_sent_block = NULL;
+    }
+
     rs->last_seen_block = NULL;
-    rs->last_sent_block = NULL;
     rs->last_page = 0;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
@@ -3037,8 +3048,8 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
     migration_bitmap_sync(rs);
 
     /* Easiest way to make sure we don't resume in the middle of a host-page */
+    rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
     rs->last_seen_block = NULL;
-    rs->last_sent_block = NULL;
     rs->last_page = 0;
 
     postcopy_each_ram_send_discard(ms);
-- 
2.38.1


