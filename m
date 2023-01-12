Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1353667C87
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:29:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1Kj-0007IQ-QJ; Thu, 12 Jan 2023 12:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KY-0007I8-6s
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KW-00005Q-JF
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CklSSM2yoSQ5DuSf0oh87A7pvDhsywraUVO8LLe4E1Q=;
 b=J2syqdWnnUc6Gs31CK/au9ivbLZfNn+Es0etfzutm9FdSQQPTM+JlgvuEkHbNa/N5rJ7vr
 62gol5NzCNtP9+6IIwLYy3BcmffAFEHnMcbUwbo20Bn5N+C8Y6X3mkW7kvFs0bpMddGVzB
 U6FNg1OtXDenn1DOxI5REuQ+2iuP8qM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-4_3ccBsZM3yANWtqT1W7lg-1; Thu, 12 Jan 2023 12:25:26 -0500
X-MC-Unique: 4_3ccBsZM3yANWtqT1W7lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C4FE1C29D46;
 Thu, 12 Jan 2023 17:25:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC27F4078903;
 Thu, 12 Jan 2023 17:25:21 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC v2 13/13] vdpa: Conditionally expose _F_LOG in vhost_net devices
Date: Thu, 12 Jan 2023 18:24:34 +0100
Message-Id: <20230112172434.760850-14-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vhost-vdpa networking devices need to meet a few conditions to be
migratable. If SVQ is not enabled from the beginning, to suspend the
device to retrieve the vq state is the first requirement.

Expose _F_LOG only in that case.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index f38532b1df..9cf931010b 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -831,6 +831,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int nvqs,
                                        bool is_datapath,
                                        bool svq,
+                                       bool feature_log,
                                        struct vhost_vdpa_iova_range iova_range)
 {
     NetClientState *nc = NULL;
@@ -854,6 +855,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
+    s->vhost_vdpa.feature_log = feature_log;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
@@ -920,12 +922,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
-    uint64_t features;
+    uint64_t features, backend_features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     struct vhost_vdpa_iova_range iova_range;
     NetClientState *nc;
     int queue_pairs, r, i = 0, has_cvq = 0;
+    bool feature_log;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -955,6 +958,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         }
     }
 
+    r = ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
+    if (unlikely(r < 0)) {
+        error_setg_errno(errp, errno, "Cannot get vdpa backend_features");
+        goto err;
+    }
+
     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
     if (unlikely(r < 0)) {
         goto err;
@@ -980,10 +989,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
 
+    /*
+     * Offer VHOST_F_LOG_ALL as long as the device met basic requisites, and
+     * let more complicated ones to vhost_vdpa_net_{cvq,data}_start.
+     */
+    feature_log = opts->x_svq ||
+                  ((backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND)) &&
+                   vhost_vdpa_net_valid_svq_features(features, NULL));
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range);
+                                     feature_log, iova_range);
         if (!ncs[i])
             goto err;
     }
@@ -991,7 +1007,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range);
+                                 opts->x_svq, feature_log, iova_range);
         if (!nc)
             goto err;
     }
-- 
2.31.1


