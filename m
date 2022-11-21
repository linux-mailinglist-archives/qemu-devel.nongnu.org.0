Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367963240C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6rr-0001Kg-5w; Mon, 21 Nov 2022 08:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6rI-0000hp-Fb
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:29:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6qY-00052p-JC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669037303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3OaD6EmIOQmYblQD6JDebQ+SMMGjJtWN/jwPdmSW4w=;
 b=Njp6yDjs+vBQ8Jcy5p7BgUnRMXb3XkL8oNX+8uikt2idbXdu6VsMi+IRH1Tl41/hbgtI2X
 uzy5E42vupdlmxh5DO5uuFA0Pqgo5BHHG+pRSmdnxSU4v5xNnJ2xxg+ofLegbJz6j+EHhr
 cKdlVIjM1JmyxgmZ+7kKvQ2dutPB6i4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-x5uhRCdiNJGoNkBTGzzYTw-1; Mon, 21 Nov 2022 08:28:19 -0500
X-MC-Unique: x5uhRCdiNJGoNkBTGzzYTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD080101A528;
 Mon, 21 Nov 2022 13:28:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCBE04B3FC6;
 Mon, 21 Nov 2022 13:28:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 18/19] migration: Remove old preempt code around state
 maintainance
Date: Mon, 21 Nov 2022 14:27:16 +0100
Message-Id: <20221121132717.63070-19-quintela@redhat.com>
In-Reply-To: <20221121132717.63070-1-quintela@redhat.com>
References: <20221121132717.63070-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=unavailable autolearn_force=no
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

With the new code to send pages in rp-return thread, there's little help to
keep lots of the old code on maintaining the preempt state in migration
thread, because the new way should always be faster..

Then if we'll always send pages in the rp-return thread anyway, we don't
need those logic to maintain preempt state anymore because now we serialize
things using the mutex directly instead of using those fields.

It's very unfortunate to have those code for a short period, but that's
still one intermediate step that we noticed the next bottleneck on the
migration thread.  Now what we can do best is to drop unnecessary code as
long as the new code is stable to reduce the burden.  It's actually a good
thing because the new "sending page in rp-return thread" model is (IMHO)
even cleaner and with better performance.

