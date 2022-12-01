Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0663EA6D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0e9i-0007gw-Qv; Thu, 01 Dec 2022 02:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e9M-0007eD-3X
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e9K-0007pr-6w
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669880303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDKsvFO1e1bP8comV8KZ+aqVZb/5jzxai6mQsMShLUI=;
 b=IKQWRtASCUuNIEVCUtaMIAtgj1sg2YUhfs3zZiG8iSlOUTuloJ3gA2ey6VMBD71wjbYu3i
 H0CXNUjlaIAhWFc67aoByYuJjU4+z3DMcNm9DyhzgOM8XEwDgOFns52zegEFqyNP/4AnVV
 FOwtPoNpWnzUQ6KwYfBHk9tH2eko394=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-ATzeHzVHPaWu42GwEcHCow-1; Thu, 01 Dec 2022 02:38:22 -0500
X-MC-Unique: ATzeHzVHPaWu42GwEcHCow-1
Received: by mail-wm1-f72.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso2158735wms.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDKsvFO1e1bP8comV8KZ+aqVZb/5jzxai6mQsMShLUI=;
 b=3eOgZMsFmXLDDztadZN7pPy1WS5k6WAFwNd8bMH7eCkInzvfwT+uq7mxCSSrRTd5ou
 vifLyx7DH0GvpNTGBSqLBDccuW3pe2hNO9aidfo8R4N/6FYLA6Xk6Eq6nHEyYoCpn016
 xHVMkD90lw80o3sFjezMLrKnMpjoDM2La+qWvKpNzy+VCaYYg1qtiBFIBdlWRKqueIZI
 m/xHxCTVTdoUFqCnUSYDgjeuUrr0VO73EjPwPC0QD7wLDIPv3LAKSq1iIH+pprFwZpUB
 4z/gm0POM/KoOu0I8Ljb+PfJV4dq7495gUlTlRb3ChbdKTSkWXDbB8WHiiNDmn0+7DMm
 iExw==
X-Gm-Message-State: ANoB5pn3tIkSBmX/ylCOu31hPTtpHeHDwa+EXxw7IXKo+pmnOtr1zjFv
 SBsRuiHBXTMCKK/zIEkhJwdzOX4W0/LflrNnihvGEhqPw0Ep2rv1yrXkI8gmwX9t1pqtjuI1p1+
 TfVWIuZ0+8GMj8OtC2tPi3dyu1ok02FXLbgnYbQb9X0B2/LGNh6fQ7e2LkD3G
X-Received: by 2002:a05:600c:1c1f:b0:3cf:aa11:93a9 with SMTP id
 j31-20020a05600c1c1f00b003cfaa1193a9mr40192969wms.138.1669880301126; 
 Wed, 30 Nov 2022 23:38:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7LhsXhoeLzzSo23QBvqNmiaYVyC/xOmELvmp8Lln8lhT3QG92VODkZfhOsKCM1KtH39ReR9Q==
X-Received: by 2002:a05:600c:1c1f:b0:3cf:aa11:93a9 with SMTP id
 j31-20020a05600c1c1f00b003cfaa1193a9mr40192949wms.138.1669880300784; 
 Wed, 30 Nov 2022 23:38:20 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4743000000b00228cbac7a25sm3622178wrs.64.2022.11.30.23.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 23:38:20 -0800 (PST)
Date: Thu, 1 Dec 2022 02:38:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PULL 5/5] include/hw: VM state takes precedence in
 virtio_device_should_start
Message-ID: <20221201073725.44585-6-mst@redhat.com>
References: <20221201073725.44585-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201073725.44585-1-mst@redhat.com>
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

From: Alex Bennée <alex.bennee@linaro.org>

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
Message-Id: <20221130112439.2527228-6-alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


