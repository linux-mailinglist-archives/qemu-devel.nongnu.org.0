Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA329486556
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:37:46 +0100 (CET)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Sxe-0002Dx-2C
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdl-0004b7-WB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdk-0000rw-D5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6+ogC/x1lapccbXRX0wQz+1ayPjtYGNbtjSlz3Drok=;
 b=d0YqPWjgKCakcHnIw/DNm8nknBGIfngAVKkI947EJSWFDSevvfKLPpzlDF1B5928gwn65Z
 A9+DyK6zE6SWO5zETwh/8tKzwcNAwvcabmRMswqcEWL89A8um3teIZ7kWQPEKYAgTmGCo4
 0lqkZXVVSWAqp+erQ2TpM3nH72kI4w0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-m1Dqi8ajNE-rPAgfGx402Q-1; Thu, 06 Jan 2022 08:17:10 -0500
X-MC-Unique: m1Dqi8ajNE-rPAgfGx402Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 s23-20020adf9797000000b001a485bd8e8dso1257895wrb.11
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z6+ogC/x1lapccbXRX0wQz+1ayPjtYGNbtjSlz3Drok=;
 b=XbYJcY/ppoUWDwMCXGMLka3ceGONp14iPMWT713miA+ukrqiS111jH5+cL18aCANC4
 U7RNm5D12GoFRviV5Nd7UwDwQwFrmbVFdPaEm/Q4UXqOHIHDYp9Ac5NqJDVZtYN3vSTL
 UB8x851YHkoWlY58hkInv5hQ+zSJ6PI35YMuputsrhqvr7+0hP02wr7+Hyzi+cX1sDP3
 JV+k2Gx4vQMtQ2/5NNQSOkXakdVnh3DrVCmUugKya4CADrCGxS53taH0Ib4UxypJVU6G
 qyqx7FFQ7D1uvbJWD50H/bzsUd9pduOVZZnqa3SPtWKSboxeQP3NLeR9XCRnY6nQvhpd
 Ut4g==
X-Gm-Message-State: AOAM532wwtKh3C7IxQrjpI0O9rRDKW67OFQ6BIcsVstymhLPAIwS1/SO
 dC2I9ygQ7PvQ9Ev1zafTEfBJtENQGJSnXpHCN5Tt16XfqPE/TYIrtTeKf+GHUKDzHQQCwsoTHPM
 rmZWsS0uH8fWkoK59TFqUlA1VdeppRqwCS6Pb5k+Jcd5Yd0q8URpQP68xJYN3
X-Received: by 2002:a5d:424c:: with SMTP id s12mr49873302wrr.465.1641475029097; 
 Thu, 06 Jan 2022 05:17:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLSKisoH9ftLfHv6OHkqU1c5SeZXPOoNvZND2aAIzf7T4uxnJmPFF0RYn/bmHa/ng6ROyBoA==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr49873290wrr.465.1641475028891; 
 Thu, 06 Jan 2022 05:17:08 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id o3sm2313088wry.98.2022.01.06.05.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:08 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/52] vhost-vdpa: stick to -errno error return convention
Message-ID: <20220106131534.423671-20-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Almost all VhostOps methods in vdpa_ops follow the convention of
returning negated errno on error.

Adjust the few that don't.  To that end, rework vhost_vdpa_add_status to
check if setting of the requested status bits has succeeded and return
the respective error code it hasn't, and propagate the error codes
wherever it's appropriate.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-8-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0a4a83713c..ac0cb575fb 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -292,18 +292,34 @@ static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
     return ret < 0 ? -errno : ret;
 }
 
-static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 {
     uint8_t s;
+    int ret;
 
     trace_vhost_vdpa_add_status(dev, status);
-    if (vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s)) {
-        return;
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
     }
 
     s |= status;
 
-    vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (!(s & status)) {
+        return -EIO;
+    }
+
+    return 0;
 }
 
 static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
@@ -484,7 +500,7 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
         }
     }
     if (mem->padding) {
-        return -1;
+        return -EINVAL;
     }
 
     return 0;
@@ -501,14 +517,11 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
 
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
-    uint8_t status = 0;
     if (ret) {
         return ret;
     }
-    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
-    vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
 
-    return !(status & VIRTIO_CONFIG_S_FEATURES_OK);
+    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
 }
 
 static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
@@ -650,12 +663,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-        vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
-
-        return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
+        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-- 
MST


