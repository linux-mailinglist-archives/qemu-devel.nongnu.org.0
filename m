Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E757952515F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:37:06 +0200 (CEST)
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAsD-0000mc-FS
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApY-00069G-GZ
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApW-0003Pv-2d
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFCLKVLT3fV8vMr/G2rFQwUvAvQqi6JrN6pAE+j38Q0=;
 b=fhDApdPgXKIOVbMQFrc1/jiV6rghbb4fM45RhF7zojtTjIeOrvgmMwov1kr+6mxTM5ZdL7
 gILKC4tyRNKFYmq/By2zx4eJDbbTlqkoXRyI31KcdabKNZoMEEmG7d8qOpOGeJviDT5wSX
 xqZqQLHXLzrurIMUQoCZ/mk4bcdC+zk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-YSBgTecQMOGRacbW3y2kig-1; Thu, 12 May 2022 11:34:14 -0400
X-MC-Unique: YSBgTecQMOGRacbW3y2kig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3874296A607;
 Thu, 12 May 2022 15:34:13 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1599C401E9D;
 Thu, 12 May 2022 15:34:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 01/10] coroutine: Rename qemu_coroutine_inc/dec_pool_size()
Date: Thu, 12 May 2022 17:33:52 +0200
Message-Id: <20220512153401.202863-2-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's true that these functions currently affect the batch size in which
coroutines are reused (i.e. moved from the global release pool to the
allocation pool of a specific thread), but this is a bug and will be
fixed in a separate patch.

In fact, the comment in the header file already just promises that it
influences the pool size, so reflect this in the name of the functions.
As a nice side effect, the shorter function name makes some line
wrapping unnecessary.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220510151020.105528-2-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/coroutine.h | 6 +++---
 hw/block/virtio-blk.c    | 6 ++----
 util/qemu-coroutine.c    | 4 ++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 284571badb..031cf23711 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -334,12 +334,12 @@ void coroutine_fn yield_until_fd_readable(int fd);
 /**
  * Increase coroutine pool size
  */
-void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
+void qemu_coroutine_inc_pool_size(unsigned int additional_pool_size);
 
 /**
- * Devcrease coroutine pool size
+ * Decrease coroutine pool size
  */
-void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
+void qemu_coroutine_dec_pool_size(unsigned int additional_pool_size);
 
 #include "qemu/lockable.h"
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 540c38f829..6a1cc41877 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1215,8 +1215,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < conf->num_queues; i++) {
         virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_output);
     }
-    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->queue_size
-                                            / 2);
+    qemu_coroutine_inc_pool_size(conf->num_queues * conf->queue_size / 2);
     virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -1253,8 +1252,7 @@ static void virtio_blk_device_unrealize(DeviceState *dev)
     for (i = 0; i < conf->num_queues; i++) {
         virtio_del_queue(vdev, i);
     }
-    qemu_coroutine_decrease_pool_batch_size(conf->num_queues * conf->queue_size
-                                            / 2);
+    qemu_coroutine_dec_pool_size(conf->num_queues * conf->queue_size / 2);
     qemu_del_vm_change_state_handler(s->change);
     blockdev_mark_auto_del(s->blk);
     virtio_cleanup(vdev);
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index f3e8300c8d..ea23929a74 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -212,12 +212,12 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
     return co->ctx;
 }
 
-void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size)
+void qemu_coroutine_inc_pool_size(unsigned int additional_pool_size)
 {
     qatomic_add(&pool_batch_size, additional_pool_size);
 }
 
-void qemu_coroutine_decrease_pool_batch_size(unsigned int removing_pool_size)
+void qemu_coroutine_dec_pool_size(unsigned int removing_pool_size)
 {
     qatomic_sub(&pool_batch_size, removing_pool_size);
 }
-- 
2.35.3


