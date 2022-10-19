Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7560465F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:08:57 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8oa-0006WG-1p
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yt-0006Q5-3a
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yr-0002Ik-KA
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlLuvcUarN69elwvHlh5K3FVhKPGqTSF12DmuECjccc=;
 b=LI5qzVAlNHLD3dpwzHs/kZnrSN/JthJW7QytfulsAzAXn/tC/+bfTrYltcfCyKV2TSc9PW
 KAO7xEDSoRPaw+qXPb65yN5hDyRbntsXj31VveeCcnsQT8oyjmvdS8ALtFNlV35pEyEm/U
 bxNojkIwv/4qsBL0g93E3rEDpJtBvBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-2nC0wrjFO5eWouTBEBDN_Q-1; Wed, 19 Oct 2022 08:52:36 -0400
X-MC-Unique: 2nC0wrjFO5eWouTBEBDN_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58EE3185A79C;
 Wed, 19 Oct 2022 12:52:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BD744081B60;
 Wed, 19 Oct 2022 12:52:33 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH v2 7/8] vhost_net: return VIRTIO_NET_S_ANNOUNCE is device
 model has it set
Date: Wed, 19 Oct 2022 14:52:09 +0200
Message-Id: <20221019125210.226291-8-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-1-eperezma@redhat.com>
References: <20221019125210.226291-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Temporal, as this affects other vhost backends and we must check status
feature first.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 5660606c1d..300f370e2a 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -118,6 +118,7 @@ int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
                          uint32_t config_len)
 {
     VirtIODevice *vdev;
+    VirtIONet *n;
     int r = vhost_dev_get_config(&net->dev, config, config_len, NULL);
 
     if (unlikely(r != 0)) {
@@ -142,6 +143,13 @@ int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
         ((struct virtio_net_config *)config)->status |= VIRTIO_NET_S_LINK_UP;
     }
 
+    if (!(net->dev.acked_features & BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE))) {
+        return 0;
+    }
+
+    n = VIRTIO_NET(vdev);
+    ((struct virtio_net_config *)config)->status |=
+                                           (n->status & VIRTIO_NET_S_ANNOUNCE);
     return 0;
 }
 int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
-- 
2.31.1


