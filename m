Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102A3833B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:01:15 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liek6-0004Hq-92
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaI-0001lI-HP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaG-0004js-RM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621263064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8069keYnyNIuYkM+FktH39KppMHupzj2AI8e+wRRD4=;
 b=h2+IvsUV9MiZ3ozHrJWsXX+pleD5vyEs1wFnmYmPLN5SkHduWNazaR1cvFPnamoGB4ka/3
 uitMnp8Ll1WDrgZ/DrpTNIP/TzejWxrso00U9m6faX7CYCC0S6g4qldpohvt2AnOdhfNWt
 g5SMtfQEp7RyTI+CDf4fWdacik+Ow4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-mN49Oxj6PwKMKGg1gzNHLw-1; Mon, 17 May 2021 10:51:01 -0400
X-MC-Unique: mN49Oxj6PwKMKGg1gzNHLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32F08015F7;
 Mon, 17 May 2021 14:51:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-23.ams2.redhat.com
 [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF6035D6D7;
 Mon, 17 May 2021 14:50:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/5] blkdebug: track all actions
Date: Mon, 17 May 2021 16:50:47 +0200
Message-Id: <20210517145049.55268-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

Add a counter for each action that a rule can trigger.
This is mainly used to keep track of how many coroutine_yield()
we need to perform after processing all rules in the list.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index e37f999254..388b5ed615 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -74,6 +74,7 @@ enum {
     ACTION_INJECT_ERROR,
     ACTION_SET_STATE,
     ACTION_SUSPEND,
+    ACTION__MAX,
 };
 
 typedef struct BlkdebugRule {
@@ -791,22 +792,22 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
     qemu_coroutine_yield();
 }
 
-static bool process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
-    bool injected)
+static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
+                         int *action_count)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
     /* Only process rules for the current state */
     if (rule->state && rule->state != s->state) {
-        return injected;
+        return;
     }
 
     /* Take the action */
+    action_count[rule->action]++;
     switch (rule->action) {
     case ACTION_INJECT_ERROR:
-        if (!injected) {
+        if (action_count[ACTION_INJECT_ERROR] == 1) {
             QSIMPLEQ_INIT(&s->active_rules);
-            injected = true;
         }
         QSIMPLEQ_INSERT_HEAD(&s->active_rules, rule, active_next);
         break;
@@ -819,21 +820,19 @@ static bool process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
         suspend_request(bs, rule);
         break;
     }
-    return injected;
 }
 
 static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     BDRVBlkdebugState *s = bs->opaque;
     struct BlkdebugRule *rule, *next;
-    bool injected;
+    int actions_count[ACTION__MAX] = { 0 };
 
     assert((int)event >= 0 && event < BLKDBG__MAX);
 
-    injected = false;
     s->new_state = s->state;
     QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
-        injected = process_rule(bs, rule, injected);
+        process_rule(bs, rule, actions_count);
     }
     s->state = s->new_state;
 }
-- 
2.30.2


