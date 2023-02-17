Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295A69AF39
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:13:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Nc-0004w0-0z; Fri, 17 Feb 2023 10:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NR-0004lW-F4
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NO-0007P3-78
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiTZrW0RRTPJ4wOSvB/b4Nm9Q135Fpe5BIvpfu2NlIY=;
 b=DdfFtscgmudpBhWBJ7LhnvydwFEDGlvh02/tqm3E4WexDWVtgUrg/XY4gRCLurDGdrDNly
 yofyfCvKWaxN9jsnVafIkj8usQEfX4z8PRN880r0ppUOYge/e38+uF4QIFiXDVeG4noI15
 ORCi5revKP7moONKuSzwJQd+z9hIjrc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-axnr0bldPr2PASJ4vld9lA-1; Fri, 17 Feb 2023 10:10:11 -0500
X-MC-Unique: axnr0bldPr2PASJ4vld9lA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D94572807D72;
 Fri, 17 Feb 2023 15:10:10 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2884C492C14;
 Fri, 17 Feb 2023 15:10:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/22] qcow2: Fix open/create to open images with no_co_wrapper
Date: Fri, 17 Feb 2023 16:09:42 +0100
Message-Id: <20230217150954.283920-10-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

.bdrv_co_create implementations run in a coroutine, as does
qcow2_do_open(). Therefore they are not allowed to open images directly.
Fix the calls to use the corresponding no_co_wrappers instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230126172432.436111-7-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 21aa4c6b7a..ee0e5b45cc 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1617,9 +1617,9 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     if (open_data_file) {
         /* Open external data file */
-        s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
-                                       &child_of_bds, BDRV_CHILD_DATA,
-                                       true, errp);
+        s->data_file = bdrv_co_open_child(NULL, options, "data-file", bs,
+                                          &child_of_bds, BDRV_CHILD_DATA,
+                                          true, errp);
         if (*errp) {
             ret = -EINVAL;
             goto fail;
@@ -1627,9 +1627,10 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
         if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
             if (!s->data_file && s->image_data_file) {
-                s->data_file = bdrv_open_child(s->image_data_file, options,
-                                               "data-file", bs, &child_of_bds,
-                                               BDRV_CHILD_DATA, false, errp);
+                s->data_file = bdrv_co_open_child(s->image_data_file, options,
+                                                  "data-file", bs,
+                                                  &child_of_bds,
+                                                  BDRV_CHILD_DATA, false, errp);
                 if (!s->data_file) {
                     ret = -EINVAL;
                     goto fail;
@@ -3454,7 +3455,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     assert(create_options->driver == BLOCKDEV_DRIVER_QCOW2);
     qcow2_opts = &create_options->u.qcow2;
 
-    bs = bdrv_open_blockdev_ref(qcow2_opts->file, errp);
+    bs = bdrv_co_open_blockdev_ref(qcow2_opts->file, errp);
     if (bs == NULL) {
         return -EIO;
     }
@@ -3596,7 +3597,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             ret = -EINVAL;
             goto out;
         }
-        data_bs = bdrv_open_blockdev_ref(qcow2_opts->data_file, errp);
+        data_bs = bdrv_co_open_blockdev_ref(qcow2_opts->data_file, errp);
         if (data_bs == NULL) {
             ret = -EIO;
             goto out;
@@ -3629,8 +3630,8 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     }
 
     /* Create BlockBackend to write to the image */
-    blk = blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL,
-                          errp);
+    blk = blk_co_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL,
+                             errp);
     if (!blk) {
         ret = -EPERM;
         goto out;
@@ -3712,9 +3713,9 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     if (data_bs) {
         qdict_put_str(options, "data-file", data_bs->node_name);
     }
-    blk = blk_new_open(NULL, NULL, options,
-                       BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_NO_FLUSH,
-                       errp);
+    blk = blk_co_new_open(NULL, NULL, options,
+                          BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_NO_FLUSH,
+                          errp);
     if (blk == NULL) {
         ret = -EIO;
         goto out;
@@ -3793,9 +3794,9 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     if (data_bs) {
         qdict_put_str(options, "data-file", data_bs->node_name);
     }
-    blk = blk_new_open(NULL, NULL, options,
-                       BDRV_O_RDWR | BDRV_O_NO_BACKING | BDRV_O_NO_IO,
-                       errp);
+    blk = blk_co_new_open(NULL, NULL, options,
+                          BDRV_O_RDWR | BDRV_O_NO_BACKING | BDRV_O_NO_IO,
+                          errp);
     if (blk == NULL) {
         ret = -EIO;
         goto out;
@@ -3877,8 +3878,8 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
         goto finish;
     }
 
-    bs = bdrv_open(filename, NULL, NULL,
-                   BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL, errp);
+    bs = bdrv_co_open(filename, NULL, NULL,
+                      BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL, errp);
     if (bs == NULL) {
         ret = -EIO;
         goto finish;
@@ -3892,9 +3893,9 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
             goto finish;
         }
 
-        data_bs = bdrv_open(val, NULL, NULL,
-                            BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL,
-                            errp);
+        data_bs = bdrv_co_open(val, NULL, NULL,
+                               BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL,
+                               errp);
         if (data_bs == NULL) {
             ret = -EIO;
             goto finish;
-- 
2.39.2


