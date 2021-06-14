Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66733A5E6C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:32:28 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi1D-0005Jd-Vd
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyf-0002WL-6W
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyb-0005ui-U7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tV2oA2cYwbKP4fPjhdH/HkwlVxYH7G80zzqfiy+0fg=;
 b=DnhZUlwgOQiDXHJvs/3mjLBU6t2g8Bj1W1aE8p1z+HzO7KlBPSaCQIVJQQ49fHUSsN/ZnK
 q/2GMpQi4thwP/+Y6vNPUGovGp4r7TnWUz0gEeJGxgKA8nQVXhsGkaG48gbiFWNBq+/Jpd
 OoPpG6vgBTVNU6plCSZyYYnLcq8RZSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-uDeuPGqKOAeFQywPk993ow-1; Mon, 14 Jun 2021 04:29:43 -0400
X-MC-Unique: uDeuPGqKOAeFQywPk993ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977AC1850606;
 Mon, 14 Jun 2021 08:29:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EEE75D9D3;
 Mon, 14 Jun 2021 08:29:40 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 3/6] blkdebug: track all actions
Date: Mon, 14 Jun 2021 10:29:28 +0200
Message-Id: <20210614082931.24925-4-eesposit@redhat.com>
In-Reply-To: <20210614082931.24925-1-eesposit@redhat.com>
References: <20210614082931.24925-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a counter for each action that a rule can trigger.
This is mainly used to keep track of how many coroutine_yield()
we need to perform after processing all rules in the list.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/blkdebug.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index e8fdf7b056..6bdeb2c7b3 100644
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
2.31.1


