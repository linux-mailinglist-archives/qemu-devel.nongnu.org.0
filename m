Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753C62C069
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:05:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImu-0000g6-Er; Wed, 16 Nov 2022 08:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImn-0000cs-1k
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-000819-2A
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YodyfMR91zUtXAX62Pz3ns6A49aC6vibiZQM3eutBso=;
 b=dbf1ilFy1v0Ri2hrz781pt3VZp5OV1NeK78mcjUPoLQJQL/hG9Y4JuOvWEPSIibmVX7w8D
 Qpnq0GKU2Nb+a/3dQGDZX3mngTbyC7+J0gHjAPRKPBQAP/bgVvhEFz8k43Si80HRgU1GJK
 0AWQ3VM2nYrk/GlBawwqPM9H0vmfTEk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-K-PADszPPMa6ediZQhQcrw-1; Wed, 16 Nov 2022 08:48:59 -0500
X-MC-Unique: K-PADszPPMa6ediZQhQcrw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A8708582B9;
 Wed, 16 Nov 2022 13:48:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D61C4A9268;
 Wed, 16 Nov 2022 13:48:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 19/20] block-gen: assert that bdrv_co_ioctl is always called
 with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:49 -0500
Message-Id: <20221116134850.3051419-20-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

The only caller of this function is blk_ioctl, a generated_co_wrapper
functions that needs to take the graph read lock.

Protecting bdrv_co_ioctl() implies that
BlockDriver->bdrv_co_ioctl() is always called with
graph rdlock taken, and BlockDriver->bdrv_aio_ioctl is
a coroutine_fn callback (called too with rdlock taken).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 1 +
 block/io.c                       | 1 +
 include/block/block_int-common.h | 5 +++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 20b772a476..9e1c689e84 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1672,6 +1672,7 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
diff --git a/block/io.c b/block/io.c
index c5b3bb0a6d..831f277e85 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3007,6 +3007,7 @@ int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
     };
     BlockAIOCB *acb;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     bdrv_inc_in_flight(bs);
     if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 9d9cd59f1e..db97d61836 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -743,10 +743,11 @@ struct BlockDriver {
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
     void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
-    /* to control generic scsi devices */
-    BlockAIOCB *(*bdrv_aio_ioctl)(BlockDriverState *bs,
+    /* to control generic scsi devices. Called with graph rdlock taken. */
+    BlockAIOCB *coroutine_fn (*bdrv_aio_ioctl)(BlockDriverState *bs,
         unsigned long int req, void *buf,
         BlockCompletionFunc *cb, void *opaque);
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_ioctl)(BlockDriverState *bs,
                                       unsigned long int req, void *buf);
 
-- 
2.31.1


