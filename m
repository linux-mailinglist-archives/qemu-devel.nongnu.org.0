Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D254E59EB46
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:43:54 +0200 (CEST)
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYsT-0003lF-Ut
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgl-0000Pb-Lh
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgH-0004UE-6P
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661279473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUVC2aZB37d/pnkcpQ+saEdmfc9yBsesAmIjYuQKXUY=;
 b=chMLtZXbwMUmz9CFUcQuOlIw2lYr/IVSYfyKN1RkbvfHe0I1sd/fyKDOFyqLUF22Lh6W35
 fFl7h+DEzgffiqX1UjKZjcwmyDaRc4qOVN6/rqi6i9jqf78pzFSI2RrHoolqU0NQcvUxgo
 hV/scvWqPThqoyNlUN1CZv0gvF727NQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-SffNuKD2NzWNa8j3JMuKUg-1; Tue, 23 Aug 2022 14:31:11 -0400
X-MC-Unique: SffNuKD2NzWNa8j3JMuKUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93DE029DD9AC;
 Tue, 23 Aug 2022 18:31:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5356C15BB3;
 Tue, 23 Aug 2022 18:31:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v10 07/12] vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
Date: Tue, 23 Aug 2022 20:30:32 +0200
Message-Id: <20220823183037.98470-8-eperezma@redhat.com>
In-Reply-To: <20220823183037.98470-1-eperezma@redhat.com>
References: <20220823183037.98470-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

Next patches will add a new info callback to restore NIC status through
CVQ. Since only the CVQ vhost device is needed, create it with a new
NetClientInfo.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
v5: Create a new NetClientInfo instead of reusing the dataplane one.
---
 net/vhost-vdpa.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index a49e7e649d..1a597c2e92 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -334,6 +334,16 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
     return true;
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
@@ -475,7 +485,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
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


