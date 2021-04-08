Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE835892E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:02:47 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUX7F-0004lV-Jo
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX46-0002r0-Te
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX44-0006wE-Tk
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkrbjbBz+yPiXpPiv51ttfOnhfkM2F4wo39zLjudxzw=;
 b=cCooR7mHPIv+rSyzI+KdVlSabc7UgEwqwjKtGVR2nU1vxonfnIvrJyj2piDXiU1vo5Mfql
 8T2z02MOePR+vAOoX7GnLyaB12c1D9bsTxTzs1s8BzAq/fBKDKd0dv47zfkx5YfUDKCaQW
 JvYPNYg8GgWy4wDsR3l+vSRCHyfIRSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-qsP4hRPjPvmJ-Yzj161HfA-1; Thu, 08 Apr 2021 11:59:26 -0400
X-MC-Unique: qsP4hRPjPvmJ-Yzj161HfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8273E807324;
 Thu,  8 Apr 2021 15:59:25 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-155.ams2.redhat.com
 [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 179CE5D6AC;
 Thu,  8 Apr 2021 15:59:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/5] blkdebug: track all actions
Date: Thu,  8 Apr 2021 17:59:11 +0200
Message-Id: <20210408155913.53235-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a counter for each action that a rule can trigger.
This is mainly used to keep track of how many coroutine_yeld()
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


