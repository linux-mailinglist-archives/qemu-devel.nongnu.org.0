Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB83AE22A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:20:50 +0200 (CEST)
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBQX-00011E-95
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBNW-0002Xz-NO
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBNS-0001D2-DY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCGwZPW63q5Gab/mWm5wN2wDas48n71KH66WkSdMF4g=;
 b=f5q78M71NVb9ai1KCN3Wl6XkGWZAwPQ4o9H+lMMuklZQmz+VGnFOdsq5cs8U2X7ynabsuG
 yXtpOZWNMvnas7yh6bRvI4kz1WBtUUthMg0eG5V9YaVrJ1bFo/bAaJzb/O0ov/SwDei4e5
 G5INXmuOxRaxfvuRJwPGldxpMSW9gHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-TVgs8FrrNbqnuseLoJOB5Q-1; Mon, 21 Jun 2021 00:17:34 -0400
X-MC-Unique: TVgs8FrrNbqnuseLoJOB5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3195100C609;
 Mon, 21 Jun 2021 04:17:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D0060877;
 Mon, 21 Jun 2021 04:17:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 10/18] vhost-vdpa: open device fd in net_init_vhost_vdpa()
Date: Mon, 21 Jun 2021 12:16:42 +0800
Message-Id: <20210621041650.5826-11-jasowang@redhat.com>
In-Reply-To: <20210621041650.5826-1-jasowang@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This path switches to open device fd in net_init_vhost_vpda(). This is
used to prepare for the multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 572aed4ca2..e63a54a938 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -157,24 +157,19 @@ static NetClientInfo net_vhost_vdpa_info = {
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
@@ -202,6 +197,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    int vdpa_device_fd, ret;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -210,5 +206,16 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
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


