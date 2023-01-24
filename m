Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C6679E53
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKLuA-0000fe-4U; Tue, 24 Jan 2023 11:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pKLu7-0000fS-Na
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pKLu6-0003nf-5C
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674576727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=32eiDBHtG7MKyAsmiOA0+36jTt4YeYC/JVTHFzduPsE=;
 b=h63rfGnohLXmo4s799AbDmaIVIKejHmeKbGM+O3jjoNfA362k8kfgGOvIAjiFUPli5aGFL
 lYOPEIr2BtLwOXQkaA1ByqEXZLlAxS0gbkkJ7oSbm3SOVvSSg30wwxTEKpIi6/a//V8dxs
 MT/XCygqCCDsBKE6P2hxaFUou0UEJW8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-b65YHP07N5KL5zgdPZWGWA-1; Tue, 24 Jan 2023 11:12:04 -0500
X-MC-Unique: b65YHP07N5KL5zgdPZWGWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C97C7293249D;
 Tue, 24 Jan 2023 16:12:03 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82DB52166B26;
 Tue, 24 Jan 2023 16:12:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: leiyang@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 gautam.dawar@amd.com, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] virtio-net: clear guest_announce feature if no cvq backend
Date: Tue, 24 Jan 2023 17:11:59 +0100
Message-Id: <20230124161159.2182117-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since GUEST_ANNOUNCE is emulated the feature bit could be set without
backend support.  This happens in the vDPA case.

However, backend vDPA parent may not have CVQ support.  This causes an
incoherent feature set, and the driver may refuse to start.  This
happens in virtio-net Linux driver.

This may be solved differently in the future.  Qemu is able to emulate a
CVQ just for guest_announce purposes, helping guest to notify the new
location with vDPA devices that does not support it.  However, this is
left as a TODO as it is way more complex to backport.

Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
driver and migrating it with x-svq=on.

Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in vhost-vdpa")
Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..09d5c7a664 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1ULL << VIRTIO_NET_F_MTU);
     }
 
+    /*
+     * Since GUEST_ANNOUNCE is emulated the feature bit could be set without
+     * enabled. This happens in the vDPA case.
+     *
+     * Make sure the feature set is not incoherent, as the driver could refuse
+     * to start.
+     *
+     * TODO: QEMU is able to emulate a CVQ just for guest_announce purposes,
+     * helping guest to notify the new location with vDPA devices that does not
+     * support it.
+     */
+    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_VQ)) {
+        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
+    }
+
     return features;
 }
 
-- 
2.31.1


