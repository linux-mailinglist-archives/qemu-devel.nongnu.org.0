Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2996380DE3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:15:01 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaSq-0004LB-Ni
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIy-0006uh-L7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIp-0005Sw-5p
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cQaYFC3t+TSH7RoQdf99af99OWcYDg63VhEarxK2SMM=;
 b=hspEqsx9VB5p0hBHLshbHyeWRUuPd0OP/OVMtvcbr81sB/BpjCKyfCTX6Q28lpHVepI+Dw
 vHo+EThS7aZJWnk5Hl6n2y9iK/wMzgZkn5UTG5PaCdMA2X+DmgnNChA/zErWbz4b7wKZLV
 klMAm0mdDnn3PT/83HPKnbJW47aFSM0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-UoCK7IPTPWaZrd3e4qddoA-1; Fri, 14 May 2021 12:04:35 -0400
X-MC-Unique: UoCK7IPTPWaZrd3e4qddoA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso12862121wrf.7
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQaYFC3t+TSH7RoQdf99af99OWcYDg63VhEarxK2SMM=;
 b=RoBnz+/fqtFWrrV2SznRagTX1aj9sYTJTswXaIx6ZlXJ1zR96NoZeuxAV/Bpq0nLlS
 NedW9vUwIbWecJiATz628FcO6YPZlyyGCzsoKT+wsAlZv5P/5UU5+V26GhjFn2qX8t3d
 QlzwaSuRMPF+AOHyvwnpZ5Lpb39PdGZt7CT+DJWoUbddnAb1FA60ZWFiz5eMto+P03Rx
 KBkmg9ckBW929V6vGmzh+e9lUlvMvsybxwp4YPg3XhRX0PIhdS439NTO1xfYOFvVSBIy
 xfATp7xmPyzSfjxtMOSeIIPFjYnPJ31aE1pcg1HGSf49LAFpZQvpmpMcr3iokIAGXONP
 yMvg==
X-Gm-Message-State: AOAM531l7CyNo6HZV2+sVsRBT/4E4zmHY1pELmXr+h+wNCp1vQcZ7fM3
 VRE/a5yasoqEgHXbU4nbRhnfGyts4dHyyGsYr5efaXnzg4h4Uy1iK29RCXQhrSRMdv2WkHmKzlq
 mSb+DRrfEhqRlvrLfDt6xwKN27TeIQ+2cI/A4QDNt3UC8WqHaFbzC55/iucss
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr2033533wmj.160.1621008273595; 
 Fri, 14 May 2021 09:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy2LTW0gbcQxexWx0R3Y7q+uPsAM374WCoI3/QEQFE4L8jq4gYmZDD73nARFIbMNJCoBwZMQ==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr2033507wmj.160.1621008273423; 
 Fri, 14 May 2021 09:04:33 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id v10sm8142240wrq.0.2021.05.14.09.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:32 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] virtio-scsi: Set host notifiers and callbacks separately
Message-ID: <20210514160245.91918-11-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Host notifiers are guaranteed to be idle until the callbacks are
hooked up with virtio_queue_aio_set_host_notifier_handler(). They
thus don't need to be set or unset with the AioContext lock held.

Do this outside the critical section, like virtio-blk already
does : basically downgrading virtio_scsi_vring_init() to only
setup the host notifier and set the callback in the caller.

This will allow to batch addition/deletion of ioeventds in
a single memory transaction, which is expected to greatly
improve initialization time.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210407143501.244343-4-groug@kaod.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 40 ++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 4ad8793406..b2cb3d9dcc 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -94,8 +94,7 @@ static bool virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
     return progress;
 }
 
-static int virtio_scsi_vring_init(VirtIOSCSI *s, VirtQueue *vq, int n,
-                                  VirtIOHandleAIOOutput fn)
+static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(s)));
     int rc;
@@ -109,7 +108,6 @@ static int virtio_scsi_vring_init(VirtIOSCSI *s, VirtQueue *vq, int n,
         return rc;
     }
 
-    virtio_queue_aio_set_host_notifier_handler(vq, s->ctx, fn);
     return 0;
 }
 
@@ -154,38 +152,44 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
 
-    aio_context_acquire(s->ctx);
-    rc = virtio_scsi_vring_init(s, vs->ctrl_vq, 0,
-                                virtio_scsi_data_plane_handle_ctrl);
-    if (rc) {
-        goto fail_vrings;
+    rc = virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
+    if (rc != 0) {
+        goto fail_host_notifiers;
     }
 
     vq_init_count++;
-    rc = virtio_scsi_vring_init(s, vs->event_vq, 1,
-                                virtio_scsi_data_plane_handle_event);
-    if (rc) {
-        goto fail_vrings;
+    rc = virtio_scsi_set_host_notifier(s, vs->event_vq, 1);
+    if (rc != 0) {
+        goto fail_host_notifiers;
     }
 
     vq_init_count++;
+
     for (i = 0; i < vs->conf.num_queues; i++) {
-        rc = virtio_scsi_vring_init(s, vs->cmd_vqs[i], i + 2,
-                                    virtio_scsi_data_plane_handle_cmd);
+        rc = virtio_scsi_set_host_notifier(s, vs->cmd_vqs[i], i + 2);
         if (rc) {
-            goto fail_vrings;
+            goto fail_host_notifiers;
         }
         vq_init_count++;
     }
 
+    aio_context_acquire(s->ctx);
+    virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
+                                            virtio_scsi_data_plane_handle_ctrl);
+    virtio_queue_aio_set_host_notifier_handler(vs->event_vq, s->ctx,
+                                           virtio_scsi_data_plane_handle_event);
+
+    for (i = 0; i < vs->conf.num_queues; i++) {
+        virtio_queue_aio_set_host_notifier_handler(vs->cmd_vqs[i], s->ctx,
+                                             virtio_scsi_data_plane_handle_cmd);
+    }
+
     s->dataplane_starting = false;
     s->dataplane_started = true;
     aio_context_release(s->ctx);
     return 0;
 
-fail_vrings:
-    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
-    aio_context_release(s->ctx);
+fail_host_notifiers:
     for (i = 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
-- 
MST


