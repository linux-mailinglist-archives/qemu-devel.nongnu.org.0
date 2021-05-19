Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4F3893D1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:32:24 +0200 (CEST)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljP7P-0004zC-7z
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP4n-0002Al-Ig
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP4m-00057l-3s
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kHOjQsXC/K2n38pcbsFNStVeupnDFmkXVqAbKuxVWo=;
 b=dAjnADT1bCapyKAUEK6dJkpyb/Gp+8GYH4ojRBuafc9jhampQYLzPAmOMXGo0/vzifVLE3
 8mWYEdXzjD1zzWoP6NS6Q/7asTP/icdeIo1wEelE4aqflB0SRvz7pe9Z9T5t8L+d9o3xs1
 07gfgGFwcSS0QAoYPQaONBOKGNJZn7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-HfP3HZ3COZWfBf3K6Djmdw-1; Wed, 19 May 2021 12:29:36 -0400
X-MC-Unique: HfP3HZ3COZWfBf3K6Djmdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9F7C1005E40;
 Wed, 19 May 2021 16:29:34 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C1C15D6AC;
 Wed, 19 May 2021 16:29:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 02/29] vhost: Save masked_notifier state
Date: Wed, 19 May 2021 18:28:36 +0200
Message-Id: <20210519162903.1172366-3-eperezma@redhat.com>
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

It will be used to configure shadow virtqueue. Shadow virtqueue will
relay the device->guest notifications, so vhost need to be able to tell
the masking status.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
index bbc2f228b5..40f9f64ebd 100644
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


