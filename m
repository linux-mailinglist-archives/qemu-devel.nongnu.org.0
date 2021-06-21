Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47B33AE221
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:18:52 +0200 (CEST)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBOd-0003nT-Pi
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBN3-0001EO-Bc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBN0-0000qx-HE
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIHZoMcmHpo2reoC9xzaIVCloljT1fO9pTKelBYVJFM=;
 b=J0WzUk0DqMd7/GCy1kTYAa+KRRlKTNH8ZDV8pF+tFggcNWZWl/PcrlR/eqzL7jSqL2MmJe
 4Y8H/bM2c0sD8OoPkZJenw66rv0vIzhcu/dwiwGJD59xfay7x6B67giqZaYaulF8kvc2Zi
 DKFQYH0q4DeWzp8pMxMfHj5VXPsWadI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-Zez60RGCOjqwTd5mSVMDyQ-1; Mon, 21 Jun 2021 00:17:08 -0400
X-MC-Unique: Zez60RGCOjqwTd5mSVMDyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB5B100C609;
 Mon, 21 Jun 2021 04:17:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E59A960877;
 Mon, 21 Jun 2021 04:17:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 03/18] vhost_net: do not assume nvqs is always 2
Date: Mon, 21 Jun 2021 12:16:35 +0800
Message-Id: <20210621041650.5826-4-jasowang@redhat.com>
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

This patch switches to initialize dev.nvqs from the VhostNetOptions
instead of assuming it was 2. This is useful for implementing control
virtqueue support which will be a single vhost_net structure with a
single cvq.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c      | 2 +-
 include/net/vhost_net.h | 1 +
 net/tap.c               | 1 +
 net/vhost-user.c        | 1 +
 net/vhost-vdpa.c        | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 6bd4184f96..ef1370bd92 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -163,9 +163,9 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
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
index ffbd94d944..b93918c5a4 100644
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
index 19187dce8c..18b45ad777 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -105,6 +105,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
+    options.nvqs = 2;
 
     net = vhost_net_init(&options);
     if (!net) {
-- 
2.25.1


