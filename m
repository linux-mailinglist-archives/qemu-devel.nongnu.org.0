Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13C57E0B5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 13:16:54 +0200 (CEST)
Received: from localhost ([::1]:34506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEqeL-0007sW-7n
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 07:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqb1-0003Ju-Pk
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqay-0006zC-Jn
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658488403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxuW+X/Od1Fr6DWVKb5qNHhwDSUp3L+B89P7cUb/Uy0=;
 b=OSIxgy0NrlUjjiSg0u0sn4UGUtiK+1T/bSDpvHhUi+GWD1O5iP7HXL8JnwiVzIl0cYPhsu
 0G4Z6bck229P33abkJliccNPpAs0qLsrsMCTv5UgeG7Sob8OVpYxxRpBHxbDIo3Ywog+Iq
 2xh8QZ1IFd8xVJBKV562P8XejNDg2+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-7ZnGLahtOHyFaPp8wzY6qg-1; Fri, 22 Jul 2022 07:13:12 -0400
X-MC-Unique: 7ZnGLahtOHyFaPp8wzY6qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB803101A588;
 Fri, 22 Jul 2022 11:13:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D625F40E80E0;
 Fri, 22 Jul 2022 11:13:08 +0000 (UTC)
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
Subject: [PATCH v4 5/7] vdpa: Reorder net_vhost_vdpa_info
Date: Fri, 22 Jul 2022 13:12:43 +0200
Message-Id: <20220722111245.3403062-6-eperezma@redhat.com>
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

Since we're going to use a new info callback to restore NIC status, we
need that callback to be able to send and receive CVQ commands. Reorder
so all needed functions are available for it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index bbe1830824..61516b1432 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -211,16 +211,6 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
     return 0;
 }
 
-static NetClientInfo net_vhost_vdpa_info = {
-        .type = NET_CLIENT_DRIVER_VHOST_VDPA,
-        .size = sizeof(VhostVDPAState),
-        .receive = vhost_vdpa_receive,
-        .cleanup = vhost_vdpa_cleanup,
-        .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
-        .has_ufo = vhost_vdpa_has_ufo,
-        .check_peer_type = vhost_vdpa_check_peer_type,
-};
-
 static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
 {
     VhostIOVATree *tree = v->iova_tree;
@@ -375,6 +365,16 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
     return VIRTIO_NET_OK;
 }
 
+static NetClientInfo net_vhost_vdpa_info = {
+        .type = NET_CLIENT_DRIVER_VHOST_VDPA,
+        .size = sizeof(VhostVDPAState),
+        .receive = vhost_vdpa_receive,
+        .cleanup = vhost_vdpa_cleanup,
+        .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
+        .has_ufo = vhost_vdpa_has_ufo,
+        .check_peer_type = vhost_vdpa_check_peer_type,
+};
+
 /**
  * Do not forward commands not supported by SVQ. Otherwise, the device could
  * accept it and qemu would not know how to update the device model.
-- 
2.31.1


