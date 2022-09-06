Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B15AEE66
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:13:00 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVaG2-0003AQ-Ba
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVaAr-0004g5-MI
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVaAo-0002GC-6G
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662476853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDWpdsL5OU9Ybva9CnjAjGSBsvyRnTO2bo8Ew4VpQPs=;
 b=Sqz9KtnJwd7aPGki7/DGleYO5GRuStrqnsi+bgRMFx4AS2ukvfTRs/ID1ucPgpLfeyb4BI
 cHTFfV+v9DeAhtsCrT3ZUC5dyskgponpW3OguMQtgCcJ0SgY2QTzI7kiTRIawWM69y0/h0
 xdkhlbhxoug3ATNZuUKBnnCS701DxRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-bf_b9Cu3OkufuJ_HzoezEw-1; Tue, 06 Sep 2022 11:07:29 -0400
X-MC-Unique: bf_b9Cu3OkufuJ_HzoezEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D48585A58A;
 Tue,  6 Sep 2022 15:07:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6457740D296C;
 Tue,  6 Sep 2022 15:07:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>
Subject: [PATCH v4 1/6] vdpa: Make VhostVDPAState cvq_cmd_in_buffer control
 ack type
Date: Tue,  6 Sep 2022 17:07:14 +0200
Message-Id: <20220906150719.1134955-2-eperezma@redhat.com>
In-Reply-To: <20220906150719.1134955-1-eperezma@redhat.com>
References: <20220906150719.1134955-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This allows to simplify the code. Rename to status while we're at it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v3: Rename it to status.
---
 net/vhost-vdpa.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6ce68fcd3f..535315c1d0 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -35,7 +35,9 @@ typedef struct VhostVDPAState {
     VHostNetState *vhost_net;
 
     /* Control commands shadow buffers */
-    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
+    void *cvq_cmd_out_buffer;
+    virtio_net_ctrl_ack *status;
+
     bool started;
 } VhostVDPAState;
 
@@ -158,7 +160,7 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
     struct vhost_dev *dev = &s->vhost_net->dev;
 
     qemu_vfree(s->cvq_cmd_out_buffer);
-    qemu_vfree(s->cvq_cmd_in_buffer);
+    qemu_vfree(s->status);
     if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
         g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
     }
@@ -310,7 +312,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
         return r;
     }
 
-    r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer,
+    r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->status,
                                vhost_vdpa_net_cvq_cmd_page_len(), true);
     if (unlikely(r < 0)) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
@@ -327,7 +329,7 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
 
     if (s->vhost_vdpa.shadow_vqs_enabled) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
-        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer);
+        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
     }
 }
 
@@ -340,7 +342,7 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
         .iov_len = out_len,
     };
     const struct iovec in = {
-        .iov_base = s->cvq_cmd_in_buffer,
+        .iov_base = s->status,
         .iov_len = sizeof(virtio_net_ctrl_ack),
     };
     VhostShadowVirtqueue *svq = g_ptr_array_index(s->vhost_vdpa.shadow_vqs, 0);
@@ -396,7 +398,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
             return dev_written;
         }
 
-        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) != VIRTIO_NET_OK;
+        return *s->status != VIRTIO_NET_OK;
     }
 
     return 0;
@@ -491,8 +493,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         goto out;
     }
 
-    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
-    if (status != VIRTIO_NET_OK) {
+    if (*s->status != VIRTIO_NET_OK) {
         return VIRTIO_NET_ERR;
     }
 
@@ -549,9 +550,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
         memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
-        s->cvq_cmd_in_buffer = qemu_memalign(qemu_real_host_page_size(),
-                                            vhost_vdpa_net_cvq_cmd_page_len());
-        memset(s->cvq_cmd_in_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
+        s->status = qemu_memalign(qemu_real_host_page_size(),
+                                  vhost_vdpa_net_cvq_cmd_page_len());
+        memset(s->status, 0, vhost_vdpa_net_cvq_cmd_page_len());
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
-- 
2.31.1


