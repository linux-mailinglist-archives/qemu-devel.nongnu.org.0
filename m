Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB145B32D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 05:34:37 +0100 (CET)
Received: from localhost ([::1]:60036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpjzN-0002IV-Qb
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 23:34:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpjyH-0001cv-O5
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 23:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpjyE-0000oJ-0Q
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 23:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637728400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cz4C9ICJbfFoJ+uKyYJkRMG852Xf6E2zO2ZLRil5slQ=;
 b=B6nieM+J4P5luiLgv410HRCM5WibciBbMeX0Ct3aA1QccLiynZgqbOWKibL8MDELy7kD/d
 rR3bS2MRg/NOuu0xy+eRqLE74tBnAy857Nhtq3AcqcQe+W1H6geiMVitC8CuNROclfjnov
 YMSXm8LfctwceeovTvMr5i2+CRBEcMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-ZZvUaQe-Pt-v2xAsqcMRqA-1; Tue, 23 Nov 2021 23:33:17 -0500
X-MC-Unique: ZZvUaQe-Pt-v2xAsqcMRqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF47C1DDE4;
 Wed, 24 Nov 2021 04:33:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-249.pek2.redhat.com
 [10.72.13.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC41100EBBF;
 Wed, 24 Nov 2021 04:32:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	david@redhat.com
Subject: [PATCH] virtio-balloon: correct used length
Date: Wed, 24 Nov 2021 12:32:55 +0800
Message-Id: <20211124043255.6050-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
length should be zero. For free_page_vq, though the free pages are
supplied via in_sgs, zero used length should still be fine since
anyway driver is expected to use the length in this case and it
simplifies the error handling path.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-balloon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index c6962fcbfe..3e52daa793 100644
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
@@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     }
 
 out:
-    virtqueue_push(vq, elem, 1);
+    virtqueue_push(vq, elem, 0);
     g_free(elem);
     return ret;
 }
-- 
2.25.1


