Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B045881AA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 20:08:36 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIwJn-0007tM-W7
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 14:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9d-0001hM-Rc
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9c-0003l3-B0
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659463083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSMWHykyf4bOT2pCEu45Nck9YtoD0hxVk+4hBaCTS90=;
 b=ZFNo7IzA5Zt9tO48TDfrlIzc1gNxOw85m/Pe0MYIzB+rtnl9i5p9lJYfYXqRISczfaB5sx
 oCHejlr+k4Bs4RaxWRDqR4iBXVvqpQlxQGNrEZjUY8/dm+Fe+/m5Wp94Jp1kYo/iO0KZnr
 qktAG20uauZYBpNFKGWdtgQTWO7bGR0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-xdMg7vbUOyqiTZbUQlOqKQ-1; Tue, 02 Aug 2022 13:58:00 -0400
X-MC-Unique: xdMg7vbUOyqiTZbUQlOqKQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B4793826248;
 Tue,  2 Aug 2022 17:58:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71B57492C3B;
 Tue,  2 Aug 2022 17:57:57 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v5 08/10] vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
Date: Tue,  2 Aug 2022 19:57:29 +0200
Message-Id: <20220802175731.312115-9-eperezma@redhat.com>
In-Reply-To: <20220802175731.312115-1-eperezma@redhat.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Next patches will add a new info callback to restore NIC status through
CVQ. Since only the CVQ vhost device is needed, create it with a new
NetClientInfo.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5: Create a new NetClientInfo instead of reusing the dataplane one.
---
 net/vhost-vdpa.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2421bca347..8d400f2dff 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -375,6 +375,16 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostVDPAState *s,
     return VIRTIO_NET_OK;
 }
 
+static NetClientInfo net_vhost_vdpa_cvq_info = {
+    .type = NET_CLIENT_DRIVER_VHOST_VDPA,
+    .size = sizeof(VhostVDPAState),
+    .receive = vhost_vdpa_receive,
+    .cleanup = vhost_vdpa_cleanup,
+    .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
+    .has_ufo = vhost_vdpa_has_ufo,
+    .check_peer_type = vhost_vdpa_check_peer_type,
+};
+
 /**
  * Do not forward commands not supported by SVQ. Otherwise, the device could
  * accept it and qemu would not know how to update the device model.
@@ -496,7 +506,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
         nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
                                  name);
     } else {
-        nc = qemu_new_net_control_client(&net_vhost_vdpa_info, peer,
+        nc = qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, peer,
                                          device, name);
     }
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
-- 
2.31.1


