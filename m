Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3F303711
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:07:48 +0100 (CET)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IS3-00037R-J3
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4IOg-0001Ud-Ix
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:04:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4IOa-0006Bf-No
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhA0b+K+hM/2YH6ae4S4KY5ATy6h938EicWWmfTmS6s=;
 b=Rb2nggr3/o951KmL11bXoE1OamIWlzQxHfwoyN4ufGd8yAT5aGn6ELJqIXw5NnE5B0G5hG
 uGA0wQUA5BW2o5rY4YQX1UCMGMyPOy0cXt5eHikSFycnS9UiGY1mlpiVsoBu1pMTqKGKFy
 SoSV8VPPevK6nDJv7C3k2Dbdyvpd8JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-L45d56_7N8G_hAnA0hewBw-1; Tue, 26 Jan 2021 02:04:10 -0500
X-MC-Unique: L45d56_7N8G_hAnA0hewBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D4C192CC47
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:04:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5F1B1F0;
 Tue, 26 Jan 2021 07:04:07 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] virtio: add support for configure interrupt
Date: Tue, 26 Jan 2021 15:03:47 +0800
Message-Id: <20210126070351.28575-2-lulu@redhat.com>
In-Reply-To: <20210126070351.28575-1-lulu@redhat.com>
References: <20210126070351.28575-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configure notifier and virtio_set_config_notifier_fd_handler
in virtio

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio.c             | 26 ++++++++++++++++++++++++++
 include/hw/virtio/virtio-bus.h |  2 ++
 include/hw/virtio/virtio.h     |  6 ++++++
 3 files changed, 34 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ceb58fda6c..25e164cf8a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3502,6 +3502,16 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
     }
 }
 
+static void virtio_config_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
+    if (!vdev->use_config_notifier) {
+        return;
+    }
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
@@ -3518,6 +3528,17 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
     }
 }
 
+void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                                bool with_irqfd)
+{
+    if (assign && !with_irqfd) {
+        event_notifier_set_handler(&vdev->config_notifier,
+                                   virtio_config_read);
+    } else {
+       event_notifier_set_handler(&vdev->config_notifier, NULL);
+    }
+}
+
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
     return &vq->guest_notifier;
@@ -3591,6 +3612,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
     return &vq->host_notifier;
 }
 
+EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)
+{
+    return &vdev->config_notifier;
+
+}
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
 {
     vq->host_notifier_enabled = enabled;
diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index ef8abe49c5..97e13ec484 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -93,6 +93,8 @@ struct VirtioBusClass {
      */
     bool has_variable_vring_alignment;
     AddressSpace *(*get_dma_as)(DeviceState *d);
+    int (*set_config_notifiers)(DeviceState *d, bool assign);
+
 };
 
 struct VirtioBusState {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..79f2f78625 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -108,6 +108,8 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
+    bool use_config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -310,11 +312,15 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
+void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
+                                                bool with_irqfd);
+
 int virtio_device_start_ioeventfd(VirtIODevice *vdev);
 int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
 void virtio_device_release_ioeventfd(VirtIODevice *vdev);
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
+EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-- 
2.21.3


