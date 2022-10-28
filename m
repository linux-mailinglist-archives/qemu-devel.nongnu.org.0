Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BE6109E7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:53:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFI-0007Jp-F6; Fri, 28 Oct 2022 01:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEt-00073P-H6
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEr-0007MY-W5
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6utpzr987AvQqAinOYXkIDo364vIZiNpBH7t3AU/qg=;
 b=bEvgLqV39d2+2e8iCAy144c97ZIOzUwrY0npQQng75C8LZWuY2vLWrjtow3XvYqRFZOs0B
 opEAbd2/N37k+mrJIJIVSt3+eqZsO29h9Cs8mpX+hZG6UY2XpmglZQ7iKymzHP/sljmIi7
 RJYisXOwgRQupfMF4FGTRo9bl3DQQbg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-nBsZLzffMoqsA1WgHA8fGQ-1; Fri, 28 Oct 2022 01:49:02 -0400
X-MC-Unique: nBsZLzffMoqsA1WgHA8fGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9476F101A54E
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:49:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D53EC15BA8;
 Fri, 28 Oct 2022 05:48:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 07/26] vhost: allocate event_idx fields on vring
Date: Fri, 28 Oct 2022 13:48:16 +0800
Message-Id: <20221028054835.29674-8-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

There was not enough room to accomodate them.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 596d443..a518f84 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -570,16 +570,16 @@ void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
 size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
 {
     size_t desc_size = sizeof(vring_desc_t) * svq->vring.num;
-    size_t avail_size = offsetof(vring_avail_t, ring) +
-                                             sizeof(uint16_t) * svq->vring.num;
+    size_t avail_size = offsetof(vring_avail_t, ring[svq->vring.num]) +
+                                                              sizeof(uint16_t);
 
     return ROUND_UP(desc_size + avail_size, qemu_real_host_page_size());
 }
 
 size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq)
 {
-    size_t used_size = offsetof(vring_used_t, ring) +
-                                    sizeof(vring_used_elem_t) * svq->vring.num;
+    size_t used_size = offsetof(vring_used_t, ring[svq->vring.num]) +
+                                                              sizeof(uint16_t);
     return ROUND_UP(used_size, qemu_real_host_page_size());
 }
 
-- 
2.7.4


