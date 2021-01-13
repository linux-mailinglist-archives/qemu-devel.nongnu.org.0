Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3082F4F23
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:49:45 +0100 (CET)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziP2-0000rj-Qx
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kziMd-0007Yz-KM
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:47:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kziMc-0006gr-0H
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIOY3cggUrcZd6xE+qdaB8L9QcWGHxHMUL82Yz+sDBg=;
 b=Tx3nI+9Jxe0e0j5grdMhPdUy0GDqoYX6S0Pcq6w/oA8ryJHUT0rJPBFtfKvBoDDzESR5P4
 SD40HdsGvhpQS76LWXonncs22fMm/hBMHMQB306Q/UOEZmkrU/NSlk8BVvRz4bUtQvf2U6
 ckSJY1e+PzeIFVihUR/a6BVpS8DOK/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-1NxiEkWlMMeROfoJFezkjQ-1; Wed, 13 Jan 2021 10:46:02 -0500
X-MC-Unique: 1NxiEkWlMMeROfoJFezkjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BF8E1008545
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:46:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-95.pek2.redhat.com [10.72.12.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A735F6F96F;
 Wed, 13 Jan 2021 15:45:59 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v1 3/4] vhost_net:enable configure interrupt when vhost_net
 start
Date: Wed, 13 Jan 2021 23:45:39 +0800
Message-Id: <20210113154540.24981-4-lulu@redhat.com>
In-Reply-To: <20210113154540.24981-1-lulu@redhat.com>
References: <20210113154540.24981-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When peer is vhost vdpa, setup the configure interrupt function
vhost_net_start and release the resource when vhost_net_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..fddc1f51f5 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -345,6 +345,15 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         error_report("Error binding guest notifier: %d", -r);
         goto err;
     }
+    if (ncs->peer && ncs->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        if (k->set_config_notifiers) {
+            r = k->set_config_notifiers(qbus->parent, true, true);
+            if (r < 0) {
+                error_report("Error binding config notifier: %d", -r);
+                goto err;
+            }
+       }
+    }
 
     for (i = 0; i < total_queues; i++) {
         peer = qemu_get_peer(ncs, i);
@@ -391,7 +400,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
     for (i = 0; i < total_queues; i++) {
         vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
     }
-
+   if (ncs->peer && ncs->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        if (k->set_config_notifiers) {
+            r = k->set_config_notifiers(qbus->parent, false, false);
+            if (r < 0) {
+                error_report("Error unbinding config notifier: %d", -r);
+            }
+           assert(r >= 0);
+        }
+    }
     r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
     if (r < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
-- 
2.21.3


