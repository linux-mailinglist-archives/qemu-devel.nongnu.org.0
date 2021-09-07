Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C684025E8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:05:50 +0200 (CEST)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNX37-0004jN-SR
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX1A-0002LE-VU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX19-0004l2-Gm
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631005426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JZ4Bp6KdsRa4XopG+cP+LlW3leovzMAGvyISFrGuGU=;
 b=VHCKMWfsLiuCU6Tr1Aa5YDjDH155b/ItUiqAwUrkPyF6r07p+Yg3/LNXteg/glsYeIme72
 bx+C7McwrK74R4VgEjSMikdwDlJSsn9FQIyR1Q9N2dBLKhfgJKtMTrUhH/fiXC/fgUrpk5
 Qf7T+sQX6ilANjlAC1I9r9SpGsgjxZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-m-_DqUBeNs2Z4NVDSdH-GA-1; Tue, 07 Sep 2021 05:03:45 -0400
X-MC-Unique: m-_DqUBeNs2Z4NVDSdH-GA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0D6101371B;
 Tue,  7 Sep 2021 09:03:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-183.pek2.redhat.com
 [10.72.12.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA27D5C1CF;
 Tue,  7 Sep 2021 09:03:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V3 03/10] vhost-vdpa: prepare for the multiqueue support
Date: Tue,  7 Sep 2021 17:03:15 +0800
Message-Id: <20210907090322.1756-4-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-1-jasowang@redhat.com>
References: <20210907090322.1756-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
index 2e3b32245e..99c676796e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -503,8 +503,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
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


