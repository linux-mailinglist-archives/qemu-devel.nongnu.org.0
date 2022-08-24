Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2C5A0185
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:44:25 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvMW-0008F6-QG
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEj-0007al-Ul
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEa-0005Sq-BH
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWGv15i6933p5S0UQDcSLRpXSTNPnB/6M20ffMC4s6Q=;
 b=eAXJIpXnUp4JZHkr7H9ZgEDGhueXws9BlVRK3YcSNaydc+eBk9fF2O8/ZpcKPC2siWXo0M
 rd5J2FFIVRscguz6XixP6ykvaphdbLmm+eEdIzWUqhC2X8R+JEij+xO9JGhlaFiH9nsJ9w
 20Y4TMb2g1ZvgfZAQj34zK3jr0PZ7+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-xzGiJooUMUm47J-QCDSJxQ-1; Wed, 24 Aug 2022 14:36:05 -0400
X-MC-Unique: xzGiJooUMUm47J-QCDSJxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66134101AA6A;
 Wed, 24 Aug 2022 18:36:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E13672166B26;
 Wed, 24 Aug 2022 18:36:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Subject: [PATCH v2 3/6] vdpa: Add vhost_vdpa_net_load_mq
Date: Wed, 24 Aug 2022 20:35:48 +0200
Message-Id: <20220824183551.197052-4-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-1-eperezma@redhat.com>
References: <20220824183551.197052-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Same way as with the MAC, restore the expected number of queues at
device's start.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index c89e2262d9..77c85f4ddd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -400,6 +400,30 @@ static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n)
     return 0;
 }
 
+static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
+                                  const VirtIONet *n)
+{
+    const struct virtio_net_ctrl_hdr ctrl = {
+        .class = VIRTIO_NET_CTRL_MQ,
+        .cmd = VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
+    };
+    struct virtio_net_ctrl_mq mq;
+    uint64_t features = n->parent_obj.guest_features;
+    ssize_t dev_written;
+
+    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
+        return 0;
+    }
+
+    mq.virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs);
+    dev_written = vhost_vdpa_net_load_cmd(s, &ctrl, &mq, sizeof(mq));
+    if (unlikely(dev_written < 0)) {
+        return dev_written;
+    }
+
+    return *s->cvq_cmd_in_buffer != VIRTIO_NET_OK;
+}
+
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -418,6 +442,10 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     if (unlikely(r < 0)) {
         return r;
     }
+    r = vhost_vdpa_net_load_mq(s, n);
+    if (unlikely(r)) {
+        return r;
+    }
 
     return 0;
 }
-- 
2.31.1


