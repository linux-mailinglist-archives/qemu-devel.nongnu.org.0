Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BBA653152
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ync-0005nE-DD; Wed, 21 Dec 2022 08:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymo-0005Ml-Ly
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymn-0004He-0B
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRkqrikn3+XUzCfSkO+8lDjCkJkCsNrKmaBhsfjqiQA=;
 b=ffYkWbN9/di1uPPVWgr0sL2iICxPx4EGFNSyXm6oRc06bjsl4YJJnyZ0vZF5/tFeEnSVef
 GvTFpc6Cy4s7cc05a76qWbayDGvxMKTsnD/Oroah/4Yaz0lJ+H8/vXbYZL6uXMICY0SpXz
 IM0d2l1wg7Y1ae187LkoVpDERZvH4yI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-dLw2z0AbMomeC9XPEj1iWA-1; Wed, 21 Dec 2022 08:05:27 -0500
X-MC-Unique: dLw2z0AbMomeC9XPEj1iWA-1
Received: by mail-wm1-f70.google.com with SMTP id
 q6-20020a05600c2e4600b003d211775a99so1302690wmf.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRkqrikn3+XUzCfSkO+8lDjCkJkCsNrKmaBhsfjqiQA=;
 b=dnwnvPTAHrUWSh+CG+9xxBA073DbLeJN2sv6i7us/kMskeezmpWZoNvTW74W7Nr15v
 HKg+2gxY6lFiDKTt4DCMNqLiV94pE1EDyq3UWZ8Io/wQV8nrNaQ3E2MHpCBeyHI8aGwV
 6ikx40jdnHM0dvOVsCKjE6sN6f1Q33yoJFPl4IMo/uu/KWzyG3PYima5OtJj+I+AMnY+
 iwN/AV01kxCjZRLNcfQpZWQHozvSlWh2jaFhtR2sFYbXh4m97gLmmx7wc8PGIcp/zOVl
 WDw8xdMkAzuqdSIBdJSErGGvson9xx5NcmFeW+piGtEunmUh0dQ82mokEqLKTwWOu8ed
 zx+g==
X-Gm-Message-State: AFqh2krqYaie1q2+Z02ZQ9f6WHzrDC3cMA0SaGf9P2AhFHihO+oXjVzD
 0zImEuuliUruXUzY920IkSrPdddxWSUPoGkYcMI1PGAdiElxzIkLWHt+NLQPRfmsRwgdbAKKjXl
 Go9UWHzRpfWuK4rAutmPRE/F6lkdr9aXSEHBNkM1IA1Oc9wTJw6SOO+iHVl08
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr1647839wmd.9.1671627925196; 
 Wed, 21 Dec 2022 05:05:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsS/IVXDiIBT+jx/5sou/3Ig2j72Ks00+JnSPdx6bMBMuiN4oLznzukxbv69Tvl0Jzc3I9PzA==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr1647826wmd.9.1671627924985; 
 Wed, 21 Dec 2022 05:05:24 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b003d359aa353csm2496153wmq.45.2022.12.21.05.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:23 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasonwang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 17/41] vdpa: request iova_range only once
Message-ID: <20221221130339.1234592-18-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Currently iova range is requested once per queue pair in the case of
net. Reduce the number of ioctls asking it once at initialization and
reusing that value for each vhost_vdpa.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20221215113144.322011-7-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasonwang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 15 ---------------
 net/vhost-vdpa.c       | 27 ++++++++++++++-------------
 2 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 014c69a475..7f6bfd961c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -365,19 +365,6 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     return 0;
 }
 
-static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
-{
-    int ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
-                              &v->iova_range);
-    if (ret != 0) {
-        v->iova_range.first = 0;
-        v->iova_range.last = UINT64_MAX;
-    }
-
-    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
-                                    v->iova_range.last);
-}
-
 /*
  * The use of this function is for requests that only need to be
  * applied once. Typically such request occurs at the beginning
@@ -465,8 +452,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         goto err;
     }
 
-    vhost_vdpa_get_iova_range(v);
-
     if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2c0ff6d7b0..b6462f0192 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -541,14 +541,15 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
 };
 
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
-                                           const char *device,
-                                           const char *name,
-                                           int vdpa_device_fd,
-                                           int queue_pair_index,
-                                           int nvqs,
-                                           bool is_datapath,
-                                           bool svq,
-                                           VhostIOVATree *iova_tree)
+                                       const char *device,
+                                       const char *name,
+                                       int vdpa_device_fd,
+                                       int queue_pair_index,
+                                       int nvqs,
+                                       bool is_datapath,
+                                       bool svq,
+                                       struct vhost_vdpa_iova_range iova_range,
+                                       VhostIOVATree *iova_tree)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -567,6 +568,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
@@ -646,6 +648,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
+    struct vhost_vdpa_iova_range iova_range;
     NetClientState *nc;
     int queue_pairs, r, i = 0, has_cvq = 0;
 
@@ -689,14 +692,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return queue_pairs;
     }
 
+    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
     if (opts->x_svq) {
-        struct vhost_vdpa_iova_range iova_range;
-
         if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
             goto err_svq;
         }
 
-        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
         iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
     }
 
@@ -705,7 +706,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_tree);
+                                     iova_range, iova_tree);
         if (!ncs[i])
             goto err;
     }
@@ -713,7 +714,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_tree);
+                                 opts->x_svq, iova_range, iova_tree);
         if (!nc)
             goto err;
     }
-- 
MST