Remove the old code that was responsible for maintaining preempt states, at
the meantime also remove x-postcopy-preempt-break-huge parameter because
with concurrent sender threads we don't really need to break-huge anymore.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |   7 -
 migration/migration.c |   2 -
 migration/ram.c       | 291 +-----------------------------------------
 3 files changed, 3 insertions(+), 297 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaa..ae4ffd3454 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -340,13 +340,6 @@ struct MigrationState {
     bool send_configuration;
     /* Whether we send section footer during migration */
     bool send_section_footer;
-    /*
-     * Whether we allow break sending huge pages when postcopy preempt is
-     * enabled.  When disabled, we won't interrupt precopy within sending a
-     * host huge page, which is the old behavior of vanilla postcopy.
-     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
-     */
-    bool postcopy_preempt_break_huge;
 
     /* Needed by postcopy-pause state */
     QemuSemaphore postcopy_pause_sem;
diff --git a/migration/migration.c b/migration/migration.c
index c1d4d76d0c..c3490c495d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4402,8 +4402,6 @@ static Property migration_properties[] = {
     DEFINE_PROP_SIZE("announce-step", MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
-    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
-                      postcopy_preempt_break_huge, true),
     DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
     DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
     DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
diff --git a/migration/ram.c b/migration/ram.c
index 16ade7cb70..1ae093fb61 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -97,28 +97,6 @@ struct PageSearchStatus {
     unsigned long page;
     /* Set once we wrap around */
     bool         complete_round;
-    /*
-     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
-     * postcopy.  When set, the request is "urgent" because the dest QEMU
-     * threads are waiting for us.
-     */
-    bool         postcopy_requested;
-    /*
-     * [POSTCOPY-ONLY] The target channel to use to send current page.
-     *
-     * Note: This may _not_ match with the value in postcopy_requested
-     * above. Let's imagine the case where the postcopy request is exactly
-     * the page that we're sending in progress during precopy. In this case
-     * we'll have postcopy_requested set to true but the target channel
-     * will be the precopy channel (so that we don't split brain on that
-     * specific page since the precopy channel already contains partial of
-     * that page data).
-     *
-     * Besides that specific use case, postcopy_target_channel should
-     * always be equal to postcopy_requested, because by default we send
-     * postcopy pages via postcopy preempt channel.
-     */
-    bool         postcopy_target_channel;
     /* Whether we're sending a host page */
     bool          host_page_sending;
     /* The start/end of current host page.  Invalid if host_page_sending==false */
@@ -343,20 +321,6 @@ struct RAMSrcPageRequest {
     QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
 };
 
-typedef struct {
-    /*
-     * Cached ramblock/offset values if preempted.  They're only meaningful if
-     * preempted==true below.
-     */
-    RAMBlock *ram_block;
-    unsigned long ram_page;
-    /*
-     * Whether a postcopy preemption just happened.  Will be reset after
-     * precopy recovered to background migration.
-     */
-    bool preempted;
-} PostcopyPreemptState;
-
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -419,14 +383,6 @@ struct RAMState {
     /* Queue of outstanding page requests from the destination */
     QemuMutex src_page_req_mutex;
     QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
-
-    /* Postcopy preemption informations */
-    PostcopyPreemptState postcopy_preempt_state;
-    /*
-     * Current channel we're using on src VM.  Only valid if postcopy-preempt
-     * is enabled.
-     */
-    unsigned int postcopy_channel;
 };
 typedef struct RAMState RAMState;
 
@@ -434,11 +390,6 @@ static RAMState *ram_state;
 
 static NotifierWithReturnList precopy_notifier_list;
 
-static void postcopy_preempt_reset(RAMState *rs)
-{
-    memset(&rs->postcopy_preempt_state, 0, sizeof(PostcopyPreemptState));
-}
-
 /* Whether postcopy has queued requests? */
 static bool postcopy_has_request(RAMState *rs)
 {
@@ -551,9 +502,6 @@ static int ram_save_host_page_urgent(PageSearchStatus *pss);
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
-static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
-                                     bool postcopy_requested);
-
 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
 {
@@ -1612,13 +1560,6 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
-    /*
-     * This is not a postcopy requested page, mark it "not urgent", and use
-     * precopy channel to send it.
-     */
-    pss->postcopy_requested = false;
-    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
-
     /* Update pss->page for the next dirty bit in ramblock */
     pss_find_next_dirty(pss);
 
@@ -2069,55 +2010,6 @@ void ram_write_tracking_stop(void)
 }
 #endif /* defined(__linux__) */
 
-/*
- * Check whether two addr/offset of the ramblock falls onto the same host huge
- * page.  Returns true if so, false otherwise.
- */
-static bool offset_on_same_huge_page(RAMBlock *rb, uint64_t addr1,
-                                     uint64_t addr2)
-{
-    size_t page_size = qemu_ram_pagesize(rb);
-
-    addr1 = ROUND_DOWN(addr1, page_size);
-    addr2 = ROUND_DOWN(addr2, page_size);
-
-    return addr1 == addr2;
-}
-
-/*
- * Whether a previous preempted precopy huge page contains current requested
- * page?  Returns true if so, false otherwise.
- *
- * This should really happen very rarely, because it means when we were sending
- * during background migration for postcopy we're sending exactly the page that
- * some vcpu got faulted on on dest node.  When it happens, we probably don't
- * need to do much but drop the request, because we know right after we restore
- * the precopy stream it'll be serviced.  It'll slightly affect the order of
- * postcopy requests to be serviced (e.g. it'll be the same as we move current
- * request to the end of the queue) but it shouldn't be a big deal.  The most
- * imporant thing is we can _never_ try to send a partial-sent huge page on the
- * POSTCOPY channel again, otherwise that huge page will got "split brain" on
- * two channels (PRECOPY, POSTCOPY).
- */
-static bool postcopy_preempted_contains(RAMState *rs, RAMBlock *block,
-                                        ram_addr_t offset)
-{
-    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
-
-    /* No preemption at all? */
-    if (!state->preempted) {
-        return false;
-    }
-
-    /* Not even the same ramblock? */
-    if (state->ram_block != block) {
-        return false;
-    }
-
-    return offset_on_same_huge_page(block, offset,
-                                    state->ram_page << TARGET_PAGE_BITS);
-}
-
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -2157,20 +2049,7 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 
     } while (block && !dirty);
 
-    if (block) {
-        /* See comment above postcopy_preempted_contains() */
-        if (postcopy_preempted_contains(rs, block, offset)) {
-            trace_postcopy_preempt_hit(block->idstr, offset);
-            /*
-             * If what we preempted previously was exactly what we're
-             * requesting right now, restore the preempted precopy
-             * immediately, boosting its priority as it's requested by
-             * postcopy.
-             */
-            postcopy_preempt_restore(rs, pss, true);
-            return true;
-        }
-    } else {
+    if (!block) {
         /*
          * Poll write faults too if background snapshot is enabled; that's
          * when we have vcpus got blocked by the write protected pages.
@@ -2192,9 +2071,6 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
          * really rare.
          */
         pss->complete_round = false;
-        /* Mark it an urgent request, meanwhile using POSTCOPY channel */
-        pss->postcopy_requested = true;
-        pss->postcopy_target_channel = RAM_CHANNEL_POSTCOPY;
     }
 
     return !!block;
@@ -2291,7 +2167,6 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
          * we should be the only one who operates on the qemufile
          */
         pss->pss_channel = migrate_get_current()->postcopy_qemufile_src;
-        pss->postcopy_requested = true;
         assert(pss->pss_channel);
 
         /*
@@ -2439,129 +2314,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     return ram_save_page(rs, pss);
 }
 
-static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
-{
-    MigrationState *ms = migrate_get_current();
-
-    /* Not enabled eager preempt?  Then never do that. */
-    if (!migrate_postcopy_preempt()) {
-        return false;
-    }
-
-    /* If the user explicitly disabled breaking of huge page, skip */
-    if (!ms->postcopy_preempt_break_huge) {
-        return false;
-    }
-
-    /* If the ramblock we're sending is a small page?  Never bother. */
-    if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
-        return false;
-    }
-
-    /* Not in postcopy at all? */
-    if (!migration_in_postcopy()) {
-        return false;
-    }
-
-    /*
-     * If we're already handling a postcopy request, don't preempt as this page
-     * has got the same high priority.
-     */
-    if (pss->postcopy_requested) {
-        return false;
-    }
-
-    /* If there's postcopy requests, then check it up! */
-    return postcopy_has_request(rs);
-}
-
-/* Returns true if we preempted precopy, false otherwise */
-static void postcopy_do_preempt(RAMState *rs, PageSearchStatus *pss)
-{
-    PostcopyPreemptState *p_state = &rs->postcopy_preempt_state;
-
-    trace_postcopy_preempt_triggered(pss->block->idstr, pss->page);
-
-    /*
-     * Time to preempt precopy. Cache current PSS into preempt state, so that
-     * after handling the postcopy pages we can recover to it.  We need to do
-     * so because the dest VM will have partial of the precopy huge page kept
-     * over in its tmp huge page caches; better move on with it when we can.
-     */
-    p_state->ram_block = pss->block;
-    p_state->ram_page = pss->page;
-    p_state->preempted = true;
-}
-
-/* Whether we're preempted by a postcopy request during sending a huge page */
-static bool postcopy_preempt_triggered(RAMState *rs)
-{
-    return rs->postcopy_preempt_state.preempted;
-}
-
-static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
-                                     bool postcopy_requested)
-{
-    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
-
-    assert(state->preempted);
-
-    pss->block = state->ram_block;
-    pss->page = state->ram_page;
-
-    /* Whether this is a postcopy request? */
-    pss->postcopy_requested = postcopy_requested;
-    /*
-     * When restoring a preempted page, the old data resides in PRECOPY
-     * slow channel, even if postcopy_requested is set.  So always use
-     * PRECOPY channel here.
-     */
-    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
-
-    trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
-
-    /* Reset preempt state, most importantly, set preempted==false */
-    postcopy_preempt_reset(rs);
-}
-
-static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
-{
-    MigrationState *s = migrate_get_current();
-    unsigned int channel = pss->postcopy_target_channel;
-    QEMUFile *next;
-
-    if (channel != rs->postcopy_channel) {
-        if (channel == RAM_CHANNEL_PRECOPY) {
-            next = s->to_dst_file;
-        } else {
-            next = s->postcopy_qemufile_src;
-        }
-        /* Update and cache the current channel */
-        rs->f = next;
-        rs->postcopy_channel = channel;
-
-        /*
-         * If channel switched, reset last_sent_block since the old sent block
-         * may not be on the same channel.
-         */
-        pss->last_sent_block = NULL;
-
-        trace_postcopy_preempt_switch_channel(channel);
-    }
-
-    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
-}
-
-/* We need to make sure rs->f always points to the default channel elsewhere */
-static void postcopy_preempt_reset_channel(RAMState *rs)
-{
-    if (postcopy_preempt_active()) {
-        rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
-        rs->f = migrate_get_current()->to_dst_file;
-        trace_postcopy_preempt_reset_channel();
-    }
-}
-
 /* Should be called before sending a host page */
 static void pss_host_page_prepare(PageSearchStatus *pss)
 {
@@ -2688,11 +2440,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     pss_host_page_prepare(pss);
 
     do {
-        if (postcopy_needs_preempt(rs, pss)) {
-            postcopy_do_preempt(rs, pss);
-            break;
-        }
-
         page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
 
         /* Check the pages is dirty and if it is send it */
@@ -2733,19 +2480,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 
     pss_host_page_finish(pss);
 
-    /*
-     * When with postcopy preempt mode, flush the data as soon as possible for
-     * postcopy requests, because we've already sent a whole huge page, so the
-     * dst node should already have enough resource to atomically filling in
-     * the current missing page.
-     *
-     * More importantly, when using separate postcopy channel, we must do
-     * explicit flush or it won't flush until the buffer is full.
-     */
-    if (migrate_postcopy_preempt() && pss->postcopy_requested) {
-        qemu_fflush(pss->pss_channel);
-    }
-
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
 }
@@ -2793,24 +2527,11 @@ static int ram_find_and_save_block(RAMState *rs)
         found = get_queued_page(rs, pss);
 
         if (!found) {
-            /*
-             * Recover previous precopy ramblock/offset if postcopy has
-             * preempted precopy.  Otherwise find the next dirty bit.
-             */
-            if (postcopy_preempt_triggered(rs)) {
-                postcopy_preempt_restore(rs, pss, false);
-                found = true;
-            } else {
-                /* priority queue empty, so just search for something dirty */
-                found = find_dirty_block(rs, pss, &again);
-            }
+            /* priority queue empty, so just search for something dirty */
+            found = find_dirty_block(rs, pss, &again);
         }
 
         if (found) {
-            /* Update rs->f with correct channel */
-            if (postcopy_preempt_active()) {
-                postcopy_preempt_choose_channel(rs, pss);
-            }
             /* Cache rs->f in pss_channel (TODO: remove rs->f) */
             pss->pss_channel = rs->f;
             pages = ram_save_host_page(rs, pss);
@@ -2942,8 +2663,6 @@ static void ram_state_reset(RAMState *rs)
     rs->last_page = 0;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
-    postcopy_preempt_reset(rs);
-    rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
@@ -3587,8 +3306,6 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
     }
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
-    postcopy_preempt_reset_channel(rs);
-
     /*
      * Must occur before EOS (or any QEMUFile operation)
      * because of RDMA protocol.
@@ -3668,8 +3385,6 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    postcopy_preempt_reset_channel(rs);
-
     ret = multifd_send_sync_main(rs->f);
     if (ret < 0) {
         return ret;
-- 
2.38.1


