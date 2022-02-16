Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A844B80C3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:36:36 +0100 (CET)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDvX-0003y2-MG
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoC-00044U-Vs
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoA-0006DZ-GV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BnfTLYqettLbQaODOhQ1y2yM9f2SmYaiz0SiZ+kAfI=;
 b=KX63br9a8rF14uC45QB0H87jH3rGPf9RCZPHB/KO+3Bh0voB7qWVh+76Rk5i+zx8Cq8pBw
 Zp0Y6SHLGMuxZYmdDX5+Hi3VknzzR+tMqMDhlAZib6hq3azzuPUdnECrkzsWzQVkUxcYg8
 DQbwXIu+0bJ6jTqWsLo1WUhAL10z0CM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-84RfrLFkNr-q2CP5BPP_GA-1; Wed, 16 Feb 2022 01:28:56 -0500
X-MC-Unique: 84RfrLFkNr-q2CP5BPP_GA-1
Received: by mail-pg1-f198.google.com with SMTP id
 t18-20020a63dd12000000b00342725203b5so728736pgg.16
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BnfTLYqettLbQaODOhQ1y2yM9f2SmYaiz0SiZ+kAfI=;
 b=c7rrnb2a4oq6FBj/BoEkCxXddphtczMSKHuTxVDo/8POJAYdVnZ9OWhM2RhoKVNrti
 wCriIu/3+pE/jhjcuTcA3FUAINJ9VQk3Ld9ZINhrz5XOTdz0sQDlyYRV33QoSGyhZO21
 J6bc0ZrJBsVbLANHG1vQ5Z3vLqa20chi+cUYWFjYyRuaDXhXOUOlfrLx5fl95lQn9LLk
 19VmJhWDbEygElUWKFOgVPk52MdUN9xzcK84Y40Wsv9uYOaBYBDz4w6+vpbrX6f6EZsH
 f19wIPlAHsgaPH3M5muBAkPNUQsNdjiVvXVqVzsXBPOdQblxTCIMgqCrEbai4uVKgrR8
 gDaA==
X-Gm-Message-State: AOAM530cmeJ8HhKvj8Hr6+JeEPiC1AysI7Mj79qapkLigDge2JrytVnD
 x8nnWSnJdMIELD57HDfdLqa63LfHdBFYOuVjEahNGMAolCCQBNtNkdvlA+DY73IVm79TZE3VVXb
 Fb+KeTfXaJlEJkvQSg0XKntrTKF7Puy/CxZM8O38dcna7xQ+g04jdERA9Y0kmv4gl
X-Received: by 2002:a17:903:1210:b0:14e:e194:2f2c with SMTP id
 l16-20020a170903121000b0014ee1942f2cmr1135334plh.130.1644992935349; 
 Tue, 15 Feb 2022 22:28:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9HrPjDhUesZEH+ATs0zbLy911bdBG/Coj9rI1oRRYmZkIPdr34PvsozikSzOF0wSj6kawFA==
X-Received: by 2002:a17:903:1210:b0:14e:e194:2f2c with SMTP id
 l16-20020a170903121000b0014ee1942f2cmr1135296plh.130.1644992934741; 
 Tue, 15 Feb 2022 22:28:54 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.28.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:28:54 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] migration: Introduce postcopy channels on dest node
Date: Wed, 16 Feb 2022 14:27:53 +0800
Message-Id: <20220216062809.57179-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Postcopy handles huge pages in a special way that currently we can only have
one "channel" to transfer the page.

It's because when we install pages using UFFDIO_COPY, we need to have the whole
huge page ready, it also means we need to have a temp huge page when trying to
receive the whole content of the page.

Currently all maintainance around this tmp page is global: firstly we'll
allocate a temp huge page, then we maintain its status mostly within
ram_load_postcopy().

To enable multiple channels for postcopy, the first thing we need to do is to
prepare N temp huge pages as caching, one for each channel.

Meanwhile we need to maintain the tmp huge page status per-channel too.

