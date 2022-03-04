Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140444CD991
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:57:11 +0100 (CET)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBEs-00037s-4h
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:57:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5U-0004VN-Ug
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5T-0007Ib-7I
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XacymdLsYXTxCKUSBJYJvR3gg9E6Oe5aOGG2IcanJw0=;
 b=AbrQQDjwdRXy8vaKXejpP+3dZIq8+2pzip9bJLp8LEF3R5Y7o6uEcbt0nPYaJgYUped96J
 OhiC5MEKFbPOYY7rGBwtg1oTqfJ9waEOcdkjlUajEqctkR6Tf/0XZqvHD/LwMcsqWeHDgV
 2FJqd8pHhxzSO6QNod0yx0zgjSfxQKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-0boSNWgENU-idOv19Orw_g-1; Fri, 04 Mar 2022 11:47:24 -0500
X-MC-Unique: 0boSNWgENU-idOv19Orw_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 721861091DA2;
 Fri,  4 Mar 2022 16:47:23 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77CD783BF9;
 Fri,  4 Mar 2022 16:47:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/50] block: move BQL logic of bdrv_co_invalidate_cache in
 bdrv_activate
Date: Fri,  4 Mar 2022 17:46:26 +0100
Message-Id: <20220304164711.474713-6-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Split bdrv_co_invalidate cache in two: the Global State (under BQL)
code that takes care of permissions and running GS callbacks,
and leave only the I/O code (->bdrv_co_invalidate_cache) running in
the I/O coroutine.

The only side effect is that bdrv_co_invalidate_cache is not
recursive anymore, and so is every direct call to
bdrv_invalidate_cache().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220209105452.1694545-6-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 5e65f134f8..df353d55e8 100644
--- a/block.c
+++ b/block.c
@@ -6394,11 +6394,6 @@ void bdrv_init_with_whitelist(void)
 }
 
 int bdrv_activate(BlockDriverState *bs, Error **errp)
-{
-    return bdrv_invalidate_cache(bs, errp);
-}
-
-int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *child, *parent;
     Error *local_err = NULL;
@@ -6410,7 +6405,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     }
 
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_co_invalidate_cache(child->bs, &local_err);
+        bdrv_activate(child->bs, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return -EINVAL;
@@ -6423,7 +6418,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
      * Note that the required permissions of inactive images are always a
      * subset of the permissions required after activating the image. This
      * allows us to just get the permissions upfront without restricting
-     * drv->bdrv_invalidate_cache().
+     * bdrv_co_invalidate_cache().
      *
      * It also means that in error cases, we don't have to try and revert to
      * the old permissions (which is an operation that could fail, too). We can
@@ -6438,13 +6433,10 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
             return ret;
         }
 
-        if (bs->drv->bdrv_co_invalidate_cache) {
-            bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
-            if (local_err) {
-                bs->open_flags |= BDRV_O_INACTIVE;
-                error_propagate(errp, local_err);
-                return -EINVAL;
-            }
+        ret = bdrv_invalidate_cache(bs, errp);
+        if (ret < 0) {
+            bs->open_flags |= BDRV_O_INACTIVE;
+            return ret;
         }
 
         FOR_EACH_DIRTY_BITMAP(bs, bm) {
@@ -6473,6 +6465,23 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
+{
+    Error *local_err = NULL;
+
+    assert(!(bs->open_flags & BDRV_O_INACTIVE));
+
+    if (bs->drv->bdrv_co_invalidate_cache) {
+        bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
 void bdrv_activate_all(Error **errp)
 {
     BlockDriverState *bs;
-- 
2.35.1


