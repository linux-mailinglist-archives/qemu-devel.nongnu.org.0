Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27086F5460
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8aE-0004dY-Bx; Wed, 03 May 2023 05:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8aA-0004EP-MM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8a8-0007Qs-KH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WLQCQHr3+R7LOMp/vZIq2FAN7t0z8GbCrXcfznFhD4=;
 b=W8M4NaEqOPeTmOt1VCn3s81zf+YoKV7/AIHnVd0LvBDg9AW6zllU1nmcyqfSgx11KL0kEU
 ngmQhaH/4nwNoW34y76H1AWgSnS9zkQXf/IasU6Ir1jwwOJp4BylqLIzWGx59fzHdVNIuU
 QFIMgUBWUwVvP3we8LdMM5VQD9zwrYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-nGqaynikONGzdm8_qdfNUQ-1; Wed, 03 May 2023 05:14:14 -0400
X-MC-Unique: nGqaynikONGzdm8_qdfNUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19A5B811E7B
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:14:14 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 283B51121331;
 Wed,  3 May 2023 09:14:11 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 4/7] net/vhost-vdpa: Add the check for iommufd
Date: Wed,  3 May 2023 17:13:34 +0800
Message-Id: <20230503091337.2130631-5-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add the check for object iommufd, if the iommfd enabled.
pass the information to vhost_vdpa.
vhost_vdpa dev start will check this bool and connect
to the iommufd

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 net/vhost-vdpa.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1a13a34d35..d4819c28e1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -659,16 +659,12 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
 };
 
-static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
-                                       const char *device,
-                                       const char *name,
-                                       int vdpa_device_fd,
-                                       int queue_pair_index,
-                                       int nvqs,
-                                       bool is_datapath,
-                                       bool svq,
-                                       struct vhost_vdpa_iova_range iova_range,
-                                       VhostIOVATree *iova_tree)
+static NetClientState *
+net_vhost_vdpa_init(NetClientState *peer, const char *device, const char *name,
+                    int vdpa_device_fd, int queue_pair_index, int nvqs,
+                    bool is_datapath, bool svq, bool enable_iommufd,
+                    struct vhost_vdpa_iova_range iova_range,
+                    VhostIOVATree *iova_tree)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -691,6 +687,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
+    s->vhost_vdpa.enable_iommufd = enable_iommufd;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
@@ -793,6 +790,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         }
     }
 
+    bool enable_iommufd = false;
+    if (opts->iommufd) {
+        enable_iommufd = true;
+        printf("[%s] %d called\n", __func__, __LINE__);
+    }
+
     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
     if (unlikely(r < 0)) {
         goto err;
@@ -825,15 +828,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range, iova_tree);
+                                     enable_iommufd, iova_range, iova_tree);
         if (!ncs[i])
             goto err;
     }
 
     if (has_cvq) {
-        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range, iova_tree);
+        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd, i,
+                                 1, false, opts->x_svq, enable_iommufd,
+                                 iova_range, iova_tree);
         if (!nc)
             goto err;
     }
-- 
2.34.3