To give some example, some local variables maintained in ram_load_postcopy()
are listed; they are responsible for maintaining temp huge page status:

  - all_zero:     this keeps whether this huge page contains all zeros
  - target_pages: this counts how many target pages have been copied
  - host_page:    this keeps the host ptr for the page to install

Move all these fields to be together with the temp huge pages to form a new
structure called PostcopyTmpPage.  Then for each (future) postcopy channel, we
need one structure to keep the state around.

For vanilla postcopy, obviously there's only one channel.  It contains both
precopy and postcopy pages.

This patch teaches the dest migration node to start realize the possible number
of postcopy channels by introducing the "postcopy_channels" variable.  Its
value is calculated when setup postcopy on dest node (during POSTCOPY_LISTEN
phase).

Vanilla postcopy will have channels=1, but when postcopy-preempt capability is
enabled (in the future), we will boost it to 2 because even during partial
sending of a precopy huge page we still want to preempt it and start sending
the postcopy requested page right away (so we start to keep two temp huge
pages; more if we want to enable multifd).  In this patch there's a TODO marked
for that; so far the channels is always set to 1.

We need to send one "host huge page" on one channel only and we cannot split
them, because otherwise the data upon the same huge page can locate on more
than one channel so we need more complicated logic to manage.  One temp host
huge page for each channel will be enough for us for now.

Postcopy will still always use the index=0 huge page even after this patch.
However it prepares for the latter patches where it can start to use multiple
channels (which needs src intervention, because only src knows which channel we
should use).

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.h    | 36 +++++++++++++++++++++++-
 migration/postcopy-ram.c | 60 ++++++++++++++++++++++++++++++----------
 migration/ram.c          | 43 ++++++++++++++--------------
 migration/savevm.c       | 12 ++++++++
 4 files changed, 113 insertions(+), 38 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 8130b703eb..42c7395094 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -45,6 +45,24 @@ struct PostcopyBlocktimeContext;
  */
 #define CLEAR_BITMAP_SHIFT_MAX            31
 
