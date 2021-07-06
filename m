Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04573BC7FB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:38:01 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gae-0003JE-K8
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRe-00020j-JZ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRc-0002uw-9J
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhYJ/O6+gxLZFzIcP8Sncd7pWbd0DQGZu9BeD+UIvJU=;
 b=e3nQf42yPMDqeaK/NzmTYQZ3OxwmZjwbwuYHl0CDdgG+zS2Xvm/urxOEyVcaltNcz2Psfs
 Xf9ajP+QwXGFwF1aRYD4EuMUdnbnlspUMTrEKYeGuIe5r6p/jnE8lsPzRLZSSFomkU3EoY
 ZFLcge1E92SasCLVTDQ7dyj+X38kfuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-GEui85HQOpujjBcdyu71lA-1; Tue, 06 Jul 2021 04:28:38 -0400
X-MC-Unique: GEui85HQOpujjBcdyu71lA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 705A1804141;
 Tue,  6 Jul 2021 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-227.pek2.redhat.com
 [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3F4017A70;
 Tue,  6 Jul 2021 08:28:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2 14/18] net: introduce control client
Date: Tue,  6 Jul 2021 16:27:13 +0800
Message-Id: <20210706082717.37730-15-jasowang@redhat.com>
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

This patch introduces a boolean for the device has control queue which
can accepts control command via network queue.

The first user would be the control virtqueue support for vhost.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h |  5 +++++
 net/net.c         | 24 +++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 5d1508081f..4f400b8a09 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -103,6 +103,7 @@ struct NetClientState {
     int vnet_hdr_len;
     bool is_netdev;
     bool do_not_pad; /* do not pad to the minimum ethernet frame length */
+    bool is_datapath;
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
@@ -134,6 +135,10 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
                                     NetClientState *peer,
                                     const char *model,
                                     const char *name);
+NetClientState *qemu_new_net_control_client(NetClientInfo *info,
+                                        NetClientState *peer,
+                                        const char *model,
+                                        const char *name);
 NICState *qemu_new_nic(NetClientInfo *info,
                        NICConf *conf,
                        const char *model,
diff --git a/net/net.c b/net/net.c
index 76bbb7c31b..fcaf9c7715 100644
--- a/net/net.c
+++ b/net/net.c
@@ -237,7 +237,8 @@ static void qemu_net_client_setup(NetClientState *nc,
                                   NetClientState *peer,
                                   const char *model,
                                   const char *name,
-                                  NetClientDestructor *destructor)
+                                  NetClientDestructor *destructor,
+                                  bool is_datapath)
 {
     nc->info = info;
     nc->model = g_strdup(model);
@@ -256,6 +257,7 @@ static void qemu_net_client_setup(NetClientState *nc,
 
     nc->incoming_queue = qemu_new_net_queue(qemu_deliver_packet_iov, nc);
     nc->destructor = destructor;
+    nc->is_datapath = is_datapath;
     QTAILQ_INIT(&nc->filters);
 }
 
@@ -270,7 +272,23 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
 
     nc = g_malloc0(info->size);
     qemu_net_client_setup(nc, info, peer, model, name,
-                          qemu_net_client_destructor);
+                          qemu_net_client_destructor, true);
+
+    return nc;
+}
+
+NetClientState *qemu_new_net_control_client(NetClientInfo *info,
+                                            NetClientState *peer,
+                                            const char *model,
+                                            const char *name)
+{
+    NetClientState *nc;
+
+    assert(info->size >= sizeof(NetClientState));
+
+    nc = g_malloc0(info->size);
+    qemu_net_client_setup(nc, info, peer, model, name,
+                          qemu_net_client_destructor, false);
 
     return nc;
 }
@@ -295,7 +313,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
 
     for (i = 0; i < queues; i++) {
         qemu_net_client_setup(&nic->ncs[i], info, peers[i], model, name,
-                              NULL);
+                              NULL, true);
         nic->ncs[i].queue_index = i;
     }
 
-- 
2.25.1


