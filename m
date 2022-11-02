Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8869616833
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJV-0005do-3n; Wed, 02 Nov 2022 12:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJS-0005Sb-KG
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJQ-0002ZL-ER
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+sTsBbNh/sM1M1BctYZsWb/EcMrzIMV1iWuVZM+Xs4=;
 b=cZxP9gmqvryonhHNXNjkKRnmztJwrJhC3JKg5CgwY357I1x3Ny1/YYv9TLUWxkQnaDB+w0
 +Jj8FGIoDSYeUwGsqUmTzFiE93YaLW6L2NOHJpBBD9GFODdaT4dBmK+ivzYnWIQBFf4SdH
 i845xlXNqQ+MmKTu7jGPa9HZw1otFTY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-tHz62ph3O7yWI2ZRNllwFQ-1; Wed, 02 Nov 2022 12:09:54 -0400
X-MC-Unique: tHz62ph3O7yWI2ZRNllwFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso5044679wrc.10
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+sTsBbNh/sM1M1BctYZsWb/EcMrzIMV1iWuVZM+Xs4=;
 b=2kRAGjMSN5Dut9w38Ktvnlot8oY8TrfofyDHAl2cStxZJDV0XheI0h4tjAnizPLUud
 nmA6XPi/yNtX/9RdUFTa4VRTRZaiLAfOoHYrUoNNnVFYNXkPcOQTPRiglGaik8gEcldm
 v9zAJ6IDOu6l2UuPf0aETe7hmOVBGOhdii9jMZfqErIaiKsROgAQuD5SC7nsWdkaSL93
 jihinRU9DX2D/U9DtF9KJYZBupz/1uxPbxJerjNtdCm7ucq2gT1eIqPYbBX4syRZQmnw
 EKArUzzw/DZRg2cONrPv8p/07E7bmAzqHo8AnIKQgwcmohQN/3TmrB5GKk+XJupXUuso
 /fiw==
X-Gm-Message-State: ACrzQf2QjqHvIVotxXvhxD85z9H+aIuoPpfiNWkvo+PdBaHeR2rKOfT6
 3d9DUseUUKyewM1RAI3k5eypvxh365VteGYqImsN43UrPpz8lFMvQCCfb3dCMQbUiuLtwV/ckKs
 VrSmQTdeTc+5y6vkKwt4dBM5EfenGtz+YwFuXCqq/mDpZEUTUn+KQE6sdAnwM
X-Received: by 2002:a5d:598d:0:b0:236:8ef4:7324 with SMTP id
 n13-20020a5d598d000000b002368ef47324mr15992030wri.84.1667405392247; 
 Wed, 02 Nov 2022 09:09:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EtpsG+0X+ligI8abwr/I618a/D1syGnk/Bafr6F5NlOMCFRVzg0Y4rm/y7JIlSEQrD/2/Fw==
X-Received: by 2002:a5d:598d:0:b0:236:8ef4:7324 with SMTP id
 n13-20020a5d598d000000b002368ef47324mr15991989wri.84.1667405391923; 
 Wed, 02 Nov 2022 09:09:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f5-20020a5d64c5000000b0022cd96b3ba6sm17134646wri.90.2022.11.02.09.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:51 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>
Subject: [PULL v2 32/82] vhost-user: Support vhost_dev_start
Message-ID: <20221102160336.616599-33-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yajun Wu <yajunw@nvidia.com>

The motivation of adding vhost-user vhost_dev_start support is to
improve backend configuration speed and reduce live migration VM
downtime.

Today VQ configuration is issued one by one. For virtio net with
multi-queue support, backend needs to update RSS (Receive side
scaling) on every rx queue enable. Updating RSS is time-consuming
(typical time like 7ms).

Implement already defined vhost status and message in the vhost
specification [1].
(a) VHOST_USER_PROTOCOL_F_STATUS
(b) VHOST_USER_SET_STATUS
(c) VHOST_USER_GET_STATUS

Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
device start and reset(0) for device stop.

On reception of the DRIVER_OK message, backend can apply the needed setting
only once (instead of incremental) and also utilize parallelism on enabling
queues.

This improves QEMU's live migration downtime with vhost user backend
implementation by great margin, specially for the large number of VQs of 64
from 800 msec to 250 msec.

[1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 74 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 03415b6c95..bb5164b753 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -81,6 +81,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
     /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_STATUS = 16,
     VHOST_USER_PROTOCOL_F_MAX
 };
 
@@ -126,6 +127,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_SET_STATUS = 39,
+    VHOST_USER_GET_STATUS = 40,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -1452,6 +1455,43 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
     return 0;
 }
 
+static int vhost_user_set_status(struct vhost_dev *dev, uint8_t status)
+{
+    return vhost_user_set_u64(dev, VHOST_USER_SET_STATUS, status, false);
+}
+
+static int vhost_user_get_status(struct vhost_dev *dev, uint8_t *status)
+{
+    uint64_t value;
+    int ret;
+
+    ret = vhost_user_get_u64(dev, VHOST_USER_GET_STATUS, &value);
+    if (ret < 0) {
+        return ret;
+    }
+    *status = value;
+
+    return 0;
+}
+
+static int vhost_user_add_status(struct vhost_dev *dev, uint8_t status)
+{
+    uint8_t s;
+    int ret;
+
+    ret = vhost_user_get_status(dev, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if ((s & status) == status) {
+        return 0;
+    }
+    s |= status;
+
+    return vhost_user_set_status(dev, s);
+}
+
 static int vhost_user_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
@@ -1460,6 +1500,7 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      * backend is actually logging changes
      */
     bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
+    int ret;
 
     /*
      * We need to include any extra backend only feature bits that
@@ -1467,9 +1508,18 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
      * features.
      */
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
+    ret = vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
                               features | dev->backend_features,
                               log_enabled);
+
+    if (virtio_has_feature(dev->protocol_features,
+                           VHOST_USER_PROTOCOL_F_STATUS)) {
+        if (!ret) {
+            return vhost_user_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
+        }
+    }
+
+    return ret;
 }
 
 static int vhost_user_set_protocol_features(struct vhost_dev *dev,
@@ -2615,6 +2665,27 @@ void vhost_user_cleanup(VhostUserState *user)
     user->chr = NULL;
 }
 
+static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
+{
+    if (!virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_STATUS)) {
+        return 0;
+    }
+
+    /* Set device status only for last queue pair */
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return 0;
+    }
+
+    if (started) {
+        return vhost_user_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                          VIRTIO_CONFIG_S_DRIVER |
+                                          VIRTIO_CONFIG_S_DRIVER_OK);
+    } else {
+        return vhost_user_set_status(dev, 0);
+    }
+}
+
 const VhostOps user_ops = {
         .backend_type = VHOST_BACKEND_TYPE_USER,
         .vhost_backend_init = vhost_user_backend_init,
@@ -2649,4 +2720,5 @@ const VhostOps user_ops = {
         .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
         .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
         .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
+        .vhost_dev_start = vhost_user_dev_start,
 };
-- 
MST


