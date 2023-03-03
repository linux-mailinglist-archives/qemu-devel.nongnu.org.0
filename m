Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E75D6A9DA6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9AN-000170-FF; Fri, 03 Mar 2023 12:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99w-0000q5-P8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99t-0005hR-Vo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXv/w5pUqu4Xe3zCx5/W1q+NbgG8V0nkqCK9SpXcFKY=;
 b=CAh8OQtKgnUmzQSW//5qrW0oXMtVCqPNw6myWJCk1jwepPPBdgPW7HT4q38lLcvyAK1/Nx
 aPBUZJVBpq/DXUO8MUQLf0PPzAc3d03e0wimtoYwl/Sfv+EhR1+QrcMRVrzd4TXS+aQF/g
 TvT+OMAc2RW11KrWjleQntb3AuirC50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-iEVtxzKdM5WnzR2_1CyCkA-1; Fri, 03 Mar 2023 12:25:26 -0500
X-MC-Unique: iEVtxzKdM5WnzR2_1CyCkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34C7985CCE4;
 Fri,  3 Mar 2023 17:25:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A0C440D8;
 Fri,  3 Mar 2023 17:25:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Lei Yang <leiyang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Shannon Nelson <snelson@pensando.io>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v5 11/14] vdpa: block migration if device has unsupported
 features
Date: Fri,  3 Mar 2023 18:24:42 +0100
Message-Id: <20230303172445.1089785-12-eperezma@redhat.com>
In-Reply-To: <20230303172445.1089785-1-eperezma@redhat.com>
References: <20230303172445.1089785-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

A vdpa net device must initialize with SVQ in order to be migratable at
this moment, and initialization code verifies some conditions.  If the
device is not initialized with the x-svq parameter, it will not expose
_F_LOG so the vhost subsystem will block VM migration from its
initialization.

Next patches change this, so we need to verify migration conditions
differently.

QEMU only supports a subset of net features in SVQ, and it cannot
migrate state that cannot track or restore in the destination.  Add a
migration blocker if the device offers an unsupported feature.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v3: add migration blocker properly so vhost_dev can handle it.
---
 net/vhost-vdpa.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 533ba54317..1089c35959 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int nvqs,
                                        bool is_datapath,
                                        bool svq,
-                                       struct vhost_vdpa_iova_range iova_range)
+                                       struct vhost_vdpa_iova_range iova_range,
+                                       uint64_t features)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-    if (!is_datapath) {
+    if (queue_pair_index == 0) {
+        vhost_vdpa_net_valid_svq_features(features,
+                                          &s->vhost_vdpa.migration_blocker);
+    } else if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
         memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
@@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range);
+                                     iova_range, features);
         if (!ncs[i])
             goto err;
     }
@@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range);
+                                 opts->x_svq, iova_range, features);
         if (!nc)
             goto err;
     }
-- 
2.31.1


