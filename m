Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361AE63AE0F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCI-0005k6-Nv; Mon, 28 Nov 2022 11:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhC1-0005eq-NY
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:17 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004oO-30
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so16909397wrr.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oheCMzPlxFSw90huN9+zm9vfeGiOj55wqAJi+rQ46y8=;
 b=PZ+DIK/bXatBqFj139vxhq4Sqbfgo1GPys31fug2xCmfOUTA/qLyS+4ggLRvwG1vYX
 tOzPncE7y8Jf13fTHk2LmwcIbQyT5YC6cSVY9CQr1IC4O/5R/DxrhgTa4OXNmYXv4JYV
 y2oogVawwmn67HvktL7ltyY1YrbKxxVVcFTKMHcpY5ENBSOolmrlDixw+0bE+bKwym0+
 1SzE5mVZKF/KjvxEhRqYQ0fELqQW/sGkIGL3sapQaTq2asRKsZumqHVra5JOqPXRjFqJ
 oeAqmVEd76ALht+PGQjQpPhmvB35BtMFVzcUymU7yF1F8wt6+EcyegBBl8XKDkHLxI+9
 pWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oheCMzPlxFSw90huN9+zm9vfeGiOj55wqAJi+rQ46y8=;
 b=mLCwruDou95e1NjNaLJYfxz4k5JK4E2RhO8lA6/MNhpEBtlfAN/iNHmN2h6eJ1Xzfr
 kYZzPhz609n40QNHc4VP2MFtTWGWpkKl2wSi5f9VRsET7gU0md1Yd90LnSku2cQxL+kO
 bebnsH8nFURkk4tGEMZ2geCTKommAp0EYneKrVgFKss/0e1BJ4X/TR4JkWqQque69N30
 /avR7VLaKwgmGVG5mNhyQ6BTtoO4TWbbBBf4Mkr6K5zGrJnUxABvPwmcx5DRslMgtYVp
 M97+hgjceqUS97YEBGpv5pGesvsvquR/iiK+7SirP8TdrLEEpZsyom0fbEnnOAbztyn8
 v6PA==
X-Gm-Message-State: ANoB5pkT7igafbRBIc3f8lbAHCcWQns1lSQcCltxXlbyNDPXh/s67H+s
 6HKV6i23DqC5kzescfNlGHR+MA==
X-Google-Smtp-Source: AA0mqf6uR6rTNw3WL9p8qBY+1/2fHHLc6RnOzptQ+KTKWN96OI6ULlCt+WmCuUYpLRXv+hMuyD4WPA==
X-Received: by 2002:adf:f6d1:0:b0:241:e2af:444f with SMTP id
 y17-20020adff6d1000000b00241e2af444fmr19929163wrp.676.1669653667586; 
 Mon, 28 Nov 2022 08:41:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a1c790b000000b003b4a699ce8esm18815025wme.6.2022.11.28.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D165C1FFB8;
 Mon, 28 Nov 2022 16:41:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PATCH v3 1/7] include/hw: attempt to document VirtIO feature
 variables
Date: Mon, 28 Nov 2022 16:40:59 +0000
Message-Id: <20221128164105.1191058-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

We have a bunch of variables associated with the device and the vhost
backend which are used inconsistently throughout the code base. Lets
start trying to bring some order by agreeing what each variable is
for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>

---
v2
  - dropped DISCUSS and commentary
  - separated protocol section for clarity
  - updated working on vhost->backend_features
  - made clear guest_features was the written state
---
 include/hw/virtio/vhost.h  | 25 ++++++++++++++++++++++---
 include/hw/virtio/virtio.h | 19 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 353252ac3e..eaf628f656 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -88,13 +88,32 @@ struct vhost_dev {
     int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    /**
+     * vhost feature handling requires matching the feature set
+     * offered by a backend which may be a subset of the total
+     * features eventually offered to the guest.
+     *
+     * @features: available features provided by the backend
+     * @acked_features: final negotiated features with front-end driver
+     *
+     * @backend_features: this is used in a couple of places to either
+     * store VHOST_USER_F_PROTOCOL_FEATURES to apply to
+     * VHOST_USER_SET_FEATURES or VHOST_NET_F_VIRTIO_NET_HDR. Its
+     * future use should be discouraged and the variable retired as
+     * its easy to confuse with the VirtIO backend_features.
+     */
     uint64_t features;
-    /** @acked_features: final set of negotiated features */
     uint64_t acked_features;
-    /** @backend_features: backend specific feature bits */
     uint64_t backend_features;
-    /** @protocol_features: final negotiated protocol features */
+
+    /**
+     * @protocol_features: is the vhost-user only feature set by
+     * VHOST_USER_SET_PROTOCOL_FEATURES. Protocol features are only
+     * negotiated if VHOST_USER_F_PROTOCOL_FEATURES has been offered
+     * by the backend (see @features).
+     */
     uint64_t protocol_features;
+
     uint64_t max_queues;
     uint64_t backend_cap;
     /* @started: is the vhost device started? */
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index a973811cbf..0f612067f7 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -93,6 +93,12 @@ enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_BIG,
 };
 
+/**
+ * struct VirtIODevice - common VirtIO structure
+ * @name: name of the device
+ * @status: VirtIO Device Status field
+ *
+ */
 struct VirtIODevice
 {
     DeviceState parent_obj;
@@ -100,9 +106,20 @@ struct VirtIODevice
     uint8_t status;
     uint8_t isr;
     uint16_t queue_sel;
-    uint64_t guest_features;
+    /**
+     * These fields represent a set of VirtIO features at various
+     * levels of the stack. @host_features indicates the complete
+     * feature set the VirtIO device can offer to the driver.
+     * @guest_features indicates which features the VirtIO driver has
+     * selected by writing to the feature register. Finally
+     * @backend_features represents everything supported by the
+     * backend (e.g. vhost) and could potentially be a subset of the
+     * total feature set offered by QEMU.
+     */
     uint64_t host_features;
+    uint64_t guest_features;
     uint64_t backend_features;
+
     size_t config_len;
     void *config;
     uint16_t config_vector;
-- 
2.34.1


