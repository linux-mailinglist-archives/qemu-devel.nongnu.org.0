Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C926E0123
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:46:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmiHQ-0008Nt-4u; Wed, 12 Apr 2023 17:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHN-0008NE-2r
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHK-0006d3-VR
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57ZIepROQQAFCGZsHrZ+1w8IXcpoRJewDTXcAxVlkAI=;
 b=VF4v3uayc6+Js5MQsV3vKefbjbWWv2TuduKZsAk1EZk9Jz/2nzHdFmPlCItraqMWmRU90Q
 RAzFJlP0UB3/uy0OYPmrP0/3KiMGVeHROKEGC/vH3Qmqe6tHrucctRW9W+pSpvZ/cDfef4
 DdXANNT9bSZExTiwJVx88p9rLnZyd9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-9-DKE8TIOPWZUcM3IXo91w-1; Wed, 12 Apr 2023 17:45:17 -0400
X-MC-Unique: 9-DKE8TIOPWZUcM3IXo91w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1B9F85C06C;
 Wed, 12 Apr 2023 21:45:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78C3B112132D;
 Wed, 12 Apr 2023 21:45:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 4/5] migration/ram.c: Fix migration with compress enabled
Date: Wed, 12 Apr 2023 23:45:06 +0200
Message-Id: <20230412214507.19816-5-quintela@redhat.com>
In-Reply-To: <20230412214507.19816-1-quintela@redhat.com>
References: <20230412214507.19816-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Lukas Straub <lukasstraub2@web.de>

Since ec6f3ab9, migration with compress enabled was broken, because
the compress threads use a dummy QEMUFile which just acts as a
buffer and that commit accidentally changed it to use the outgoing
migration channel instead.

Fix this by using the dummy file again in the compress threads.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..9d1817ab7b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -688,12 +688,11 @@ exit:
  * @offset: offset inside the block for the page
  *          in the lower bits, it contains flags
  */
-static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
-                               ram_addr_t offset)
+static size_t save_page_header(PageSearchStatus *pss, QEMUFile *f,
+                               RAMBlock *block, ram_addr_t offset)
 {
     size_t size, len;
     bool same_block = (block == pss->last_sent_block);
-    QEMUFile *f = pss->pss_channel;
 
     if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
@@ -867,7 +866,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
     }
 
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle = save_page_header(pss, block,
+    bytes_xbzrle = save_page_header(pss, pss->pss_channel, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
     qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
     qemu_put_be16(file, encoded_len);
@@ -1302,15 +1301,14 @@ void ram_release_page(const char *rbname, uint64_t offset)
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page_to_file(PageSearchStatus *pss,
+static int save_zero_page_to_file(PageSearchStatus *pss, QEMUFile *file,
                                   RAMBlock *block, ram_addr_t offset)
 {
     uint8_t *p = block->host + offset;
-    QEMUFile *file = pss->pss_channel;
     int len = 0;
 
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
+        len += save_page_header(pss, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
         ram_release_page(block->idstr, offset);
@@ -1327,10 +1325,10 @@ static int save_zero_page_to_file(PageSearchStatus *pss,
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
+static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *block,
                           ram_addr_t offset)
 {
-    int len = save_zero_page_to_file(pss, block, offset);
+    int len = save_zero_page_to_file(pss, f, block, offset);
 
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1394,7 +1392,7 @@ static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
 {
     QEMUFile *file = pss->pss_channel;
 
-    ram_transferred_add(save_page_header(pss, block,
+    ram_transferred_add(save_page_header(pss, pss->pss_channel, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
@@ -1473,11 +1471,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     uint8_t *p = block->host + offset;
     int ret;
 
-    if (save_zero_page_to_file(pss, block, offset)) {
+    if (save_zero_page_to_file(pss, f, block, offset)) {
         return true;
     }
 
-    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
 
     /*
      * copy it to a internal buffer to avoid it being modified by VM
@@ -2355,7 +2353,7 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
         return 1;
     }
 
-    res = save_zero_page(pss, block, offset);
+    res = save_zero_page(pss, pss->pss_channel, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
-- 
2.39.2


