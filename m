Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD984025EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:07:04 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNX4J-0007K7-Aw
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX1c-0003aM-AQ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX1a-000599-Mh
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631005454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S08/s4PvwYBIXNIJQZrcl+7drWjd11Gf+x6eK6zE8k=;
 b=Fmu8cy7M0f7zmTtAq7ETyl+4my9GeTyzeHVvtHwRd8p7ng9saQKOh1/CyJhnND82fMap8O
 KqqmD6/rtimAQR+YCC6CqN2YmGezAbT8JCLsTdicS8N4nmfV02CTW1S1KUFgLonvyDNiY3
 xS5ymi1gHqnYpRshyHpiOqOZS6ksImo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-NcP2qyOcPW-HU4pCbo9Czw-1; Tue, 07 Sep 2021 05:04:13 -0400
X-MC-Unique: NcP2qyOcPW-HU4pCbo9Czw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E6FB8010F4;
 Tue,  7 Sep 2021 09:04:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-183.pek2.redhat.com
 [10.72.12.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CC6B5C25D;
 Tue,  7 Sep 2021 09:04:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V3 08/10] vhost: record the last virtqueue index for the
 virtio device
Date: Tue,  7 Sep 2021 17:03:20 +0800
Message-Id: <20210907090322.1756-9-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-1-jasowang@redhat.com>
References: <20210907090322.1756-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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

This patch introduces a new field in the vhost_dev structure to record
the last virtqueue index for the virtio device. This will be useful
for the vhost backends with 1:N model to start or stop the device
after all the vhost_dev structures were started or stopped.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c        | 12 +++++++++---
 include/hw/virtio/vhost.h |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 2b594b4642..3aabab06ea 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -231,9 +231,11 @@ fail:
     return NULL;
 }
 
-static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index)
+static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
+                                   int last_index)
 {
     net->dev.vq_index = vq_index;
+    net->dev.last_index = last_index;
 }
 
 static int vhost_net_start_one(struct vhost_net *net,
@@ -324,9 +326,13 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i;
+    int r, e, i, last_index = data_qps * 2;
     NetClientState *peer;
 
+    if (!cvq) {
+        last_index -= 1;
+    }
+
     if (!k->set_guest_notifiers) {
         error_report("binding does not support guest notifiers");
         return -ENOSYS;
@@ -341,7 +347,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
 
         net = get_vhost_net(peer);
-        vhost_net_set_vq_index(net, i * 2);
+        vhost_net_set_vq_index(net, i * 2, last_index);
 
         /* Suppress the masking guest notifiers on vhost user
          * because vhost user doesn't interrupt masking/unmasking
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1a9fc65089..3fa0b554ef 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -74,6 +74,8 @@ struct vhost_dev {
     unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
+    /* the last vq index for the virtio device (not vhost) */
+    int last_index;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
-- 
2.25.1


