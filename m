Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C303FFCDA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:16:14 +0200 (CEST)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Iz-0001er-7A
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5Ew-00039d-BG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5Et-0003nk-Dl
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNv1OIFwGBQz2dNcpkq4b5eWPX64C5nT3coNSNRCRvo=;
 b=F3qM9HutvSolL6ax6dLOQoJ1Rn43RtQ+0sZ86e0XZ9Q7Fsk/uAlEz4YFCsrdNTEzfOGNF4
 oNn04fttxA7OmuG2tJeJdLdTP0Ciq1dWjNC2gYgGD9vxCD9C3Y2g7gi0/gw9+QN/saLEst
 u58i9Il6icge+YUU3ZUd9nZSEIDHN6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-irmSvD9AMt6ZoBIUeyTypg-1; Fri, 03 Sep 2021 05:11:57 -0400
X-MC-Unique: irmSvD9AMt6ZoBIUeyTypg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6F91006C85;
 Fri,  3 Sep 2021 09:11:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 247D660C81;
 Fri,  3 Sep 2021 09:11:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 14/21] vhost-vdpa: prepare for the multiqueue support
Date: Fri,  3 Sep 2021 17:10:24 +0800
Message-Id: <20210903091031.47303-15-jasowang@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
index 42c66de791..94eb9d4069 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -492,8 +492,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
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


