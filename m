Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BBC642696
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:20:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Eh-0005aM-7U; Mon, 05 Dec 2022 04:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28Ef-0005Xm-OF
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28Ed-00081s-5p
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkPlQ4gEg9a7Yj+e7nBmIk5Ti/EnLgZT1bGXxBuSW7U=;
 b=b8wb8c/JKVOcsyUOyOVPAlciCE9EE7iyKnJXJyi8IPMxxE0LyxDycc25gm/G8CTJJmjTaB
 oRP//RaUoW1nx/wOzTrFKvRI8cvB+fV318hb/0DpPY2+XScCb4AT2cfTBQCrkhvVS3LALr
 6FA4MoiO7puEGiM5rC8wVyNET9Q8AV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-MyOiaqYXNuqyBrLjCF3Tdg-1; Mon, 05 Dec 2022 04:57:54 -0500
X-MC-Unique: MyOiaqYXNuqyBrLjCF3Tdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DD943C10ECD;
 Mon,  5 Dec 2022 09:57:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD16B2166B29;
 Mon,  5 Dec 2022 09:57:45 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 40/51] migration: Introduce pss_channel
Date: Mon,  5 Dec 2022 10:52:17 +0100
Message-Id: <20221205095228.1314-41-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Introduce pss_channel for PageSearchStatus, define it as "the migration
channel to be used to transfer this host page".

We used to have rs->f, which is a mirror to MigrationState.to_dst_file.

After postcopy preempt initial version, rs->f can be dynamically changed
depending on which channel we want to use.

But that later work still doesn't grant full concurrency of sending pages
in e.g. different threads, because rs->f can either be the PRECOPY channel
or POSTCOPY channel.  This needs to be per-thread too.

PageSearchStatus is actually a good piece of struct which we can leverage
if we want to have multiple threads sending pages.  Sending a single guest
page may not make sense, so we make the granule to be "host page", and in
the PSS structure we allow specify a QEMUFile* to migrate a specific host
page.  Then we open the possibility to specify different channels in
different threads with different PSS structures.

The PSS prefix can be slightly misleading here because e.g. for the
upcoming usage of postcopy channel/thread it's not "searching" (or,
scanning) at all but sending the explicit page that was requested.  However
since PSS existed for some years keep it as-is until someone complains.

