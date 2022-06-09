Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5585454FE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:32:13 +0200 (CEST)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNt6-00024n-3b
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLro-0007sH-QK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrd-0003ft-ON
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3ikKUwNOaWf07Mgq0iXgXgq0du0UqZuzpiPPuVZ5LA=;
 b=IzbFCXqZUE4kJ1gG8liVdDYQqdCuENEYMg57MJNMciAXbgmtBxZjHYq/uLP2RmRLcnC1wS
 +O7mqkHuraC0b4ijbce/z58jSfrOjicpFYIJwmDFN6E/sJ3WnuB7PCUDxqQrMxa2lX0keQ
 BjOU9i19rNja5x1UCl+CBNzqvX2Wwsw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-v7WETsGjOvOfqmfZdTyhxw-1; Thu, 09 Jun 2022 13:22:19 -0400
X-MC-Unique: v7WETsGjOvOfqmfZdTyhxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEEA93C02196;
 Thu,  9 Jun 2022 17:22:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27C2940D2827;
 Thu,  9 Jun 2022 17:22:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 07/18] block/export: Fix incorrect length passed to
 vu_queue_push()
Date: Thu,  9 Jun 2022 19:21:38 +0200
Message-Id: <20220609172149.293877-8-kwolf@redhat.com>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xie Yongji <xieyongji@bytedance.com>

Now the req->size is set to the correct value only
when handling VIRTIO_BLK_T_GET_ID request. This patch
fixes it.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Message-Id: <20220523084611.91-3-xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index b2e458ade3..19c6ee51d3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -60,8 +60,7 @@ static void vu_blk_req_complete(VuBlkReq *req)
 {
     VuDev *vu_dev = &req->server->vu_dev;
 
-    /* IO size with 1 extra status byte */
-    vu_queue_push(vu_dev, req->vq, &req->elem, req->size + 1);
+    vu_queue_push(vu_dev, req->vq, &req->elem, req->size);
     vu_queue_notify(vu_dev, req->vq);
 
     free(req);
@@ -207,6 +206,7 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
         goto err;
     }
 
+    req->size = iov_size(in_iov, in_num);
     /* We always touch the last byte, so just see how big in_iov is.  */
     req->in = (void *)in_iov[in_num - 1].iov_base
               + in_iov[in_num - 1].iov_len
@@ -267,7 +267,6 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
                           VIRTIO_BLK_ID_BYTES);
         snprintf(elem->in_sg[0].iov_base, size, "%s", "vhost_user_blk");
         req->in->status = VIRTIO_BLK_S_OK;
-        req->size = elem->in_sg[0].iov_len;
         break;
     }
     case VIRTIO_BLK_T_DISCARD:
-- 
2.35.3


