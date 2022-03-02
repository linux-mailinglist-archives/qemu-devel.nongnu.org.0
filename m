Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0864CAFF2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:34:03 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPVfd-0007tr-NR
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVci-0005cF-3U
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVce-000235-Nh
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646253054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HT1J9o8e8hMWr+fuenoBd2CTP0mmy5j6F2gk8Fio8t8=;
 b=QDqg++GkeykmsyUBguF/Kon+Eoi1agfK3Gip/cGjn1mSRkO60c+V7DPUvwuAqwxFkqk9rU
 4WKIL0BZQI5sq4aa7o4jxNYLZ6lGZp8BmQvKOx/Kl+B5WFGCx2agZpSfu1KbDNg1/Somio
 DgB1GkU4s7Ypfq1Y4VyA2t8yHiLYmoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-iRl4H9j-PriKnowLvUwV8g-1; Wed, 02 Mar 2022 15:30:53 -0500
X-MC-Unique: iRl4H9j-PriKnowLvUwV8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BC83801DDB;
 Wed,  2 Mar 2022 20:30:51 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63E33646A4;
 Wed,  2 Mar 2022 20:30:45 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/14] vhost: Add VhostShadowVirtqueue
Date: Wed,  2 Mar 2022 21:29:59 +0100
Message-Id: <20220302203012.3476835-2-eperezma@redhat.com>
In-Reply-To: <20220302203012.3476835-1-eperezma@redhat.com>
References: <20220302203012.3476835-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vhost shadow virtqueue (SVQ) is an intermediate jump for virtqueue
notifications and buffers, allowing qemu to track them. While qemu is
forwarding the buffers and virtqueue changes, it is able to commit the
memory it's being dirtied, the same way regular qemu's VirtIO devices
do.

This commit only exposes basic SVQ allocation and free. Next patches of
the series add functionality like notifications and buffers forwarding.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 28 ++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.c | 62 ++++++++++++++++++++++++++++++
 hw/virtio/meson.build              |  2 +-
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
new file mode 100644
index 0000000000..f1519e3c7b
--- /dev/null
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -0,0 +1,28 @@
+/*
+ * vhost shadow virtqueue
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
+#include "qemu/event_notifier.h"
+
+/* Shadow virtqueue to relay notifications */
+typedef struct VhostShadowVirtqueue {
+    /* Shadow kick notifier, sent to vhost */
+    EventNotifier hdev_kick;
+    /* Shadow call notifier, sent to vhost */
+    EventNotifier hdev_call;
+} VhostShadowVirtqueue;
+
+VhostShadowVirtqueue *vhost_svq_new(void);
+
+void vhost_svq_free(gpointer vq);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
+
+#endif
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
new file mode 100644
index 0000000000..c1db02c53e
--- /dev/null
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -0,0 +1,62 @@
+/*
+ * vhost shadow virtqueue
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2021
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
+
+#include "qemu/error-report.h"
+
+/**
+ * Creates vhost shadow virtqueue, and instructs the vhost device to use the
+ * shadow methods and file descriptors.
+ *
+ * Returns the new virtqueue or NULL.
+ *
+ * In case of error, reason is reported through error_report.
+ */
+VhostShadowVirtqueue *vhost_svq_new(void)
+{
+    g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
+    int r;
+
+    r = event_notifier_init(&svq->hdev_kick, 0);
+    if (r != 0) {
+        error_report("Couldn't create kick event notifier: %s (%d)",
+                     g_strerror(errno), errno);
+        goto err_init_hdev_kick;
+    }
+
+    r = event_notifier_init(&svq->hdev_call, 0);
+    if (r != 0) {
+        error_report("Couldn't create call event notifier: %s (%d)",
+                     g_strerror(errno), errno);
+        goto err_init_hdev_call;
+    }
+
+    return g_steal_pointer(&svq);
+
+err_init_hdev_call:
+    event_notifier_cleanup(&svq->hdev_kick);
+
+err_init_hdev_kick:
+    return NULL;
+}
+
+/**
+ * Free the resources of the shadow virtqueue.
+ *
+ * @pvq: gpointer to SVQ so it can be used by autofree functions.
+ */
+void vhost_svq_free(gpointer pvq)
+{
+    VhostShadowVirtqueue *vq = pvq;
+    event_notifier_cleanup(&vq->hdev_kick);
+    event_notifier_cleanup(&vq->hdev_call);
+    g_free(vq);
+}
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d64a8..2dc87613bc 100644
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


