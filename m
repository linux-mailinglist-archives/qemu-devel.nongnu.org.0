Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918CE4C5BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 14:57:44 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOK3T-00032V-Gy
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 08:57:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJux-0001rE-EP
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJun-0000aX-Md
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645969725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkxIWaHJoTcx7+LfAgZNHDWBShpX5Qok2mORaH0a/OQ=;
 b=jOkahqxN8ekdr6WMaRTrBg6ie75YmITUPd16cEieuvBmRtDkF8xfLCynSU3RtVkiFAatNY
 Ijgde3BXv6loI1ai64MzY29FqdfEXV3QL2ub92WQUSrv/p45TDjzgEs22LZw1CigSYc193
 lo9mS17f75XcPJlwzwk+RkGWHjfWJJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-sxD6Xyc5OtuCMIdYvTvOag-1; Sun, 27 Feb 2022 08:48:41 -0500
X-MC-Unique: sxD6Xyc5OtuCMIdYvTvOag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E0D751DF;
 Sun, 27 Feb 2022 13:48:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 538D98497A;
 Sun, 27 Feb 2022 13:48:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/14] vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
Date: Sun, 27 Feb 2022 14:41:08 +0100
Message-Id: <20220227134111.3254066-12-eperezma@redhat.com>
In-Reply-To: <20220227134111.3254066-1-eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to achieve migration, so the destination can restore its
index.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 56f9f125cd..accc4024c2 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1180,8 +1180,25 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
 static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
 
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                      ring->index);
+
+        /*
+         * Setting base as last used idx, so destination will see as available
+         * all the entries that the device did not use, including the in-flight
+         * processing ones.
+         *
+         * TODO: This is ok for networking, but other kinds of devices might
+         * have problems with these retransmissions.
+         */
+        ring->num = svq->last_used_idx;
+        return 0;
+    }
+
     ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
     trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
     return ret;
-- 
2.27.0


