Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FA693ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSyz-0004gV-LG; Mon, 13 Feb 2023 02:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyF-0003Di-MD
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyB-00022Z-Kl
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id by3so9741306wrb.10
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bInkmnburNvSek0igY2MOEI+V86XMbjL1VMr60EEqDs=;
 b=NdZ2jjxHfwKHVO3zxd9GWFL/7DG4seCf3p1lLGLysBNRih2X39+4ns8/RaqThZKT+D
 yJ8kv2NHjwfUnK0zfQAM420F2LUFUIiX/s7fg+fFcxZmpilm2EPyvL6qgdGdZf1qfLXX
 vE8XDRqb3cK9iwlfk+J0apqoKKOl13UsLSAtk9TUQnBCa4GatpguXldyht7KpgwsVLN9
 rnWczNb6TBF+dDLy7ATcAVbTrCR5KuAzaANS+0waGYK9zNspH7BLn3msI/oQzeqUe3WL
 X8k/kdODFYyScOykY8GIn5eZ4uQrvKHIvquWXmyUYaFp87C+2ZnHN1A+UVyp1jRIMkA6
 ytEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bInkmnburNvSek0igY2MOEI+V86XMbjL1VMr60EEqDs=;
 b=HfR3Olsp2RintwGpOSEEc0w4T9AHRsR4rOGG3fL+99ThnE3oND1mIazSuuYpP6zmpa
 iO9R5PjUNPn9p+cP3ogmGT3Zur82W7iMrQu0n+KN+QgqtUVMzU4yifTgBJdIp9hobrH2
 P3GXAj61/CcmRoVMsZOs4lQWxNj1HTb/gVqhwJ0Ze0W5xaFMwzA7XA6S+TGjeomFvigH
 KxZXMivDF4HCgVHMXfK9OUGAZRFQooxn5Uh9RXmUmaeD+X1c7szojuwRZUIGHsAMfguK
 q9T/M1SByOsdVgb4sdDPIMS2RRVVxRrpV5LCdl5dAZtktWcxUxYNpmjsnEmZwQ99GeJI
 p87w==
X-Gm-Message-State: AO0yUKUGuMms2gYgCqNF7Ijrs+MoI6jMlQC4t+RImF/2Tr0/WrfFw8pb
 1rDQGHiJq9GCCYKqY8p5DL62JUZX/hWVZHy3
X-Google-Smtp-Source: AK7set/gGI9QJmL1uQ4EbQxKn207C+qapMrShLwIQy2QvJN6FsJXLUM/ICqTUNxVSD5fYpEtOoDChA==
X-Received: by 2002:a5d:6707:0:b0:2c3:d69a:1da7 with SMTP id
 o7-20020a5d6707000000b002c3d69a1da7mr18641043wru.0.1676272186099; 
 Sun, 12 Feb 2023 23:09:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d514a000000b002c3e28d0343sm9540429wrt.85.2023.02.12.23.09.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH v2 16/19] hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by
 VFIO_CCW()
Date: Mon, 13 Feb 2023 08:08:17 +0100
Message-Id: <20230213070820.76881-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/ccw.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737666..a8aa5b48c4 100644
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
 
@@ -252,8 +248,8 @@ again:
 static void vfio_ccw_reset(DeviceState *dev)
 {
     CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
 
     ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
 }
@@ -588,9 +584,10 @@ static void vfio_ccw_put_device(VFIOCCWDevice *vcdev)
 static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
                                 Error **errp)
 {
-    char *name = g_strdup_printf("%x.%x.%04x", vcdev->cdev.hostid.cssid,
-                                 vcdev->cdev.hostid.ssid,
-                                 vcdev->cdev.hostid.devid);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(vcdev);
+    char *name = g_strdup_printf("%x.%x.%04x", cdev->hostid.cssid,
+                                 cdev->hostid.ssid,
+                                 cdev->hostid.devid);
     VFIODevice *vbasedev;
 
     QLIST_FOREACH(vbasedev, &group->device_list, next) {
@@ -611,14 +608,14 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
      */
     vcdev->vdev.ram_block_discard_allowed = true;
 
-    if (vfio_get_device(group, vcdev->cdev.mdevid, &vcdev->vdev, errp)) {
+    if (vfio_get_device(group, cdev->mdevid, &vcdev->vdev, errp)) {
         goto out_err;
     }
 
     vcdev->vdev.ops = &vfio_ccw_ops;
     vcdev->vdev.type = VFIO_DEVICE_TYPE_CCW;
     vcdev->vdev.name = name;
-    vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
+    vcdev->vdev.dev = &cdev->parent_obj.parent_obj;
 
     return;
 
@@ -657,9 +654,9 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 {
     VFIOGroup *group;
     CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
     Error *err = NULL;
 
     /* Call the class init function for subchannel. */
@@ -729,9 +726,9 @@ out_err_propagate:
 static void vfio_ccw_unrealize(DeviceState *dev)
 {
     CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(ccw_dev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
     VFIOGroup *group = vcdev->vdev.group;
 
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
-- 
2.38.1


