Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBA488098
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:34:55 +0100 (CET)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60dC-0004vH-Gi
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609w-0004J0-S6
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609v-0002Mz-CD
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6+ogC/x1lapccbXRX0wQz+1ayPjtYGNbtjSlz3Drok=;
 b=HaDgDWrTbO8vyOes1GaJHfs5mgFHaPWXE6UbgQK5i6J6npvX801pdBE9Sz1zWqpU9DZWWZ
 /t1v41WzhOgQbVAf+qSIe6k6CrDzf2ojqmMnbFBL6aPHcNxZtcr38FPBhJ3fil22Kyhice
 EU1v414tsEwQWwyxxtHgutRUDBTBEKg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-TDMsS2UxM-yKCTHt1d76Tg-1; Fri, 07 Jan 2022 20:04:34 -0500
X-MC-Unique: TDMsS2UxM-yKCTHt1d76Tg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m21-20020a7bcf35000000b00346ddc490efso2497816wmg.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z6+ogC/x1lapccbXRX0wQz+1ayPjtYGNbtjSlz3Drok=;
 b=YrbHVWu+JBPkY9hVOkU4k7p7uy6vqhXZFwqGlIJMQp5JjwcSch2I69IZ1WJ28ELQJG
 UwSf389gLVaiqQAQpuvUwZM4Xgo0Aj/1K/XtjQm2/1skx8l+k5SFytU9UeCaxwnXdpPc
 FU6Oy1lAdcBUk5+ufblqYWbRPzWHislFDjtPRRl1V+0vYr50oQXvqjoNNSRWOffuTjwj
 LHIe1QhN8bmnETrfS6LPxUF7zJbALYQEVYqBnCimPKArbMilqj4ekhWw8lMNhCPuqQ6u
 BcTsPBn/tNzCXvLKCmZQ/zTgrIfB5ZZGQ+gLeqJkJHOfy8MPvX9XHfSzLzejg57aQdEP
 OtdQ==
X-Gm-Message-State: AOAM533nJg9wmayBApD9Lr6DFX0ggvO13XxaVy0Eiu1+t34bxLdQX2f2
 W5FvSGJXDrhPe/FNlv3K0EOTqehDao2AJO6yc4yO2E0UQMAHB/wAC1Bfcufq1sD6X8vORbxsbd1
 7NxAzTeZTY1igo5Xz0haWQJTLTnZIOUGrb9VoocUjTh7rv9qqTHeRhXNyxOTo
X-Received: by 2002:adf:fd85:: with SMTP id d5mr9005733wrr.212.1641603873010; 
 Fri, 07 Jan 2022 17:04:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCfXFVMcCNfZS70xDAmD7AbjoPPhNm2U++RAjTlXyUa37tZbxsP4eHMJha4pa+khDSvb1ZyQ==
X-Received: by 2002:adf:fd85:: with SMTP id d5mr9005722wrr.212.1641603872785; 
 Fri, 07 Jan 2022 17:04:32 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id bg19sm230302wmb.47.2022.01.07.17.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:32 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 19/55] vhost-vdpa: stick to -errno error return convention
Message-ID: <20220108003423.15830-20-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


