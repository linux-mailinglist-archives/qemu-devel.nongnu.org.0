Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A43CE8D2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:33:08 +0200 (CEST)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5X8d-0007gL-AN
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X33-0005H3-Pb
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X31-0003er-U4
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626715639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmc8fK8KoNKCoLW2UsEY+/ylkpVsysQtUC9Fe+pl91g=;
 b=AukPSKSbieEutJYMybaktwS/L0xZ57dH1/Rn4Qek4X1X1bj8LBBFQ+RAXHj60OEV7JDNJx
 1gAPDRYmpw7/5OhJm+t/m6+5m2+QTz9MGG5Qy1o8zmH++zmCuxu7oThEWH3mdMwKOrPs7D
 VJ61bAzalyLAGzpUo3eVG8oOlwKM53E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-WhH4k3MzNeqgErPwYRxZKA-1; Mon, 19 Jul 2021 13:27:15 -0400
X-MC-Unique: WhH4k3MzNeqgErPwYRxZKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9BD91084F4B;
 Mon, 19 Jul 2021 17:27:14 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6DD19C44;
 Mon, 19 Jul 2021 17:27:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 6/6] blkdebug: protect rules and suspended_reqs with a lock
Date: Mon, 19 Jul 2021 19:26:58 +0200
Message-Id: <20210719172658.715442-7-mreitz@redhat.com>
In-Reply-To: <20210719172658.715442-1-mreitz@redhat.com>
References: <20210719172658.715442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

First, categorize the structure fields to identify what needs
to be protected and what doesn't.

We essentially need to protect only .state, and the 3 lists in
BDRVBlkdebugState.

Then, add the lock and mark the functions accordingly.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210614082931.24925-7-eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/blkdebug.c | 49 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index b47c3fd97c..8b67554bec 100644
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
@@ -64,8 +67,11 @@ typedef struct BlkdebugAIOCB {
 } BlkdebugAIOCB;
 
 typedef struct BlkdebugSuspendedReq {
+    /* IN: initialized in suspend_request() */
     Coroutine *co;
     char *tag;
+
+    /* List entry protected BDRVBlkdebugState's lock */
     QLIST_ENTRY(BlkdebugSuspendedReq) next;
 } BlkdebugSuspendedReq;
 
@@ -77,6 +83,7 @@ enum {
 };
 
 typedef struct BlkdebugRule {
+    /* IN: initialized in add_rule() or blkdebug_debug_breakpoint() */
     BlkdebugEvent event;
     int action;
     int state;
@@ -95,6 +102,8 @@ typedef struct BlkdebugRule {
             char *tag;
         } suspend;
     } options;
+
+    /* List entries protected BDRVBlkdebugState's lock */
     QLIST_ENTRY(BlkdebugRule) next;
     QSIMPLEQ_ENTRY(BlkdebugRule) active_next;
 } BlkdebugRule;
@@ -244,11 +253,14 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
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
@@ -467,6 +479,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     uint64_t align;
 
+    qemu_mutex_init(&s->lock);
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         ret = -EINVAL;
@@ -567,6 +580,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     ret = 0;
 out:
     if (ret < 0) {
+        qemu_mutex_destroy(&s->lock);
         g_free(s->config_file);
     }
     qemu_opts_del(opts);
@@ -581,6 +595,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     int error;
     bool immediately;
 
+    qemu_mutex_lock(&s->lock);
     QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
         uint64_t inject_offset = rule->options.inject.offset;
 
@@ -594,6 +609,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     }
 
     if (!rule || !rule->options.inject.error) {
+        qemu_mutex_unlock(&s->lock);
         return 0;
     }
 
@@ -605,6 +621,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         remove_rule(rule);
     }
 
+    qemu_mutex_unlock(&s->lock);
     if (!immediately) {
         aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
         qemu_coroutine_yield();
@@ -770,8 +787,10 @@ static void blkdebug_close(BlockDriverState *bs)
     }
 
     g_free(s->config_file);
+    qemu_mutex_destroy(&s->lock);
 }
 
+/* Called with lock held.  */
 static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
@@ -790,6 +809,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
     }
 }
 
+/* Called with lock held.  */
 static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
                          int *action_count, int *new_state)
 {
@@ -829,11 +849,13 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
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
-    s->state = new_state;
 
     while (actions_count[ACTION_SUSPEND] > 0) {
         qemu_coroutine_yield();
@@ -861,11 +883,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
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
@@ -888,7 +913,9 @@ retry:
             g_free(r->tag);
             g_free(r);
 
+            qemu_mutex_unlock(&s->lock);
             qemu_coroutine_enter(co);
+            qemu_mutex_lock(&s->lock);
 
             if (all) {
                 goto retry;
@@ -902,7 +929,7 @@ retry:
 static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
 {
     BDRVBlkdebugState *s = bs->opaque;
-
+    QEMU_LOCK_GUARD(&s->lock);
     return resume_req_by_tag(s, tag, false);
 }
 
@@ -913,6 +940,7 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
     BlkdebugRule *rule, *next;
     int i, ret = -ENOENT;
 
+    QEMU_LOCK_GUARD(&s->lock);
     for (i = 0; i < BLKDBG__MAX; i++) {
         QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
             if (rule->action == ACTION_SUSPEND &&
@@ -933,6 +961,7 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
 
+    QEMU_LOCK_GUARD(&s->lock);
     QLIST_FOREACH(r, &s->suspended_reqs, next) {
         if (!strcmp(r->tag, tag)) {
             return true;
-- 
2.31.1


