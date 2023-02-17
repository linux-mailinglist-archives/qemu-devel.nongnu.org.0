Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69269AF2F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2NV-0004mu-06; Fri, 17 Feb 2023 10:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NO-0004ii-5q
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NK-0007Oa-97
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=71ELHRPewmVVyNSxCu44M+nRY2oMMDEnwJCYgAMCEMY=;
 b=SRgoZmLWTQox2UxH47XxkMKjEfsic5ViADIeDB4wYWe7nzZahsuuHIm2s/MUHdlhHnK2iW
 AB2+KIG0bCuRdC9OCG5KfZ5JYFsQba8RhV7iCGbq6Jx6VAne1xEFbWK/8fn5St6vdGRLSX
 AdMZ84RB4aekiRwLL9MBxwFJsrmnYmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-LMREUvmZM66e1f8lEfBtnQ-1; Fri, 17 Feb 2023 10:10:10 -0500
X-MC-Unique: LMREUvmZM66e1f8lEfBtnQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9215100F906;
 Fri, 17 Feb 2023 15:10:09 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34953492C14;
 Fri, 17 Feb 2023 15:10:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/22] qcow: Fix .bdrv_co_create(_opts) to open images with
 no_co_wrapper
Date: Fri, 17 Feb 2023 16:09:41 +0100
Message-Id: <20230217150954.283920-9-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

.bdrv_co_create implementations run in a coroutine. Therefore they are
not allowed to open images directly. Fix the calls to use the
corresponding no_co_wrappers instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230126172432.436111-6-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index 5f0801f545..20c53b447b 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -833,13 +833,13 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     }
 
     /* Create BlockBackend to write to the image */
-    bs = bdrv_open_blockdev_ref(qcow_opts->file, errp);
+    bs = bdrv_co_open_blockdev_ref(qcow_opts->file, errp);
     if (bs == NULL) {
         return -EIO;
     }
 
-    qcow_blk = blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE,
-                               BLK_PERM_ALL, errp);
+    qcow_blk = blk_co_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE,
+                                  BLK_PERM_ALL, errp);
     if (!qcow_blk) {
         ret = -EPERM;
         goto exit;
@@ -978,8 +978,8 @@ static int coroutine_fn qcow_co_create_opts(BlockDriver *drv,
         goto fail;
     }
 
-    bs = bdrv_open(filename, NULL, NULL,
-                   BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL, errp);
+    bs = bdrv_co_open(filename, NULL, NULL,
+                      BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL, errp);
     if (bs == NULL) {
         ret = -EIO;
         goto fail;
-- 
2.39.2


