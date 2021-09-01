Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1C3FDEE2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:42:32 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSNj-0004mZ-8U
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzL-00056z-TB
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzI-0003ie-SC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ds/cH/bSkilGbLJqatLi75oQmmFFOHug94uAZG1ACDg=;
 b=eB7qbWnhcdX9LKJtiHvfNh+1DzVoo79ymClq2XocF3uQWLC5veVFMf1hBMu6knqtgpVH86
 T8jK5HBQ6wrg7taXHXdjNDvVgxglMkrQAXp+pksIBvtlqh8MZvVJjGf0if3UqOZyJK8cVg
 UqLKZtddc2G82IB6RTVnaoA7JH2pBfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-L5jkTyTgNASD5QiHvcvqQg-1; Wed, 01 Sep 2021 11:17:14 -0400
X-MC-Unique: L5jkTyTgNASD5QiHvcvqQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBA1F801A92;
 Wed,  1 Sep 2021 15:17:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 929205D9DC;
 Wed,  1 Sep 2021 15:17:13 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/56] qdev: allow setting drive property for realized device
Date: Wed,  1 Sep 2021 17:15:47 +0200
Message-Id: <20210901151619.689075-25-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We need an ability to insert filters above top block node, attached to
block device. It can't be achieved with blockdev-reopen command. So, we
want do it with help of qom-set.

Intended usage:

Assume there is a node A that is attached to some guest device.

1. blockdev-add to create a filter node B that has A as its child.

2. qom-set to change the node attached to the guest device’s
   BlockBackend from A to B.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210824083856.17408-5-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 hw/core/qdev-properties-system.c | 43 +++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 2760c21f11..e71f5d64d1 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -36,11 +36,11 @@
 
 static bool check_prop_still_unset(Object *obj, const char *name,
                                    const void *old_val, const char *new_val,
-                                   Error **errp)
+                                   bool allow_override, Error **errp)
 {
     const GlobalProperty *prop = qdev_find_global_prop(obj, name);
 
-    if (!old_val) {
+    if (!old_val || (!prop && allow_override)) {
         return true;
     }
 
@@ -93,16 +93,34 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
     BlockBackend *blk;
     bool blk_created = false;
     int ret;
+    BlockDriverState *bs;
+    AioContext *ctx;
 
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
 
-    /*
-     * TODO Should this really be an error?  If no, the old value
-     * needs to be released before we store the new one.
-     */
-    if (!check_prop_still_unset(obj, name, *ptr, str, errp)) {
+    if (!check_prop_still_unset(obj, name, *ptr, str, true, errp)) {
+        return;
+    }
+
+    if (*ptr) {
+        /* BlockBackend alread exists. So, we want to change attached node */
+        blk = *ptr;
+        ctx = blk_get_aio_context(blk);
+        bs = bdrv_lookup_bs(NULL, str, errp);
+        if (!bs) {
+            return;
+        }
+
+        if (ctx != bdrv_get_aio_context(bs)) {
+            error_setg(errp, "Different aio context is not supported for new "
+                       "node");
+        }
+
+        aio_context_acquire(ctx);
+        blk_replace_bs(blk, bs, errp);
+        aio_context_release(ctx);
         return;
     }
 
@@ -114,7 +132,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
 
     blk = blk_by_name(str);
     if (!blk) {
-        BlockDriverState *bs = bdrv_lookup_bs(NULL, str, NULL);
+        bs = bdrv_lookup_bs(NULL, str, NULL);
         if (bs) {
             /*
              * If the device supports iothreads, it will make sure to move the
@@ -123,8 +141,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
              * aware of iothreads require their BlockBackends to be in the main
              * AioContext.
              */
-            AioContext *ctx = iothread ? bdrv_get_aio_context(bs) :
-                                         qemu_get_aio_context();
+            ctx = iothread ? bdrv_get_aio_context(bs) : qemu_get_aio_context();
             blk = blk_new(ctx, 0, BLK_PERM_ALL);
             blk_created = true;
 
@@ -196,6 +213,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
 const PropertyInfo qdev_prop_drive = {
     .name  = "str",
     .description = "Node name or ID of a block device to use as a backend",
+    .realized_set_allowed = true,
     .get   = get_drive,
     .set   = set_drive,
     .release = release_drive,
@@ -204,6 +222,7 @@ const PropertyInfo qdev_prop_drive = {
 const PropertyInfo qdev_prop_drive_iothread = {
     .name  = "str",
     .description = "Node name or ID of a block device to use as a backend",
+    .realized_set_allowed = true,
     .get   = get_drive,
     .set   = set_drive_iothread,
     .release = release_drive,
@@ -238,7 +257,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
      * TODO Should this really be an error?  If no, the old value
      * needs to be released before we store the new one.
      */
-    if (!check_prop_still_unset(obj, name, be->chr, str, errp)) {
+    if (!check_prop_still_unset(obj, name, be->chr, str, false, errp)) {
         return;
     }
 
@@ -408,7 +427,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
          * TODO Should this really be an error?  If no, the old value
          * needs to be released before we store the new one.
          */
-        if (!check_prop_still_unset(obj, name, ncs[i], str, errp)) {
+        if (!check_prop_still_unset(obj, name, ncs[i], str, false, errp)) {
             goto out;
         }
 
-- 
2.31.1


