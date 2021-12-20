Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE547B1D6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:06:39 +0100 (CET)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzM7S-0003Wi-8v
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQR-0001y0-B6
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQG-0006Id-CA
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZYsCQpjeEG9tGgHYJCXcDdGhjCJacpRXo7DIarhcFM=;
 b=JaWHtMdtcz8sYtmIwYl4PDT/6R/WtEETc2exOhnzaoNMtxV+y03fIARNNTuPJJsMFaKGaS
 9OfLQagyyJWiC6aw2BDlzCWgklkwlZQDgaWUVuhMuZNaH1YShXlR8lYOIOLE4XGd1g5zyT
 1IQOcbW/drUo4zafL33Y/FygPF1oY+o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-TBPFK3wFPDGFKBH_69ScYQ-1; Mon, 20 Dec 2021 03:54:34 -0500
X-MC-Unique: TBPFK3wFPDGFKBH_69ScYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso6148627wme.8
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZYsCQpjeEG9tGgHYJCXcDdGhjCJacpRXo7DIarhcFM=;
 b=eFLcbv6cwhP+vmc/JgJjNy5mOGXxIxfPCod7mrwQlHU7tTBPjz96J3tFxI/PiN3B3V
 ZGkGWb2is0kAXDH+gwn63LPAySfMH85mCG1r6qAzot9k5Rf6IbGTW8WJqZWOz+DEIYta
 TeN1Xc5vKviLc2GkCAwDen3iXQ28Xrq0HecyMFCYrTUgGgb7l7EN0PPJEopDTH3ybCP1
 JsANFmP52bl0M4S9etBZmnrjBHbyYc6TUtu4TFn6mDReqTASCl9t573PkufaFQfenX1l
 1gLMaMUwu6XTzQi0YJJvIlBibB/D7IbUbHZifLtzPhdqqBG50E2gzMM7pbVFDF06wuqU
 rlCA==
X-Gm-Message-State: AOAM532QlqFBn6IWWpEslqCncJB1u9MgwIs8fwi2VXy6xtlZz0fICwC8
 0sXZZiHm10NyRiZk2LHSdK0YEdtFnaUp2DjbFVzlC1qcdmf675PFVqd9Dg/IGHYuBelfJutMEPK
 NofO6KoqD88l/1dlYf9GhesZocu/bxNTvERADt46H6ebbwHSjs9qiJFom6sRgKkls
X-Received: by 2002:a7b:c007:: with SMTP id c7mr20160156wmb.82.1639990471382; 
 Mon, 20 Dec 2021 00:54:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE6qb+1KboeOeXFZ+RwPE5cBIOcp3hfULEWGbDgqRiJv7iOf29H5AA4ZqZ6gQ9xrlseL9qKA==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr20160130wmb.82.1639990470988; 
 Mon, 20 Dec 2021 00:54:30 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:30 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] migration: Drop return code for disgard ram process
Date: Mon, 20 Dec 2021 16:53:52 +0800
Message-Id: <20211220085355.2284-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220085355.2284-1-peterx@redhat.com>
References: <20211220085355.2284-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will just never fail.  Drop those return values where they're constantly
zeros.

A tiny touch-up on the tracepoint so trace_ram_postcopy_send_discard_bitmap()
is called after the logic itself (which sounds more reasonable).

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c |  5 +----
 migration/ram.c       | 20 +++++---------------
 migration/ram.h       |  2 +-
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae921..beeb162a1a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2990,10 +2990,7 @@ static int postcopy_start(MigrationState *ms)
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
index e7107b9790..5234d1ece1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2473,8 +2473,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
- * Returns 0 for success or negative for error
- *
  * Utility for the outgoing postcopy code.
  *   Calls postcopy_send_discard_bm_ram for each RAMBlock
  *   passing it bitmap indexes and name.
@@ -2483,10 +2481,9 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
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
@@ -2504,14 +2501,9 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
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
@@ -2584,8 +2576,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 /**
  * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
  *
- * Returns zero on success
- *
  * Transmit the set of pages to be discarded after precopy to the target
  * these are pages that:
  *     a) Have been previously transmitted but are now dirty again
@@ -2596,7 +2586,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
  *
  * @ms: current migration state
  */
-int ram_postcopy_send_discard_bitmap(MigrationState *ms)
+void ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
 
@@ -2610,9 +2600,9 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
-    trace_ram_postcopy_send_discard_bitmap();
+    postcopy_each_ram_send_discard(ms);
 
-    return postcopy_each_ram_send_discard(ms);
+    trace_ram_postcopy_send_discard_bitmap();
 }
 
 /**
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
-- 
2.32.0


