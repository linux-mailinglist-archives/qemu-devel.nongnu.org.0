Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3738334F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:58:31 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liehS-0007ri-O0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaE-0001Sz-65
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaB-0004de-IC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621263058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fV20J4Btohsbn/Q0xrXXA6gW+0ZKKcirbJd1bz20viM=;
 b=RLBX1CClAGlBtWZ1w2GwakU+6s+doQVT5RXIU0ybujWvp6hJ4yrsGKrw+Zaaf6ogoQBHGj
 +lPrsU6v7qMOZVF2lAVp4xMmHMbnCV0XS4YK0W7NVZIBcIIze4qC3DpTltE7/yf95C81yG
 H+t1Dk3BtiIvaQMsQ9VytQQ5bPFoQ/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-zhF3H-I6M9-x7EuMdl9zXg-1; Mon, 17 May 2021 10:50:57 -0400
X-MC-Unique: zhF3H-I6M9-x7EuMdl9zXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A204A0CAE;
 Mon, 17 May 2021 14:50:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-23.ams2.redhat.com
 [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE705D71D;
 Mon, 17 May 2021 14:50:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/5] blkdebug: refactor removal of a suspended request
Date: Mon, 17 May 2021 16:50:45 +0200
Message-Id: <20210517145049.55268-2-eesposit@redhat.com>
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract to a separate function.  Do not rely on FOREACH_SAFE, which is
only "safe" if the *current* node is removed---not if another node is
removed.  Instead, just walk the entire list from the beginning when
asked to resume all suspended requests with a given tag.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 2c0b9b0ee8..8f19d991fa 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -793,7 +793,6 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
         printf("blkdebug: Resuming request '%s'\n", r.tag);
     }
 
-    QLIST_REMOVE(&r, next);
     g_free(r.tag);
 }
 
@@ -869,25 +868,35 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
     return 0;
 }
 
-static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
+static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
 {
-    BDRVBlkdebugState *s = bs->opaque;
-    BlkdebugSuspendedReq *r, *next;
+    BlkdebugSuspendedReq *r;
 
-    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, next) {
+retry:
+    QLIST_FOREACH(r, &s->suspended_reqs, next) {
         if (!strcmp(r->tag, tag)) {
+            QLIST_REMOVE(r, next);
             qemu_coroutine_enter(r->co);
+            if (all) {
+                goto retry;
+            }
             return 0;
         }
     }
     return -ENOENT;
 }
 
+static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
+{
+    BDRVBlkdebugState *s = bs->opaque;
+
+    return resume_req_by_tag(s, tag, false);
+}
+
 static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
                                             const char *tag)
 {
     BDRVBlkdebugState *s = bs->opaque;
-    BlkdebugSuspendedReq *r, *r_next;
     BlkdebugRule *rule, *next;
     int i, ret = -ENOENT;
 
@@ -900,11 +909,8 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
             }
         }
     }
-    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, r_next) {
-        if (!strcmp(r->tag, tag)) {
-            qemu_coroutine_enter(r->co);
-            ret = 0;
-        }
+    if (resume_req_by_tag(s, tag, true) == 0) {
+        ret = 0;
     }
     return ret;
 }
-- 
2.30.2


