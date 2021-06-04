Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5B39B6D7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:13:11 +0200 (CEST)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp6pC-0005AL-BM
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp6kL-00031A-Lw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp6kF-0003Qg-Jm
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622801283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KE9EZOzG7K1AbTxcu89JOVMRmHUA6g5SwXnOgv3Q//c=;
 b=dVcbiohEoBgSr/7U6fKKN1iPAjy/pZnQX6jBh5N3OnB7AD2kFqwIWMPnv3Don5Q/ZXydCn
 1oQu/ZXcFz3PTHxBRxYmy9IYzbGDFDmzzwP5DYYcbvNfpNi+ggaNulG2iTnlUKYjC4fIk8
 talKa1P/0kkVPbyZe0Drfg6bhwpQK4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-NWXOT6x6OPmajPqeA2G1Dw-1; Fri, 04 Jun 2021 06:07:59 -0400
X-MC-Unique: NWXOT6x6OPmajPqeA2G1Dw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A91BC801107;
 Fri,  4 Jun 2021 10:07:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-43.ams2.redhat.com
 [10.36.115.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A068E5D74B;
 Fri,  4 Jun 2021 10:07:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 6/6] blkdebug: protect rules and suspended_reqs with a lock
Date: Fri,  4 Jun 2021 12:07:41 +0200
Message-Id: <20210604100741.18966-7-eesposit@redhat.com>
In-Reply-To: <20210604100741.18966-1-eesposit@redhat.com>
References: <20210604100741.18966-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, categorize the structure fields to identify what needs
to be protected and what doesn't.

We essentially need to protect only .state, and the 3 lists in
BDRVBlkdebugState.

Then, add the lock and mark the functions accordingly.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index d597753139..ac3799f739 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -38,24 +38,27 @@
 #include "qapi/qobject-input-visitor.h"
 #include "sysemu/qtest.h"
 
+/* All APIs are thread-safe */
+
 typedef struct BDRVBlkdebugState {
-    int state;
+    /* IN: initialized in blkdebug_open() and never changed */
     uint64_t align;
     uint64_t max_transfer;
     uint64_t opt_write_zero;
     uint64_t max_write_zero;
     uint64_t opt_discard;
     uint64_t max_discard;
-
+    char *config_file; /* For blkdebug_refresh_filename() */
+    /* initialized in blkdebug_parse_perms() */
     uint64_t take_child_perms;
     uint64_t unshare_child_perms;
 
-    /* For blkdebug_refresh_filename() */
-    char *config_file;
-
+    /* State. Protected by lock */
+    int state;
     QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
     QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
     QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
+    QemuMutex lock;
 } BDRVBlkdebugState;
 
 typedef struct BlkdebugAIOCB {
@@ -64,6 +67,7 @@ typedef struct BlkdebugAIOCB {
 } BlkdebugAIOCB;
 
 typedef struct BlkdebugSuspendedReq {
+    /* IN: initialized in suspend_request() */
     Coroutine *co;
     char *tag;
     QLIST_ENTRY(BlkdebugSuspendedReq) next;
@@ -77,6 +81,7 @@ enum {
 };
 
 typedef struct BlkdebugRule {
+    /* IN: initialized in add_rule() or blkdebug_debug_breakpoint() */
     BlkdebugEvent event;
     int action;
     int state;
@@ -244,11 +249,14 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
     };
 
     /* Add the rule */
+    qemu_mutex_lock(&s->lock);
     QLIST_INSERT_HEAD(&s->rules[event], rule, next);
+    qemu_mutex_unlock(&s->lock);
 
     return 0;
 }
 
+/* Called with lock held or from .bdrv_close */
 static void remove_rule(BlkdebugRule *rule)
 {
     switch (rule->action) {
@@ -467,6 +475,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     uint64_t align;
 
+    qemu_mutex_init(&s->lock);
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         ret = -EINVAL;
@@ -567,6 +576,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     ret = 0;
 out:
     if (ret < 0) {
+        qemu_mutex_destroy(&s->lock);
         g_free(s->config_file);
     }
     qemu_opts_del(opts);
@@ -581,6 +591,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     int error;
     bool immediately;
 
+    qemu_mutex_lock(&s->lock);
     QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
         uint64_t inject_offset = rule->options.inject.offset;
 
@@ -594,6 +605,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     }
 
     if (!rule || !rule->options.inject.error) {
+        qemu_mutex_unlock(&s->lock);
         return 0;
     }
 
@@ -605,6 +617,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         remove_rule(rule);
     }
 
+    qemu_mutex_unlock(&s->lock);
     if (!immediately) {
         aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
         qemu_coroutine_yield();
@@ -770,8 +783,10 @@ static void blkdebug_close(BlockDriverState *bs)
     }
 
     g_free(s->config_file);
+    qemu_mutex_destroy(&s->lock);
 }
 
+/* Called with lock held.  */
 static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
@@ -790,6 +805,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
     }
 }
 
+/* Called with lock held.  */
 static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
                          int *action_count, int *new_state)
 {
@@ -830,17 +846,18 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
     assert((int)event >= 0 && event < BLKDBG__MAX);
 
-    new_state = s->state;
-    QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
-        process_rule(bs, rule, actions_count, &new_state);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        new_state = s->state;
+        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
+            process_rule(bs, rule, actions_count, &new_state);
+        }
+        s->state = new_state;
     }
 
     while (actions_count[ACTION_SUSPEND] > 0) {
         qemu_coroutine_yield();
         actions_count[ACTION_SUSPEND]--;
     }
-
-    s->state = new_state;
 }
 
 static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
@@ -863,11 +880,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
         .options.suspend.tag = g_strdup(tag),
     };
 
+    qemu_mutex_lock(&s->lock);
     QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
+    qemu_mutex_unlock(&s->lock);
 
     return 0;
 }
 
+/* Called with lock held. May temporarily release lock. */
 static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
 {
     BlkdebugSuspendedReq *r;
@@ -885,7 +905,9 @@ retry:
             g_free(r->tag);
             g_free(r);
 
+            qemu_mutex_unlock(&s->lock);
             qemu_coroutine_enter(co);
+            qemu_mutex_lock(&s->lock);
 
             if (all) {
                 goto retry;
@@ -899,7 +921,7 @@ retry:
 static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
 {
     BDRVBlkdebugState *s = bs->opaque;
-
+    QEMU_LOCK_GUARD(&s->lock);
     return resume_req_by_tag(s, tag, false);
 }
 
@@ -910,6 +932,7 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
     BlkdebugRule *rule, *next;
     int i, ret = -ENOENT;
 
+    QEMU_LOCK_GUARD(&s->lock);
     for (i = 0; i < BLKDBG__MAX; i++) {
         QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
             if (rule->action == ACTION_SUSPEND &&
@@ -930,6 +953,7 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
 
+    QEMU_LOCK_GUARD(&s->lock);
     QLIST_FOREACH(r, &s->suspended_reqs, next) {
         if (!strcmp(r->tag, tag)) {
             return true;
-- 
2.30.2


