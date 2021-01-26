Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD462303779
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:49:39 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4J6Y-0004Sh-V8
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4J0R-0007EB-EH
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:43:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4J0P-0001jG-SR
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611646997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ua2MJPKyhckrhznbF0TFlcdA8jGgaynNIN8wY0tzrgw=;
 b=OVIgQqfA3fNc7G3lxmGhymGH+tizhSfA4JoArn5YMDXVvGnEX8Y/UHfIRprFjNzXBClxma
 Qji2vSXvlnS5bEw8FCOl31U7dz9pAGGcMcQtyiWKSdQNNWGEfFPuIuPc2L7kBdvbp2XDKy
 VlREaWvGHJI9D4/tKlCfuoWMVuB/Gog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-a5wUNJvBPruuUQ2a5FjJUg-1; Tue, 26 Jan 2021 02:43:15 -0500
X-MC-Unique: a5wUNJvBPruuUQ2a5FjJUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D32C010054FF
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:43:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FFAD5D74E;
 Tue, 26 Jan 2021 07:43:13 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] virtio-mmio: add support for configure interrupt
Date: Tue, 26 Jan 2021 15:42:53 +0800
Message-Id: <20210126074254.3225-5-lulu@redhat.com>
In-Reply-To: <20210126074254.3225-1-lulu@redhat.com>
References: <20210126074254.3225-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add configure interrupt support for virtio-mmio bus. This
interrupt will working while backend is vhost-vdpa

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-mmio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index e1b5c3b81e..d580f1ea9a 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -666,6 +666,21 @@ assign_error:
     return r;
 }
 
+static int virtio_mmio_set_config_notifier(DeviceState *d,  bool assign)
+{
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    EventNotifier *notifier = virtio_get_config_notifier(vdev);
+    int r = 0;
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        virtio_set_config_notifier_fd_handler(vdev, true, false);
+    } else {
+        virtio_set_config_notifier_fd_handler(vdev, false, false);
+        event_notifier_cleanup(notifier);
+    }
+    return r;
+}
 static void virtio_mmio_pre_plugged(DeviceState *d, Error **errp)
 {
     VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
@@ -780,6 +795,7 @@ static void virtio_mmio_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_assign = virtio_mmio_ioeventfd_assign;
     k->pre_plugged = virtio_mmio_pre_plugged;
     k->has_variable_vring_alignment = true;
+    k->set_config_notifiers = virtio_mmio_set_config_notifier;
     bus_class->max_dev = 1;
     bus_class->get_dev_path = virtio_mmio_bus_get_dev_path;
 }
-- 
2.21.3


