Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3962039F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:19:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0O-0005sv-NI; Mon, 07 Nov 2022 17:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0J-0005mR-1A
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0D-0004ak-Ud
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=As5aksLgJGKiOjHHM7RxMlpTX7dtaJu29uk4Jkwtx/A=;
 b=PQMsshV5Lv50I1q3VpAr8w44eZUyCEiTsoOjVdDCV6k7Z9kpDNpVzB1PgRM3oIZxcxu4v4
 ocua6CiJeEHScgXiu2kZ/8dDj67n9j8NyWjEVbzhyB1uHA+M9UUBLwrUULN+P4yhXcBiT9
 r24Nqta4XxO1R4Jf5SMeyhfPVQ/8wNI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517--pXJEX21PbmuFrmCuD0xyQ-1; Mon, 07 Nov 2022 17:54:00 -0500
X-MC-Unique: -pXJEX21PbmuFrmCuD0xyQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so4104733qty.22
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=As5aksLgJGKiOjHHM7RxMlpTX7dtaJu29uk4Jkwtx/A=;
 b=69GPi6SenrQakU0Jij84fgQ9XRSeuV45c2nFTSdveJn4opOFeBOF2yP5cLMLcrUz0C
 RRcayefqUfc2HBhTsgr4FqjSCurT4n38cxK1VxJJwOZSNMVdGd6xDwjUDqcJZGLC/ns/
 KRFoTcvbzgS7VhCRgSHW0jSsk9NbmMxitME/op5pqaHed0HNizfIquppqXj7RmD/gkGv
 djv0yp2DeWMt3DISFrxf6nHdhtrY01ymohqKUsLxM9UD5c2DBV4fVesRmPPYU1SODdUE
 Hb+8czX/z9szyz/nyv8iNzTkgFhc/NsWQWe75YmynpguGM6RJW1vT8U9nLWq1q5fzXHD
 Fj5g==
X-Gm-Message-State: ACrzQf3tZMtRWjew7D23o83LXES1Ehc4aSYG1TZ7EOvqU/5UptFWM7Jy
 4Ggpw1Ik9fEYO3SOqCfHdPe/EnPKIeO3LmH49bgwosccvbvXlyBZZdMOF8g0TIYeHWuqiK20BS0
 OdCBrRBjBUIf+C0Xd5xFzSl3z4pHN9E2fg1QMuj6DHKI7oYtWksnAj5VC1/k6
X-Received: by 2002:a0c:e1c7:0:b0:4b7:e275:d023 with SMTP id
 v7-20020a0ce1c7000000b004b7e275d023mr47600815qvl.100.1667861639494; 
 Mon, 07 Nov 2022 14:53:59 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5SvidTWECGAGE1Uq6j1YB5IK7EU1okisCOgCw5iJTCiCIaucpBwebfMBww0ej4899wdywiZw==
X-Received: by 2002:a0c:e1c7:0:b0:4b7:e275:d023 with SMTP id
 v7-20020a0ce1c7000000b004b7e275d023mr47600796qvl.100.1667861639175; 
 Mon, 07 Nov 2022 14:53:59 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 d4-20020a05620a240400b006f87d28ea3asm7934337qkn.54.2022.11.07.14.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:58 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>
Subject: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Message-ID: <20221107224600.934080-77-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index d256ce589b..abe23d4ebe 100644
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
@@ -2620,6 +2670,27 @@ void vhost_user_cleanup(VhostUserState *user)
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
@@ -2654,4 +2725,5 @@ const VhostOps user_ops = {
         .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
         .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
         .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
+        .vhost_dev_start = vhost_user_dev_start,
 };
-- 
MST


