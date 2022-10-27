Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57840610149
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:14:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7ih-00071z-D6; Thu, 27 Oct 2022 14:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gb-0001xd-QF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gV-0002ZB-Bp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oj07waJznpmxRC3AVRRFQ8nG585N3UiGu08H7ILbXNk=;
 b=MMKbrKrefJ8wOG7Jw6NF90njIK0Ctu9U5w1cbgbmL1Yy+eLjGS0oncN7ELaQnLqb0vhHBE
 KYLE3Jw12NCgAlpFIF6LiCAsvxV4EkVRfNCYhE8xJVc3jauUHs5NZFeAVSuijeO0rBUvlk
 1NQLXGjQgfwUGgYR26p7ZE3bDkP3NT4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-a8t-VFNEPKSHjCJLuU6V0Q-1; Thu, 27 Oct 2022 14:32:52 -0400
X-MC-Unique: a8t-VFNEPKSHjCJLuU6V0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C4323802B86;
 Thu, 27 Oct 2022 18:32:51 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9D5C1121320;
 Thu, 27 Oct 2022 18:32:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 41/58] block: add missing coroutine_fn annotation to
 BlockDriverState callbacks
Date: Thu, 27 Oct 2022 20:31:29 +0200
Message-Id: <20221027183146.463129-42-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-9-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h                    | 14 +++++++-------
 include/block/block_int-common.h | 12 +++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 3e7c5e80b6..ad6e7f65bd 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -991,13 +991,13 @@ int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
 bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
-bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
-                                         const char *name,
-                                         uint32_t granularity,
-                                         Error **errp);
-int qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
-                                            const char *name,
-                                            Error **errp);
+bool coroutine_fn qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                      const char *name,
+                                                      uint32_t granularity,
+                                                      Error **errp);
+int coroutine_fn qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                                         const char *name,
+                                                         Error **errp);
 bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs);
 uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
                                                 uint32_t cluster_size);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c756b838e8..afce4f8c0a 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -745,13 +745,11 @@ struct BlockDriver {
     void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
-    bool (*bdrv_co_can_store_new_dirty_bitmap)(BlockDriverState *bs,
-                                               const char *name,
-                                               uint32_t granularity,
-                                               Error **errp);
-    int (*bdrv_co_remove_persistent_dirty_bitmap)(BlockDriverState *bs,
-                                                  const char *name,
-                                                  Error **errp);
+    bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, uint32_t granularity,
+        Error **errp);
+    int coroutine_fn (*bdrv_co_remove_persistent_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, Error **errp);
 };
 
 static inline bool block_driver_can_compress(BlockDriver *drv)
-- 
2.37.3


