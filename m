Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2663CE8CF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:31:42 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5X7F-0004kZ-R9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2v-00056N-KQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2r-0003Vh-Mo
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626715628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4UIohc1Wi2K/DZs9OmuX0EAzg8fqMb42f9LXAizuxY=;
 b=SvlpDQybdlpK3v5QqCfHlrswSThkUbjXHBf4CUoeVYnZBNDIE1YCqI4ycdmWLPGvVbjEy+
 LonRaFOAQHVarcc6V/fhObTOhTeXDhBFb/hu4tSfKEn8HGCU1qDwPq+Y40wZmmUhRc1r0i
 IvS9DRe9TuNKhkNWvh5GRcNWmENzcKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-cIhsWD9rPKe9lSnfQ969hg-1; Mon, 19 Jul 2021 13:27:06 -0400
X-MC-Unique: cIhsWD9rPKe9lSnfQ969hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD4610066F7;
 Mon, 19 Jul 2021 17:27:05 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B389D60877;
 Mon, 19 Jul 2021 17:27:04 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/6] blkdebug: move post-resume handling to resume_req_by_tag
Date: Mon, 19 Jul 2021 19:26:54 +0200
Message-Id: <20210719172658.715442-3-mreitz@redhat.com>
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

We want to move qemu_coroutine_yield() after the loop on rules,
because QLIST_FOREACH_SAFE is wrong if the rule list is modified
while the coroutine has yielded.  Therefore move the suspended
request to the heap and clean it up from the remove side.
All that is left is for blkdebug_debug_event to handle the
yielding.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210614082931.24925-3-eesposit@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/blkdebug.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 5ccbfcab42..e8fdf7b056 100644
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
@@ -880,8 +875,18 @@ retry:
      */
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
2.31.1


