Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A10496739
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:18:39 +0100 (CET)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1Is-0001sa-75
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:18:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0dJ-0000ar-92
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:35:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0dF-0005tV-7d
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqKu9gV12BSP7bp/DmZuehYWhm/L06WrJinEvvM6P9c=;
 b=TDhZ9+qzRZIdrHBp0lw8c99rdpet+NTJZPmSfNSeDg0hh6mTyua0qvjAo8SNzr6aPMc4KH
 A721StLkR7P7+2m7/+OhgySciMXzsK+3Zu4PufNzfDd4+v7Tg01EZq5yuSzTwx7z8Yulzm
 8uKvz4x2rbmmsRB3gaWUYIzwOzscbLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-Ytj1KbFdOYG7ug1COfmKpQ-1; Fri, 21 Jan 2022 15:35:18 -0500
X-MC-Unique: Ytj1KbFdOYG7ug1COfmKpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDA998189CC;
 Fri, 21 Jan 2022 20:35:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82221194B9;
 Fri, 21 Jan 2022 20:35:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
Date: Fri, 21 Jan 2022 21:27:30 +0100
Message-Id: <20220121202733.404989-29-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SVQ is able to log the dirty bits by itself, so let's use it to not
block migration.

Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
enabled. Even if the device supports it, the reports would be nonsense
because SVQ memory is in the qemu region.

The log region is still allocated. Future changes might skip that, but
this series is already long enough.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index fb0a338baa..75090d65e8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev, uint64_t *features)
     if (ret == 0 && v->shadow_vqs_enabled) {
         /* Filter only features that SVQ can offer to guest */
         vhost_svq_valid_guest_features(features);
+
+        /* Add SVQ logging capabilities */
+        *features |= BIT_ULL(VHOST_F_LOG_ALL);
     }
 
     return ret;
@@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
 
     if (v->shadow_vqs_enabled) {
         uint64_t dev_features, svq_features, acked_features;
+        uint8_t status = 0;
         bool ok;
 
+        ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
+        if (unlikely(ret)) {
+            return ret;
+        }
+
+        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
+            /*
+             * vhost is trying to enable or disable _F_LOG, and the device
+             * would report wrong dirty pages. SVQ handles it.
+             */
+            return 0;
+        }
+
+        /* We must not ack _F_LOG if SVQ is enabled */
+        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
+
         ret = vhost_vdpa_get_dev_features(dev, &dev_features);
         if (ret != 0) {
             error_report("Can't get vdpa device features, got (%d)", ret);
-- 
2.27.0


