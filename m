Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3732DD3E3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:16:07 +0100 (CET)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpv0g-0008OL-Ms
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpumJ-0004O5-ST
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpum2-0007vd-TL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608217257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1Wf6LxNX59oifmSq/DRgXmalRIrEoTC3b8aEtFycaQ=;
 b=a3zu+aG9ijzCBOlDQ5EHxdy/nlgmRunYsaNuDxNuEqyMp9x+WricF2hIXRqQdsvYwSOQ9z
 zyK25t0ZSTJsn0F78Ragqg//iYzpPLF480m800wuT4TJW59VfyyQaiSH59vKAEMFEXTpEQ
 Dhbg6SiOdj7NA5bXulNcKdB8f/O88aY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-l57V8H3_MteDh4QUpzZk8g-1; Thu, 17 Dec 2020 10:00:51 -0500
X-MC-Unique: l57V8H3_MteDh4QUpzZk8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DC3259;
 Thu, 17 Dec 2020 15:00:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 038DA5D9CD;
 Thu, 17 Dec 2020 15:00:48 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtio-scsi: don't uninitialize queues that we didn't
 initialize
Date: Thu, 17 Dec 2020 17:00:39 +0200
Message-Id: <20201217150040.906961-3-mlevitsk@redhat.com>
In-Reply-To: <20201217150040.906961-1-mlevitsk@redhat.com>
References: <20201217150040.906961-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Count number of queues that we initialized and only deinitialize these that we
initialized successfully.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 2824a25b65..cd1e72d3f8 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -132,6 +132,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 {
     int i;
     int rc;
+    int vq_init_count = 0;
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
@@ -159,17 +160,22 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     if (rc) {
         goto fail_vrings;
     }
+
+    vq_init_count++;
     rc = virtio_scsi_vring_init(s, vs->event_vq, 1,
                                 virtio_scsi_data_plane_handle_event);
     if (rc) {
         goto fail_vrings;
     }
+
+    vq_init_count++;
     for (i = 0; i < vs->conf.num_queues; i++) {
         rc = virtio_scsi_vring_init(s, vs->cmd_vqs[i], i + 2,
                                     virtio_scsi_data_plane_handle_cmd);
         if (rc) {
             goto fail_vrings;
         }
+        vq_init_count++;
     }
 
     s->dataplane_starting = false;
@@ -180,7 +186,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 fail_vrings:
     aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
     aio_context_release(s->ctx);
-    for (i = 0; i < vs->conf.num_queues + 2; i++) {
+    for (i = 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
-- 
2.26.2


