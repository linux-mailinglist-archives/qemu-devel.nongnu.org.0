Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E0C363E1B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:01:34 +0200 (CEST)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPmf-0007Fr-FK
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhk-0001Sq-LE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhh-0001Hj-7x
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZA0KhXzvaBqWyhzILLmVRLdX/8xBMJXcXdvw+3nKvwQ=;
 b=IkeE3Oj3/bm6WbxqIAphnKEeSIyEhycIDhOGnp1Gr1DhZ/E73EJwNsmOdjAXlyP0mh4YZ0
 E4io+DHGoO5YaCBk67RdpwIGJZzmMKqrjyiWIvdy52xWTNKONGomNTPSTV2ObcAIp0RrX7
 quDF1aaYjCGVrBuZR9mY3fmz1xBcbDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Ex5CCSPwP-OmoojNzOR5kQ-1; Mon, 19 Apr 2021 04:56:20 -0400
X-MC-Unique: Ex5CCSPwP-OmoojNzOR5kQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B8E83DD25;
 Mon, 19 Apr 2021 08:56:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36CFB5D71D;
 Mon, 19 Apr 2021 08:56:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 8/8] block: do not take AioContext around reopen
Date: Mon, 19 Apr 2021 10:55:41 +0200
Message-Id: <20210419085541.22310-9-eesposit@redhat.com>
In-Reply-To: <20210419085541.22310-1-eesposit@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reopen needs to handle AioContext carefully due to calling
bdrv_drain_all_begin/end.  By not taking AioContext around calls to
bdrv_reopen_multiple, we can drop the function's release/acquire
pair and the AioContext argument too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c |  4 ----
 block/mirror.c        |  9 ---------
 blockdev.c            | 19 ++++++-------------
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 413af51f3b..6fdc698e9e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2291,20 +2291,16 @@ int blk_commit_all(void)
     BlockBackend *blk = NULL;
 
     while ((blk = blk_all_next(blk)) != NULL) {
-        AioContext *aio_context = blk_get_aio_context(blk);
         BlockDriverState *unfiltered_bs = bdrv_skip_filters(blk_bs(blk));
 
-        aio_context_acquire(aio_context);
         if (blk_is_inserted(blk) && bdrv_cow_child(unfiltered_bs)) {
             int ret;
 
             ret = bdrv_commit(unfiltered_bs);
             if (ret < 0) {
-                aio_context_release(aio_context);
                 return ret;
             }
         }
-        aio_context_release(aio_context);
     }
     return 0;
 }
diff --git a/block/mirror.c b/block/mirror.c
index 5a71bd8bbc..43174bbc6b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -631,7 +631,6 @@ static int mirror_exit_common(Job *job)
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockJob *bjob = &s->common;
     MirrorBDSOpaque *bs_opaque;
-    AioContext *replace_aio_context = NULL;
     BlockDriverState *src;
     BlockDriverState *target_bs;
     BlockDriverState *mirror_top_bs;
@@ -699,11 +698,6 @@ static int mirror_exit_common(Job *job)
         }
     }
 
-    if (s->to_replace) {
-        replace_aio_context = bdrv_get_aio_context(s->to_replace);
-        aio_context_acquire(replace_aio_context);
-    }
-
     if (s->should_complete && !abort) {
         BlockDriverState *to_replace = s->to_replace ?: src;
         bool ro = bdrv_is_read_only(to_replace);
@@ -740,9 +734,6 @@ static int mirror_exit_common(Job *job)
         error_free(s->replace_blocker);
         bdrv_unref(s->to_replace);
     }
-    if (replace_aio_context) {
-        aio_context_release(replace_aio_context);
-    }
     g_free(s->replaces);
     bdrv_unref(target_bs);
 
diff --git a/blockdev.c b/blockdev.c
index e901107344..1672ef756e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3469,7 +3469,6 @@ void qmp_change_backing_file(const char *device,
                              Error **errp)
 {
     BlockDriverState *bs = NULL;
-    AioContext *aio_context;
     BlockDriverState *image_bs = NULL;
     Error *local_err = NULL;
     bool ro;
@@ -3480,37 +3479,34 @@ void qmp_change_backing_file(const char *device,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     image_bs = bdrv_lookup_bs(NULL, image_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     if (!image_bs) {
         error_setg(errp, "image file not found");
-        goto out;
+        return;
     }
 
     if (bdrv_find_base(image_bs) == image_bs) {
         error_setg(errp, "not allowing backing file change on an image "
                          "without a backing file");
-        goto out;
+        return;
     }
 
     /* even though we are not necessarily operating on bs, we need it to
      * determine if block ops are currently prohibited on the chain */
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_CHANGE, errp)) {
-        goto out;
+        return;
     }
 
     /* final sanity check */
     if (!bdrv_chain_contains(bs, image_bs)) {
         error_setg(errp, "'%s' and image file are not in the same chain",
                    device);
-        goto out;
+        return;
     }
 
     /* if not r/w, reopen to make r/w */
@@ -3518,7 +3514,7 @@ void qmp_change_backing_file(const char *device,
 
     if (ro) {
         if (bdrv_reopen_set_read_only(image_bs, false, errp) != 0) {
-            goto out;
+            return;
         }
     }
 
@@ -3536,9 +3532,6 @@ void qmp_change_backing_file(const char *device,
     if (ro) {
         bdrv_reopen_set_read_only(image_bs, true, errp);
     }
-
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
-- 
2.30.2


