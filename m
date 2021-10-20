Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C660D434473
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:01:37 +0200 (CEST)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3jM-0001Zk-RP
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3eh-0002Kj-NN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3ef-0007rW-Vm
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634705805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCGdI+T0gT+l8KWgZC0lw8Tma6FcejZ/06nwvfIJxfc=;
 b=WxomeZCeE8RuSuodqXC9a6ukUAdM8b0ussx7k1sLCT/11I3uGG1iXyj3HV9OLtww+PGjds
 W26l0FWj4HIWCjsDCbnJ1pGZ7yQ+CcFPBpGxiUa5G9UNyWkf15dYivxKy1zIHMMaqHcCfG
 i1riWgeSNeVuURAU2IWM4mVuuDFQTXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-lnsopeTBMwyS2JjMI2PGhw-1; Wed, 20 Oct 2021 00:56:42 -0400
X-MC-Unique: lnsopeTBMwyS2JjMI2PGhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E58806688;
 Wed, 20 Oct 2021 04:56:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-13.pek2.redhat.com [10.72.13.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A956A60BF1;
 Wed, 20 Oct 2021 04:56:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V5 04/10] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
Date: Wed, 20 Oct 2021 12:55:54 +0800
Message-Id: <20211020045600.16082-5-jasowang@redhat.com>
In-Reply-To: <20211020045600.16082-1-jasowang@redhat.com>
References: <20211020045600.16082-1-jasowang@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to let net_vhost_vdpa_init() to return
NetClientState *. This is used for the callers to allocate multiqueue
NetClientState for multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fd4ff5a0fb..151f60184d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -169,8 +169,10 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
-static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
-                               const char *name, int vdpa_device_fd)
+static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
+                                           const char *device,
+                                           const char *name,
+                                           int vdpa_device_fd)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -184,15 +186,17 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
         qemu_del_net_client(nc);
+        return NULL;
     }
-    return ret;
+    return nc;
 }
 
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
-    int vdpa_device_fd, ret;
+    int vdpa_device_fd;
+    NetClientState *nc;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -202,10 +206,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
-    if (ret) {
+    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
+    if (!nc) {
         qemu_close(vdpa_device_fd);
+        return -1;
     }
 
-    return ret;
+    return 0;
 }
-- 
2.25.1


