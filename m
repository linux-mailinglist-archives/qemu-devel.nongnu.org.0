Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D23FFD19
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:29:55 +0200 (CEST)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5WE-0000kA-AY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5Eh-000323-F6
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5Ef-0003aW-Ry
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oznsK4TYWyVPd+Wvkh0qoOvkqDiKzoLreIhBVUPJ29U=;
 b=ZnkorJvKNR7DXZcQbUv7TfrcwxjteyPJwaBZpJkX24qZQxdgjSLsk61HX6ssMu9oSMWUOi
 MWnwT6N7Xb86gkNBwGJM3xCcnLgKv622h4IFkOCeCkf6IJW/vNjT99/Bk16UZhFwHtRtv+
 MhTM96jWPuFnnChPLg7XYVNuqrSnFPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-S2a8u1l7M0KQtbYPg1KrOA-1; Fri, 03 Sep 2021 05:11:44 -0400
X-MC-Unique: S2a8u1l7M0KQtbYPg1KrOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 254951854E20;
 Fri,  3 Sep 2021 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 260CC60BF1;
 Fri,  3 Sep 2021 09:11:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 12/21] vhost-vdpa: open device fd in net_init_vhost_vdpa()
Date: Fri,  3 Sep 2021 17:10:22 +0800
Message-Id: <20210903091031.47303-13-jasowang@redhat.com>
In-Reply-To: <20210903091031.47303-1-jasowang@redhat.com>
References: <20210903091031.47303-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lulu@redhat.com, gdawar@xilinx.com, eperezma@redhat.com, elic@nvidia.com,
 lingshan.zhu@intel.com, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This path switches to open device fd in net_init_vhost_vpda(). This is
used to prepare for the multiqueue support.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 912686457c..73d29a74ef 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -156,24 +156,19 @@ static NetClientInfo net_vhost_vdpa_info = {
 };
 
 static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
-                               const char *name, const char *vhostdev)
+                               const char *name, int vdpa_device_fd)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
-    int vdpa_device_fd = -1;
     int ret = 0;
     assert(name);
     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
-    vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-    if (vdpa_device_fd == -1) {
-        return -errno;
-    }
+
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
-        qemu_close(vdpa_device_fd);
         qemu_del_net_client(nc);
     }
     return ret;
@@ -201,6 +196,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    int vdpa_device_fd, ret;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -209,5 +205,16 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                           (char *)name, errp)) {
         return -1;
     }
-    return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
+
+    vdpa_device_fd = qemu_open_old(opts->vhostdev, O_RDWR);
+    if (vdpa_device_fd == -1) {
+        return -errno;
+    }
+
+    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
+    if (ret) {
+        qemu_close(vdpa_device_fd);
+    }
+
+    return ret;
 }
-- 
2.25.1


