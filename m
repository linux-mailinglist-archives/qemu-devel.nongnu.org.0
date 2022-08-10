Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0254058F2AB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:00:41 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqwa-0001sM-1J
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfO-0002AR-BI
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfM-0006nk-Pw
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeyBAG6aT1XeG4X0sacNDdNhmDyM8S/qNFDxSwuCWuI=;
 b=GhKqYMgFODaIliJHlemk+eMKuZeDNsHhDMqRY+Z5AFIL54myc8Pa6vSlBnmsgkL1owxi+K
 lJjuf2BdbUbWmFph5yAMWdyM52RQcQkiVZwkqAkcum4cXM3eETs87SZyqyke7AhvbGe1xs
 1L7muRWXC+m4M0VJur6vvcCxC3cQqrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-tgNjXTU-P-qyKAFHqDjcZQ-1; Wed, 10 Aug 2022 14:42:49 -0400
X-MC-Unique: tgNjXTU-P-qyKAFHqDjcZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA498039A1;
 Wed, 10 Aug 2022 18:42:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC52C15BA4;
 Wed, 10 Aug 2022 18:42:45 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 8/8] vdpa: Conditionally expose _F_LOG in vhost_net devices
Date: Wed, 10 Aug 2022 20:42:20 +0200
Message-Id: <20220810184220.2362292-9-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-1-eperezma@redhat.com>
References: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

Vhost-vdpa networking devices need to met a few conditions to be
migratable. If SVQ is not enabled from the beginnig, to suspend the
device to retrieve the vq state is the first requirement.

However, qemu also needs to be able to intercept SVQ from the beginning.
To be able to do so, the vdpa device needs to expose certains features.

Expose _F_LOG only if all of these are met.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4c6947feb8..73c27cd315 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -49,6 +49,9 @@ typedef struct VhostVDPAState {
     /* Device log enabled */
     bool log_enabled;
 
+    /* Device can suspend */
+    bool feature_suspend;
+
     bool started;
 } VhostVDPAState;
 
@@ -431,6 +434,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     /* Default values */
     v->listener_shadow_vq = s->always_svq || s->log_enabled;
     v->shadow_vqs_enabled = s->always_svq || s->log_enabled;
+    v->feature_log = s->always_svq || s->log_enabled;
     s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_PASSTHROUGH;
 
     if (s->address_space_num < 2) {
@@ -455,6 +459,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
         if (unlikely(vq_group.num == cvq_group.num)) {
             warn_report("CVQ %u group is the same as VQ %u one (%u)",
                          cvq_group.index, vq_group.index, cvq_group.num);
+            v->feature_log = false;
             return 0;
         }
     }
@@ -464,6 +469,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     if (r == 0) {
         v->shadow_vqs_enabled = true;
         s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
+        v->feature_log = s->feature_suspend;
     }
 
 out:
@@ -728,6 +734,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            unsigned nas,
                                            bool is_datapath,
                                            bool svq,
+                                           bool feature_suspend,
                                            VhostIOVATree *iova_tree)
 {
     NetClientState *nc = NULL;
@@ -748,9 +755,11 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
+    s->feature_suspend = feature_suspend;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.listener_shadow_vq = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
+    s->vhost_vdpa.feature_log = feature_suspend;
     if (queue_pair_index == 0) {
         s->memory_listener = (MemoryListener) {
             .log_global_start = vhost_vdpa_net_log_global_start,
@@ -839,7 +848,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     NetClientState *nc;
     int queue_pairs, r, i = 0, has_cvq = 0;
     unsigned num_as = 1;
-    bool svq_cvq;
+    bool svq_cvq, feature_suspend;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -892,10 +901,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
 
+    feature_suspend = backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND);
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, num_as, true,
-                                     opts->x_svq, iova_tree);
+                                     opts->x_svq, feature_suspend, iova_tree);
         if (!ncs[i])
             goto err;
     }
@@ -903,7 +913,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, num_as, false,
-                                 opts->x_svq, iova_tree);
+                                 opts->x_svq, feature_suspend, iova_tree);
         if (!nc)
             goto err;
     }
-- 
2.31.1


