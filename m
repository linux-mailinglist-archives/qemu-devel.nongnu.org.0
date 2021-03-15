Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B133C721
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:53:39 +0100 (CET)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtHW-0001Mn-Sd
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDC-0005A1-RJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDB-0003vh-2T
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJUB2BKxUp+/hgtNUy8u9evkox43m4+lW00bD5Y36Zs=;
 b=Slw9w4pdlHUY+2js8oQVm7L4IxR2rk5vrRr4H67OVD/jAU0lXVNhd17WuAWugn5eje9+hw
 NRskKbxt8TsCU09/s4VnnjNp0iwOoaRuZA3+v1S4TU56REyPQIuEz2AoKvs9bgaPuy6UB0
 Xzh9tCrTXmH/rmp9FJqUx6oo/yN5nd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-F5x4cHkzODOYAErd37G0KA-1; Mon, 15 Mar 2021 15:49:06 -0400
X-MC-Unique: F5x4cHkzODOYAErd37G0KA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 351D219200C1;
 Mon, 15 Mar 2021 19:49:05 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02C0E1C4;
 Mon, 15 Mar 2021 19:48:58 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 03/13] vhost: Add VhostShadowVirtqueue
Date: Mon, 15 Mar 2021 20:48:32 +0100
Message-Id: <20210315194842.277740-4-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vhost shadow virtqueue (SVQ)is an intermediate jump for virtqueue
notifications and buffers, allowing qemu to track them. While qemu is
forwarding the buffers and virtqueue changes, is able to commit the
memory it's being dirtied, the same way regular qemu's VirtIO devices
do.

This commit only exposes basic SVQ allocation and free, so changes
regarding different aspects of SVQ (notifications forwarding, buffer
forwarding, starting/stopping) are more isolated and easier to bisect.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 24 ++++++++++++
 hw/virtio/vhost-shadow-virtqueue.c | 63 ++++++++++++++++++++++++++++++
 hw/virtio/meson.build              |  2 +-
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
new file mode 100644
index 0000000000..6cc18d6acb
--- /dev/null
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -0,0 +1,24 @@
+/*
+ * vhost software live migration ring
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2021
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef VHOST_SHADOW_VIRTQUEUE_H
+#define VHOST_SHADOW_VIRTQUEUE_H
+
+#include "qemu/osdep.h"
+
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+
+VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx);
+
+void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
+
+#endif
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
new file mode 100644
index 0000000000..4512e5b058
--- /dev/null
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -0,0 +1,63 @@
+/*
+ * vhost software live migration ring
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2021
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "hw/virtio/vhost-shadow-virtqueue.h"
+
+#include "qemu/error-report.h"
+#include "qemu/event_notifier.h"
+
+/* Shadow virtqueue to relay notifications */
+typedef struct VhostShadowVirtqueue {
+    /* Shadow kick notifier, sent to vhost */
+    EventNotifier kick_notifier;
+    /* Shadow call notifier, sent to vhost */
+    EventNotifier call_notifier;
+} VhostShadowVirtqueue;
+
+/*
+ * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
+ * methods and file descriptors.
+ */
+VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
+{
+    g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
+    int r;
+
+    r = event_notifier_init(&svq->kick_notifier, 0);
+    if (r != 0) {
+        error_report("Couldn't create kick event notifier: %s",
+                     strerror(errno));
+        goto err_init_kick_notifier;
+    }
+
+    r = event_notifier_init(&svq->call_notifier, 0);
+    if (r != 0) {
+        error_report("Couldn't create call event notifier: %s",
+                     strerror(errno));
+        goto err_init_call_notifier;
+    }
+
+    return g_steal_pointer(&svq);
+
+err_init_call_notifier:
+    event_notifier_cleanup(&svq->kick_notifier);
+
+err_init_kick_notifier:
+    return NULL;
+}
+
+/*
+ * Free the resources of the shadow virtqueue.
+ */
+void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
+{
+    event_notifier_cleanup(&vq->kick_notifier);
+    event_notifier_cleanup(&vq->call_notifier);
+    g_free(vq);
+}
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4..8b5a0225fe 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
-virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c'))
+virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
-- 
2.27.0


