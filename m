Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01159A2FD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:54:55 +0200 (CEST)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP6Cs-0007uz-6v
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z3-0001HJ-9I
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z1-0003R8-Gk
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660929222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhm0gsPDkilsBilRLwOl3RJdeTaUppXVAvGqhwRvYv8=;
 b=JQlqK+D7SbioJWjmI6FqfFsxEUmJJqYkMkXnQxZUmNGY+cXpFsSfRn2bUCBFqT1dMZGog/
 vZkVqndHfD5UNKAn40cjETeXGBEedsSSkzR9LfndQv6L2WoPaQDwMvVXBiFaj4nEIfSPsD
 EXGKSkCLQleIlmvM5xbeQtoo6Q1Femw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-Nmj0cMBePs2TPOHOj0QVkA-1; Fri, 19 Aug 2022 13:13:41 -0400
X-MC-Unique: Nmj0cMBePs2TPOHOj0QVkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D256C80418F;
 Fri, 19 Aug 2022 17:13:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F83A40CF8EE;
 Fri, 19 Aug 2022 17:13:38 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 2/5] vdpa: Add vhost_vdpa_net_load_mq
Date: Fri, 19 Aug 2022 19:13:26 +0200
Message-Id: <20220819171329.3597027-3-eperezma@redhat.com>
In-Reply-To: <20220819171329.3597027-1-eperezma@redhat.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

Same way as with the MAC, restore the expected number of queues at
device's start.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e0dbfcced..96fd3bc835 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -391,6 +391,35 @@ static int vhost_vdpa_net_load_mac(VhostVDPAState *s,
     return 0;
 }
 
+static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
+                                  const VirtIONet *n)
+{
+    uint64_t features = n->parent_obj.guest_features;
+    ssize_t dev_written;
+    void *cursor = s->cvq_cmd_out_buffer;
+    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
+        return 0;
+    }
+
+    *(struct virtio_net_ctrl_hdr *)cursor = (struct virtio_net_ctrl_hdr) {
+        .class = VIRTIO_NET_CTRL_MQ,
+        .cmd = VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
+    };
+    cursor += sizeof(struct virtio_net_ctrl_hdr);
+    *(struct virtio_net_ctrl_mq *)cursor = (struct virtio_net_ctrl_mq) {
+        .virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs),
+    };
+    cursor += sizeof(struct virtio_net_ctrl_mq);
+
+    dev_written = vhost_vdpa_net_cvq_add(s, cursor - s->cvq_cmd_out_buffer,
+                                             sizeof(virtio_net_ctrl_ack));
+    if (unlikely(dev_written < 0)) {
+        return dev_written;
+    }
+
+    return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) != VIRTIO_NET_OK;
+}
+
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -409,6 +438,10 @@ static int vhost_vdpa_net_load(NetClientState *nc)
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


