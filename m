Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5CE667C78
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1K9-0006e6-Tb; Thu, 12 Jan 2023 12:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K7-0006dB-9E
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1K5-0008RP-P9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPoj2lVJsWprqpmTaHUkjMZg3CvrA3oSBniXKgLWMks=;
 b=FI9AIQmFq5zCQPY+7nk+bFc4Lm+j1VbCvf1/BogUVNNZ6CCO7gDadGdklEVxc4d9hneKtT
 wDfqDm57nZFWauz74iO7hA0aOfYxtmsRSRCXfNWkDuaWUhRLykrEBuu5meHVyjeVBEtHBh
 J2g7r0aLJgCIGONQTjkDYMpRKc7KX58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-CJIBQHQXO_e4oCaU984VEA-1; Thu, 12 Jan 2023 12:25:01 -0500
X-MC-Unique: CJIBQHQXO_e4oCaU984VEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE74D85D067;
 Thu, 12 Jan 2023 17:25:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3DAC4078903;
 Thu, 12 Jan 2023 17:24:57 +0000 (UTC)
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
Subject: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
Date: Thu, 12 Jan 2023 18:24:27 +0100
Message-Id: <20230112172434.760850-7-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

To restore the device at the destination of a live migration we send the
commands through control virtqueue. For a device to read CVQ it must
have received the DRIVER_OK status bit.

However this opens a window where the device could start receiving
packets in rx queue 0 before it receives the RSS configuration. To avoid
that, we will not send vring_enable until all configuration is used by
the device.

As a first step, run vhost_set_vring_ready for all vhost_net backend after
all of them are started (with DRIVER_OK). This code should not affect
vdpa.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index c4eecc6f36..3900599465 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
+        r = vhost_net_start_one(get_vhost_net(peer), dev);
+        if (r < 0) {
+            goto err_start;
+        }
+    }
+
+    for (int j = 0; j < nvhosts; j++) {
+        if (j < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, j);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queue_pairs);
+        }
 
         if (peer->vring_enable) {
             /* restore vring enable state */
@@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
                 goto err_start;
             }
         }
-
-        r = vhost_net_start_one(get_vhost_net(peer), dev);
-        if (r < 0) {
-            goto err_start;
-        }
     }
 
     return 0;
-- 
2.31.1


