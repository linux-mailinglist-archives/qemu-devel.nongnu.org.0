Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034055783E2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:38:43 +0200 (CEST)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQxO-00082g-1w
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDQsg-0007ME-QO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDQsd-0007Nr-0R
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658151226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcrN7aXsZEzs0FCgTCcZPSOUEpZXVZqiS8xJ9VkuhDU=;
 b=Wkif9UdqVYzDUTE0mu7HTqaE8KNQ2HWNNYqURCIU7tUdIbVdvRbljyauN7T3i0R+q8iGrM
 QNNuKORNUPB09dqxS7DapYskjgVmkaRIgTzLhvx0Otwy81xQZhYBCdw8glLLakUO5sCYJX
 g8xBbDTbA7/Qkvf+knRB26M1DnSPsSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-r-xOITjHNx6BNWxhxzEw3A-1; Mon, 18 Jul 2022 09:33:36 -0400
X-MC-Unique: r-xOITjHNx6BNWxhxzEw3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BDF9823F10;
 Mon, 18 Jul 2022 13:33:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 056462166B26;
 Mon, 18 Jul 2022 13:33:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 3/5] vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out sg
Date: Mon, 18 Jul 2022 15:33:19 +0200
Message-Id: <20220718133321.2902838-4-eperezma@redhat.com>
In-Reply-To: <20220718133321.2902838-1-eperezma@redhat.com>
References: <20220718133321.2902838-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

So its generic enough to accept any out sg buffer and we can inject
NIC state messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fa00928854..533bd9f680 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -302,35 +302,36 @@ dma_map_err:
 }
 
 /**
- * Copy the guest element into a dedicated buffer suitable to be sent to NIC
+ * Maps out sg and in buffer into dedicated buffers suitable to be sent to NIC
  *
- * @iov: [0] is the out buffer, [1] is the in one
+ * @dev_iov: [0] is the out buffer, [1] is the in one
  */
-static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
-                                        VirtQueueElement *elem,
-                                        struct iovec *iov)
+static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
+                                      const struct iovec *out, size_t out_num,
+                                      struct iovec *dev_iov)
 {
     size_t in_copied;
     bool ok;
 
-    iov[0].iov_base = s->cvq_cmd_out_buffer;
-    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
-                                vhost_vdpa_net_cvq_cmd_len(), iov[0].iov_base,
-                                &iov[0].iov_len, false);
+    dev_iov[0].iov_base = s->cvq_cmd_out_buffer;
+    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
+                                vhost_vdpa_net_cvq_cmd_len(),
+                                dev_iov[0].iov_base, &dev_iov[0].iov_len,
+                                false);
     if (unlikely(!ok)) {
         return false;
     }
 
-    iov[1].iov_base = s->cvq_cmd_in_buffer;
+    dev_iov[1].iov_base = s->cvq_cmd_in_buffer;
     ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
-                                sizeof(virtio_net_ctrl_ack), iov[1].iov_base,
-                                &in_copied, true);
+                                sizeof(virtio_net_ctrl_ack),
+                                dev_iov[1].iov_base, &in_copied, true);
     if (unlikely(!ok)) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
         return false;
     }
 
-    iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
+    dev_iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
     return true;
 }
 
@@ -431,7 +432,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     };
     bool ok;
 
-    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
+    ok = vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num, dev_buffers);
     if (unlikely(!ok)) {
         goto out;
     }
-- 
2.31.1


