Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A083FFD0D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:27:24 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Tn-000370-ME
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5E2-0000wB-SM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5E1-00033R-7J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCGH0HFb2ZDk3oTS+UwDghALPfMJPeJDR24dam/uXHk=;
 b=HSVT0uIQS9keoIq/VE93ZwudzLqUorrAjlJze50taZuxtn6W3tdlBRXHpGCyswZRTmaW7k
 qB8bRUZgXkg+ak+3ZxEpxg2Ctuoj3zUijanBvLo3E/gf68zg/K3RteaQARaJUTAoXN6Xc+
 pr8X16nsqoAd17pU8lavs777DRAcBys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-y0bvp9rsMBuOiJGm3928jA-1; Fri, 03 Sep 2021 05:11:03 -0400
X-MC-Unique: y0bvp9rsMBuOiJGm3928jA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63B35835DE1;
 Fri,  3 Sep 2021 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57EE560BF1;
 Fri,  3 Sep 2021 09:10:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 05/21] vhost_net: do not assume nvqs is always 2
Date: Fri,  3 Sep 2021 17:10:15 +0800
Message-Id: <20210903091031.47303-6-jasowang@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

This patch switches to initialize dev.nvqs from the VhostNetOptions
instead of assuming it was 2. This is useful for implementing control
virtqueue support which will be a single vhost_net structure with a
single cvq.

Note that nvqs is still set to 2 for all users and this patch does not
change functionality.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c      | 2 +-
 include/net/vhost_net.h | 1 +
 net/tap.c               | 1 +
 net/vhost-user.c        | 1 +
 net/vhost-vdpa.c        | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 6ed0c39836..386ec2eaa2 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -165,9 +165,9 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
         goto fail;
     }
     net->nc = options->net_backend;
+    net->dev.nvqs = options->nvqs;
 
     net->dev.max_queues = 1;
-    net->dev.nvqs = 2;
     net->dev.vqs = net->vqs;
 
     if (backend_kernel) {
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 172b0051d8..fba40cf695 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -14,6 +14,7 @@ typedef struct VhostNetOptions {
     VhostBackendType backend_type;
     NetClientState *net_backend;
     uint32_t busyloop_timeout;
+    unsigned int nvqs;
     void *opaque;
 } VhostNetOptions;
 
diff --git a/net/tap.c b/net/tap.c
index f5686bbf77..f716be3e3f 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -749,6 +749,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             qemu_set_nonblock(vhostfd);
         }
         options.opaque = (void *)(uintptr_t)vhostfd;
+        options.nvqs = 2;
 
         s->vhost_net = vhost_net_init(&options);
         if (!s->vhost_net) {
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 6adfcd623a..4a939124d2 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -85,6 +85,7 @@ static int vhost_user_start(int queues, NetClientState *ncs[],
         options.net_backend = ncs[i];
         options.opaque      = be;
         options.busyloop_timeout = 0;
+        options.nvqs = 2;
         net = vhost_net_init(&options);
         if (!net) {
             error_report("failed to init vhost_net for queue %d", i);
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 72829884d7..395117debd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -104,6 +104,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
+    options.nvqs = 2;
 
     net = vhost_net_init(&options);
     if (!net) {
-- 
2.25.1


