Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B954518F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:08:27 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKhu-0000R0-E8
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI6-0002NY-2I
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI2-000722-O2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BM9aMGqOaRDN5U237HJSVr0+I59u3uXikeSGvgQOrR8=;
 b=bqB8MPzp50W7MYRMkdPii5QgI8yArwluFFRGsO1lptc0fa295V9SzbXRb7xDOh5WRAVFQx
 D8m/SNm2Wxhds5j2V+QAalQ7DcFRaQhRocKvUjm5fHIMAKi+V/nGLfcLOI22QmrSj57P5b
 i6ZolqE6sXqsULOn842DOVwJNJe+r6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-KJpGgirxN5C4YgzjaY6G9w-1; Thu, 09 Jun 2022 10:37:34 -0400
X-MC-Unique: KJpGgirxN5C4YgzjaY6G9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF20811E75;
 Thu,  9 Jun 2022 14:37:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A567492C3B;
 Thu,  9 Jun 2022 14:37:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 8/8] virtio-blk: remove unnecessary AioContext lock from
 function already safe
Date: Thu,  9 Jun 2022 10:37:27 -0400
Message-Id: <20220609143727.1151816-9-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

AioContext lock was introduced in b9e413dd375 and in this instance
it is used to protect these 3 functions:
- virtio_blk_handle_rw_error
- virtio_blk_req_complete
- block_acct_done

Now that all three of the above functions are protected with
their own locks, we can get rid of the AioContext lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/virtio-blk.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 88c61457e1..ce8efd8381 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -133,7 +133,6 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
 
     IO_CODE();
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (next) {
         VirtIOBlockReq *req = next;
         next = req->mr_next;
@@ -166,7 +165,6 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->blk), &req->acct);
         virtio_blk_free_request(req);
     }
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static void virtio_blk_flush_complete(void *opaque, int ret)
@@ -175,20 +173,16 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
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
@@ -199,11 +193,10 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
                             ~VIRTIO_BLK_T_BARRIER) == VIRTIO_BLK_T_WRITE_ZEROES;
 
     IO_CODE();
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
 
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, false, is_write_zeroes)) {
-            goto out;
+            return;
         }
     }
 
@@ -212,9 +205,6 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->blk), &req->acct);
     }
     virtio_blk_free_request(req);
-
-out:
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 #ifdef __linux__
@@ -263,10 +253,8 @@ static void virtio_blk_ioctl_complete(void *opaque, int status)
     virtio_stl_p(vdev, &scsi->data_len, hdr->dxfer_len);
 
 out:
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
     g_free(ioctl_req);
 }
 
@@ -873,7 +861,6 @@ void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
         s->rq = NULL;
     }
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (req) {
         VirtIOBlockReq *next = req->next;
         if (virtio_blk_handle_request(req, &mrb)) {
@@ -897,7 +884,6 @@ void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
     if (is_bh) {
         blk_dec_in_flight(s->conf.conf.blk);
     }
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 void virtio_blk_restart_bh(void *opaque)
-- 
2.31.1


