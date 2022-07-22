Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F61657E0B7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 13:19:03 +0200 (CEST)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEqgQ-00014x-31
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 07:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqaj-00034P-As
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqah-0006wu-Mu
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658488387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+LUG03BDYPp5kNAJLMAJQOFe/AQNqvHDhHyOWlVtyY=;
 b=cv5iLo/pPo6duDJFGSQlfKTFU9WgYK/i92ZFQPDzSMUN52ruDbYvgdqTw41i47k8DcjOfh
 PSQYZvJvu4WA0E01Hoex/Uu0nSOLK+d54Ia+wfYISis3NHqJN6Q6S7VxxAn6BFj6Yap+fE
 HbVYEF4fs7CRxiHDnqMSQzrTR1XmoME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-6a9IMuumOOmQjl-ZtuPMwQ-1; Fri, 22 Jul 2022 07:13:05 -0400
X-MC-Unique: 6a9IMuumOOmQjl-ZtuPMwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 637EE101AA69;
 Fri, 22 Jul 2022 11:13:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94C8E40D2962;
 Fri, 22 Jul 2022 11:13:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Subject: [PATCH v4 3/7] vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out
 sg
Date: Fri, 22 Jul 2022 13:12:41 +0200
Message-Id: <20220722111245.3403062-4-eperezma@redhat.com>
In-Reply-To: <20220722111245.3403062-1-eperezma@redhat.com>
References: <20220722111245.3403062-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
index 1b82ac2e07..bbe1830824 100644
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
 
@@ -434,7 +435,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     };
     bool ok;
 
-    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
+    ok = vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num, dev_buffers);
     if (unlikely(!ok)) {
         goto out;
     }
-- 
2.31.1


