Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7C36F99D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:51:37 +0200 (CEST)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRgG-0005bN-54
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm8-0005cp-SF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm2-00033Z-4f
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpIMkvDE1/MvEqZPHsVtsIy/HkcHhuurWSDBt05hmRE=;
 b=Ee0eICaVZQyU23wIwo2dfj1rJB1h1Z0V7Bh0poDv5IWe4lplPQiohbgDWM6D1znxiddtNm
 AFvfN4VY0voc4rfjXaNn+kNSbKHrd++kRmVFbnSVeuuJvhVKVygf9aS0NkS2BFAr9LARA2
 m9DMOai3uBk4d/B4GX/PC5lCX91X4a8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-2QcoUOdjOBKilK6Uv8IJrw-1; Fri, 30 Apr 2021 06:53:27 -0400
X-MC-Unique: 2QcoUOdjOBKilK6Uv8IJrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 903EA9196B2;
 Fri, 30 Apr 2021 10:53:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0BB35F707;
 Fri, 30 Apr 2021 10:53:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 36/39] block: refactor bdrv_node_check_perm()
Date: Fri, 30 Apr 2021 12:51:44 +0200
Message-Id: <20210430105147.125840-37-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Now, bdrv_node_check_perm() is called only with fresh cumulative
permissions, so its actually "refresh_perm".

Move permission calculation to the function. Also, drop unreachable
error message and rewrite the remaining one to be more generic (as now
we don't know which node is added and which was already here).

Add also Virtuozzo copyright, as big work is done at this point.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-37-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                | 38 +++++++++++---------------------------
 tests/qemu-iotests/245 |  2 +-
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/block.c b/block.c
index df8fa6003c..874c22c43e 100644
--- a/block.c
+++ b/block.c
@@ -2,6 +2,7 @@
  * QEMU System Emulator block driver
  *
  * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2020 Virtuozzo International GmbH.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -2270,22 +2271,18 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
 }
 
 /*
- * Check whether permissions on this node can be changed in a way that
- * @cumulative_perms and @cumulative_shared_perms are the new cumulative
- * permissions of all its parents. This involves checking whether all necessary
- * permission changes to child nodes can be performed.
- *
- * A call to this function must always be followed by a call to bdrv_set_perm()
- * or bdrv_abort_perm_update().
+ * Refresh permissions in @bs subtree. The function is intended to be called
+ * after some graph modification that was done without permission update.
  */
-static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                uint64_t cumulative_perms,
-                                uint64_t cumulative_shared_perms,
-                                Transaction *tran, Error **errp)
+static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
 
     /* Write permissions never work with read-only images */
     if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
@@ -2294,15 +2291,8 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         if (!bdrv_is_writable_after_reopen(bs, NULL)) {
             error_setg(errp, "Block node is read-only");
         } else {
-            uint64_t current_perms, current_shared;
-            bdrv_get_cumulative_perm(bs, &current_perms, &current_shared);
-            if (current_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
-                error_setg(errp, "Cannot make block node read-only, there is "
-                           "a writer on it");
-            } else {
-                error_setg(errp, "Cannot make block node read-only and create "
-                           "a writer on it");
-            }
+            error_setg(errp, "Read-only block node '%s' cannot support "
+                       "read-write users", bdrv_get_node_name(bs));
         }
 
         return -EPERM;
@@ -2358,7 +2348,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
     int ret;
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
     for ( ; list; list = list->next) {
@@ -2368,12 +2357,7 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
             return -EINVAL;
         }
 
-        bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                 &cumulative_shared_perms);
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
+        ret = bdrv_node_refresh_perm(bs, q, tran, errp);
         if (ret < 0) {
             return ret;
         }
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 11104b9208..fc5297e268 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -905,7 +905,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can't reopen hd1 to read-only, as block-stream requires it to be
         # read-write
         self.reopen(opts['backing'], {'read-only': True},
-                    "Cannot make block node read-only, there is a writer on it")
+                    "Read-only block node 'hd1' cannot support read-write users")
 
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
-- 
2.30.2


