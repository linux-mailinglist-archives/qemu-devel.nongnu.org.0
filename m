Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555B63AE0B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCG-0005iG-N8; Mon, 28 Nov 2022 11:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBx-0005eg-Us
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:16 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004oV-34
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p16so8941847wmc.3
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uka7vikx+meAP3llZrE2xZszY8K9HOEMeUD7dZAV6nM=;
 b=inp1Ny7Q9uISTwqsbI+bXlxcuVtIsT8A3J5tVSJobOBFESO6q2EppAF2JnjyJzpJgk
 HlmCLYcwGFv9gtbCyIlZkyzUdwR8h7HkmXLmZ+UalRxVOSNTo5yGBTalUK7gkz4N0Qfn
 DtYBnm5inougoHEwFg/3oMtFaW3AmIzxGFpjWzvzJl6WiqHNvlnXHnr83SnxSFAM+u6r
 XNktAsaKj2R43cXm9GdYo9jElBztOqWiwq/xXxBGJ38PYF4Psdiwp2j4BilPq4gZ+bKI
 7Y7MWazIgdMt6OJ22j7cSlj7v/TYKs02XoeRg+A6DEdbbAYTuOvmEsvuhUDFU9bmcbyd
 h8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uka7vikx+meAP3llZrE2xZszY8K9HOEMeUD7dZAV6nM=;
 b=Zws7CzyAujUzTGSuv7wWfWeGelmw8FBMOqrGprlOeBmdk2/NIDnDBz47DnBCaJaYdF
 Dvr7kaRq6yhiKvOBqelgNTu17fR8KIsFw0osfsQeCzAughdidiG48F79HhIN7JLErm+c
 fxGjpuh9EGJ6wx0c2GaBvu/LCC4b5T1He+V47kmIFtPALuUynIGNmcVbMHz1q2ZmNZCL
 Ha0cGzAK5jMeLmEMjCtSeEHvU9+hvWB1SVpXRmD13c8B/giFIFJF0pHcOC3kLSs7VVk+
 7fOUZAgfkTWIXy/B8iczXmFFmHbnTjqQNmPHKHicH+mofpU+lol0P+xxl9OE8vIXu9ro
 vfhg==
X-Gm-Message-State: ANoB5pmEO1NqjYf2f0SP74Sgt1g633Ts2yjAV7uBcjKoKMGuIqXS+dgJ
 Arr9JAirBcl4qqIYhtFlCNTFkg==
X-Google-Smtp-Source: AA0mqf69kjC+fiDobeMo191Q0I6TmO4nkNg+N0Ihs8xf3IhJE9d30lRq2UhrXSpuu1styQ5RIg1TlA==
X-Received: by 2002:a05:600c:34d5:b0:3cf:7016:d401 with SMTP id
 d21-20020a05600c34d500b003cf7016d401mr41442324wmq.154.1669653668339; 
 Mon, 28 Nov 2022 08:41:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d6b49000000b002366e3f1497sm11331424wrw.6.2022.11.28.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F02C41FFBA;
 Mon, 28 Nov 2022 16:41:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v3 2/7] include/hw: VM state takes precedence in
 virtio_device_should_start
Date: Mon, 28 Nov 2022 16:41:00 +0000
Message-Id: <20221128164105.1191058-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
v3
  - rm extra line
  - fix fn name in comment for virtio_device_started()
---
 include/hw/virtio/virtio.h | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 0f612067f7..24561e933a 100644
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
@@ -408,6 +415,16 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
     return false;
 }
 
+/**
+ * virtio_device_started() - check if device started
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
@@ -428,15 +445,11 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
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


