Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7959A2FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:51:39 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP69h-0002LW-Uc
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z3-0001Dr-9e
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z0-0003R4-LQ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660929221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ltBVP/2bbvjIm1EZXLG2VJuU/x835gJJ9NjPPqZAo0=;
 b=R0nUsEAb6oUgpYq7FPqYvAe8233MGqXQppq7he+FaM0FmxfHyJXMKPBDYIJpI8KodjAMMa
 aNcVearaufsLMExF3v8YfwbC52WjsIOpz6OF1g+OCoBEsBxbL5hoVkojXAUcnxwiPBhnbg
 6Gayuzz+yJK/nmoFL2GSxPPoTc3H4XU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-__VdpV2VMB-RgIh-rz8dAw-1; Fri, 19 Aug 2022 13:13:38 -0400
X-MC-Unique: __VdpV2VMB-RgIh-rz8dAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D95929324B0;
 Fri, 19 Aug 2022 17:13:38 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A48040CFD0A;
 Fri, 19 Aug 2022 17:13:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 1/5] vdpa: extract vhost_vdpa_net_load_mac from
 vhost_vdpa_net_load
Date: Fri, 19 Aug 2022 19:13:25 +0200
Message-Id: <20220819171329.3597027-2-eperezma@redhat.com>
In-Reply-To: <20220819171329.3597027-1-eperezma@redhat.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

Since there may be many commands we need to issue to load the NIC
state, let's split them in individual functions

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 97b658f412..1e0dbfcced 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -363,21 +363,10 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
     return vhost_svq_poll(svq);
 }
 
-static int vhost_vdpa_net_load(NetClientState *nc)
+static int vhost_vdpa_net_load_mac(VhostVDPAState *s,
+                                  const VirtIONet *n)
 {
-    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-    const struct vhost_vdpa *v = &s->vhost_vdpa;
-    const VirtIONet *n;
-    uint64_t features;
-
-    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
-
-    if (!v->shadow_vqs_enabled) {
-        return 0;
-    }
-
-    n = VIRTIO_NET(v->dev->vdev);
-    features = n->parent_obj.guest_features;
+    uint64_t features = n->parent_obj.guest_features;
     if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
         const struct virtio_net_ctrl_hdr ctrl = {
             .class = VIRTIO_NET_CTRL_MAC,
@@ -402,6 +391,28 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     return 0;
 }
 
+static int vhost_vdpa_net_load(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    const VirtIONet *n;
+    int r;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (!v->shadow_vqs_enabled) {
+        return 0;
+    }
+
+    n = VIRTIO_NET(v->dev->vdev);
+    r = vhost_vdpa_net_load_mac(s, n);
+    if (unlikely(r < 0)) {
+        return r;
+    }
+
+    return 0;
+}
+
 static NetClientInfo net_vhost_vdpa_cvq_info = {
     .type = NET_CLIENT_DRIVER_VHOST_VDPA,
     .size = sizeof(VhostVDPAState),
-- 
2.31.1


