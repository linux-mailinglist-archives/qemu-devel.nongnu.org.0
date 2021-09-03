Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AD3FFD4F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:39:32 +0200 (CEST)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5fX-0002vS-HM
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5FR-0004w0-4Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5FO-0004CJ-58
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcrbamXvwR0Mw6piP+Isi2B6dsNimlUTkmbQnwSM68M=;
 b=WSrBh6hAMwFkKiyMQUhuPR23jqtXP1r126thq2l7/ZfiVAfQUx2ZpnK7MEpsX5Tll7uL9A
 2NubdOxUrpcw5J2Ve8rddTvNPl/6/tkui4Gl3n/9Tu143z1quA58MJD0OBFZuS7Uii5OjN
 LKMeyXYcQA3bjdVRLnbIw8xtiKmRMuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-ibz4Gfx6PsqHpDjkwxQdkA-1; Fri, 03 Sep 2021 05:12:28 -0400
X-MC-Unique: ibz4Gfx6PsqHpDjkwxQdkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 921461854E20;
 Fri,  3 Sep 2021 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91AB860BF1;
 Fri,  3 Sep 2021 09:12:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 20/21] virtio-net: vhost control virtqueue support
Date: Fri,  3 Sep 2021 17:10:30 +0800
Message-Id: <20210903091031.47303-21-jasowang@redhat.com>
In-Reply-To: <20210903091031.47303-1-jasowang@redhat.com>
References: <20210903091031.47303-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the control virtqueue support for vhost. This
requires virtio-net to figure out the datapath queue pairs and control
virtqueue via is_datapath and pass the number of those two types
of virtqueues to vhost_net_start()/vhost_net_stop().

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c            | 21 ++++++++++++++++++---
 include/hw/virtio/virtio-net.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 0a5d9862ec..2523157177 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -244,6 +244,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int qps = n->multiqueue ? n->max_qps : 1;
+    int cvq = n->max_ncs - n->max_qps;
 
     if (!get_vhost_net(nc->peer)) {
         return;
@@ -285,14 +286,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         }
 
         n->vhost_started = 1;
-        r = vhost_net_start(vdev, n->nic->ncs, qps, 0);
+        r = vhost_net_start(vdev, n->nic->ncs, qps, cvq);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }
     } else {
-        vhost_net_stop(vdev, n->nic->ncs, qps, 0);
+        vhost_net_stop(vdev, n->nic->ncs, qps, cvq);
         n->vhost_started = 0;
     }
 }
@@ -3368,7 +3369,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    n->max_qps = MAX(n->nic_conf.peers.queues, 1);
+    n->max_ncs = MAX(n->nic_conf.peers.queues, 1);
+
+    /*
+     * Figure out the datapath queue pairs since the backend could
+     * provide control queue via peers as well.
+     */
+    if (n->nic_conf.peers.queues) {
+        for (i = 0; i < n->max_ncs; i++) {
+            if (n->nic_conf.peers.ncs[i]->is_datapath) {
+                ++n->max_qps;
+            }
+        }
+    }
+    n->max_qps = MAX(n->max_qps, 1);
+
     if (n->max_qps * 2 + 1 > VIRTIO_QUEUE_MAX) {
         error_setg(errp, "Invalid number of qps (= %" PRIu32 "), "
                    "must be a positive integer less than %d.",
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index a9b6dc252e..ed4659c189 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -194,6 +194,7 @@ struct VirtIONet {
     NICConf nic_conf;
     DeviceState *qdev;
     int multiqueue;
+    uint16_t max_ncs;
     uint16_t max_qps;
     uint16_t curr_qps;
     size_t config_size;
-- 
2.25.1


