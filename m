Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D8638F12
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycXY-0004Sy-DV; Fri, 25 Nov 2022 12:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXJ-0004ND-5j
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:50 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXG-0004V0-Sx
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:48 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so3899552wmi.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DG6Z60g5BE8Y2pNczTMVoNVOGhKFXAV6GN7gVc4h2s=;
 b=JCGUA/1k0LhuYtCV5TcXZpZ7l1URX64L8z2XsMpj6Mctt3BnK/M1GF6qnlo1yg+Xpo
 Q/Hk9PRaXKCnEzxVHqvX/O3b/mtC5r/9mt66rn0jIOYBdhPdTUG7DkpIxswfyAZL73ZX
 CLPm32lR7u0+uCZH9Q/qMldgVY6v+t0NUhHxCJhcxqagOjUH5zIxtZlYgbr8xiUllBUS
 DZuAL9vtP9f7i0E8gG/smHxCDoHL/yiFblSxVOdpmqRcVWIeheckDzBLVd0fUFOjqd3B
 H8g2wcjfFzEWAaQizksJ5+ih8h4QPufmvJEEmaGe6sIqLfj8q/MzqdBCEQijDX19aEuI
 O2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9DG6Z60g5BE8Y2pNczTMVoNVOGhKFXAV6GN7gVc4h2s=;
 b=SReTwSPyPochXzmN6hCJq+X5heRgNh4m5nCEPkur45sCnU6Hp8912INGWljVn6IorO
 8kOx34SIllggjF/wj4q4TmXfHQLw/5OxXRSb1pzFEBOldvWZFwJ8kF/eu/T2wyvDIWBE
 mdRdvipYNufoXmLf/MV9gpnBx/xFOI7/rbPweU6lUxRtR/NFvaZ4TXbn0mLXw8UFEBmE
 MZQjye8CEhBOhMS4vebviyliC22JX+JdvdpEou9uLoYeXKUas4LoWKuLYATC8oUpoeBL
 rmHrWaYODNQj7SZgYaj/PJ1ghH0K2QxR4cinZRdkD5AMfgw6EuQY/aOKA0JhNc92P5JS
 FCZg==
X-Gm-Message-State: ANoB5pnEd5S0m2eZCAvggFsoXDTPxQVmGc76iDV8i7tCfiPxD0mzU4vg
 MLOw98alWfSh9KbK19FzUSLJRw==
X-Google-Smtp-Source: AA0mqf4d7JailO4h6WJ2PcMV29w/ECruuHZazW6UcMDk9ZvK/3aXBRSxd+STFKJK+BQu36ipKoYc5w==
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id
 b41-20020a05600c4aa900b003cf68bbf5b8mr32104682wmp.67.1669397445465; 
 Fri, 25 Nov 2022 09:30:45 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b003c71358a42dsm13390884wmb.18.2022.11.25.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 09:30:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F8421FFBA;
 Fri, 25 Nov 2022 17:30:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v2 2/5] include/hw: VM state takes precedence in
 virtio_device_should_start
Date: Fri, 25 Nov 2022 17:30:40 +0000
Message-Id: <20221125173043.1998075-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125173043.1998075-1-alex.bennee@linaro.org>
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

The VM status should always preempt the device status for these
checks. This ensures the device is in the correct state when we
suspend the VM prior to migrations. This restores the checks to the
order they where in before the refactoring moved things around.

While we are at it lets improve our documentation of the various
fields involved and document the two functions.

Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
Fixes: 259d69c00b (hw/virtio: introduce virtio_device_should_start)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 include/hw/virtio/virtio.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 0f612067f7..48f539d0fe 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -133,6 +133,13 @@ struct VirtIODevice
     bool broken; /* device in invalid state, needs reset */
     bool use_disabled_flag; /* allow use of 'disable' flag when needed */
     bool disabled; /* device in temporarily disabled state */
+    /**
+     * @use_started: true if the @started flag should be used to check the
+     * current state of the VirtIO device. Otherwise status bits
+     * should be checked for a current status of the device.
+     * @use_started is only set via QMP and defaults to true for all
+     * modern machines (since 4.1).
+     */
     bool use_started;
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
@@ -408,6 +415,17 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
     return false;
 }
 
+
+/**
+ * virtio_device_should_start() - check if device started
+ * @vdev - the VirtIO device
+ * @status - the devices status bits
+ *
+ * Check if the device is started. For most modern machines this is
+ * tracked via the @vdev->started field (to support migration),
+ * otherwise we check for the final negotiated status bit that
+ * indicates everything is ready.
+ */
 static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
 {
     if (vdev->use_started) {
@@ -428,15 +446,11 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
  */
 static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
 {
-    if (vdev->use_started) {
-        return vdev->started;
-    }
-
     if (!vdev->vm_running) {
         return false;
     }
 
-    return status & VIRTIO_CONFIG_S_DRIVER_OK;
+    return virtio_device_started(vdev, status);
 }
 
 static inline void virtio_set_started(VirtIODevice *vdev, bool started)
-- 
2.34.1


