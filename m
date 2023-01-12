Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF0667CA0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1K7-0006d6-VI; Thu, 12 Jan 2023 12:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K4-0006cZ-91
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K2-0008GL-Mv
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+vbnLVHFE98xu6DQxprtLM0Tqst2JAJDVkWqUTLcr4=;
 b=Gne680FICwLrelc3brA244sbGi6FpY7C/GrORAzIt/8GPovDmFrsDpMfL2ecRdckLF54oh
 DVs2e1TgMe1lSDa/YOIIvt/7nxF3lLCSNldI9LgNH6aIaiiZnr04akcFqcaE0Ymtvw2HeB
 rcq4UZMkFJw5ksO2jvwqUYJ5zef7emY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-9mAnowN2OSinIJx8dmY-pQ-1; Thu, 12 Jan 2023 12:24:58 -0500
X-MC-Unique: 9mAnowN2OSinIJx8dmY-pQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB48382C96F;
 Thu, 12 Jan 2023 17:24:57 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ADC04078903;
 Thu, 12 Jan 2023 17:24:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC v2 05/13] vdpa net: add migration blocker if cannot migrate cvq
Date: Thu, 12 Jan 2023 18:24:26 +0100
Message-Id: <20230112172434.760850-6-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

A vdpa net device must initialize with SVQ in order to be migratable,
and initialization code verifies conditions.  If the device is not
initialized with the x-svq parameter, it will not expose _F_LOG so vhost
sybsystem will block VM migration from its initialization.

Next patches change this. Net data VQs will be shadowed only at
migration time and vdpa net devices need to expose _F_LOG as long as it
can go to SVQ.

Since we don't know that at initialization time but at start, add an
independent blocker at CVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 631424d9c4..2ca93e850a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -26,12 +26,14 @@
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
 #include "monitor/monitor.h"
+#include "migration/blocker.h"
 #include "hw/virtio/vhost.h"
 
 /* Todo:need to add the multiqueue support here */
 typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
+    Error *migration_blocker;
     VHostNetState *vhost_net;
 
     /* Control commands shadow buffers */
@@ -433,9 +435,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
             g_strerror(errno), errno);
         return -1;
     }
-    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
-        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
-        return 0;
+    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
+        error_setg(&s->migration_blocker,
+                   "vdpa device %s does not support ASID",
+                   nc->name);
+        goto out;
+    }
+    if (!vhost_vdpa_net_valid_svq_features(v->dev->features,
+                                           &s->migration_blocker)) {
+        goto out;
     }
 
     /*
@@ -455,7 +463,10 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
         }
 
         if (group == cvq_group) {
-            return 0;
+            error_setg(&s->migration_blocker,
+                "vdpa %s vq %d group %"PRId64" is the same as cvq group "
+                "%"PRId64, nc->name, i, group, cvq_group);
+            goto out;
         }
     }
 
@@ -468,8 +479,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
 
 out:
-    if (!s->vhost_vdpa.shadow_vqs_enabled) {
-        return 0;
+    if (s->migration_blocker) {
+        Error *errp = NULL;
+        r = migrate_add_blocker(s->migration_blocker, &errp);
+        if (unlikely(r != 0)) {
+            g_clear_pointer(&s->migration_blocker, error_free);
+            error_report_err(errp);
+        }
+
+        return r;
     }
 
     s0 = vhost_vdpa_net_first_nc_vdpa(s);
@@ -513,6 +531,11 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
     }
 
+    if (s->migration_blocker) {
+        migrate_del_blocker(s->migration_blocker);
+        g_clear_pointer(&s->migration_blocker, error_free);
+    }
+
     vhost_vdpa_net_client_stop(nc);
 }
 
-- 
2.31.1


