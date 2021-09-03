Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADBF3FFCCD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:13:15 +0200 (CEST)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5G6-0004Mp-MM
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5EE-0001d3-Qs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5ED-0003DC-D0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64erj3ykZlts4/Rl/kgztxwDq2hi6anrP/1lxJeM+64=;
 b=b3/otzIU1hl9goUgKFACnwVryh9B8DY0D/iNhNlOOG7Qdl11fo9nZ/teARX8AQ5opIWa0Z
 xvHuVQt0KEvkusa7D3gBqabS7PfUdwLbiJwX93tCaAyhBZXiJfYtzFR7y+zjnYp4W6kf2w
 8jya4N+Z+01xou3ky1Hy3Cglq2iAXQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-PNUdwOrbOzyQJI5_fIbU8A-1; Fri, 03 Sep 2021 05:11:16 -0400
X-MC-Unique: PNUdwOrbOzyQJI5_fIbU8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E23710054F6;
 Fri,  3 Sep 2021 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3630260BF1;
 Fri,  3 Sep 2021 09:11:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 07/21] vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
Date: Fri,  3 Sep 2021 17:10:17 +0800
Message-Id: <20210903091031.47303-8-jasowang@redhat.com>
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

The previous vhost_net_cleanup is sufficient for freeing, calling
vhost_vdpa_del() in this case will lead an extra round of free. Note
that this kind of "double free" is safe since vhost_dev_cleanup() zero
the whole structure.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 5c09cacd5a..3213e69d63 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -81,16 +81,6 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static void vhost_vdpa_del(NetClientState *ncs)
-{
-    VhostVDPAState *s;
-    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
-    s = DO_UPCAST(VhostVDPAState, nc, ncs);
-    if (s->vhost_net) {
-        vhost_net_cleanup(s->vhost_net);
-    }
-}
-
 static int vhost_vdpa_add(NetClientState *ncs, void *be)
 {
     VhostNetOptions options;
@@ -121,7 +111,6 @@ err:
     if (net) {
         vhost_net_cleanup(net);
     }
-    vhost_vdpa_del(ncs);
     return -1;
 }
 
-- 
2.25.1


