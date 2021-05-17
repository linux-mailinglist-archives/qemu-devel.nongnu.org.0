Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF138334C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:57:29 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liegS-0006Bi-BS
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaO-00028q-EH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaK-0004o7-LR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621263067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8A4K7B6u+Ahiit92Q//OczxdstTQY10OSEPcPfO7f6o=;
 b=YmgUqCxCd/aWcMx/NWr37ePVSa3Iilefpzg5n/6V2ZuqPos7PurD6fvLVbpgLyshWJxC6g
 e7mCcVoRprTLeryfEsUbs0VmXFezQEcX8LLrV4NDbpspHvENpCOC4edvADBUV1tExSbe2d
 x7l3dy/703BWnSJkg7CxTA/aD7j0EPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-C-ZbL9jUOTC7cT35QxHTZw-1; Mon, 17 May 2021 10:51:06 -0400
X-MC-Unique: C-ZbL9jUOTC7cT35QxHTZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F846801106;
 Mon, 17 May 2021 14:51:05 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-23.ams2.redhat.com
 [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 631835D6D7;
 Mon, 17 May 2021 14:51:03 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 5/5] blkdebug: protect rules and suspended_reqs with a lock
Date: Mon, 17 May 2021 16:50:49 +0200
Message-Id: <20210517145049.55268-6-eesposit@redhat.com>
In-Reply-To: <20210517145049.55268-1-eesposit@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 53 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index dffd869b32..cf8b088ce7 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -54,6 +54,7 @@ typedef struct BDRVBlkdebugState {
     /* For blkdebug_refresh_filename() */
     char *config_file;
 
+    QemuMutex lock;
     QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
     QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
     QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
@@ -245,7 +246,9 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
     };
 
     /* Add the rule */
+    qemu_mutex_lock(&s->lock);
     QLIST_INSERT_HEAD(&s->rules[event], rule, next);
+    qemu_mutex_unlock(&s->lock);
 
     return 0;
 }
@@ -468,6 +471,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     uint64_t align;
 
+    qemu_mutex_init(&s->lock);
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         ret = -EINVAL;
@@ -568,6 +572,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     ret = 0;
 out:
     if (ret < 0) {
+        qemu_mutex_destroy(&s->lock);
         g_free(s->config_file);
     }
     qemu_opts_del(opts);
@@ -582,6 +587,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     int error;
     bool immediately;
 
+    qemu_mutex_lock(&s->lock);
     QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
         uint64_t inject_offset = rule->options.inject.offset;
 
@@ -595,6 +601,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     }
 
     if (!rule || !rule->options.inject.error) {
+        qemu_mutex_unlock(&s->lock);
         return 0;
     }
 
@@ -606,6 +613,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         remove_rule(rule);
     }
 
+    qemu_mutex_unlock(&s->lock);
     if (!immediately) {
         aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
         qemu_coroutine_yield();
@@ -771,8 +779,10 @@ static void blkdebug_close(BlockDriverState *bs)
     }
 
     g_free(s->config_file);
+    qemu_mutex_destroy(&s->lock);
 }
 
+/* Called with lock held.  */
 static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
@@ -791,6 +801,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
     }
 }
 
+/* Called with lock held.  */
 static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
                          int *action_count)
 {
@@ -829,9 +840,11 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
     assert((int)event >= 0 && event < BLKDBG__MAX);
 
-    s->new_state = s->state;
-    QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
-        process_rule(bs, rule, actions_count);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        s->new_state = s->state;
+        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
+            process_rule(bs, rule, actions_count);
+        }
     }
 
     while (actions_count[ACTION_SUSPEND] > 0) {
@@ -839,7 +852,9 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
         actions_count[ACTION_SUSPEND]--;
     }
 
+    qemu_mutex_lock(&s->lock);
     s->state = s->new_state;
+    qemu_mutex_unlock(&s->lock);
 }
 
 static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
@@ -862,11 +877,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
         .options.suspend.tag = g_strdup(tag),
     };
 
+    qemu_mutex_lock(&s->lock);
     QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
+    qemu_mutex_unlock(&s->lock);
 
     return 0;
 }
 
+/* Called with lock held.  */
 static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
 {
     BlkdebugSuspendedReq *r;
@@ -884,7 +902,9 @@ retry:
             g_free(r->tag);
             g_free(r);
 
+            qemu_mutex_unlock(&s->lock);
             qemu_coroutine_enter(co);
+            qemu_mutex_lock(&s->lock);
 
             if (all) {
                 goto retry;
@@ -898,8 +918,12 @@ retry:
 static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
 {
     BDRVBlkdebugState *s = bs->opaque;
+    int rc;
 
-    return resume_req_by_tag(s, tag, false);
+    qemu_mutex_lock(&s->lock);
+    rc = resume_req_by_tag(s, tag, false);
+    qemu_mutex_unlock(&s->lock);
+    return rc;
 }
 
 static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
@@ -909,17 +933,19 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
     BlkdebugRule *rule, *next;
     int i, ret = -ENOENT;
 
-    for (i = 0; i < BLKDBG__MAX; i++) {
-        QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
-            if (rule->action == ACTION_SUSPEND &&
-                !strcmp(rule->options.suspend.tag, tag)) {
-                remove_rule(rule);
-                ret = 0;
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        for (i = 0; i < BLKDBG__MAX; i++) {
+            QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
+                if (rule->action == ACTION_SUSPEND &&
+                    !strcmp(rule->options.suspend.tag, tag)) {
+                    remove_rule(rule);
+                    ret = 0;
+                }
             }
         }
-    }
-    if (resume_req_by_tag(s, tag, true) == 0) {
-        ret = 0;
+        if (resume_req_by_tag(s, tag, true) == 0) {
+            ret = 0;
+        }
     }
     return ret;
 }
@@ -929,6 +955,7 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
 
+    QEMU_LOCK_GUARD(&s->lock);
     QLIST_FOREACH(r, &s->suspended_reqs, next) {
         if (!strcmp(r->tag, tag)) {
             return true;
-- 
2.30.2


