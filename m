Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586BC694D9D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcEF-0004JY-Pu; Mon, 13 Feb 2023 12:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDZ-0002r7-7Y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDW-0007aQ-HS
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n13so9158802wmr.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NE9DmmuW1MdiTRa7txeyB+Xb80CvmASbM5xSHtXSVRY=;
 b=pgTLrzb1sy7itkIkli8f87RbzMntjJ08tshfJ0JiGa5ogvYzyQdO5nF9pGZQI7a5mx
 uDLzneNQ+FQ48z/yYg6mZ2Of4VxqHMBdua8I45sbDMfWp+//Ko2Hv/2Q8gnW+Ajt0If1
 vCWcbbkrMVS1Pspw6hv138uLG014ks8EDSuNT2kBjkQWf5XJLctV8BAl/NcPpGyqYxw1
 lrBRrYrF+YbGsXx8lEiLIyLyFk+7zY1cN03Tj4pkq824QFbPMlgUnxxf/5mrUfUdNr+e
 y8UkjhBTmxcmy0ItdGzlozvvwU7GOIHw0lBHlpFbGqmf3mspYerV6Yw3TJc+AEwftcUB
 wcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NE9DmmuW1MdiTRa7txeyB+Xb80CvmASbM5xSHtXSVRY=;
 b=EIbHd29IH/qV3xrWe1yc9TnBw59RcInwTMTlN82FKAngvAcSUCImz3BRGfq2lMdDQf
 Ynh6tHHT4R6wn8SVfEHCjlut33sbS2dkhIYz+tYou53t1jA7fP21T2hbadqvybEdm10g
 ysH8TK7pDcwVIgjox6RH0i76ZGlfdXNYyPetyhpXhOcgGOBsO2TQ3/9XLYOsXbVCjAuj
 EmRn2v52CI/aCsSycI4BfSCpsvRTb5h7NTQjHmce8V6S6l2N/R/3KPYvfkAJsAquaGwJ
 p6uCMAT4zQKv9nCNwm4evb6HdTGLAXg0ncXdRGWz1BV1GtW2kupcWsR3XHctruBzD9ay
 /mzw==
X-Gm-Message-State: AO0yUKVVCryBSPhgLxJdvc281BpwWMs/QNsZaBmBf1Sb9xIwETr0i0+e
 PwCCGXmOEXxtebDGuYTApmqxjQ==
X-Google-Smtp-Source: AK7set8YjYo0K+92FNLTrG9hqs43fYFwaLgmI03+1PkXCtYC5rcqX//K5zmq6R1D1PVb6XKlAHvNTg==
X-Received: by 2002:a05:600c:1714:b0:3df:dc29:d69 with SMTP id
 c20-20020a05600c171400b003dfdc290d69mr18574939wmn.36.1676307731606; 
 Mon, 13 Feb 2023 09:02:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003df245cd853sm13646442wme.44.2023.02.13.09.02.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:02:11 -0800 (PST)
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
Subject: [PATCH v3 4/6] hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by
 S390_CCW_DEVICE()
Date: Mon, 13 Feb 2023 18:01:43 +0100
Message-Id: <20230213170145.45666-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Use the S390_CCW_DEVICE() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/ccw.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 2c20e3c202..2ea7b4a63c 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -251,8 +251,7 @@ again:
 
 static void vfio_ccw_reset(DeviceState *dev)
 {
-    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
     VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
 
     ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
@@ -657,8 +656,7 @@ static VFIOGroup *vfio_ccw_get_group(S390CCWDevice *cdev, Error **errp)
 static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 {
     VFIOGroup *group;
-    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
     VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     Error *err = NULL;
@@ -729,8 +727,7 @@ out_err_propagate:
 
 static void vfio_ccw_unrealize(DeviceState *dev)
 {
-    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
     VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     VFIOGroup *group = vcdev->vdev.group;
-- 
2.38.1


