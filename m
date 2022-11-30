Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE6A63D46A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LCq-0004LN-2l; Wed, 30 Nov 2022 06:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCn-0004KR-Ow
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCl-0004f3-W0
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id bs21so26568663wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d70kMeIFAreRNq1P8Q9A13pWa2SZk/EgMzBIG4xKn9g=;
 b=gR7WQbt8TvLhqxViA1+f7PpR/2/B54W8gdmhQPwVgE59IHkZbCR1Go8fcyRtAnGsad
 Ot8d5XEZev1uPKEbST9LpG9tU/xpf98ieshFZuMwbtqK9H64JvSB2zFJBOi7uObhtoAA
 MDYDROfJVaaKpouFoY5+3D3M2tj1mnyN+RpOYb4JGAMHGPQRxUKINUAqsayVK4hvDNpO
 8nTNys3ENYGyhutrWJ7iX6EWlQ6VVzAIpfUevSXPy/U5k13G9aPuN1NiZh8bFGv7TEle
 LH3Y24Fwjcc5uKEYow2VYJEHHaX11jf97sJoxnwDFXAhACsU2rx9rYX9+Ls1o+x53z52
 8cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d70kMeIFAreRNq1P8Q9A13pWa2SZk/EgMzBIG4xKn9g=;
 b=4Yympocwnugwl3ltm+lTV743BLB5mwmQMKCGceaJCrLTCio6LmjGAuDqEkwqZbAdXl
 pwjHuSfj6qCwJYRUybff1zzQVDMzCFvWiWOxxaiJPdhvofGDgxq5gcWyBJw9rG86ebCb
 H+AE4q2pYNZtaX7V7YtLyoVLcyw15ymrALSgkAawT86wv62jEbwIPTNVc+C9nosAy+iO
 Awe9CTbl1HV6L5imj1dzaWBmuhU9yBB+U7DZ6drrBchD2PrCxI+ngwiNeEwRBlgpT9EK
 pJQ6sp3gHInbtBLjyEo/hH86T8Hjb1rhaFX+0hvRyTsadEvMe8qt00R1zj/4kkXgYtks
 Op/Q==
X-Gm-Message-State: ANoB5pkTFkP4/YV/esScpyktwMDiDipqv5tCg/DzvE9IUD9PGGUEWhSV
 qjbuV/fuzPXhDZmTaB0IgLAjGg==
X-Google-Smtp-Source: AA0mqf5qlgFCpDj2pwO3Bi2qeforkx9yW/1v2JDl+fnryjZcbJY42x1Ao6OpCAI2R6MTqQ+EXnw4bg==
X-Received: by 2002:a05:6000:60c:b0:242:10ac:6ab2 with SMTP id
 bn12-20020a056000060c00b0024210ac6ab2mr11265079wrb.552.1669807482586; 
 Wed, 30 Nov 2022 03:24:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003cfa80443a0sm1577944wme.35.2022.11.30.03.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:24:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 055511FFBD;
 Wed, 30 Nov 2022 11:24:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v4 5/5] include/hw: VM state takes precedence in
 virtio_device_should_start
Date: Wed, 30 Nov 2022 11:24:39 +0000
Message-Id: <20221130112439.2527228-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112439.2527228-1-alex.bennee@linaro.org>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---
v3
  - rm extra line
  - fix fn name in comment for virtio_device_started()
---
 include/hw/virtio/virtio.h | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index a973811cbf..acfd4df125 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -116,6 +116,13 @@ struct VirtIODevice
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
@@ -391,6 +398,16 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
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
@@ -411,15 +428,11 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
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


