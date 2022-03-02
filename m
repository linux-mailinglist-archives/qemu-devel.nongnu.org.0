Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A54CADAA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:35:50 +0100 (CET)
Received: from localhost ([::1]:50866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTpG-0001YM-0A
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkX-0001KD-CQ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkU-0000IL-Tz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rRrpb1sDuxZy+FQkUbEtE26orkvvdoajPiaObxe81k=;
 b=IA7/fM1I2YKEeUDlwUgzjx889fOHmHaANI+Sf/WNeXGNOWNCGkqLykr4MvrB1tFvNHlz6S
 kyeaUimpc+fMPgHAwRikf+h0ZrrOaCQqIbtX095J1ogPKE3A4L+ry1ZK1ScCCrsJSeU7UI
 /LHFE8yi3q+qI+CFBchZuyuANKGwqAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-VmzQ4yl3NT-hN-ioYuQYYQ-1; Wed, 02 Mar 2022 13:30:50 -0500
X-MC-Unique: VmzQ4yl3NT-hN-ioYuQYYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF34F801DDB;
 Wed,  2 Mar 2022 18:30:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254C01059166;
 Wed,  2 Mar 2022 18:30:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 10/18] migration: Introduce postcopy channels on dest node
Date: Wed,  2 Mar 2022 18:29:28 +0000
Message-Id: <20220302182936.227719-11-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-5-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Fixed up long line
---
 migration/migration.h    | 36 +++++++++++++++++++++++-
 migration/postcopy-ram.c | 60 ++++++++++++++++++++++++++++++----------
 migration/ram.c          | 45 ++++++++++++++----------------
 migration/savevm.c       | 12 ++++++++
 4 files changed, 114 insertions(+), 39 deletions(-)

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
index 2a2cc5faf8..30c3508f44 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -526,9 +526,18 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
 
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
@@ -1092,17 +1101,30 @@ retry:
 
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
@@ -1352,6 +1374,16 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
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
index 781f0745dc..fe3de84856 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3641,11 +3641,8 @@ static int ram_load_postcopy(QEMUFile *f)
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
@@ -3689,7 +3686,7 @@ static int ram_load_postcopy(QEMUFile *f)
                 ret = -EINVAL;
                 break;
             }
-            target_pages++;
+            tmp_page->target_pages++;
             matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;
             /*
              * Postcopy requires that we place whole host pages atomically;
@@ -3701,15 +3698,16 @@ static int ram_load_postcopy(QEMUFile *f)
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
@@ -3719,10 +3717,11 @@ static int ram_load_postcopy(QEMUFile *f)
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
@@ -3736,12 +3735,12 @@ static int ram_load_postcopy(QEMUFile *f)
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
@@ -3759,7 +3758,7 @@ static int ram_load_postcopy(QEMUFile *f)
             }
             break;
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-            all_zero = false;
+            tmp_page->all_zero = false;
             len = qemu_get_be32(f);
             if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
                 error_report("Invalid compressed data length: %d", len);
@@ -3791,16 +3790,14 @@ static int ram_load_postcopy(QEMUFile *f)
         }
 
         if (!ret && place_needed) {
-            if (all_zero) {
-                ret = postcopy_place_page_zero(mis, host_page, block);
+            if (tmp_page->all_zero) {
+                ret = postcopy_place_page_zero(mis, tmp_page->host_addr, block);
             } else {
-                ret = postcopy_place_page(mis, host_page, place_source,
-                                          block);
+                ret = postcopy_place_page(mis, tmp_page->host_addr,
+                                          place_source, block);
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
2.35.1


