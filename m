Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C34FBFA6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 16:54:21 +0200 (CEST)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvQq-0000a6-57
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 10:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvNT-0005hH-GN
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvNQ-0007iL-Ef
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649688647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NY0yjFl4kansC5VeJh7l4mujK97Y5LhTofKmeL7JHAM=;
 b=IkZDt9BeQSyNXNR539wusxZ6sBbNMl2QqOixwTfMOpjEh3D1RU8vfqPBoWH4wxBdTU1pzo
 smyTNb7OoGRnB3LTAosh8pxQerexZ/EUsLI4pOsN6D2NaJxN8OL5pW2A9nn2TlEbhhfvOG
 Ghlz+cWAIss20eN/RnyvPXyPi8J+kjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-5ZSeL1VGP-aYQrLo4kcqig-1; Mon, 11 Apr 2022 10:50:42 -0400
X-MC-Unique: 5ZSeL1VGP-aYQrLo4kcqig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 794C085A5A8;
 Mon, 11 Apr 2022 14:50:41 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6927154AC99;
 Mon, 11 Apr 2022 14:50:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 02/23] vdpa: Fix bad index calculus at
 vhost_vdpa_get_vring_base
Date: Mon, 11 Apr 2022 16:50:05 +0200
Message-Id: <20220411145026.1618035-3-eperezma@redhat.com>
In-Reply-To: <20220411145026.1618035-1-eperezma@redhat.com>
References: <20220411145026.1618035-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 6d0b222666 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 9e5fe15d03..1f229ff4cb 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1172,11 +1172,11 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
+    int vdpa_idx = ring->index - dev->vq_index;
     int ret;
 
     if (v->shadow_vqs_enabled) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
-                                                      ring->index);
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
 
         /*
          * Setting base as last used idx, so destination will see as available
-- 
2.27.0


