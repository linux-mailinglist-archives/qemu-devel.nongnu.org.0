Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71F32A5B6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:22:48 +0100 (CET)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7nK-0002VV-LG
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH7mP-00020M-Sd
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH7mN-0000jI-E0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614702106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lCixjWvBHCGvMqpyREzWDiX2gmEDYj6mB/wyHquz0pc=;
 b=NlGKejv6YuDnvQywenxMQVhawensSquBaU++1/1pEn2ZVrTDNBx55muZ/0E6e7LoEwz+Rk
 tN3gQmeZkAzhLsmgQ27AtaaTbbF+KzJI7iCEFURAdnwkIOHsImYobPfBazvtQ/yu3Y9tbf
 q3Lgzr/pz1MQXAiCC9yQVLDag92NZxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-dzn3_yD7O02TSBulbJieYA-1; Tue, 02 Mar 2021 11:21:42 -0500
X-MC-Unique: dzn3_yD7O02TSBulbJieYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F23385B667
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 16:21:41 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A1E15DEF8;
 Tue,  2 Mar 2021 16:21:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when initializing
 the backend
Date: Tue,  2 Mar 2021 17:21:29 +0100
Message-Id: <20210302162129.52912-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
that used to be discarded will get re-populated and if we
discard+re-access memory after mapping+pinning, the pages mapped into the
vDPA IOMMU will go out of sync with the actual pages mapped into the user
space page tables.

Set discarding of RAM broken such that:
- virtio-mem and vhost-vdpa run mutually exclusive
- virtio-balloon is inhibited and no memory discards will get issued

In the future, we might be able to support coordinated discarding of RAM
as used by virtio-mem and as planned for VFIO.

Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Note: I was not actually able to reproduce/test as I fail to get the
vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa, vhost_vdpa,
vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa devices
appear under /sys/bus/vdpa/devices/ or /dev/).

---
 hw/virtio/vhost-vdpa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..86058d4041 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -278,6 +278,17 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
     uint64_t features;
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     trace_vhost_vdpa_init(dev, opaque);
+    int ret;
+
+    /*
+     * Similar to VFIO, we end up pinning all guest memory and have to
+     * disable discarding of RAM.
+     */
+    ret = ram_block_discard_disable(true);
+    if (ret) {
+        error_report("Cannot set discarding of RAM broken");
+        return ret;
+    }
 
     v = opaque;
     v->dev = dev;
@@ -302,6 +313,8 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     memory_listener_unregister(&v->listener);
 
     dev->opaque = NULL;
+    ram_block_discard_disable(false);
+
     return 0;
 }
 
-- 
2.29.2


