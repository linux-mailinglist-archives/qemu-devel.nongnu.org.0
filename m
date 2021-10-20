Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C243446F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 06:58:31 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3gN-0004qX-30
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 00:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3ec-000220-FR
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3ea-0007jB-TN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634705800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OuBEil5mGm0bOGex9y7DhiVr0xXclwj8RVIwQw1DAc=;
 b=J8F/1Z+VXlmz9T1tYffOthNpomo8/A2JOFqIbQQ0t8VVGKKFQ4sVYg8w/86/9fRtqU5Drc
 Uhi/i61u5uYuRnDiECknwhPxD4Qlibdf4yo1Snm2Q6xFr7TpBWr3QrCTxD7VHvOPgC+1/R
 39l6lpQR/GedrK+kRzmR9qfnIY7hjiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-aSEJhLsiM-OAmimBYMwJ8A-1; Wed, 20 Oct 2021 00:56:39 -0400
X-MC-Unique: aSEJhLsiM-OAmimBYMwJ8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A984806689;
 Wed, 20 Oct 2021 04:56:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-13.pek2.redhat.com [10.72.13.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B19060BF1;
 Wed, 20 Oct 2021 04:56:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V5 03/10] vhost-vdpa: prepare for the multiqueue support
Date: Wed, 20 Oct 2021 12:55:53 +0800
Message-Id: <20211020045600.16082-4-jasowang@redhat.com>
In-Reply-To: <20211020045600.16082-1-jasowang@redhat.com>
References: <20211020045600.16082-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Unlike vhost-kernel, vhost-vdpa adapts a single device multiqueue
model. So we need to simply use virtqueue index as the vhost virtqueue
index. This is a must for multiqueue to work for vhost-vdpa.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 67a3dcf6a5..40987188cf 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -544,8 +544,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
 {
     assert(idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs);
 
-    trace_vhost_vdpa_get_vq_index(dev, idx, idx - dev->vq_index);
-    return idx - dev->vq_index;
+    trace_vhost_vdpa_get_vq_index(dev, idx, idx);
+    return idx;
 }
 
 static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
-- 
2.25.1