+/* This is an abstraction of a "temp huge page" for postcopy's purpose */
+typedef struct {
+    /*
+     * This points to a temporary huge page as a buffer for UFFDIO_COPY.  It's
+     * mmap()ed and needs to be freed when cleanup.
+     */
+    void *tmp_huge_page;
+    /*
+     * This points to the host page we're going to install for this temp page.
+     * It tells us after we've received the whole page, where we should put it.
+     */
+    void *host_addr;
+    /* Number of small pages copied (in size of TARGET_PAGE_SIZE) */
+    unsigned int target_pages;
+    /* Whether this page contains all zeros */
+    bool all_zero;
+} PostcopyTmpPage;
+
 /* State for the incoming migration */
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
@@ -81,7 +99,22 @@ struct MigrationIncomingState {
     QemuMutex rp_mutex;    /* We send replies from multiple threads */
     /* RAMBlock of last request sent to source */
     RAMBlock *last_rb;
-    void     *postcopy_tmp_page;
+    /*
+     * Number of postcopy channels including the default precopy channel, so
+     * vanilla postcopy will only contain one channel which contain both
+     * precopy and postcopy streams.
+     *
+     * This is calculated when the src requests to enable postcopy but before
+     * it starts.  Its value can depend on e.g. whether postcopy preemption is
+     * enabled.
+     */
+    unsigned int postcopy_channels;
+    /*
+     * An array of temp host huge pages to be used, one for each postcopy
+     * channel.
+     */
+    PostcopyTmpPage *postcopy_tmp_pages;
+    /* This is shared for all postcopy channels */
     void     *postcopy_tmp_zero_page;
     /* PostCopyFD's for external userfaultfds & handlers of shared memory */
     GArray   *postcopy_remote_fds;
@@ -391,5 +424,6 @@ bool migration_rate_limit(void);
 void migration_cancel(const Error *error);
 
 void populate_vfio_info(MigrationInfo *info);
+void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
 #endif
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e662dd05cc..315f784965 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -525,9 +525,18 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
 
 static void postcopy_temp_pages_cleanup(MigrationIncomingState *mis)
 {
-    if (mis->postcopy_tmp_page) {
-        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
-        mis->postcopy_tmp_page = NULL;
+    int i;
+
+    if (mis->postcopy_tmp_pages) {
+        for (i = 0; i < mis->postcopy_channels; i++) {
+            if (mis->postcopy_tmp_pages[i].tmp_huge_page) {
+                munmap(mis->postcopy_tmp_pages[i].tmp_huge_page,
+                       mis->largest_page_size);
+                mis->postcopy_tmp_pages[i].tmp_huge_page = NULL;
+            }
+        }
+        g_free(mis->postcopy_tmp_pages);
+        mis->postcopy_tmp_pages = NULL;
     }
 
     if (mis->postcopy_tmp_zero_page) {
@@ -1091,17 +1100,30 @@ retry:
 
 static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
 {
-    int err;
-
-    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
-                                  PROT_READ | PROT_WRITE,
-                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-    if (mis->postcopy_tmp_page == MAP_FAILED) {
-        err = errno;
-        mis->postcopy_tmp_page = NULL;
-        error_report("%s: Failed to map postcopy_tmp_page %s",
-                     __func__, strerror(err));
-        return -err;
+    PostcopyTmpPage *tmp_page;
+    int err, i, channels;
+    void *temp_page;
+
+    /* TODO: will be boosted when enable postcopy preemption */
+    mis->postcopy_channels = 1;
+
+    channels = mis->postcopy_channels;
+    mis->postcopy_tmp_pages = g_malloc0_n(sizeof(PostcopyTmpPage), channels);
+
+    for (i = 0; i < channels; i++) {
+        tmp_page = &mis->postcopy_tmp_pages[i];
+        temp_page = mmap(NULL, mis->largest_page_size, PROT_READ | PROT_WRITE,
+                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        if (temp_page == MAP_FAILED) {
+            err = errno;
+            error_report("%s: Failed to map postcopy_tmp_pages[%d]: %s",
+                         __func__, i, strerror(err));
+            /* Clean up will be done later */
+            return -err;
+        }
+        tmp_page->tmp_huge_page = temp_page;
+        /* Initialize default states for each tmp page */
+        postcopy_temp_page_reset(tmp_page);
     }
 
     /*
@@ -1351,6 +1373,16 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
 #endif
 
 /* ------------------------------------------------------------------------- */
+void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page)
+{
+    tmp_page->target_pages = 0;
+    tmp_page->host_addr = NULL;
+    /*
+     * This is set to true when reset, and cleared as long as we received any
+     * of the non-zero small page within this huge page.
+     */
+    tmp_page->all_zero = true;
+}
 
 void postcopy_fault_thread_notify(MigrationIncomingState *mis)
 {
diff --git a/migration/ram.c b/migration/ram.c
index 91ca743ac8..36b0a53afe 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3640,11 +3640,8 @@ static int ram_load_postcopy(QEMUFile *f)
     bool place_needed = false;
     bool matches_target_page_size = false;
     MigrationIncomingState *mis = migration_incoming_get_current();
-    /* Temporary page that is later 'placed' */
-    void *postcopy_host_page = mis->postcopy_tmp_page;
-    void *host_page = NULL;
-    bool all_zero = true;
-    int target_pages = 0;
+    /* Currently we only use channel 0.  TODO: use all the channels */
+    PostcopyTmpPage *tmp_page = &mis->postcopy_tmp_pages[0];
 
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
@@ -3688,7 +3685,7 @@ static int ram_load_postcopy(QEMUFile *f)
                 ret = -EINVAL;
                 break;
             }
-            target_pages++;
+            tmp_page->target_pages++;
             matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;
             /*
              * Postcopy requires that we place whole host pages atomically;
@@ -3700,15 +3697,16 @@ static int ram_load_postcopy(QEMUFile *f)
              * however the source ensures it always sends all the components
              * of a host page in one chunk.
              */
-            page_buffer = postcopy_host_page +
+            page_buffer = tmp_page->tmp_huge_page +
                           host_page_offset_from_ram_block_offset(block, addr);
             /* If all TP are zero then we can optimise the place */
-            if (target_pages == 1) {
-                host_page = host_page_from_ram_block_offset(block, addr);
-            } else if (host_page != host_page_from_ram_block_offset(block,
-                                                                    addr)) {
+            if (tmp_page->target_pages == 1) {
+                tmp_page->host_addr =
+                    host_page_from_ram_block_offset(block, addr);
+            } else if (tmp_page->host_addr !=
+                       host_page_from_ram_block_offset(block, addr)) {
                 /* not the 1st TP within the HP */
-                error_report("Non-same host page %p/%p", host_page,
+                error_report("Non-same host page %p/%p", tmp_page->host_addr,
                              host_page_from_ram_block_offset(block, addr));
                 ret = -EINVAL;
                 break;
@@ -3718,10 +3716,11 @@ static int ram_load_postcopy(QEMUFile *f)
              * If it's the last part of a host page then we place the host
              * page
              */
-            if (target_pages == (block->page_size / TARGET_PAGE_SIZE)) {
+            if (tmp_page->target_pages ==
+                (block->page_size / TARGET_PAGE_SIZE)) {
                 place_needed = true;
             }
-            place_source = postcopy_host_page;
+            place_source = tmp_page->tmp_huge_page;
         }
 
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
@@ -3735,12 +3734,12 @@ static int ram_load_postcopy(QEMUFile *f)
                 memset(page_buffer, ch, TARGET_PAGE_SIZE);
             }
             if (ch) {
-                all_zero = false;
+                tmp_page->all_zero = false;
             }
             break;
 
         case RAM_SAVE_FLAG_PAGE:
-            all_zero = false;
+            tmp_page->all_zero = false;
             if (!matches_target_page_size) {
                 /* For huge pages, we always use temporary buffer */
                 qemu_get_buffer(f, page_buffer, TARGET_PAGE_SIZE);
@@ -3758,7 +3757,7 @@ static int ram_load_postcopy(QEMUFile *f)
             }
             break;
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-            all_zero = false;
+            tmp_page->all_zero = false;
             len = qemu_get_be32(f);
             if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
                 error_report("Invalid compressed data length: %d", len);
@@ -3790,16 +3789,14 @@ static int ram_load_postcopy(QEMUFile *f)
         }
 
         if (!ret && place_needed) {
-            if (all_zero) {
-                ret = postcopy_place_page_zero(mis, host_page, block);
+            if (tmp_page->all_zero) {
+                ret = postcopy_place_page_zero(mis, tmp_page->host_addr, block);
             } else {
-                ret = postcopy_place_page(mis, host_page, place_source,
+                ret = postcopy_place_page(mis, tmp_page->host_addr, place_source,
                                           block);
             }
             place_needed = false;
-            target_pages = 0;
-            /* Assume we have a zero page until we detect something different */
-            all_zero = true;
+            postcopy_temp_page_reset(tmp_page);
         }
     }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 41e3238798..0ccd7e5e3f 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2579,6 +2579,18 @@ void qemu_loadvm_state_cleanup(void)
 /* Return true if we should continue the migration, or false. */
 static bool postcopy_pause_incoming(MigrationIncomingState *mis)
 {
+    int i;
+
+    /*
+     * If network is interrupted, any temp page we received will be useless
+     * because we didn't mark them as "received" in receivedmap.  After a
+     * proper recovery later (which will sync src dirty bitmap with receivedmap
+     * on dest) these cached small pages will be resent again.
+     */
+    for (i = 0; i < mis->postcopy_channels; i++) {
+        postcopy_temp_page_reset(&mis->postcopy_tmp_pages[i]);
+    }
+
     trace_postcopy_pause_incoming();
 
     assert(migrate_postcopy_ram());
-- 
2.32.0


