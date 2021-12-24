Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702247EC7C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:07:50 +0100 (CET)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0eg9-0004mT-7K
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePO-0001Ew-SS
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePN-0005qt-5y
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwMIb7HX3Rilfemmu/NF48gq/klN+qs16FNWRwHcUuw=;
 b=jE106rajmPyn4Xd+YPzVCPCFp0Koce39FgsKMnQAztdNZmX/c0hUGEBiNM+lbpu5VwULey
 5uDin8p/iL4tfMAkiRIOJMPy0/Bj15E/K0uchlvkqz+MyJLQWK8+mJKAGJP7E7YE5N3qB5
 Au1zwe+NVbKIpD1RSwARDQ7VinV9MRA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-SDp_yFpbN5iKsk8drumz2Q-1; Fri, 24 Dec 2021 01:50:27 -0500
X-MC-Unique: SDp_yFpbN5iKsk8drumz2Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 t30-20020adfa2de000000b001a24004e1fbso1461146wra.10
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwMIb7HX3Rilfemmu/NF48gq/klN+qs16FNWRwHcUuw=;
 b=sg7bzUAhv3SAsVyGPH2jnYUBncBVsmySbZbg5N7qyMPlQZxPQ2lOX7kJlODtUiinIG
 9MSbYaot+j78FmpgffGugCfs+fXkqprBWnMQbwi2ud95VaEYvyx6O/mdFNpoKRbWrRRi
 weL/I02dOd1WaGcF8sSjTiek/YzUM68traMKVi4MnyST3UcmqAQ8ogn4WABe6SSJj3/F
 gPMqvs1KvxfQyQpMX+HB0RfPwVdBSD6OUVAE+Qj/UkY5pUmVdDWZ8exDu5jM6RAhap61
 EaRIes0NrXa3GnZ5rD+AixPcbU2dLy9ozpModhTCDaai0ekMA6+ibBjJB8x8UBWhAgvE
 /e4g==
X-Gm-Message-State: AOAM533bnMm4tQCCSZT98sZRhA0wVebmDDLcYgPZoI2MTg2j55OHUSFx
 C1la5I5+bA9HO/igmmatJYxhGUkbXcdh2ItT3yPqRzubjtTy/IM3mNQTkoulRgH5GPqXXRJeHjj
 XAn/KyER4EJ0zMk4lYd5Fn7Gka7/vdOYWqh+S74zKjd4nDF1ABvPPg8fcNZbnrxCj
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr3748350wrs.579.1640328626016; 
 Thu, 23 Dec 2021 22:50:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhd2m1GxQJCGyY2VEDWMw5iI8DrgmLVOzVE7lOZjJHQw1q2EIghGpEgRl9hqzABlBAo1CaHA==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr3748332wrs.579.1640328625758; 
 Thu, 23 Dec 2021 22:50:25 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:25 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] migration: Drop return code for disgard ram process
Date: Fri, 24 Dec 2021 14:49:57 +0800
Message-Id: <20211224065000.97572-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224065000.97572-1-peterx@redhat.com>
References: <20211224065000.97572-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
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
index 0652165610..252ce1eaec 100644
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


