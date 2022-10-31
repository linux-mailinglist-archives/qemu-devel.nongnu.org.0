Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55912613724
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:57:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHw-0007bf-By; Mon, 31 Oct 2022 08:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHN-0003w1-CJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHJ-0002eA-Gn
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+sTsBbNh/sM1M1BctYZsWb/EcMrzIMV1iWuVZM+Xs4=;
 b=bHTwa3eTiBLuOlg3nx1XuwL67mXabDi2gMJkNR3eoe3n5cPd8EU76Hrqm3PeAZsBkFksle
 o3tYmJFCiqiGAKxv1uOaaHbpID9h9iOkoXSPTjRPu1tXZM7T13sA5+oTUwV/vFpn+Gz/vP
 gvt/C/mo9HQk1tqjU8F7W5LcvrA7wDQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-dvGzurbYPjeky1SvpKR71g-1; Mon, 31 Oct 2022 08:52:27 -0400
X-MC-Unique: dvGzurbYPjeky1SvpKR71g-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cf4dbff2e4so5768173wmh.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+sTsBbNh/sM1M1BctYZsWb/EcMrzIMV1iWuVZM+Xs4=;
 b=FR5qtJUStKLWr0QoVbRm31voxINRrPwwRHGLNGvXQQP95UUkHy6UMkGVesIQRGZbXM
 ZCeCAMZVUDLdmFNRuLXukKt+F7p5UD3OCbg8//cKgzx0x2y9q9x9C8kDQkoPsrzz4rKT
 GJQprPK+Axs1CiwTFs7NaRWVaUuEAAMJymOGRE3Jbabh9+HKkxYNJWA+9lzwJGRFZWTR
 2HCNSgMNCQKR6hlHJ6F13DuejHW8+3bJEKzaVvb0VtfQOYZ0z6KWivHxZE+vMoWrBbqM
 ocurevvfwpsVwQUYExk0VIsAZrpPA6ps0m4FHQoO8myVspL6LKWeAq4H/jQZm3MRZi3N
 Q1wA==
X-Gm-Message-State: ACrzQf1Gn51AylxkHpj/I2wgNAKNxsO3OG5+0UuGSq6iOwRs7SeQNJXW
 apq8FjAx24+o05Dj1wcBP4vNmaFcefxtoIbUj8DmqoL41ort1sdLXKIEolmEwX6mWG+qLMrQOPv
 Lwn/wpFR9srLzDHSmj0TQByk1WBCVGewjzM/JFzAsoOUmh8uoEhgB9hFkutIs
X-Received: by 2002:a05:6000:1a41:b0:22e:3667:d306 with SMTP id
 t1-20020a0560001a4100b0022e3667d306mr7894236wry.21.1667220744102; 
 Mon, 31 Oct 2022 05:52:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qaVPBu7Uc03RHCwmynZItgzCD8NgRmTRNRrRu/oPan+2rsxEAwoPg9kBZ9+YA/agezP1TVg==
X-Received: by 2002:a05:6000:1a41:b0:22e:3667:d306 with SMTP id
 t1-20020a0560001a4100b0022e3667d306mr7894222wry.21.1667220743818; 
 Mon, 31 Oct 2022 05:52:23 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q9-20020a5d61c9000000b00236733f0f98sm6971742wrv.107.2022.10.31.05.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:23 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>
Subject: [PULL 34/86] vhost-user: Support vhost_dev_start
Message-ID: <20221031124928.128475-35-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


