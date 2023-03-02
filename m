Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC26A7C94
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:27:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFy-0003Vk-3K; Thu, 02 Mar 2023 03:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFq-0002uc-S5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFp-0002Ju-2R
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpHv1sDqC6NygLP0zl9CacgM4K8/lko9ZbzQDaG876Y=;
 b=Dp+d8a6WRvi5N+tifkaJe8K827tevS/y7qCCPCqvAzEP40kt/QxVa/SfWD2laEOAxJIyWU
 kCbrOZZKunfEKb6jxgWG+cEObP52HbfAWdieQx6cEH3qIh1dJqB1zpLe2mwPhcGGXGxYze
 xvl5ifrBwDzVIbeIO/YC8g09fvTf/Wk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-rmh6fyXdNriTbco6aloFXw-1; Thu, 02 Mar 2023 03:25:31 -0500
X-MC-Unique: rmh6fyXdNriTbco6aloFXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5461977wmi.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745529;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpHv1sDqC6NygLP0zl9CacgM4K8/lko9ZbzQDaG876Y=;
 b=M6TxkTu/HrP1bN8whwGtfTzTEA/pc1k0DGb4ZS2Lpvg13lUP4mbwq4c1+/24amrC86
 Jl+dBljrlbofynsDlyz3jn17k+aKzeAbGXKfl4VYAWKP4yEOPLe0L+lF+4foApva4vSN
 S6P2+n5qfSOQHiivGGxTqQmf9XqNU7zg70IybhyUJqRHc3JyqE7WGJwCQpegCx2c2kKQ
 81FzCzhOifnUipO+5b2lUGApjhCw55wpPNgaWpEAGSJLVDB711ciSvpbmp1W4xKoBqOm
 CxWscKKncpDXs35zlw7zGFwbl5VWmlT3x+N94zy3PfIt92aELjZUwST2pLUak584BkkO
 luDA==
X-Gm-Message-State: AO0yUKXJHHiVQ6tfhmjerj40fn8gqZpmPCEn+0rzW4pXRNVu+EcP7Qx2
 NYyEWQPMtMRXHYzPMw+IV56IDMskdBLRBPDldOovWXBzAqJHKxeFZAef60QzUHrntESX2VLojZ6
 JbXlmv4+N2pIaAjuq2B6G/d/P7iPK7sw4A/9y2iMtDNH23X3AxeSHB/gsE33JcavpcQ==
X-Received: by 2002:a05:600c:81b:b0:3e2:6ec:61ea with SMTP id
 k27-20020a05600c081b00b003e206ec61eamr7238663wmp.28.1677745529333; 
 Thu, 02 Mar 2023 00:25:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8hXhPvDyWtZ3gSQHpOUfB3cBJGx0MP5PsByDNyjxjUnw9O5EiLL+UhWYKYLE4Yd0Q2rOB3Fw==
X-Received: by 2002:a05:600c:81b:b0:3e2:6ec:61ea with SMTP id
 k27-20020a05600c081b00b003e206ec61eamr7238648wmp.28.1677745529043; 
 Thu, 02 Mar 2023 00:25:29 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm2342046wmq.5.2023.03.02.00.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:28 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/53] vhost-user: Adopt new backend naming
Message-ID: <20230302082343.560446-19-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

From: Maxime Coquelin <maxime.coquelin@redhat.com>

The Vhost-user specification changed feature and request
naming from _SLAVE_ to _BACKEND_.

This patch adopts the new naming convention.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
Message-Id: <20230208203259.381326-4-maxime.coquelin@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 30 +++++++++++++++---------------
 hw/virtio/virtio-qmp.c | 12 ++++++------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e68daa35d4..8968541514 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -40,7 +40,7 @@
 
 #define VHOST_MEMORY_BASELINE_NREGIONS    8
 #define VHOST_USER_F_PROTOCOL_FEATURES 30
-#define VHOST_USER_SLAVE_MAX_FDS     8
+#define VHOST_USER_BACKEND_MAX_FDS     8
 
 /*
  * Set maximum number of RAM slots supported to
@@ -71,12 +71,12 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RARP = 2,
     VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
     VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
     VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
     VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
     VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
     VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
     VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
@@ -110,7 +110,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_VRING_ENABLE = 18,
     VHOST_USER_SEND_RARP = 19,
     VHOST_USER_NET_SET_MTU = 20,
-    VHOST_USER_SET_SLAVE_REQ_FD = 21,
+    VHOST_USER_SET_BACKEND_REQ_FD = 21,
     VHOST_USER_IOTLB_MSG = 22,
     VHOST_USER_SET_VRING_ENDIAN = 23,
     VHOST_USER_GET_CONFIG = 24,
@@ -134,11 +134,11 @@ typedef enum VhostUserRequest {
 } VhostUserRequest;
 
 typedef enum VhostUserSlaveRequest {
-    VHOST_USER_SLAVE_NONE = 0,
-    VHOST_USER_SLAVE_IOTLB_MSG = 1,
-    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
-    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
-    VHOST_USER_SLAVE_MAX
+    VHOST_USER_BACKEND_NONE = 0,
+    VHOST_USER_BACKEND_IOTLB_MSG = 1,
+    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
+    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
+    VHOST_USER_BACKEND_MAX
 }  VhostUserSlaveRequest;
 
 typedef struct VhostUserMemoryRegion {
@@ -1638,13 +1638,13 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
     }
 
     switch (hdr.request) {
-    case VHOST_USER_SLAVE_IOTLB_MSG:
+    case VHOST_USER_BACKEND_IOTLB_MSG:
         ret = vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
         break;
-    case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
+    case VHOST_USER_BACKEND_CONFIG_CHANGE_MSG:
         ret = vhost_user_slave_handle_config_change(dev);
         break;
-    case VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG:
+    case VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG:
         ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
                                                           fd ? fd[0] : -1);
         break;
@@ -1696,7 +1696,7 @@ fdcleanup:
 static int vhost_setup_slave_channel(struct vhost_dev *dev)
 {
     VhostUserMsg msg = {
-        .hdr.request = VHOST_USER_SET_SLAVE_REQ_FD,
+        .hdr.request = VHOST_USER_SET_BACKEND_REQ_FD,
         .hdr.flags = VHOST_USER_VERSION,
     };
     struct vhost_user *u = dev->opaque;
@@ -1707,7 +1707,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
     QIOChannel *ioc;
 
     if (!virtio_has_feature(dev->protocol_features,
-                            VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
+                            VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
         return 0;
     }
 
@@ -2065,7 +2065,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
 
         if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
                 !(virtio_has_feature(dev->protocol_features,
-                    VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
+                    VHOST_USER_PROTOCOL_F_BACKEND_REQ) &&
                  virtio_has_feature(dev->protocol_features,
                     VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
             error_setg(errp, "IOMMU support requires reply-ack and "
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index e4d4bece2d..b70148aba9 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -42,12 +42,12 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RARP = 2,
     VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
     VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
     VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
     VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
     VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
     VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
     VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
@@ -101,8 +101,8 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
             "supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
             "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
-            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_BACKEND_REQ, \
+            "VHOST_USER_PROTOCOL_F_BACKEND_REQ: Socket fd for back-end initiated "
             "requests supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
             "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
@@ -116,8 +116,8 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
             "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
             "device configuration space supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
-            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD, \
+            "VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD: Slave fd communication "
             "channel supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
             "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
-- 
MST


