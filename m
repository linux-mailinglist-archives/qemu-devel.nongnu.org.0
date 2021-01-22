Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22298300D6A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:11:20 +0100 (CET)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32m6-00049R-Ji
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l32k6-0003ZH-K8
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:09:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l32k0-0003iD-JL
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611346146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ByhSEzZdJIl7WMzxwngIXqOEWbdTrKVhXRS21CzFeWI=;
 b=eDu51DkRAqyOWhMld4TKHF9iYN2YI5XK2NLMsMFmOeOpcm36UH9NoSXuZmM/0eLU34612c
 eJZfjAP/b7N+O5wSzPHIG65kFmykt5VCsKhiz2lmJbd6PIBIKRDMRJoclUgLIM05moHmwU
 +rE1NoVKXNeDwa19GXuwYJKf5ax9dn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-M4G-RvnVNDKT0tkK5ftlqw-1; Fri, 22 Jan 2021 15:09:03 -0500
X-MC-Unique: M4G-RvnVNDKT0tkK5ftlqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FD0F180E472
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:09:02 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-26.ams2.redhat.com [10.36.113.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20FD550DE3;
 Fri, 22 Jan 2021 20:08:53 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio: Add corresponding memory_listener_unregister to
 unrealize
Date: Fri, 22 Jan 2021 21:08:51 +0100
Message-Id: <20210122200851.345259-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cannot destroy address spaces of IOMMU-aware virtio devices without it,
since they can contain memory listeners.

Fixes: c611c76417f ("virtio: add MemoryListener to cache ring translations")
Buglink: https://bugs.launchpad.net/qemu/+bug/1912846
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b308026596..67efd2c301 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3680,6 +3680,7 @@ static void virtio_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(dev);
 
+    memory_listener_unregister(&vdev->listener);
     virtio_bus_device_unplugged(vdev);
 
     if (vdc->unrealize != NULL) {
-- 
2.27.0


