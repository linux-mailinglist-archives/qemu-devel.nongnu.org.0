Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC635893A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:05:41 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXA3-0008Qa-1a
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX4B-00032N-BA
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX49-00070I-B9
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xd4aToLfR6Kqtnto4ra/nR+PkEuFt/R+LfY61RjU144=;
 b=F3wTZe14KPWoRMGrxuSQzFIKotg6ufJBDfLmREIU47OLM0rxQFtRJ34F2nSohWkOxjtP5k
 poF5q8JRGHEuqrtMAuDPAwixFztzSqZsJxaYPYgx8gDUDGToWPNQ9/8NRZ0WUhbgtEIx37
 l2IObdr7ZAvIw50hBbEbQnIFCz/kCME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-FZDsGDGDOr2Vj4uqYP1z2g-1; Thu, 08 Apr 2021 11:59:30 -0400
X-MC-Unique: FZDsGDGDOr2Vj4uqYP1z2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0B7487504F;
 Thu,  8 Apr 2021 15:59:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-155.ams2.redhat.com
 [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 151615D6AC;
 Thu,  8 Apr 2021 15:59:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/5] blkdebug: protect rules and suspended_reqs with a lock
Date: Thu,  8 Apr 2021 17:59:13 +0200
Message-Id: <20210408155913.53235-6-eesposit@redhat.com>
In-Reply-To: <20210408155913.53235-1-eesposit@redhat.com>
References: <20210408155913.53235-1-eesposit@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index dffd869b32..e92a35ccbb 100644
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
@@ -829,17 +840,22 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
     assert((int)event >= 0 && event < BLKDBG__MAX);
 
+    qemu_mutex_lock(&s->lock);
     s->new_state = s->state;
     QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
         process_rule(bs, rule, actions_count);
     }
 
+    qemu_mutex_unlock(&s->lock);
+
     while (actions_count[ACTION_SUSPEND] > 0) {
         qemu_coroutine_yield();
         actions_count[ACTION_SUSPEND]--;
     }
 
+    qemu_mutex_lock(&s->lock);
     s->state = s->new_state;
+    qemu_mutex_unlock(&s->lock);
 }
 
 static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
@@ -862,11 +878,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
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
@@ -884,7 +903,9 @@ retry:
             g_free(r->tag);
             g_free(r);
 
+            qemu_mutex_unlock(&s->lock);
             qemu_coroutine_enter(co);
+            qemu_mutex_lock(&s->lock);
 
             if (all) {
                 goto retry;
@@ -898,8 +919,12 @@ retry:
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
@@ -909,6 +934,7 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
     BlkdebugRule *rule, *next;
     int i, ret = -ENOENT;
 
+    qemu_mutex_lock(&s->lock);
     for (i = 0; i < BLKDBG__MAX; i++) {
         QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
             if (rule->action == ACTION_SUSPEND &&
@@ -921,6 +947,7 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
     if (resume_req_by_tag(s, tag, true) == 0) {
         ret = 0;
     }
+    qemu_mutex_unlock(&s->lock);
     return ret;
 }
 
@@ -929,11 +956,14 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
 
+    qemu_mutex_lock(&s->lock);
     QLIST_FOREACH(r, &s->suspended_reqs, next) {
         if (!strcmp(r->tag, tag)) {
+            qemu_mutex_unlock(&s->lock);
             return true;
         }
     }
+    qemu_mutex_unlock(&s->lock);
     return false;
 }
 
-- 
2.30.2


