Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0864757660F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:32:19 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCPAo-0004rI-7C
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOy1-0004sH-PM
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOy0-0005sH-8A
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657905543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VFI7Qq3P0oJUhO9TZwdYJZr2TRLgQmgOa7NOJmaqao=;
 b=EfV34Wyt+7Yy50I/pg0me9X+ojBV1em19tZCb/iKwI0BRVUW9nLhnpmVBQqBvjUN3wrpvU
 zaZhqyKtsInqA9e8QDAUdeiB5++j2at6DWetss+iy7FK6Pcd+NpdRVbeT5z21RH+ZAkveH
 VEFjtnM/cleJUctqU+a08eZUJAZKG8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-cNupAcctM8WEdiPOdPNeWg-1; Fri, 15 Jul 2022 13:18:52 -0400
X-MC-Unique: cNupAcctM8WEdiPOdPNeWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 636E73806739;
 Fri, 15 Jul 2022 17:18:52 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C83640E8B04;
 Fri, 15 Jul 2022 17:18:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 04/19] vhost: Reorder vhost_svq_kick
Date: Fri, 15 Jul 2022 19:18:19 +0200
Message-Id: <20220715171834.2666455-5-eperezma@redhat.com>
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
References: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Future code needs to call it from vhost_svq_add.

No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e2184a4481..fd1839cec5 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -215,6 +215,20 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     return true;
 }
 
+static void vhost_svq_kick(VhostShadowVirtqueue *svq)
+{
+    /*
+     * We need to expose the available array entries before checking the used
+     * flags
+     */
+    smp_mb();
+    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
+        return;
+    }
+
+    event_notifier_set(&svq->hdev_kick);
+}
+
 /**
  * Add an element to a SVQ.
  *
@@ -235,20 +249,6 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
     return true;
 }
 
-static void vhost_svq_kick(VhostShadowVirtqueue *svq)
-{
-    /*
-     * We need to expose the available array entries before checking the used
-     * flags
-     */
-    smp_mb();
-    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
-        return;
-    }
-
-    event_notifier_set(&svq->hdev_kick);
-}
-
 /**
  * Forward available buffers.
  *
-- 
2.31.1


