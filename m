Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E6C33C720
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:53:36 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtHT-0001Hf-PR
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtD6-00050a-1O
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtD4-0003ss-FF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7e52shHXEbVUO5OUANPRBavCWxWLcLX8FMHXidmngsI=;
 b=C3y5e0nqT0ySjPWGkMIFA5qor7KrTcC6kuXiBhrdoZ1PAWZS/hBPfLwyONzUZ3jpU+UxaC
 FuGvaUcSDfeU23emQ44RvtnNuXXvDBAiLVe2LNXA8sLTugg5+3T9Qxv2EChul7pbcHnAI9
 9U2NnHxww1CxukMpe778bHKy08Wyi+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-uSrrjxn-O4uGucdMVlleag-1; Mon, 15 Mar 2021 15:49:00 -0400
X-MC-Unique: uSrrjxn-O4uGucdMVlleag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A10D919200C5;
 Mon, 15 Mar 2021 19:48:58 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32B361876A;
 Mon, 15 Mar 2021 19:48:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 02/13] vhost: Save masked_notifier state
Date: Mon, 15 Mar 2021 20:48:31 +0100
Message-Id: <20210315194842.277740-3-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will be used to configure shadow virtqueue. Shadow virtqueue will
relay the device->guest notifications, so vhost need to be able to tell
the masking status.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h | 1 +
 hw/virtio/vhost.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415..ac963bf23d 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -28,6 +28,7 @@ struct vhost_virtqueue {
     unsigned avail_size;
     unsigned long long used_phys;
     unsigned used_size;
+    bool notifier_is_masked;
     EventNotifier masked_notifier;
     struct vhost_dev *dev;
 };
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e2163a0d63..4680c0cfcf 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1527,6 +1527,8 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     r = hdev->vhost_ops->vhost_set_vring_call(hdev, &file);
     if (r < 0) {
         VHOST_OPS_DEBUG("vhost_set_vring_call failed");
+    } else {
+        hdev->vqs[index].notifier_is_masked = mask;
     }
 }
 
-- 
2.27.0


