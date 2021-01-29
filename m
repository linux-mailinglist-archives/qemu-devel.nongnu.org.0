Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F220308EE2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 22:00:37 +0100 (CET)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ase-00036i-Ca
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 16:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anT-0007Fj-ML
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anR-0002me-Ns
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611953713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oniwa/aRK4MFbG4ov7pO713lIswUhGp9/PJOl9xck9g=;
 b=jAUu58brpYWf7MHcGXmkJw2r/NQob9yOFD1MGxYp/3kZm65Js0paPiRiV48SYy2FKVfEhM
 zM4G2R+1IiZQp9+qkMP9kPvmU6AbkJDOGdUTVGQAbyvgOHXdElh/3I4K1o41o73X+CMNin
 Am6v1khFnRvnwYZkISnE8b+eUeqhl9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-Axb5-rR9NKWNk08wG04ddA-1; Fri, 29 Jan 2021 15:55:11 -0500
X-MC-Unique: Axb5-rR9NKWNk08wG04ddA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE7A8144E3;
 Fri, 29 Jan 2021 20:55:09 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-115.ams2.redhat.com
 [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 625D919C66;
 Fri, 29 Jan 2021 20:55:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 07/10] vhost: Add VhostShadowVirtqueue
Date: Fri, 29 Jan 2021 21:54:12 +0100
Message-Id: <20210129205415.876290-8-eperezma@redhat.com>
In-Reply-To: <20210129205415.876290-1-eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vhost shadow virtqueue is an intermediate jump for virtqueue
notifications and buffers, allowing qemu to track them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 24 ++++++++++++
 hw/virtio/vhost-shadow-virtqueue.c | 60 ++++++++++++++++++++++++++++++
 hw/virtio/meson.build              |  2 +-
 3 files changed, 85 insertions(+), 1 deletion(-)
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
index 0000000000..c0c967a7c5
--- /dev/null
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -0,0 +1,60 @@
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
+typedef struct VhostShadowVirtqueue {
+    EventNotifier kick_notifier;
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
+    return svq;
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


