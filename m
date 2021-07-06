Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EF3BC7F8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:37:50 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gaT-0002db-7B
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRd-0001yO-0L
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRZ-0002sS-1g
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2v/6cYoMfoCiTZYXMcg5SJpP6eFFfJCxNj89FOlxEFM=;
 b=H60vcRAxDxsWCwK15G9ECQvWzAQtpHWhX+wz8Q0+oCRjVvh3acC749UvrjmP+CTa54uf53
 VYPaxqixoE4hKEvxgIKgGP57Y9V8ZlDkyxiZLthUDs9LBWa458vMqPVP2WqPMPpa69tnB5
 1YbS85LbEe+EULNdpln23WXcGjQUi20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Emt7f2bcMiipq2PAC8RAZA-1; Tue, 06 Jul 2021 04:28:35 -0400
X-MC-Unique: Emt7f2bcMiipq2PAC8RAZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BACF10C1ADC;
 Tue,  6 Jul 2021 08:28:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-227.pek2.redhat.com
 [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 921E62EB02;
 Tue,  6 Jul 2021 08:28:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2 13/18] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
Date: Tue,  6 Jul 2021 16:27:12 +0800
Message-Id: <20210706082717.37730-14-jasowang@redhat.com>
In-Reply-To: <20210706082717.37730-1-jasowang@redhat.com>
References: <20210706082717.37730-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This patch switches to let net_vhost_vdpa_init() to return
NetClientState *. This is used for the callers to allocate multiqueue
NetClientState for multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e63a54a938..cc11b2ec40 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -156,8 +156,10 @@ static NetClientInfo net_vhost_vdpa_info = {
         .has_ufo = vhost_vdpa_has_ufo,
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
@@ -171,8 +173,9 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
         qemu_del_net_client(nc);
+        return NULL;
     }
-    return ret;
+    return nc;
 }
 
 static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
@@ -197,7 +200,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
-    int vdpa_device_fd, ret;
+    int vdpa_device_fd;
+    NetClientState *nc;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -212,10 +216,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
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


