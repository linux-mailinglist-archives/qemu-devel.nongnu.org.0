Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B057694D9C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcE9-0003dx-Nc; Mon, 13 Feb 2023 12:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDi-0002y8-0P
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDg-0007cQ-9k
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3320079wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYVAD9s/RzYqbHnSs00cSURUQXlKLoiuleQHl0wgJpY=;
 b=delsgwcb3DNIP7kMSRwjO7Tz0LcKjjy/oR6vZJXvGyO/XUZVgVOSvuI/2QT8OfZFWM
 1MTJl83QGFZk1hfLivDLxFrMWNhgaf7H1hGnmb/6KGm4wfPxScBREgvXsq6XNX9a6sz8
 LG0Fs0f5Vjo2d+QfNWUup0xbJoVagM2lPKfvUHQTo/Q/9+06+L9sG1Gn9X0wM/nRHi5b
 cecn3KSZNF+1mb7R5cnTn7oIY0Su7cXm+fmZDfVAGWLFUsPDh9J/ReSc7+hMc6bEi0RH
 D+Uj87aZhDCYU9RkI9URWqzV6UD416nS36jRpupoV6TrJaAuj8Odtjw0HvGt3Cf+fC1C
 2enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYVAD9s/RzYqbHnSs00cSURUQXlKLoiuleQHl0wgJpY=;
 b=0BoSqORudZkbcq0lgj+uEh10UBYSrhcByWfmoI+u89BSmh14UhjpNIWJ35l73VhBYy
 fSHL/TXEfY7HcbdiP+AoI3PrraapskJN1dhyo6uR5ShIJjfT0lut1OrJviA2uwu3dTvU
 szGjD6rBZZo/IEJtmbmpTv89uJ/2q7BSqbgPwaq/16gvoULgnZOukCBBdJcnrN5mXstR
 hx/EtwJv66UjR77xuLH9Ud3RlmVApKHDkCycXk3Sjxif1WZWgx6ndP9VeWK8MWq/j7po
 +vE+zAbY4nvMWo751QDURhkUUgfQTuD5Yq5fjt22UPk9TzTXV0EhYcxHq+1QVUt4Ucnx
 hMiA==
X-Gm-Message-State: AO0yUKXXdx/EV9IaNgInb5iS8ogRWMhhmwe3hx68om29Q55/d68o46VE
 LbZ4wb6MDFoXs49udNOY+JrQzw==
X-Google-Smtp-Source: AK7set/ZZEsOQhAjOChBrdP68tpDSj1wy4JcXDEnRr0CV5nRW9Jr+cjPJ00mLVfDx00wQOWn5j+8gA==
X-Received: by 2002:a05:600c:a695:b0:3da:1f6a:7b36 with SMTP id
 ip21-20020a05600ca69500b003da1f6a7b36mr23731084wmb.0.1676307743071; 
 Mon, 13 Feb 2023 09:02:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003dfe8c4c497sm17682712wml.39.2023.02.13.09.02.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:02:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/6] hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by
 VFIO_CCW()
Date: Mon, 13 Feb 2023 18:01:45 +0100
Message-Id: <20230213170145.45666-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use the VFIO_CCW() QOM type-checking macro to avoid DO_UPCAST().

Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/ccw.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index cd66b66742..1e2fce83b0 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -76,8 +76,7 @@ struct VFIODeviceOps vfio_ccw_ops = {
 
 static IOInstEnding vfio_ccw_handle_request(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     struct ccw_io_region *region = vcdev->io_region;
     int ret;
 
@@ -125,8 +124,7 @@ again:
 
 static IOInstEnding vfio_ccw_handle_store(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     SCHIB *schib = &sch->curr_status;
     struct ccw_schib_region *region = vcdev->schib_region;
     SCHIB *s;
@@ -170,8 +168,7 @@ static IOInstEnding vfio_ccw_handle_store(SubchDev *sch)
 
 static int vfio_ccw_handle_clear(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     struct ccw_cmd_region *region = vcdev->async_cmd_region;
     int ret;
 
@@ -210,8 +207,7 @@ again:
 
 static int vfio_ccw_handle_halt(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     struct ccw_cmd_region *region = vcdev->async_cmd_region;
     int ret;
 
@@ -251,8 +247,7 @@ again:
 
 static void vfio_ccw_reset(DeviceState *dev)
 {
-    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(dev);
 
     ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
 }
@@ -656,7 +651,7 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 {
     VFIOGroup *group;
     S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     Error *err = NULL;
 
@@ -727,7 +722,7 @@ out_err_propagate:
 static void vfio_ccw_unrealize(DeviceState *dev)
 {
     S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     VFIOGroup *group = vcdev->vdev.group;
 
-- 
2.38.1


