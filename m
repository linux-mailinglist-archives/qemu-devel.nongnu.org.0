Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BE636350
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrZG-0004pa-Jl; Wed, 23 Nov 2022 10:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxrZF-0004pO-2n
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:41 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxrZD-0006Tw-DJ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id e11so16976157wru.8
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DG6Z60g5BE8Y2pNczTMVoNVOGhKFXAV6GN7gVc4h2s=;
 b=LGc9yzHbKNSknqYUhTS30eiKbn/DheepTXZCIYfImzszcVmTNIofMavbSC13nXhQIc
 Bvfr5MBvCZSqVVK20RgLyQvowRoAHfNrz3ZZFMR6X9SbH5rAohD94/+E27s++VwQ5/Qb
 fvnwMy6sHrFweiMYIbf+H/vSSmVIA5XXigLY9iwmfelny2iiO5/YE1Py4RNKWFM9fniM
 VckSEofzdOXcBeBBNA0LPWZx8fQsGG5M7a0ft9/Ni9hfJ6WKp0vj7jghwqZ+R6Dliowh
 Ojt+PuKTiwOsMq+ab+g5MUvItd9Smxnd/OPrNUQRJljNln1qSpA85IZr3xl1/tsIs2+4
 FZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9DG6Z60g5BE8Y2pNczTMVoNVOGhKFXAV6GN7gVc4h2s=;
 b=TQHyGWDLmwFea0MazredBTDUamDjkZgFr5AfIiaQTs6lU+38yuseOVh7t4Wi9rLmAp
 oV2QTsOT5H9Jv3ukbysoqddyz5DzKd5iMw8QwGPPXwqdXsESWfP6hopwAqf8rGp+DMw1
 He4hpQaOXcWVb+He7U0M96YXwFPfbbzThEwp3qV31h1gd5K+U2vRkFRWZ4cI3FKUzuhU
 BaGOoIuzBONh+miZfhwhHPNV5q7ISfpnfIdVquBJNEG7HLVZ/vvgvdOXBJi5Jd0N8GCk
 pCkjzbHfqKNwjEpTn5UlskNbGJz+/Yeyg4psLqEDxBCFce75KOsAbhVvvq/ie0BR4SMx
 K9Xw==
X-Gm-Message-State: ANoB5plsT7CjQqqLciXIN5x6DTE3ISpVXvaHu4LNDwGA6gOArpMpJNSi
 2nBIah5mOwPGqNXyhGqIiwtoEQ==
X-Google-Smtp-Source: AA0mqf6Wo6vKz3K++8RwnciPDNeVxhM2/TnyDVcIsX6XesBWBWFLL1zh+3ThgNAY1r1U8KNjPJpllg==
X-Received: by 2002:a5d:44c7:0:b0:236:7a11:b06a with SMTP id
 z7-20020a5d44c7000000b002367a11b06amr6991381wrr.298.1669216897762; 
 Wed, 23 Nov 2022 07:21:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056000024600b00236705daefesm16980569wrz.39.2022.11.23.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 07:21:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B79A61FFBA;
 Wed, 23 Nov 2022 15:21:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v1 2/2] include/hw: VM state takes precedence in
 virtio_device_should_start
Date: Wed, 23 Nov 2022 15:21:34 +0000
Message-Id: <20221123152134.179929-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123152134.179929-1-alex.bennee@linaro.org>
References: <20221123152134.179929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