This patch mostly (simply) replace rs->f with pss->pss_channel only. No
functional change intended for this patch yet.  But it does prepare to
finally drop rs->f, and make ram_save_guest_page() thread safe.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 70 +++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 4d7b50ef79..571d780987 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -453,6 +453,8 @@ void dirty_sync_missed_zero_copy(void)
 
 /* used by the search for pages to send */
 struct PageSearchStatus {
+    /* The migration channel used for a specific host page */
+    QEMUFile    *pss_channel;
     /* Current block being searched */
     RAMBlock    *block;
     /* Current page to search from */
@@ -775,9 +777,9 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
-                            ram_addr_t current_addr, RAMBlock *block,
-                            ram_addr_t offset)
+static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
+                            uint8_t **current_data, ram_addr_t current_addr,
+                            RAMBlock *block, ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
@@ -845,11 +847,11 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     }
 
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle = save_page_header(rs, rs->f, block,
+    bytes_xbzrle = save_page_header(rs, file, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
-    qemu_put_byte(rs->f, ENCODING_FLAG_XBZRLE);
-    qemu_put_be16(rs->f, encoded_len);
-    qemu_put_buffer(rs->f, XBZRLE.encoded_buf, encoded_len);
+    qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
+    qemu_put_be16(file, encoded_len);
+    qemu_put_buffer(file, XBZRLE.encoded_buf, encoded_len);
     bytes_xbzrle += encoded_len + 1 + 2;
     /*
      * Like compressed_size (please see update_compress_thread_counts),
@@ -1305,9 +1307,10 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
+static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+                          ram_addr_t offset)
 {
-    int len = save_zero_page_to_file(rs, rs->f, block, offset);
+    int len = save_zero_page_to_file(rs, file, block, offset);
 
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1324,15 +1327,15 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
  *
  * Return true if the pages has been saved, otherwise false is returned.
  */
-static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
-                              int *pages)
+static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
+                              ram_addr_t offset, int *pages)
 {
     uint64_t bytes_xmit = 0;
     int ret;
 
     *pages = -1;
-    ret = ram_control_save_page(rs->f, block->offset, offset, TARGET_PAGE_SIZE,
-                                &bytes_xmit);
+    ret = ram_control_save_page(pss->pss_channel, block->offset, offset,
+                                TARGET_PAGE_SIZE, &bytes_xmit);
     if (ret == RAM_SAVE_CONTROL_NOT_SUPP) {
         return false;
     }
@@ -1366,17 +1369,17 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
  * @buf: the page to be sent
  * @async: send to page asyncly
  */
-static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
-                            uint8_t *buf, bool async)
+static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+                            ram_addr_t offset, uint8_t *buf, bool async)
 {
-    ram_transferred_add(save_page_header(rs, rs->f, block,
+    ram_transferred_add(save_page_header(rs, file, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
-        qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
+        qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
                               migrate_release_ram() &&
                               migration_in_postcopy());
     } else {
-        qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
+        qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
     stat64_add(&ram_atomic_counters.normal, 1);
@@ -1409,8 +1412,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
-        pages = save_xbzrle_page(rs, &p, current_addr, block,
-                                 offset);
+        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
+                                 block, offset);
         if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
              * might get updated before it gets to the wire
@@ -1421,7 +1424,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     /* XBZRLE overflow or normal page */
     if (pages == -1) {
-        pages = save_normal_page(rs, block, offset, p, send_async);
+        pages = save_normal_page(rs, pss->pss_channel, block, offset,
+                                 p, send_async);
     }
 
     XBZRLE_cache_unlock();
@@ -1429,10 +1433,10 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
     return pages;
 }
 
-static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
+static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
                                  ram_addr_t offset)
 {
-    if (multifd_queue_page(rs->f, block, offset) < 0) {
+    if (multifd_queue_page(file, block, offset) < 0) {
         return -1;
     }
     stat64_add(&ram_atomic_counters.normal, 1);
@@ -1727,7 +1731,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
         uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
 
         /* Flush async buffers before un-protect. */
-        qemu_fflush(rs->f);
+        qemu_fflush(pss->pss_channel);
         /* Un-protect memory range. */
         res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
                 false, false);
@@ -2314,7 +2318,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
     int res;
 
-    if (control_save_page(rs, block, offset, &res)) {
+    if (control_save_page(pss, block, offset, &res)) {
         return res;
     }
 
@@ -2322,7 +2326,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         return 1;
     }
 
-    res = save_zero_page(rs, block, offset);
+    res = save_zero_page(rs, pss->pss_channel, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
@@ -2342,7 +2346,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
      * still see partially copied pages which is data corruption.
      */
     if (migrate_use_multifd() && !migration_in_postcopy()) {
-        return ram_save_multifd_page(rs, block, offset);
+        return ram_save_multifd_page(pss->pss_channel, block, offset);
     }
 
     return ram_save_page(rs, pss);
@@ -2544,10 +2548,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
-    if (postcopy_preempt_active()) {
-        postcopy_preempt_choose_channel(rs, pss);
-    }
-
     /* Update host page boundary information */
     pss_host_page_prepare(pss);
 
@@ -2607,7 +2607,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
      * explicit flush or it won't flush until the buffer is full.
      */
     if (migrate_postcopy_preempt() && pss->postcopy_requested) {
-        qemu_fflush(rs->f);
+        qemu_fflush(pss->pss_channel);
     }
 
     res = ram_save_release_protection(rs, pss, start_page);
@@ -2673,6 +2673,12 @@ static int ram_find_and_save_block(RAMState *rs)
         }
 
         if (found) {
+            /* Update rs->f with correct channel */
+            if (postcopy_preempt_active()) {
+                postcopy_preempt_choose_channel(rs, &pss);
+            }
+            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
+            pss.pss_channel = rs->f;
             pages = ram_save_host_page(rs, &pss);
         }
     } while (!pages && again);
-- 
2.38.1


