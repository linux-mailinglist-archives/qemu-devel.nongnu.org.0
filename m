Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625245D326
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 03:22:38 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq4PF-0006QS-EF
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 21:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mq4Nv-0004yE-Nd
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 21:21:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mq4Nt-0001RB-Bd
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 21:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637806867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quq+y/NQON/YkZHdv74O20T+OJql1hEHRE0MlFQ12qE=;
 b=gEWrfgI1oPO01ZHu0nQCpoN4rgCMDVu2+qUOzfD0TnoG5LLjn/tRoONv/T9ftTaNxZDZ6x
 BA0mAgNf67HDDrI99ouT3HJiAGkbsTBgi2JkLnPbshIkqLRUij4UGslcV1LXPunHEUPXVZ
 2PYJ9U2Yu76MzWAYO+gDMi15gWIyfVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-V3yTwj4KNumhjSSquoaSuA-1; Wed, 24 Nov 2021 21:21:02 -0500
X-MC-Unique: V3yTwj4KNumhjSSquoaSuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2AD78042E2;
 Thu, 25 Nov 2021 02:21:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-40.pek2.redhat.com [10.72.13.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE2160C05;
 Thu, 25 Nov 2021 02:20:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	david@redhat.com
Subject: [PATCH 2/2] virtio-balloon: correct used length
Date: Thu, 25 Nov 2021 10:20:46 +0800
Message-Id: <20211125022046.10433-2-jasowang@redhat.com>
In-Reply-To: <20211125022046.10433-1-jasowang@redhat.com>
References: <20211125022046.10433-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mpe@ellerman.id.au, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spec said:

"and len the total of bytes written into the buffer."

For inflateq, deflateq and statsq, we don't process in_sg so the used
length should be zero. For free_page_vq, since the pages could be
changed in the destination, we should make all pages used for safety.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-balloon.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 17de2558cb..fb4426ac0c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
         return;
     }
 
-    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
+    virtqueue_push(s->svq, s->stats_vq_elem, 0);
     virtio_notify(vdev, s->svq);
     g_free(s->stats_vq_elem);
     s->stats_vq_elem = NULL;
@@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
             memory_region_unref(section.mr);
         }
 
-        virtqueue_push(vq, elem, offset);
+        virtqueue_push(vq, elem, 0);
         virtio_notify(vdev, vq);
         g_free(elem);
         virtio_balloon_pbp_free(&pbp);
@@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtQueue *vq = dev->free_page_vq;
     bool ret = true;
+    size_t used = 0;
     int i;
 
     while (dev->block_iothread) {
@@ -548,11 +549,12 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
         for (i = 0; i < elem->in_num; i++) {
             qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
                                       elem->in_sg[i].iov_len);
+            used += elem->in_sg[i].iov_len;
         }
     }
 
 out:
-    virtqueue_push(vq, elem, 1);
+    virtqueue_push(vq, elem, used);
     g_free(elem);
     return ret;
 }
-- 
2.25.1


