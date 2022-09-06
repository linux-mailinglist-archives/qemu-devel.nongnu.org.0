Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507455AF0BD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 18:42:11 +0200 (CEST)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVbeM-0002n1-G4
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 12:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVbZ6-0004Kl-2R
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVbZ4-0001AB-JO
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662482202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAG5vvx0dc4U+p0OlwxEIJp96aLvStB6XTeITvPepQU=;
 b=hg1viELJj9QMF2rjONWt/1o1qVRDfhEoDLwGmvk5H1DVeqQU7LUwBNV+EfsYmX7/9NbIpW
 L9he17J63qc5c4J+QgqxWmTWaO3elw5xA+GhpGXMsuFdgytf6hvShpaps/TDQGH0Czs/jD
 ON80k6Di14ECm5rsb9unyglVInw6hjM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-pqvaccugMMCSSElmSIgxyA-1; Tue, 06 Sep 2022 12:36:37 -0400
X-MC-Unique: pqvaccugMMCSSElmSIgxyA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 712A13C0ED49;
 Tue,  6 Sep 2022 16:36:37 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9A6403349;
 Tue,  6 Sep 2022 16:36:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 3/3] vdpa: Support VLAN on nic control shadow virtqueue
Date: Tue,  6 Sep 2022 18:36:21 +0200
Message-Id: <20220906163621.1144675-4-eperezma@redhat.com>
In-Reply-To: <20220906163621.1144675-1-eperezma@redhat.com>
References: <20220906163621.1144675-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Update the virtio-net device model with each guest's update of vlan
through control virtqueue, and accept creating a SVQ with a device
exposing vlan feature bit.

Done in the same commit since a malicious guest could send vlan
commands otherwise.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index ecbfd08eb9..40f7c60399 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -94,6 +94,7 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
     BIT_ULL(VIRTIO_NET_F_STATUS) |
     BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_VLAN) |
     BIT_ULL(VIRTIO_NET_F_MQ) |
     BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
     BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
@@ -538,6 +539,16 @@ static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_t len)
                           __func__, ctrl.cmd);
         };
         break;
+    case VIRTIO_NET_CTRL_VLAN:
+        switch (ctrl->cmd) {
+        case VIRTIO_NET_CTRL_VLAN_ADD:
+        case VIRTIO_NET_CTRL_VLAN_DEL:
+            return true;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid vlan cmd %u\n",
+                          __func__, ctrl->cmd);
+        };
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
                       __func__, ctrl.class);
-- 
2.31.1


