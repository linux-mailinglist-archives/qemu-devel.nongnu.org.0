Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88992576D9A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:43:26 +0200 (CEST)
Received: from localhost ([::1]:48718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCgCj-0004O8-Nh
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg4e-0006cZ-HX
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg4c-00071W-Um
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657971301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNeUoTTGq69aLf2Omwl8Y+wmoKgnPv6It5bysav20XY=;
 b=Zad3mYD9wo9iYs1ZOqHgY8XCobjhbvCzjy7ZJjW+GKm4irB0dBJP02yXNyS9vc2V97B03E
 gHb9WV+6SQfRkueKrUXwq5BeSPv3SuppFNFpv5Ze1fbn82Fp7wsib2M3iBnRVmFXwra3Qy
 M9X/o4ztlc9/Dj2xGeUADkH+EgrQSAs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-GkvFyXV-OVydVa_EAu6RJA-1; Sat, 16 Jul 2022 07:34:56 -0400
X-MC-Unique: GkvFyXV-OVydVa_EAu6RJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DDC11C05B16;
 Sat, 16 Jul 2022 11:34:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C322C40E80E0;
 Sat, 16 Jul 2022 11:34:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH 08/12] vdpa: Add vhost_vdpa_start_control_svq
Date: Sat, 16 Jul 2022 13:34:03 +0200
Message-Id: <20220716113407.2730331-9-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-1-eperezma@redhat.com>
References: <20220716113407.2730331-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

As a first step we only enable CVQ first than others. Future patches add
state restore.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 986e6414b4..211bd0468b 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -334,6 +334,18 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
     return true;
 }
 
+static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
+{
+    struct vhost_vring_state state = {
+        .index = v->dev->vq_index,
+        .num = 1,
+    };
+    int r;
+
+    r = ioctl(v->device_fd, VHOST_VDPA_SET_VRING_ENABLE, &state);
+    return r < 0 ? -errno : r;
+}
+
 /**
  * Do not forward commands not supported by SVQ. Otherwise, the device could
  * accept it and qemu would not know how to update the device model.
@@ -493,6 +505,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                             vhost_vdpa_net_cvq_cmd_page_len());
         memset(s->cvq_cmd_in_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
 
+        s->vhost_vdpa.start_op = vhost_vdpa_start_control_svq;
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
         error_setg(&s->vhost_vdpa.migration_blocker,
-- 
2.31.1


