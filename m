Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C90363E21
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:02:31 +0200 (CEST)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPna-0000ag-1W
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhR-0000sr-Lt
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhO-0000zT-Ly
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aj+m7bFeSvHh3CRGJg61cTK6r5lIG3JM1YBLFdhutP8=;
 b=eISZDC+X2XLEk0xOAPkIp4Do10r6Bbhm1loLSxAZddw/wZkGyf0jcXABFWnnKEYb3h2zLA
 NmD8W3gQ3MhM4J0v/+KpenD77midl6m1qS8KG68APooIjHRrfLb5gY9Uk8Kofh4cBolzgM
 jfsCkaxlorlHiGct+4F9zxkrVl+JX1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-lSBt1HoWPyuJQ_FoIUIW5A-1; Mon, 19 Apr 2021 04:56:04 -0400
X-MC-Unique: lSBt1HoWPyuJQ_FoIUIW5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70DEB184B7E4;
 Mon, 19 Apr 2021 08:56:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4A05D742;
 Mon, 19 Apr 2021 08:56:00 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/8] block: make before-write notifiers thread-safe
Date: Mon, 19 Apr 2021 10:55:37 +0200
Message-Id: <20210419085541.22310-5-eesposit@redhat.com>
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

Reads access the list in RCU style, so be careful to avoid use-after-free
scenarios in the backup block job.  Apart from this, all that's needed
is protecting updates with a mutex.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                   |  6 +++---
 block/io.c                | 12 ++++++++++++
 block/write-threshold.c   |  2 +-
 include/block/block_int.h | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index c5b887cec1..f40fb63c75 100644
--- a/block.c
+++ b/block.c
@@ -6434,7 +6434,7 @@ static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
     g_free(ban);
 }
 
-static void bdrv_detach_aio_context(BlockDriverState *bs)
+void bdrv_detach_aio_context(BlockDriverState *bs)
 {
     BdrvAioNotifier *baf, *baf_tmp;
 
@@ -6462,8 +6462,8 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     bs->aio_context = NULL;
 }
 
-static void bdrv_attach_aio_context(BlockDriverState *bs,
-                                    AioContext *new_context)
+void bdrv_attach_aio_context(BlockDriverState *bs,
+                             AioContext *new_context)
 {
     BdrvAioNotifier *ban, *ban_tmp;
 
diff --git a/block/io.c b/block/io.c
index ca2dca3007..8f6af6077b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3137,10 +3137,22 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
     return true;
 }
 
+static QemuSpin notifiers_spin_lock;
+
 void bdrv_add_before_write_notifier(BlockDriverState *bs,
                                     NotifierWithReturn *notifier)
 {
+    qemu_spin_lock(&notifiers_spin_lock);
     notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
+    qemu_spin_unlock(&notifiers_spin_lock);
+}
+
+void bdrv_remove_before_write_notifier(BlockDriverState *bs,
+                                       NotifierWithReturn *notifier)
+{
+    qemu_spin_lock(&notifiers_spin_lock);
+    notifier_with_return_remove(notifier);
+    qemu_spin_unlock(&notifiers_spin_lock);
 }
 
 void bdrv_io_plug(BlockDriverState *bs)
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 77c74bdaa7..b87b749b02 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -32,7 +32,7 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
 static void write_threshold_disable(BlockDriverState *bs)
 {
     if (bdrv_write_threshold_is_set(bs)) {
-        notifier_with_return_remove(&bs->write_threshold_notifier);
+        bdrv_remove_before_write_notifier(bs, &bs->write_threshold_notifier);
         bs->write_threshold_offset = 0;
     }
 }
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..a1aad5ad2d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1089,6 +1089,8 @@ bool bdrv_backing_overridden(BlockDriverState *bs);
 
 /**
  * bdrv_add_before_write_notifier:
+ * @bs: The #BlockDriverState for which to register the notifier
+ * @notifier: The notifier to add
  *
  * Register a callback that is invoked before write requests are processed but
  * after any throttling or waiting for overlapping requests.
@@ -1096,6 +1098,41 @@ bool bdrv_backing_overridden(BlockDriverState *bs);
 void bdrv_add_before_write_notifier(BlockDriverState *bs,
                                     NotifierWithReturn *notifier);
 
+/**
+ * bdrv_remove_before_write_notifier:
+ * @bs: The #BlockDriverState for which to register the notifier
+ * @notifier: The notifier to add
+ *
+ * Unregister a callback that is invoked before write requests are processed but
+ * after any throttling or waiting for overlapping requests.
+ *
+ * Note that more I/O could be pending on @bs.  You need to wait for
+ * it to finish, for example with bdrv_drain(), before freeing @notifier.
+ */
+void bdrv_remove_before_write_notifier(BlockDriverState *bs,
+                                       NotifierWithReturn *notifier);
+
+/**
+ * bdrv_detach_aio_context:
+ *
+ * May be called from .bdrv_detach_aio_context() to detach children from the
+ * current #AioContext.  This is only needed by block drivers that manage their
+ * own children.  Both ->file and ->backing are automatically handled and
+ * block drivers should not call this function on them explicitly.
+ */
+void bdrv_detach_aio_context(BlockDriverState *bs);
+
+/**
+ * bdrv_attach_aio_context:
+ *
+ * May be called from .bdrv_attach_aio_context() to attach children to the new
+ * #AioContext.  This is only needed by block drivers that manage their own
+ * children.  Both ->file and ->backing are automatically handled and block
+ * drivers should not call this function on them explicitly.
+ */
+void bdrv_attach_aio_context(BlockDriverState *bs,
+                             AioContext *new_context);
+
 /**
  * bdrv_add_aio_context_notifier:
  *
-- 
2.30.2


