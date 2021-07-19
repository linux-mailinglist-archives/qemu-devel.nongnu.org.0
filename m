Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7F3CE8C9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:29:30 +0200 (CEST)
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5X56-0008PR-Uo
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2z-0005C5-JY
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2x-0003bZ-AN
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626715634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giRroj1+EzsSlLW9sdsjxfGSVcEZLdtIfZvGnWmyihM=;
 b=PJb5OqpAnG+goVQhuoaaHHJHOQiv9U1BWY57JbyzTOD405r8EjS7ULLiI9MXKdIMrxzNzD
 YwOlKDw3bOWIAiV8LhF1jzxpoFtQtwghnPNY0YcFAPiSbR5pGEFbC+y3MYrCnGZpnyGomT
 82r2GoW3HJvorSwe4EJIUfapHhyesMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-vkuk34nKPrmNp3Q2dVLAfQ-1; Mon, 19 Jul 2021 13:27:13 -0400
X-MC-Unique: vkuk34nKPrmNp3Q2dVLAfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25667804140;
 Mon, 19 Jul 2021 17:27:12 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B35F260938;
 Mon, 19 Jul 2021 17:27:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 5/6] block/blkdebug: remove new_state field and instead use a
 local variable
Date: Mon, 19 Jul 2021 19:26:57 +0200
Message-Id: <20210719172658.715442-6-mreitz@redhat.com>
In-Reply-To: <20210719172658.715442-1-mreitz@redhat.com>
References: <20210719172658.715442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

There seems to be no benefit in using a field. Replace it with a local
variable, and move the state update before the yields.

The state update has do be done before the yields because now using
a local variable does not allow the new updated state to be visible
by the other yields.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210614082931.24925-6-eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/blkdebug.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index dd82131d1e..b47c3fd97c 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -40,7 +40,6 @@
 
 typedef struct BDRVBlkdebugState {
     int state;
-    int new_state;
     uint64_t align;
     uint64_t max_transfer;
     uint64_t opt_write_zero;
@@ -792,7 +791,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 }
 
 static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
-                         int *action_count)
+                         int *action_count, int *new_state)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
@@ -812,7 +811,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
         break;
 
     case ACTION_SET_STATE:
-        s->new_state = rule->options.set_state.new_state;
+        *new_state = rule->options.set_state.new_state;
         break;
 
     case ACTION_SUSPEND:
@@ -825,21 +824,21 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     BDRVBlkdebugState *s = bs->opaque;
     struct BlkdebugRule *rule, *next;
+    int new_state;
     int actions_count[ACTION__MAX] = { 0 };
 
     assert((int)event >= 0 && event < BLKDBG__MAX);
 
-    s->new_state = s->state;
+    new_state = s->state;
     QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
-        process_rule(bs, rule, actions_count);
+        process_rule(bs, rule, actions_count, &new_state);
     }
+    s->state = new_state;
 
     while (actions_count[ACTION_SUSPEND] > 0) {
         qemu_coroutine_yield();
         actions_count[ACTION_SUSPEND]--;
     }
-
-    s->state = s->new_state;
 }
 
 static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
-- 
2.31.1


