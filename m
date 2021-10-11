Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB44285F6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 06:39:01 +0200 (CEST)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZn5Y-0000Vm-Ch
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 00:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mZmwD-0001Ik-MH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mZmwA-000365-3p
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633926557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrKIFwvO1KWD1hYthrofeVlarJwkjjhJoX4eFsAZ6m4=;
 b=Qz+Dxnlu440g8tGJFjV3SOywld9zimlO3lR2cgCgT+325jKETM7hHRoRWWM1lYUSCE8wPC
 apKm8n/gFf2Nu2rZBXKBzN67KhMMPzlft1v6E+6k6lJPICpmjzLH+b7eA/EHiVwFhRf6MX
 CLaLjF3lW0hV9VknaXh7z1qfTgulx9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-xTjK2AN-NTq5rGLyi34XBQ-1; Mon, 11 Oct 2021 00:29:01 -0400
X-MC-Unique: xTjK2AN-NTq5rGLyi34XBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBDE9824FA6;
 Mon, 11 Oct 2021 04:29:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-160.pek2.redhat.com
 [10.72.13.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1830F19D9B;
 Mon, 11 Oct 2021 04:28:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V4 05/10] net: introduce control client
Date: Mon, 11 Oct 2021 12:28:24 +0800
Message-Id: <20211011042829.4159-6-jasowang@redhat.com>
In-Reply-To: <20211011042829.4159-1-jasowang@redhat.com>
References: <20211011042829.4159-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This patch introduces a boolean for the device has control queue which
can accepts control command via network queue.

The first user would be the control virtqueue support for vhost.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-6-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 52c99196c6..f0d14dbfc1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -239,7 +239,8 @@ static void qemu_net_client_setup(NetClientState *nc,
                                   NetClientState *peer,
                                   const char *model,
                                   const char *name,
-                                  NetClientDestructor *destructor)
+                                  NetClientDestructor *destructor,
+                                  bool is_datapath)
 {
     nc->info = info;
     nc->model = g_strdup(model);
@@ -258,6 +259,7 @@ static void qemu_net_client_setup(NetClientState *nc,
 
     nc->incoming_queue = qemu_new_net_queue(qemu_deliver_packet_iov, nc);
     nc->destructor = destructor;
+    nc->is_datapath = is_datapath;
     QTAILQ_INIT(&nc->filters);
 }
 
@@ -272,7 +274,23 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
 
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
@@ -297,7 +315,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
 
     for (i = 0; i < queues; i++) {
         qemu_net_client_setup(&nic->ncs[i], info, peers[i], model, name,
-                              NULL);
+                              NULL, true);
         nic->ncs[i].queue_index = i;
     }
 
-- 
2.25.1


