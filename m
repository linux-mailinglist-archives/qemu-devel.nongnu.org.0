Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC024963F8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:29:52 +0100 (CET)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxjT-0004EU-59
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNE-0007oe-41
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN6-0000MA-O8
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gowl1vCikZsLEGJ9hm7tDcalUv2IfvxK+oYGORPQ8hs=;
 b=T18aj6/4PQQIXoiFU/6nbux8d2t/7juTggFJD0J+X+KuTFk9uKa2oH+xMqHWuDwrRQZ4V6
 iYDFaKXJBr6v0/quFUtQL0xV8NNxMLj235HpIQW6rqOWYxYy+IHXSikCIKV0gOZXEDY6W7
 JivrskUcRtPw3THHr+QGjikE/ILO5OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-hKwnXbOvNYmubyGsrUIArg-1; Fri, 21 Jan 2022 12:06:38 -0500
X-MC-Unique: hKwnXbOvNYmubyGsrUIArg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF91383DD20;
 Fri, 21 Jan 2022 17:06:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1881D7EBE8;
 Fri, 21 Jan 2022 17:06:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 21/33] block: move BQL logic of bdrv_co_invalidate_cache in
 bdrv_activate
Date: Fri, 21 Jan 2022 12:05:32 -0500
Message-Id: <20220121170544.2049944-22-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split bdrv_co_invalidate cache in two: the GS code that takes
care of permissions and running GS callbacks, and leave only the
I/O code (->bdrv_co_invalidate_cache) running in the I/O coroutine.

The only side effect is that bdrv_co_invalidate_cache is not
recursive anymore, and so is every direct call to
bdrv_invalidate_cache().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index 7ab5031027..bad834c86e 100644
--- a/block.c
+++ b/block.c
@@ -6550,23 +6550,20 @@ void bdrv_init_with_whitelist(void)
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
     int ret;
     BdrvDirtyBitmap *bm;
 
+    assert(qemu_in_main_thread());
+
     if (!bs->drv)  {
         return -ENOMEDIUM;
     }
 
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_co_invalidate_cache(child->bs, &local_err);
+        bdrv_activate(child->bs, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return -EINVAL;
@@ -6579,7 +6576,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
      * Note that the required permissions of inactive images are always a
      * subset of the permissions required after activating the image. This
      * allows us to just get the permissions upfront without restricting
-     * drv->bdrv_invalidate_cache().
+     * drv->bdrv_co_invalidate_cache().
      *
      * It also means that in error cases, we don't have to try and revert to
      * the old permissions (which is an operation that could fail, too). We can
@@ -6594,14 +6591,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
             return ret;
         }
 
-        if (bs->drv->bdrv_co_invalidate_cache) {
-            bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
-            if (local_err) {
-                bs->open_flags |= BDRV_O_INACTIVE;
-                error_propagate(errp, local_err);
-                return -EINVAL;
-            }
-        }
+        bdrv_invalidate_cache(bs, errp);
 
         FOR_EACH_DIRTY_BITMAP(bs, bm) {
             bdrv_dirty_bitmap_skip_store(bm, false);
@@ -6629,6 +6619,22 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
+{
+    Error *local_err = NULL;
+
+    if (bs->drv->bdrv_co_invalidate_cache) {
+        bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
+        if (local_err) {
+            bs->open_flags |= BDRV_O_INACTIVE;
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
2.31.1


