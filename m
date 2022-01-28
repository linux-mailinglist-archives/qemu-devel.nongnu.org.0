Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E0A4A011E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 20:49:18 +0100 (CET)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDXFF-0002Om-D4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 14:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWAp-0001Sk-70
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWAk-0002DB-3m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gaBfMRbjowHnqRPDnBC7yhRQPALIIHNsXEKr4uCULw=;
 b=TZ7Z7mWEbNoHaRP0sQnPEFN3VN0wxbxvQyQBbIqRHMuDLo6QGOA56zf9TKDtpB45Da0MDr
 cCqVAxcV++6uCYuHwqcpVdkuO5Z+9BPNHsudkyfvi8AQIs5snaVnFhxE11CQcqB+UFfuEn
 N8dmJe9H7HmUBZIcqPzUqgZitp30ruY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-NTPAcerCPYGEMsk9lzIrUA-1; Fri, 28 Jan 2022 13:40:29 -0500
X-MC-Unique: NTPAcerCPYGEMsk9lzIrUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6296345AF;
 Fri, 28 Jan 2022 18:40:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 334D512E25;
 Fri, 28 Jan 2022 18:39:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/36] migration: Drop return code for disgard ram process
Date: Fri, 28 Jan 2022 19:30:25 +0100
Message-Id: <20220128183033.31998-29-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

It will just never fail.  Drop those return values where they're constantly
zeros.

A tiny touch-up on the tracepoint so trace_ram_postcopy_send_discard_bitmap()
is called after the logic itself (which sounds more reasonable).

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       |  2 +-
 migration/migration.c |  5 +----
 migration/ram.c       | 20 +++++---------------
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index f543e25765..2c6dc3675d 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -57,7 +57,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
 void acct_update_position(QEMUFile *f, size_t size, bool zero);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
-int ram_postcopy_send_discard_bitmap(MigrationState *ms);
+void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
 int ram_postcopy_incoming_init(MigrationIncomingState *mis);
diff --git a/migration/migration.c b/migration/migration.c
index 3849b33108..771f3e2bec 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2991,10 +2991,7 @@ static int postcopy_start(MigrationState *ms)
      * that are dirty
      */
     if (migrate_postcopy_ram()) {
-        if (ram_postcopy_send_discard_bitmap(ms)) {
-            error_report("postcopy send discard bitmap failed");
-            goto fail;
-        }
+        ram_postcopy_send_discard_bitmap(ms);
     }
 
     /*
diff --git a/migration/ram.c b/migration/ram.c
index d74a8c04b6..5489ee3b7a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2459,8 +2459,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
- * Returns 0 for success or negative for error
- *
  * Utility for the outgoing postcopy code.
  *   Calls postcopy_send_discard_bm_ram for each RAMBlock
  *   passing it bitmap indexes and name.
@@ -2469,10 +2467,9 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
  *
  * @ms: current migration state
  */
-static int postcopy_each_ram_send_discard(MigrationState *ms)
+static void postcopy_each_ram_send_discard(MigrationState *ms)
 {
     struct RAMBlock *block;
-    int ret;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         postcopy_discard_send_init(ms, block->idstr);
@@ -2490,14 +2487,9 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
          * just needs indexes at this point, avoids it having
          * target page specific code.
          */
-        ret = postcopy_send_discard_bm_ram(ms, block);
+        postcopy_send_discard_bm_ram(ms, block);
         postcopy_discard_send_finish(ms);
-        if (ret) {
-            return ret;
-        }
     }
-
-    return 0;
 }
 
 /**
@@ -2570,8 +2562,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 /**
  * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
  *
- * Returns zero on success
- *
  * Transmit the set of pages to be discarded after precopy to the target
  * these are pages that:
  *     a) Have been previously transmitted but are now dirty again
@@ -2582,7 +2572,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
  *
  * @ms: current migration state
  */
-int ram_postcopy_send_discard_bitmap(MigrationState *ms)
+void ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
 
@@ -2596,9 +2586,9 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
+    postcopy_each_ram_send_discard(ms);
+
     trace_ram_postcopy_send_discard_bitmap();
-
-    return postcopy_each_ram_send_discard(ms);
 }
 
 /**
-- 
2.34.1


