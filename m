Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9793A5E79
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:37:09 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi5k-00073S-4A
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyi-0002bZ-O8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyg-0005xt-4h
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q47hSNkHtDYiNQorkj4KJHZn/B/8NQYKHknd/rEliSQ=;
 b=eILNB3kczJB9sDpZ0Kr2OC8hKOWsZTQoYY1lVFJ1uCIaiZWv1UUrRtPVEH/T37IPZNRH5B
 af2c9boLr5x/9qNdnTpFXCEllMtv74yx3g1KGar5MeAlj3MCAD/ug7z4JFmn+zarY3jAKv
 Ge4tk+H68G9RgDQJJJEEE4RNTFoYSJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-es8C5c3fPBe4AJYE54GMGw-1; Mon, 14 Jun 2021 04:29:48 -0400
X-MC-Unique: es8C5c3fPBe4AJYE54GMGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF9D100C609;
 Mon, 14 Jun 2021 08:29:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 646C75D9E2;
 Mon, 14 Jun 2021 08:29:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 5/6] block/blkdebug: remove new_state field and instead use
 a local variable
Date: Mon, 14 Jun 2021 10:29:30 +0200
Message-Id: <20210614082931.24925-6-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There seems to be no benefit in using a field. Replace it with a local
variable, and move the state update before the yields.

The state update has do be done before the yields because now using
a local variable does not allow the new updated state to be visible
by the other yields.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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


