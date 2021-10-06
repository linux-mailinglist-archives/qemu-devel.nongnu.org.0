Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77A423BFB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:08:25 +0200 (CEST)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4md-00015X-OM
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eJ-0008C0-3G
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eF-00062F-9j
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vx3OcyrLTGboCEi9qWxoNVp9d9HAIuZjXKNNyT5t1nE=;
 b=ifqxW81+n2h7wqBUOzj/P0F4HXcinVtIkBRGXWPZBETck2KYxy5YUpBm1+redpB1v3kLqa
 aA4Db/lZVA0rwA4HCiLroGdfoCocn1rSvy3npgWFEgHrw+N3RtRq2r4u/MtaTh6TlhtS4J
 r1aTdNbwO1u0dWeKpt0nUhvH8VINsck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-2gWQ_3DIPEW6q26p2kJLzw-1; Wed, 06 Oct 2021 06:59:39 -0400
X-MC-Unique: 2gWQ_3DIPEW6q26p2kJLzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69EBA180830E;
 Wed,  6 Oct 2021 10:59:38 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A533860BE5;
 Wed,  6 Oct 2021 10:59:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/13] block: implement bdrv_new_open_driver_opts()
Date: Wed,  6 Oct 2021 12:59:13 +0200
Message-Id: <20211006105923.223549-4-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add version of bdrv_new_open_driver() that supports QDict options.
We'll use it in further commit.

Simply add one more argument to bdrv_new_open_driver() is worse, as
there are too many invocations of bdrv_new_open_driver() to update
then.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210920115538.264372-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  4 ++++
 block.c               | 25 +++++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index ab987e8a99..e5dd22b034 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -383,6 +383,10 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp);
+BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
+                                            const char *node_name,
+                                            QDict *options, int flags,
+                                            Error **errp);
 BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
                                        int flags, Error **errp);
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
diff --git a/block.c b/block.c
index 5ce08a79fd..917fb7faca 100644
--- a/block.c
+++ b/block.c
@@ -1604,16 +1604,26 @@ open_failed:
     return ret;
 }
 
-BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
-                                       int flags, Error **errp)
+/*
+ * Create and open a block node.
+ *
+ * @options is a QDict of options to pass to the block drivers, or NULL for an
+ * empty set of options. The reference to the QDict belongs to the block layer
+ * after the call (even on failure), so if the caller intends to reuse the
+ * dictionary, it needs to use qobject_ref() before calling bdrv_open.
+ */
+BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
+                                            const char *node_name,
+                                            QDict *options, int flags,
+                                            Error **errp)
 {
     BlockDriverState *bs;
     int ret;
 
     bs = bdrv_new();
     bs->open_flags = flags;
-    bs->explicit_options = qdict_new();
-    bs->options = qdict_new();
+    bs->options = options ?: qdict_new();
+    bs->explicit_options = qdict_clone_shallow(bs->options);
     bs->opaque = NULL;
 
     update_options_from_flags(bs->options, flags);
@@ -1631,6 +1641,13 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
     return bs;
 }
 
+/* Create and open a block node. */
+BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
+                                       int flags, Error **errp)
+{
+    return bdrv_new_open_driver_opts(drv, node_name, NULL, flags, errp);
+}
+
 QemuOptsList bdrv_runtime_opts = {
     .name = "bdrv_common",
     .head = QTAILQ_HEAD_INITIALIZER(bdrv_runtime_opts.head),
-- 
2.31.1


