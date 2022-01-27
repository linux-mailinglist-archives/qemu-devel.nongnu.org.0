Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D157349E77C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:28:43 +0100 (CET)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7da-0007js-VJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6YL-0004zP-HU
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6YI-0003jv-FE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXI6MpsEynOrVbApTNRU23ZTCAnXWnWLNK0+MEwOlaI=;
 b=BQqV6LnlD1dowG0jT8UULI0q5AwKW9gHaLCUqSQjh6tLJD+Cenv+YRR9e8+pjC2BsSaj0J
 s9+Ur75UpxfssR/lQJbByZ7MwxY6ZIZoo/+pKmcphClDrHmT53did+/FZVd9Hnwtf60tRG
 jmiZa1GFU0KrhCRoU96jqjVe0oC5VZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-yJibaR4nN-C_srNQYJQA-A-1; Thu, 27 Jan 2022 10:19:06 -0500
X-MC-Unique: yJibaR4nN-C_srNQYJQA-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 991421091DA3;
 Thu, 27 Jan 2022 15:19:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD1B072FA2;
 Thu, 27 Jan 2022 15:17:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/38] migration: Introduce ram_transferred_add()
Date: Thu, 27 Jan 2022 16:05:42 +0100
Message-Id: <20220127150548.20595-33-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Replace direct manipulation of ram_counters.transferred with a
function.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1771bbdb02..619a1d9a6b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -387,6 +387,11 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
+static void ram_transferred_add(uint64_t bytes)
+{
+    ram_counters.transferred += bytes;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
@@ -767,7 +772,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
      * RAM_SAVE_FLAG_CONTINUE.
      */
     xbzrle_counters.bytes += bytes_xbzrle - 8;
-    ram_counters.transferred += bytes_xbzrle;
+    ram_transferred_add(bytes_xbzrle);
 
     return 1;
 }
@@ -1208,7 +1213,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
 
     if (len) {
         ram_counters.duplicate++;
-        ram_counters.transferred += len;
+        ram_transferred_add(len);
         return 1;
     }
     return -1;
@@ -1235,7 +1240,7 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
 
     if (bytes_xmit) {
-        ram_counters.transferred += bytes_xmit;
+        ram_transferred_add(bytes_xmit);
         *pages = 1;
     }
 
@@ -1266,8 +1271,8 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
 static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
                             uint8_t *buf, bool async)
 {
-    ram_counters.transferred += save_page_header(rs, rs->f, block,
-                                                 offset | RAM_SAVE_FLAG_PAGE);
+    ram_transferred_add(save_page_header(rs, rs->f, block,
+                                         offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
                               migrate_release_ram() &
@@ -1275,7 +1280,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     } else {
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
     }
-    ram_counters.transferred += TARGET_PAGE_SIZE;
+    ram_transferred_add(TARGET_PAGE_SIZE);
     ram_counters.normal++;
     return 1;
 }
@@ -1367,7 +1372,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void
 update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 {
-    ram_counters.transferred += bytes_xmit;
+    ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
         ram_counters.duplicate++;
@@ -2284,7 +2289,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
         ram_counters.duplicate += pages;
     } else {
         ram_counters.normal += pages;
-        ram_counters.transferred += size;
+        ram_transferred_add(size);
         qemu_update_position(f, size);
     }
 }
@@ -3040,7 +3045,7 @@ out:
         multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
-        ram_counters.transferred += 8;
+        ram_transferred_add(8);
 
         ret = qemu_file_get_error(f);
     }
-- 
2.34.1


