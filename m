Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41215621E77
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:22:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW17-0005QQ-Ob; Tue, 08 Nov 2022 16:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW11-0005JK-Nz
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0p-0008Oj-Eu
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAOhxaD0NGsnLQ/4hmxRnZgulgDvH30FUpAJSIzDbno=;
 b=FCuRDMucAOqXStWfslA+ddS3kN72RQ2VPZbxSNO+Mmtz3dMHnwmWrTvls99XDOB+wgA5Se
 XRmebMAzbYuA/Lh9m1TMqkkmCRNjRb5dmPdB0L1S3bLrP+Xz8aTiivNeWVp3Z+yURr5GkJ
 jo/DyLOc2j6JHRM/N1okKY8YQcezYhQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-FdPsbsutOwqigapmKtqTRQ-1; Tue, 08 Nov 2022 16:19:58 -0500
X-MC-Unique: FdPsbsutOwqigapmKtqTRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 602AC29324BA;
 Tue,  8 Nov 2022 21:19:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA84DC15BB5;
 Tue,  8 Nov 2022 21:19:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 6/8] virtio-blk: remove unnecessary AioContext lock from
 function already safe
Date: Tue,  8 Nov 2022 16:19:28 -0500
Message-Id: <20221108211930.876142-7-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

AioContext lock was introduced in b9e413dd375 and in this instance
it is used to protect these 3 functions:
- virtio_blk_handle_rw_error
- virtio_blk_req_complete
- block_acct_done

Now that all three of the above functions are protected with
their own locks, we can get rid of the AioContext lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609143727.1151816-9-eesposit@redhat.com>
---
 hw/block/virtio-blk.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f8fcf25292..faea045178 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -108,7 +108,6 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
 
     IO_CODE();
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (next) {
         VirtIOBlockReq *req = next;
         next = req->mr_next;
@@ -141,7 +140,6 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->blk), &req->acct);
         virtio_blk_free_request(req);
     }
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static void virtio_blk_flush_complete(void *opaque, int ret)
@@ -150,20 +148,16 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
     VirtIOBlock *s = req->dev;
 
     IO_CODE();
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
 
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, 0, true)) {
-            goto out;
+            return;
         }
     }
 
     virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
     block_acct_done(blk_get_stats(s->blk), &req->acct);
     virtio_blk_free_request(req);
-
-out:
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
@@ -174,11 +168,10 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
                             ~VIRTIO_BLK_T_BARRIER) == VIRTIO_BLK_T_WRITE_ZEROES;
 
     IO_CODE();
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
 
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, false, is_write_zeroes)) {
-            goto out;
+            return;
         }
     }
 
@@ -187,9 +180,6 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->blk), &req->acct);
     }
     virtio_blk_free_request(req);
-
-out:
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 #ifdef __linux__
@@ -238,10 +228,8 @@ static void virtio_blk_ioctl_complete(void *opaque, int status)
     virtio_stl_p(vdev, &scsi->data_len, hdr->dxfer_len);
 
 out:
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
     g_free(ioctl_req);
 }
 
@@ -852,7 +840,6 @@ static void virtio_blk_dma_restart_bh(void *opaque)
 
     s->rq = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (req) {
         VirtIOBlockReq *next = req->next;
         if (virtio_blk_handle_request(req, &mrb)) {
@@ -876,8 +863,6 @@ static void virtio_blk_dma_restart_bh(void *opaque)
 
     /* Paired with inc in virtio_blk_dma_restart_cb() */
     blk_dec_in_flight(s->conf.conf.blk);
-
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 /*
-- 
2.38.1


