Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91736E8074
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:34:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBcZ-0004V8-76; Wed, 19 Apr 2023 13:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBcW-0004M8-Kc
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBcV-0002Mp-40
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681925366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qs0Wu6hxc7j58DwPPRdDhx+qIxo2MCSBXMmfJ14jr7A=;
 b=P81Hbad2MkrxYTfi71uOxxkGaggxm+9W6bTi5GM2BTkPDcPFnK7pF6YXAlQOQkOq/8nV1O
 hWV0a02+t5ibJI9zvKkiL8RyS6ToCmoM4vuje/hz+FkZktCEZmssTifAfPzGl6DH0z5Wb/
 GjxSdH06n467P6qYOIzjoaC5c7SG0UE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-UORK3zzVOxmLu7977uaTMQ-1; Wed, 19 Apr 2023 13:29:22 -0400
X-MC-Unique: UORK3zzVOxmLu7977uaTMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59D9D1C189A4;
 Wed, 19 Apr 2023 17:29:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8045B40C2064;
 Wed, 19 Apr 2023 17:29:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 16/16] virtio: make it possible to detach host notifier
 from any thread
Date: Wed, 19 Apr 2023 13:28:17 -0400
Message-Id: <20230419172817.272758-17-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

virtio_queue_aio_detach_host_notifier() does two things:
1. It removes the fd handler from the event loop.
2. It processes the virtqueue one last time.

The first step can be peformed by any thread and without taking the
AioContext lock.

The second step may need the AioContext lock (depending on the device
implementation) and runs in the thread where request processing takes
place. virtio-blk and virtio-scsi therefore call
virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
AioContext

Scheduling a BH is undesirable for .drained_begin() functions. The next
patch will introduce a .drained_begin() function that needs to call
virtio_queue_aio_detach_host_notifier().

Move the virtqueue processing out to the callers of
virtio_queue_aio_detach_host_notifier() so that the function can be
called from any thread. This is in preparation for the next patch.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 2 ++
 hw/scsi/virtio-scsi-dataplane.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index b28d81737e..bd7cc6e76b 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -286,8 +286,10 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
 
     for (i = 0; i < s->conf->num_queues; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
+        EventNotifier *host_notifier = virtio_queue_get_host_notifier(vq);
 
         virtio_queue_aio_detach_host_notifier(vq, s->ctx);
+        virtio_queue_host_notifier_read(host_notifier);
     }
 }
 
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 20bb91766e..81643445ed 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -71,12 +71,21 @@ static void virtio_scsi_dataplane_stop_bh(void *opaque)
 {
     VirtIOSCSI *s = opaque;
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
+    EventNotifier *host_notifier;
     int i;
 
     virtio_queue_aio_detach_host_notifier(vs->ctrl_vq, s->ctx);
+    host_notifier = virtio_queue_get_host_notifier(vs->ctrl_vq);
+    virtio_queue_host_notifier_read(host_notifier);
+
     virtio_queue_aio_detach_host_notifier(vs->event_vq, s->ctx);
+    host_notifier = virtio_queue_get_host_notifier(vs->event_vq);
+    virtio_queue_host_notifier_read(host_notifier);
+
     for (i = 0; i < vs->conf.num_queues; i++) {
         virtio_queue_aio_detach_host_notifier(vs->cmd_vqs[i], s->ctx);
+        host_notifier = virtio_queue_get_host_notifier(vs->cmd_vqs[i]);
+        virtio_queue_host_notifier_read(host_notifier);
     }
 }
 
-- 
2.39.2


