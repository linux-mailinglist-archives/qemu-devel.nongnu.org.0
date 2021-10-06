Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB00423C0F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:09:30 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4nh-0001zL-DT
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eO-0008PF-2w
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eM-00068X-99
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJlefR5PlnEMEY42gWpyOpsNck+2k5yLR/hav3y7Zvk=;
 b=V3mmrwTLhrzpRurCZVsozpAvR9IPDB5DbdCIq4Y4ci++R0fjAWv2KQCKsqK/pnUaRw0SHw
 PnffySnbkJGhVsOJLunv25HY11H1YH8g0muR4htXOYjcq6plScXl0735COcQUzb1oLQr2F
 9CLEq3rGSsxiAfTDP0TQhIeOfT9Eu8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-HAeiBhdzMpSSKfjZx8OzFg-1; Wed, 06 Oct 2021 06:59:48 -0400
X-MC-Unique: HAeiBhdzMpSSKfjZx8OzFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70D76362F9;
 Wed,  6 Oct 2021 10:59:47 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4C160BE5;
 Wed,  6 Oct 2021 10:59:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/13] block: bdrv_insert_node(): don't use bdrv_open()
Date: Wed,  6 Oct 2021 12:59:16 +0200
Message-Id: <20211006105923.223549-7-kwolf@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use bdrv_new_open_driver_opts() instead of complicated bdrv_open().

Among other extra things bdrv_open() also check for white-listed
formats, which we don't want for internal node creation: currently
backup doesn't work when copy-before-write filter is not white-listed.
As well block-stream doesn't work when copy-on-read is not
white-listed.

Fixes: 751cec7a261adaf1145dc7adf6de7c9c084e5a0b
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2004812
Reported-by: Yanan Fu
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210920115538.264372-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 3a90407b83..45f653a88b 100644
--- a/block.c
+++ b/block.c
@@ -5133,12 +5133,30 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 {
     ERRP_GUARD();
     int ret;
-    BlockDriverState *new_node_bs;
+    BlockDriverState *new_node_bs = NULL;
+    const char *drvname, *node_name;
+    BlockDriver *drv;
+
+    drvname = qdict_get_try_str(options, "driver");
+    if (!drvname) {
+        error_setg(errp, "driver is not specified");
+        goto fail;
+    }
+
+    drv = bdrv_find_format(drvname);
+    if (!drv) {
+        error_setg(errp, "Unknown driver: '%s'", drvname);
+        goto fail;
+    }
 
-    new_node_bs = bdrv_open(NULL, NULL, options, flags, errp);
-    if (new_node_bs == NULL) {
+    node_name = qdict_get_try_str(options, "node-name");
+
+    new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
+                                            errp);
+    options = NULL; /* bdrv_new_open_driver() eats options */
+    if (!new_node_bs) {
         error_prepend(errp, "Could not create node: ");
-        return NULL;
+        goto fail;
     }
 
     bdrv_drained_begin(bs);
@@ -5147,11 +5165,15 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     if (ret < 0) {
         error_prepend(errp, "Could not replace node: ");
-        bdrv_unref(new_node_bs);
-        return NULL;
+        goto fail;
     }
 
     return new_node_bs;
+
+fail:
+    qobject_unref(options);
+    bdrv_unref(new_node_bs);
+    return NULL;
 }
 
 /*
-- 
2.31.1


