Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB1A4AEFA3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:06:58 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkoK-0001m3-6v
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcz-000572-Ob
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcu-00046w-54
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEu8CC572/fIw5PJHp1dCZ+AlY06iPaPOan66DSXrJk=;
 b=PXpB8kkD21DDLu0BDJ5vKATkJmevSJRK2T7CXHxE3TKEXeZSu3u7mXgzuw6isOKCh5Gz2w
 WxKg5mBX0I07JnoSJ7n7IruPQQd1t7UBrKhXTY9eyv32fZtkzTY5WvbMG8lublo67wBOn6
 dT23iklhz6QlKkrcrY45221YLsajLNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-GXeBCLUaP_6btJ-8vhgGbQ-1; Wed, 09 Feb 2022 05:55:05 -0500
X-MC-Unique: GXeBCLUaP_6btJ-8vhgGbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F7591091DB0;
 Wed,  9 Feb 2022 10:55:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60CA5F6BA;
 Wed,  9 Feb 2022 10:55:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/5] block: move BQL logic of bdrv_co_invalidate_cache in
 bdrv_activate
Date: Wed,  9 Feb 2022 05:54:52 -0500
Message-Id: <20220209105452.1694545-6-eesposit@redhat.com>
In-Reply-To: <20220209105452.1694545-1-eesposit@redhat.com>
References: <20220209105452.1694545-1-eesposit@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split bdrv_co_invalidate cache in two: the Global State (under BQL)
code that takes care of permissions and running GS callbacks,
and leave only the I/O code (->bdrv_co_invalidate_cache) running in
the I/O coroutine.

The only side effect is that bdrv_co_invalidate_cache is not
recursive anymore, and so is every direct call to
bdrv_invalidate_cache().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
2.31.1


