Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5438157B3B1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:22:51 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5us-0007UR-Dv
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cr-0000QD-AY
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cd-0001Rv-2f
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryMfQclSrOUn61q4ST6zQqq0N9vt00RrcjyO/iesoEM=;
 b=H0wchN0fEliqLuA0WrxNHvM0uphd/yGtqdd5CufLpTz3HY7AUv59/o57FJAwUGwD0qYhBi
 4011emtIxHBr0xoe5or6gSpc6EsHqBv6/+w7Gm6+u6qANYdMUPSpnHkZWaskSseZYlITKh
 0TO90xs25QaPmfK7q/XBO+u2Ba9g/+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-ME-ENTy8PpKe66PkKLJM6w-1; Wed, 20 Jul 2022 05:03:33 -0400
X-MC-Unique: ME-ENTy8PpKe66PkKLJM6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07FD485A584;
 Wed, 20 Jul 2022 09:03:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E8D1492C3B;
 Wed, 20 Jul 2022 09:03:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 05/25] vhost: Reorder vhost_svq_kick
Date: Wed, 20 Jul 2022 17:02:53 +0800
Message-Id: <20220720090313.55169-6-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Future code needs to call it from vhost_svq_add.

No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 560d07a..043a185 100644
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
2.7.4


