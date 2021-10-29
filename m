Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4024402A1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:56:40 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgX3P-0001yW-5G
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWlH-0002j2-7V
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWlF-0000Zf-Q5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uv3dGNIBRYRCUYoeDo3vlZ3X5y8gZu5m2RYc4WKv/4=;
 b=V4lULdnxSHV6XIAMLl+z6jrXGwQ5OYHvlWRVClo4/g39tBfPerJrDihMDxERHpStOVA2m9
 7/omgkrowHxW1DEmrLNeAkbFLICDRxktk2zTU9DK3PuqgJp+c4fM7l69cipDyTJjOMB5cN
 6f2dUIv/FlfrKuxpwLDTheD3ZUVobYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-WKhs9jBnM8m6wkUeStBzrw-1; Fri, 29 Oct 2021 14:37:49 -0400
X-MC-Unique: WKhs9jBnM8m6wkUeStBzrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC9E18125C3;
 Fri, 29 Oct 2021 18:37:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DA9D5D6CF;
 Fri, 29 Oct 2021 18:37:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 09/26] vdpa: Add vhost_svq_set_svq_kick_fd
Date: Fri, 29 Oct 2021 20:35:08 +0200
Message-Id: <20211029183525.1776416-10-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function allow vhost-vdpa backend to override kick_fd.

There are a few pieces still missing, like the guest's kick handler in
SVQ, and how to handle the first set of kick file descriptor, that has
its own complexities. These will be added in next patches.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  1 +
 hw/virtio/vhost-shadow-virtqueue.c | 36 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 50ebddbbb9..a19eede089 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,7 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 const EventNotifier *vhost_svq_get_dev_kick_notifier(
                                               const VhostShadowVirtqueue *svq);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 076418556d..513d7f2782 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -11,6 +11,7 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
@@ -18,6 +19,16 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier hdev_kick;
     /* Shadow call notifier, sent to vhost */
     EventNotifier hdev_call;
+
+    /*
+     * Borrowed virtqueue's guest to host notifier.
+     * To borrow it in this event notifier allows to register on the event
+     * loop and access the associated shadow virtqueue easily. If we use the
+     * VirtQueue, we don't have an easy way to retrieve it.
+     *
+     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
+     */
+    EventNotifier svq_kick;
 } VhostShadowVirtqueue;
 
 /**
@@ -29,6 +40,31 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
     return &svq->hdev_kick;
 }
 
+/**
+ * Set a new file descriptor for the guest to kick SVQ and notify for avail
+ *
+ * @svq          The svq
+ * @svq_kick_fd  The new svq kick fd
+ */
+void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
+{
+    EventNotifier tmp;
+
+    event_notifier_set_handler(&svq->svq_kick, NULL);
+    event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_kick));
+
+    /*
+     * event_notifier_set_handler already checks for guest's notifications if
+     * they arrive to the new file descriptor in the switch, so there is no
+     * need to explicitely check for them.
+     */
+    event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
+
+    if (event_notifier_test_and_clear(&tmp)) {
+        event_notifier_set(&svq->hdev_kick);
+    }
+}
+
 /*
  * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
  * methods and file descriptors.
-- 
2.27.0


