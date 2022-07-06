Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C756925A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:07:47 +0200 (CEST)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ANG-0006zx-W2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xq-0005bx-1F
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xk-0000vL-18
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=daEXiDWJK5Rl36PD+mqiBuzrx2naUodE57lDs3D7Kmc=;
 b=LH1rjifFEQneG0OpSFFgBo1BwLBx4Favs8UceKiaz4PYyU+CG9ZFltDk94mPmXQnUAVtQF
 q/N6AILNB+SRY/yxM4udOfsoDughK3QBmK6VEPiAQe/h9fxQpymm9tw6gjdP1CyN753jAy
 U9YQiqnLlvx1Dr1oUv/j5kopPRSpwF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-ETXzH_yQOoWxPM_WnYbw_Q-1; Wed, 06 Jul 2022 14:41:14 -0400
X-MC-Unique: ETXzH_yQOoWxPM_WnYbw_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A1B185A7BA;
 Wed,  6 Jul 2022 18:41:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2561A1415116;
 Wed,  6 Jul 2022 18:41:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 21/23] vdpa: Add vhost_vdpa_start_control_svq
Date: Wed,  6 Jul 2022 20:40:06 +0200
Message-Id: <20220706184008.1649478-22-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

As a first step we only enable CVQ first than others. Future patches add
state restore.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e415cc8de5..77d013833f 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -370,6 +370,24 @@ static CVQElement *vhost_vdpa_cvq_alloc_elem(VhostVDPAState *s,
     return g_steal_pointer(&cvq_elem);
 }
 
+static int vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
+                                        void *opaque)
+{
+    struct vhost_vring_state state = {
+        .index = virtio_get_queue_index(svq->vq),
+        .num = 1,
+    };
+    VhostVDPAState *s = opaque;
+    struct vhost_dev *dev = s->vhost_vdpa.dev;
+    struct vhost_vdpa *v = dev->opaque;
+    int r;
+
+    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
+
+    r = ioctl(v->device_fd, VHOST_VDPA_SET_VRING_ENABLE, &state);
+    return r < 0 ? -errno : r;
+}
+
 /**
  * iov_size with an upper limit. It's assumed UINT64_MAX is an invalid
  * iov_size.
@@ -554,6 +572,7 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
     .used_handler = vhost_vdpa_net_handle_ctrl_used,
     .detach_handler = vhost_vdpa_net_handle_ctrl_detach,
+    .start = vhost_vdpa_start_control_svq,
 };
 
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
-- 
2.31.1


