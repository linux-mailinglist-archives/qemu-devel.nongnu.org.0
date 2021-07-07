Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398603BEA66
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:09:05 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Ae-000568-1W
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1955-0000lT-EE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1953-0006bz-HQ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3MGUCJtgBhwKzEbRcOjG3DpxML933D/5Xe7a2aplEo=;
 b=TbDiiP8U2pcHhKKbdLY2wbXIH+7PVJrwn6IT6VIv6JPuxlb1IvaLDUFMg67AYSJDeU/iuS
 YCl8J5vLMhCEAzuBnJ2Jv+brKn+oEzn6gKdej7vsmFuqeAHb49jO+us0OZRzs+eCO2u+Gy
 HsVbJdhFk4Qv0phiqOcoWDInwaooCcc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45--bpzJqiNNKm7CGnNe5SkhQ-1; Wed, 07 Jul 2021 11:03:04 -0400
X-MC-Unique: -bpzJqiNNKm7CGnNe5SkhQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so2560059wmc.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A3MGUCJtgBhwKzEbRcOjG3DpxML933D/5Xe7a2aplEo=;
 b=O8N0xY/CMKeQtZLHn3LdtxyDzgTBiy0kdYY2fci4KC76L8oXD2wE8TbMVmLw2rvP+p
 VNE2h+vwirD5lAWBfmeR2GT9hxLjkdWPGwzplpmPgaGWKEKbZ9Ce9ySAiIxecVCzD9NZ
 1Tuvk3lD2Ex9O8wy0FaMozEtekaYG75mX6sz04lW+Yxf8GwijXnH8fHVjjObZQx28P2o
 ZlbEVL/uawy5gsHnUCw2wv/JGv4MvQ6qKp1FuxOqiYhRpwO9Yn2PiE6j8ApHCMPaGAIB
 4uJJuYnkTczOdWO7ROcw5Mz+q6fbFijO71JtgPxp1RTG3vOV+VuAePSDp5I7eHwRN5bC
 X8+g==
X-Gm-Message-State: AOAM531j93qZtgrvJJbl6LYXk08Rd7wMFzhDtPgFezx2+rL6JOpGSOrh
 5dzYaqa69vOPz5N3DcdO3qDAafCX7BuPps1TsATy383UkzjvTALtrj4kTeMjujmMYcsaBt08tgW
 Ut+PL0uf4yv9kMGk5ZuHaKAzQmwjCNrwPXH5WKJ7dnWDD72OmL0fzkFs+txvh
X-Received: by 2002:a5d:5102:: with SMTP id s2mr3466683wrt.214.1625670183087; 
 Wed, 07 Jul 2021 08:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy04joxzZk06KKOZB9XvnV5GZGW/yZswUGhV0Oz2Ap/YEQZDRiy8OyBImG977M/NehwWKn7Cw==
X-Received: by 2002:a5d:5102:: with SMTP id s2mr3466640wrt.214.1625670182803; 
 Wed, 07 Jul 2021 08:03:02 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id v2sm20186590wru.16.2021.07.07.08.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:02 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:02:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] virtio: Clarify MR transaction optimization
Message-ID: <20210707150157.52328-3-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The device model batching its ioeventfds in a single MR transaction is
an optimization. Clarify this in virtio-scsi, virtio-blk and generic
virtio code. Also clarify that the transaction must commit before
closing ioeventfds so that no one is tempted to merge the loops
in the start functions error path and in the stop functions.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <162125799728.1394228.339855768563326832.stgit@bahia.lan>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 16 ++++++++++++++++
 hw/scsi/virtio-scsi-dataplane.c | 16 ++++++++++++++++
 hw/virtio/virtio.c              | 16 ++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index cd81893d1d..252c3a7a23 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -198,6 +198,10 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
 
     /* Set up virtqueue notify */
@@ -211,6 +215,10 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
             }
 
+            /*
+             * The transaction expects the ioeventfds to be open when it
+             * commits. Do it now, before the cleanup loop.
+             */
             memory_region_transaction_commit();
 
             while (j--) {
@@ -330,12 +338,20 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
 
     aio_context_release(s->ctx);
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
 
     for (i = 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
     }
 
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
 
     for (i = 0; i < nvqs; i++) {
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 28e003250a..18eb824c97 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -152,6 +152,10 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
 
     rc = virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
@@ -198,6 +202,10 @@ fail_host_notifiers:
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
     }
 
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
 
     for (i = 0; i < vq_init_count; i++) {
@@ -238,12 +246,20 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
 
     blk_drain_all(); /* ensure there are no in-flight requests */
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
 
     for (i = 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
     }
 
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
 
     for (i = 0; i < vs->conf.num_queues + 2; i++) {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ab516ac614..6dcf3baf56 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3728,6 +3728,10 @@ static int virtio_device_start_ioeventfd_impl(VirtIODevice *vdev)
     VirtioBusState *qbus = VIRTIO_BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, n, r, err;
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
     for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
         VirtQueue *vq = &vdev->vq[n];
@@ -3766,6 +3770,10 @@ assign_error:
         r = virtio_bus_set_host_notifier(qbus, n, false);
         assert(r >= 0);
     }
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
 
     while (--i >= 0) {
@@ -3790,6 +3798,10 @@ static void virtio_device_stop_ioeventfd_impl(VirtIODevice *vdev)
     VirtioBusState *qbus = VIRTIO_BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int n, r;
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
     for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
         VirtQueue *vq = &vdev->vq[n];
@@ -3801,6 +3813,10 @@ static void virtio_device_stop_ioeventfd_impl(VirtIODevice *vdev)
         r = virtio_bus_set_host_notifier(qbus, n, false);
         assert(r >= 0);
     }
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
 
     for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
-- 
MST


