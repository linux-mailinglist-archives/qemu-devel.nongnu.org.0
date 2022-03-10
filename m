Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582C4D3F6E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:56:39 +0100 (CET)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8yk-0004Y1-1J
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8ja-0005Ym-LO
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8jW-0004NV-HY
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646880040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wP5n6IWD7bxGMTwdS/PEYq6nGiL2247UrJnrny6d8wQ=;
 b=M2U4v5P/7u2nnE/2mQQLR2MuIoIbxra+g8M3qpbTNh2BJBkwHl931mGPZD8ZZ4jpMh2Lpc
 FXVPRmJayKWV43Ie8ppg8e/uuK6lHaqHiKQ3oxXcaf0NBLz/V7Pv8nPVAWmTQK+PmJ9jRr
 PMbVtJbDgcubemIEq1dkv2WAmUiTFIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-pfz-OEljOBmR6iiONwU5UA-1; Wed, 09 Mar 2022 21:40:39 -0500
X-MC-Unique: pfz-OEljOBmR6iiONwU5UA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F313824FA6;
 Thu, 10 Mar 2022 02:40:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-194.pek2.redhat.com
 [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DA80100685F;
 Thu, 10 Mar 2022 02:40:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 13/15] vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
Date: Thu, 10 Mar 2022 10:39:05 +0800
Message-Id: <20220310023907.2443-14-jasowang@redhat.com>
In-Reply-To: <20220310023907.2443-1-jasowang@redhat.com>
References: <20220310023907.2443-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

This is needed to achieve migration, so the destination can restore its
index.

Setting base as last used idx, so destination will see as available all
the entries that the device did not use, including the in-flight
processing ones.

This is ok for networking, but other kinds of devices might have
problems with these retransmissions.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index a7db129..12ca10f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1144,8 +1144,25 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
 static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
 
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                      ring->index);
+
+        /*
+         * Setting base as last used idx, so destination will see as available
+         * all the entries that the device did not use, including the in-flight
+         * processing ones.
+         *
+         * TODO: This is ok for networking, but other kinds of devices might
+         * have problems with these retransmissions.
+         */
+        ring->num = svq->last_used_idx;
+        return 0;
+    }
+
     ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
     trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
     return ret;
-- 
2.7.4


