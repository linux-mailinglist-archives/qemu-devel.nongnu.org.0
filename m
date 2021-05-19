Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04FD3893F1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:38:19 +0200 (CEST)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPD8-0008RZ-UN
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP58-0002hp-NK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP56-0005EW-Pv
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6l3SqLSeKmEhV1NXWaESuTSmX7euR+x4nuSnTsSY50I=;
 b=SIaMc5dU4+GB7ko04IJlMa2yGZVl4h0RLpdR/4JgMcNljBr6uDf3OA0E6v1GN2Jinwc7pk
 7T/1+g1IWJe60lxkhi84hciah5rnYJL94pTwS42fWberd8II9Oum9KBSn89jObbKWLO29z
 CgtXatjbL3rHj6x90hRuOlfpA2+ZxiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-K64JIjBIN6qxux0KWwexJQ-1; Wed, 19 May 2021 12:29:58 -0400
X-MC-Unique: K64JIjBIN6qxux0KWwexJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8865180FD65;
 Wed, 19 May 2021 16:29:56 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 823045D6AC;
 Wed, 19 May 2021 16:29:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 06/29] virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
Date: Wed, 19 May 2021 18:28:40 +0200
Message-Id: <20210519162903.1172366-7-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So the guest can stop and start net device. It implements the RFC
https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html

To stop (as "pause") the device is required to migrate status and vring
addresses between device and SVQ.

This is a WIP commit: as with VIRTIO_F_QUEUE_STATE, is introduced in
virtio_config.h before of even proposing for the kernel, with no feature
flag, and, with no checking in the device. It also needs a modified
vp_vdpa driver that supports to set and retrieve status.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/standard-headers/linux/virtio_config.h | 2 ++
 hw/net/virtio-net.c                            | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index 59fad3eb45..b3f6b1365d 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -40,6 +40,8 @@
 #define VIRTIO_CONFIG_S_DRIVER_OK	4
 /* Driver has finished configuring features */
 #define VIRTIO_CONFIG_S_FEATURES_OK	8
+/* Device is stopped */
+#define VIRTIO_CONFIG_S_DEVICE_STOPPED 32
 /* Device entered invalid state, driver must reset it */
 #define VIRTIO_CONFIG_S_NEEDS_RESET	0x40
 /* We've given up on this device. */
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 96a3cc8357..2d3caea289 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -198,7 +198,9 @@ static bool virtio_net_started(VirtIONet *n, uint8_t status)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     return (status & VIRTIO_CONFIG_S_DRIVER_OK) &&
-        (n->status & VIRTIO_NET_S_LINK_UP) && vdev->vm_running;
+        (!(n->status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) &&
+        (n->status & VIRTIO_NET_S_LINK_UP) &&
+        vdev->vm_running;
 }
 
 static void virtio_net_announce_notify(VirtIONet *net)
-- 
2.27.0


