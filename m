Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A634BA7BB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:10:11 +0100 (CET)
Received: from localhost ([::1]:38270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlEH-0001Qs-Jp
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:10:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKkvk-00082R-SZ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKkvg-00080B-GJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645120241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zTsCoUoM6GSUXC9kbdbEv3j0VsB+4Z+ZH7S1KgtdN0Y=;
 b=DhYk1rp9+8ZPmZ4cs5OIx/VN/ZFGjbdu5eug7jVpOXLvbdThlL2vAbOzM7hqYY1odRnJbB
 bMwbk3NSxh5bBtfC8eVlG+2pxQCnE9a9HJB2BOpyISDrFodht8zopWCnQUyuf5F2CgJCp2
 cLQls+JHkdI8Iy3Q/gvyzdvC4yYRRSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-OIMqpYAEMEO6DHv7ZLQ5Eg-1; Thu, 17 Feb 2022 12:50:38 -0500
X-MC-Unique: OIMqpYAEMEO6DHv7ZLQ5Eg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85B7F84DA40;
 Thu, 17 Feb 2022 17:50:37 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36987DE5B;
 Thu, 17 Feb 2022 17:50:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] virtio-net: Unlimit tx queue size if peer is vdpa
Date: Thu, 17 Feb 2022 18:50:29 +0100
Message-Id: <20220217175029.2517071-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code used to limit the maximum size of tx queue for others backends
than vhost_user since the introduction of configurable tx queue size in
9b02e1618cf2 ("virtio-net: enable configurable tx queue size").

As vhost_user, vhost_vdpa devices should deal with memory region
crosses already, so let's use the full tx size.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 49cd13314a..b1769bfee0 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -629,17 +629,20 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
     NetClientState *peer = n->nic_conf.peers.ncs[0];
 
     /*
-     * Backends other than vhost-user don't support max queue size.
+     * Backends other than vhost-user or vhost-vdpa don't support max queue
+     * size.
      */
     if (!peer) {
         return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
     }
 
-    if (peer->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
+    switch(peer->info->type) {
+    case NET_CLIENT_DRIVER_VHOST_USER:
+    case NET_CLIENT_DRIVER_VHOST_VDPA:
+        return VIRTQUEUE_MAX_SIZE;
+    default:
         return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
-    }
-
-    return VIRTQUEUE_MAX_SIZE;
+    };
 }
 
 static int peer_attach(VirtIONet *n, int index)
-- 
2.27.0


