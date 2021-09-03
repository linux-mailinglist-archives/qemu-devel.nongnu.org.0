Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197893FFD45
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:37:44 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5dn-00079H-5X
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5FB-00045n-2X
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5F7-0003zk-LC
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AN9MvBB/2SAN5dBYgsgpRwPgatjvg7plur/HtJIJRaM=;
 b=Cne09FlkW2g8NGm/iWyHGZfkYJLo12LycdCeA/HR16mrooQ++neo7nSyHAKOVoshregXaq
 vOVH4aR/y7YsconJA6I0HJxxqcW7WvDRa/yqjqyAkn9T4FZxb3dTujXHCSl7aUTZe/mCnU
 CdxKisu5Vj8r5lyG00N27SEds6vzvLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-E4zEjB8bOtCL0X8vEwciJg-1; Fri, 03 Sep 2021 05:12:12 -0400
X-MC-Unique: E4zEjB8bOtCL0X8vEwciJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C931854E26;
 Fri,  3 Sep 2021 09:12:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A7E160C81;
 Fri,  3 Sep 2021 09:12:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 16/21] net: introduce control client
Date: Fri,  3 Sep 2021 17:10:26 +0800
Message-Id: <20210903091031.47303-17-jasowang@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
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


