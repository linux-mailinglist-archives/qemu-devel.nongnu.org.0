Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955630376E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:45:11 +0100 (CET)
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4J2E-0008Et-7g
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4J0I-0006v0-4P
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4J0G-0001gV-Hy
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611646987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJcUJHvBjXsnwfyTHfgl/jj1ddgQ0Itnc9egQ+dJRPQ=;
 b=AQIiLiFeolelmOEh3fn+cZyrJ+G9FRqgxo5WQFIrDJs/E3Ej/BK2GAvYx5/HXdbfo6QWL2
 V5W7RmCsUkm4u/mcw8Y/6FMXdDwGttT3aITPKp4GvRa95skwXNUvyj+zaz0ul2EvuCw+Vu
 68WUR2ilpv+Jv1rVB8XpUtLu0kVN1hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-2KI1A4jqPfC8IW3cDF45MQ-1; Tue, 26 Jan 2021 02:43:06 -0500
X-MC-Unique: 2KI1A4jqPfC8IW3cDF45MQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997F5806674
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:43:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15E9A5D76F;
 Tue, 26 Jan 2021 07:43:03 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] vhost_net: enable configure interrupt when vhost_net
 start
Date: Tue, 26 Jan 2021 15:42:51 +0800
Message-Id: <20210126074254.3225-3-lulu@redhat.com>
In-Reply-To: <20210126074254.3225-1-lulu@redhat.com>
References: <20210126074254.3225-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While peer is vhost vdpa, setup the configure interrupt function
vhost_net_start and release the resource when vhost_net_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..0660da474a 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -345,6 +345,15 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         error_report("Error binding guest notifier: %d", -r);
         goto err;
     }
+    if (ncs->peer && ncs->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        if (k->set_config_notifiers) {
+            r = k->set_config_notifiers(qbus->parent, true);
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
+            r = k->set_config_notifiers(qbus->parent, false);
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


