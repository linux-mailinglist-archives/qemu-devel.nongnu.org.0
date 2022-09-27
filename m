Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1FF5EBC9D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:01:36 +0200 (CEST)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5X5-0003j4-L2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53A-0003a1-9t
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124]:56438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od538-0001hk-Ha
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5CT0z2HWjzrIlnQMdbwEix/LI0y6xGLoifOSrUKFs8=;
 b=QMlKHgv8l47HCaRx/DJnbUJKhfJbgA8Xd56Sd19AgRr2bQyIWuEJ1pq/uWmd39y4IztnzB
 EiIlOtrGdZmxnG8UZw1bmqrFlYSiN4aGU+IBG1WJt4yupjulbFGpEEHymUu3LU1X98LGF4
 9UE6AiKAWn0QrR9jAwI3wiLUa0/BbNk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-myZ5mWu0O1ecmwKW2Bl5Yg-1; Tue, 27 Sep 2022 03:30:34 -0400
X-MC-Unique: myZ5mWu0O1ecmwKW2Bl5Yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F1E9299E752;
 Tue, 27 Sep 2022 07:30:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFD9C2166B26;
 Tue, 27 Sep 2022 07:30:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 2/8] vdpa: Make VhostVDPAState cvq_cmd_in_buffer control ack
 type
Date: Tue, 27 Sep 2022 15:30:16 +0800
Message-Id: <20220927073022.28378-3-jasowang@redhat.com>
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=jasowang@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

From: Eugenio Pérez <eperezma@redhat.com>

This allows to simplify the code. Rename to status while we're at it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6ce68fc..535315c 100644
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
2.7.4


