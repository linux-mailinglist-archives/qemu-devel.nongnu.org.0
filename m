Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC4652DDC6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:24:37 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrllE-0003ls-Kz
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlat-0005Wd-DD
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaq-0006Q8-Vb
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fU/RsuJkVNZGtkaJmkVTz8JDO/UhA/dz7iWVC1PvyFY=;
 b=Y9VVuSPf6PC7vaQvHYflXOsc0ATKkhCGFCgaQdbvkFqtLwUrnO7TcymlGoJMNHpewXPSAf
 IL3hYhFyUS8n0tH1Q18V318xJFzDyDxk3XUnhGixQFu97hvuUMGx+/sXBtyKa8/Jxf+APk
 MIs0HIrJn64yNLeIijI3+1AjELhubnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-8NLZhAyjN8i85wnYpIvVPw-1; Thu, 19 May 2022 15:13:49 -0400
X-MC-Unique: 8NLZhAyjN8i85wnYpIvVPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B67F4811E78;
 Thu, 19 May 2022 19:13:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CEBF200AE6D;
 Thu, 19 May 2022 19:13:46 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 13/21] vhost: Add ShadowVirtQueueStart operation
Date: Thu, 19 May 2022 21:12:58 +0200
Message-Id: <20220519191306.821774-14-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It allows to run commands at SVQ start.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  4 ++++
 hw/virtio/vhost-vdpa.c             | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 8fe0367944..3c55fe2641 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -28,10 +28,14 @@ typedef struct SVQElement {
     bool not_from_guest;
 } SVQElement;
 
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
+                                    struct vhost_dev *dev);
 typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
                                          const VirtQueueElement *elem);
 
 typedef struct VhostShadowVirtqueueOps {
+    ShadowVirtQueueStart start;
     VirtQueueElementCallback used_elem_handler;
 } VhostShadowVirtqueueOps;
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 13e5e2a061..eec6d544e9 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1141,6 +1141,20 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(r)) {
             return r;
         }
+
+        if (v->shadow_vqs_enabled) {
+            for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
+                VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                              i);
+                if (svq->ops && svq->ops->start) {
+                    r = svq->ops->start(svq, dev);
+                    if (unlikely(r)) {
+                        return r;
+                    }
+                }
+            }
+        }
+
         vhost_vdpa_set_vring_ready(dev);
     } else {
         vhost_vdpa_reset_device(dev);
-- 
2.27.0


