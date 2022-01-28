Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B55B4A0068
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:27 +0100 (CET)
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDWME-0004ew-Jh
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW4L-00050u-AM
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:33:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW4H-0000xl-Ea
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQbBtcOQQqTGlmVLcvaCYCTmSqbpaVikGchlkLKdfGo=;
 b=QAjoW4SDv7V368vg4HPo3JVocg2Awo8EkybHA4x+lLfxyKyzM33eRjEmMujecPUKKx8OBw
 NEOzt0n2795a2R0Ul7tcu79eiVGMz+no3jdD875CRxbuZIg8wkuzA1hsTdZDkMJTk1fF2N
 yvw/zkqLH8uOLhM1WNbfug7JXbokmZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-GqyUe1THOjmiqWE_RUx1rw-1; Fri, 28 Jan 2022 13:33:45 -0500
X-MC-Unique: GqyUe1THOjmiqWE_RUx1rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66201091DA0;
 Fri, 28 Jan 2022 18:33:42 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8A377466;
 Fri, 28 Jan 2022 18:33:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/36] migration: We only need last_stage in two places
Date: Fri, 28 Jan 2022 19:29:59 +0100
Message-Id: <20220128183033.31998-3-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only need last_stage in two places and we are passing it all
around.  Just add a field to RAMState that passes it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

Repeat subject (philmd suggestion)
---
 migration/ram.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..7223b0d8ca 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -325,7 +325,8 @@ struct RAMState {
     uint64_t xbzrle_bytes_prev;
     /* Start using XBZRLE (e.g., after the first round). */
     bool xbzrle_enabled;
-
+    /* Are we on the last stage of migration */
+    bool last_stage;
     /* compression statistics since the beginning of the period */
     /* amount of count that no free thread to compress data */
     uint64_t compress_thread_busy_prev;
@@ -683,11 +684,10 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  * @current_addr: addr of the page
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
- * @last_stage: if we are at the completion stage
  */
 static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
                             ram_addr_t current_addr, RAMBlock *block,
-                            ram_addr_t offset, bool last_stage)
+                            ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
@@ -695,7 +695,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     if (!cache_is_cached(XBZRLE.cache, current_addr,
                          ram_counters.dirty_sync_count)) {
         xbzrle_counters.cache_miss++;
-        if (!last_stage) {
+        if (!rs->last_stage) {
             if (cache_insert(XBZRLE.cache, current_addr, *current_data,
                              ram_counters.dirty_sync_count) == -1) {
                 return -1;
@@ -734,7 +734,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
      * Update the cache contents, so that it corresponds to the data
      * sent, in all cases except where we skip the page.
      */
-    if (!last_stage && encoded_len != 0) {
+    if (!rs->last_stage && encoded_len != 0) {
         memcpy(prev_cached_page, XBZRLE.current_buf, TARGET_PAGE_SIZE);
         /*
          * In the case where we couldn't compress, ensure that the caller
@@ -1290,9 +1290,8 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
  * @rs: current RAM state
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
- * @last_stage: if we are at the completion stage
  */
-static int ram_save_page(RAMState *rs, PageSearchStatus *pss, bool last_stage)
+static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 {
     int pages = -1;
     uint8_t *p;
@@ -1307,8 +1306,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss, bool last_stage)
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
         pages = save_xbzrle_page(rs, &p, current_addr, block,
-                                 offset, last_stage);
-        if (!last_stage) {
+                                 offset);
+        if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
              * might get updated before it gets to the wire
              */
@@ -2129,10 +2128,8 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
  *
  * @rs: current RAM state
  * @pss: data about the page we want to send
- * @last_stage: if we are at the completion stage
  */
-static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
-                                bool last_stage)
+static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock *block = pss->block;
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
@@ -2171,7 +2168,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
         return ram_save_multifd_page(rs, block, offset);
     }
 
-    return ram_save_page(rs, pss, last_stage);
+    return ram_save_page(rs, pss);
 }
 
 /**
@@ -2190,10 +2187,8 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
  * @rs: current RAM state
  * @ms: current migration state
  * @pss: data about the page we want to send
- * @last_stage: if we are at the completion stage
  */
-static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
-                              bool last_stage)
+static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
     int tmppages, pages = 0;
     size_t pagesize_bits =
@@ -2211,7 +2206,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     do {
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss, last_stage);
+            tmppages = ram_save_target_page(rs, pss);
             if (tmppages < 0) {
                 return tmppages;
             }
@@ -2245,13 +2240,11 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
  * or negative on error
  *
  * @rs: current RAM state
- * @last_stage: if we are at the completion stage
  *
  * On systems where host-page-size > target-page-size it will send all the
  * pages in a host page that are dirty.
  */
-
-static int ram_find_and_save_block(RAMState *rs, bool last_stage)
+static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus pss;
     int pages = 0;
@@ -2280,7 +2273,7 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         }
 
         if (found) {
-            pages = ram_save_host_page(rs, &pss, last_stage);
+            pages = ram_save_host_page(rs, &pss);
         }
     } while (!pages && again);
 
@@ -3080,7 +3073,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
                 break;
             }
 
-            pages = ram_find_and_save_block(rs, false);
+            pages = ram_find_and_save_block(rs);
             /* no more pages to sent */
             if (pages == 0) {
                 done = 1;
@@ -3160,6 +3153,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     RAMState *rs = *temp;
     int ret = 0;
 
+    rs->last_stage = !migration_in_colo_state();
+
     WITH_RCU_READ_LOCK_GUARD() {
         if (!migration_in_postcopy()) {
             migration_bitmap_sync_precopy(rs);
@@ -3173,7 +3168,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         while (true) {
             int pages;
 
-            pages = ram_find_and_save_block(rs, !migration_in_colo_state());
+            pages = ram_find_and_save_block(rs);
             /* no more blocks to sent */
             if (pages == 0) {
                 break;
-- 
2.34.1


