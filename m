Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24A2460D9B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:44:48 +0100 (CET)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXax-0002cy-1D
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:44:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrX2O-00035o-TX
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrX2L-0000ou-AZ
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638155340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avrg3dpQNq2hHFheXi/6EAnTO7JoHuJKwJsiCrOlmEA=;
 b=G0y1QYOiKY3+fRpMZE3qpWfIKsrnIB9dntijAvctQnH7pT9v37H8BZFlL9tAXd+lzJwJc1
 6sUMn9r2R8cDlDszCgAmEugExqxgcKEheKmkuwRpabfK+Jz2mdqAibJe6drm4lnbw0a79P
 nNkOLTHiZPdUMsRqhka/aMzQJvWxNvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-bSF-MuR6PaGq5GyngrkY6w-1; Sun, 28 Nov 2021 22:08:57 -0500
X-MC-Unique: bSF-MuR6PaGq5GyngrkY6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 768AD1006AA0;
 Mon, 29 Nov 2021 03:08:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-14.pek2.redhat.com [10.72.13.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 663F460BF1;
 Mon, 29 Nov 2021 03:08:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	david@redhat.com
Subject: [PATCH V2 2/2] virtio-balloon: correct used length
Date: Mon, 29 Nov 2021 11:08:41 +0800
Message-Id: <20211129030841.3611-2-jasowang@redhat.com>
In-Reply-To: <20211129030841.3611-1-jasowang@redhat.com>
References: <20211129030841.3611-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, wei.w.wang@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spec said:

"and len the total of bytes written into the buffer."

For inflateq, deflateq and statsq, we don't process in_sg so the used
length should be zero. For free_page_vq, tough the pages could be
changed by the device (in the destination), spec said:

"Note: len is particularly useful for drivers using untrusted buffers:
if a driver does not know exactly how much has been written by the
device, the driver would have to zero the buffer in advance to ensure
no data leakage occurs."

So 0 should be used as well here.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since V1:
- use 0 as used length for free_page_vq
---
 hw/virtio/virtio-balloon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 17de2558cb..9a4f491b54 100644
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
@@ -552,7 +552,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     }
 
 out:
-    virtqueue_push(vq, elem, 1);
+    virtqueue_push(vq, elem, 0);
     g_free(elem);
     return ret;
 }
-- 
2.25.1


