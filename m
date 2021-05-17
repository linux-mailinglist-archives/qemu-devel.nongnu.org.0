Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EA38333C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:55:46 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieen-00029F-3K
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaF-0001Xk-Cl
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaD-0004fX-I5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621263060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICrrjGgia8w1NaBy1XQD706S9/jMkYW2Mr1MjkqN/bs=;
 b=MMv+vrmMxXsCZwK7m34oMPupEylenYi+xvRlbn4onlGknR0gePifnLa/e+zJerlp12vt8y
 dFD1mrKaXbO50atNYN7IqH3BGqp0XzEtQiUc/rwlk3rZqdWTrqJkpghLeC9IhzshsiNcYQ
 8AHHYfQwV+k5btNhhnvVa6FPAblOq9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-OWp_ukHTNpKDEKcGlyIhnA-1; Mon, 17 May 2021 10:50:59 -0400
X-MC-Unique: OWp_ukHTNpKDEKcGlyIhnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DAEA192377A;
 Mon, 17 May 2021 14:50:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-23.ams2.redhat.com
 [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98B015D749;
 Mon, 17 May 2021 14:50:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/5] blkdebug: move post-resume handling to
 resume_req_by_tag
Date: Mon, 17 May 2021 16:50:46 +0200
Message-Id: <20210517145049.55268-3-eesposit@redhat.com>
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

We want to move qemu_coroutine_yield() after the loop on rules,
because QLIST_FOREACH_SAFE is wrong if the rule list is modified
while the coroutine has yielded.  Therefore move the suspended
request to the heap and clean it up from the remove side.
All that is left is for blkdebug_debug_event to handle the
yielding.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8f19d991fa..e37f999254 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -775,25 +775,20 @@ static void blkdebug_close(BlockDriverState *bs)
 static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
-    BlkdebugSuspendedReq r;
+    BlkdebugSuspendedReq *r;
 
-    r = (BlkdebugSuspendedReq) {
-        .co         = qemu_coroutine_self(),
-        .tag        = g_strdup(rule->options.suspend.tag),
-    };
+    r = g_new(BlkdebugSuspendedReq, 1);
+
+    r->co         = qemu_coroutine_self();
+    r->tag        = g_strdup(rule->options.suspend.tag);
 
     remove_rule(rule);
-    QLIST_INSERT_HEAD(&s->suspended_reqs, &r, next);
+    QLIST_INSERT_HEAD(&s->suspended_reqs, r, next);
 
     if (!qtest_enabled()) {
-        printf("blkdebug: Suspended request '%s'\n", r.tag);
+        printf("blkdebug: Suspended request '%s'\n", r->tag);
     }
     qemu_coroutine_yield();
-    if (!qtest_enabled()) {
-        printf("blkdebug: Resuming request '%s'\n", r.tag);
-    }
-
-    g_free(r.tag);
 }
 
 static bool process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
@@ -875,8 +870,18 @@ static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
 retry:
     QLIST_FOREACH(r, &s->suspended_reqs, next) {
         if (!strcmp(r->tag, tag)) {
+            Coroutine *co = r->co;
+
+            if (!qtest_enabled()) {
+                printf("blkdebug: Resuming request '%s'\n", r->tag);
+            }
+
             QLIST_REMOVE(r, next);
-            qemu_coroutine_enter(r->co);
+            g_free(r->tag);
+            g_free(r);
+
+            qemu_coroutine_enter(co);
+
             if (all) {
                 goto retry;
             }
-- 
2.30.2


