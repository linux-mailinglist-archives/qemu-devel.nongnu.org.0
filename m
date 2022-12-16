Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89B64F37E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUd-0006Dh-6v; Fri, 16 Dec 2022 16:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITn-0005vu-4Z
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:59 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITj-0000b3-H8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:54 -0500
Received: by mail-wm1-x32a.google.com with SMTP id ja17so2736093wmb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kcDNWul230g1IVkNvMU6uv+Q0A4IDRbxHNgR7Lo8f4I=;
 b=juDv0skZXjsshTGgySybu7ZeHIN26bAep0mzWhhX40uI9PJkXH0kz9bgga1neOn/GD
 CsSs41YAnUi5VCahRfREFaY+ziMR38X+EvMq8jADnR827dMOJD6khj6etsvgE8FR79ie
 RCim74SP2/10zmWTKC5n7qwMb/kkiUL/TUknDUXnj9TNa3bOyoW03mOGurhuS/J+fqPc
 JlW1jrMevoOreWkq/cX05wNn3HBOqZZ9iEEeYDMoXSVm5sK2n0magu7mGi0bF09fz9oH
 W1IKkaI5Qx1hZNtOk2cW7HOrniri2KcAi0gI7Z+4HohOomkAsoXq7Q9lGKF4F6EEbCk7
 jbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcDNWul230g1IVkNvMU6uv+Q0A4IDRbxHNgR7Lo8f4I=;
 b=JoelUuPUg8Z39Ykv1OUjnVOh2jIQp5E19BUI8aliI6mIQacxkJ1kS4Frn33PfdtTuv
 45VfYwOQ/SROree0HeJBhXSAMQGVfKuoNMni2xCzA1TenQ4WDVLp54jKKLFvI/GJy5XW
 GVTsJN/iNaVXytuXXEJx6Yi1ZoVmZt8qpZLDlWu9H1AmQxIoGeNQ4mdPHs5W9912E9Rp
 JPMaEMdaoKq2gw2cAqcUFxv/pjwO6/CHaSANClmpBufGXXYMoAJiIOKY6S86qqc1eFzs
 LduLvVo7RmangdA097gDJ6DvyhLc3ZJm5gHMJZyADyPGdsFHKx6pbeSZik0Mh8vj0fLa
 1XNA==
X-Gm-Message-State: AFqh2kp8YW3sNh4FW96aVuzRzSF0JK7UOvJ5CkoNHovi0R9wgo9KHBYi
 hFhn9MZjTHKeG7fv2tifxN9jjLMDaxNVp4Ym
X-Google-Smtp-Source: AMrXdXu6XwT8hBpN1OX6az3H5Hpzrn2OwSHUuhc48wWVkG35fFhieMZ/yJQR8aQOw/HDfmL8CeoX+g==
X-Received: by 2002:a05:600c:4d8a:b0:3d3:3d51:7d44 with SMTP id
 v10-20020a05600c4d8a00b003d33d517d44mr4869310wmp.33.1671226969986; 
 Fri, 16 Dec 2022 13:42:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/36] Replace use of qdev_reset_all() with device_cold_reset()
Date: Fri, 16 Dec 2022 21:42:12 +0000
Message-Id: <20221216214244.1391647-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The legacy function qdev_reset_all() performs a recursive reset,
starting from a qdev.  However, it does not permit any of the devices
in the tree to use three-phase reset, because device reset goes
through the device_legacy_reset() function that only calls the single
DeviceClass::reset method.

Switch to using the device_cold_reset() function instead.  This also
performs a recursive reset, where first the children are reset and
then finally the parent, but it uses the new (...in 2020...)
Resettable mechanism, which supports both the old style single-reset
method and also the new 3-phase reset handling.

This commit changes the five remaining uses of this function.

Commit created with:
 sed -i -e 's/qdev_reset_all/device_cold_reset/g' hw/i386/xen/xen_platform.c hw/input/adb.c hw/remote/vfio-user-obj.c hw/s390x/s390-virtio-ccw.c hw/usb/dev-uas.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/xen/xen_platform.c | 2 +-
 hw/input/adb.c             | 2 +-
 hw/remote/vfio-user-obj.c  | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 hw/usb/dev-uas.c           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index a64265cca07..7db0d94ec28 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -177,7 +177,7 @@ static void pci_xen_ide_unplug(DeviceState *dev, bool aux)
             blk_unref(blk);
         }
     }
-    qdev_reset_all(dev);
+    device_cold_reset(dev);
 }
 
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
diff --git a/hw/input/adb.c b/hw/input/adb.c
index 84331b9fce6..214ae6f42b3 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -43,7 +43,7 @@ static const char *adb_commands[] = {
 
 static void adb_device_reset(ADBDevice *d)
 {
-    qdev_reset_all(DEVICE(d));
+    device_cold_reset(DEVICE(d));
 }
 
 static int do_adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 6d0310cec97..fe1fdfb5f70 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -678,7 +678,7 @@ static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
         return 0;
     }
 
-    qdev_reset_all(DEVICE(o->pci_dev));
+    device_cold_reset(DEVICE(o->pci_dev));
 
     return 0;
 }
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2e64ffab45e..fab79045dd0 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -118,7 +118,7 @@ static void subsystem_reset(void)
     for (i = 0; i < ARRAY_SIZE(reset_dev_types); i++) {
         dev = DEVICE(object_resolve_path_type("", reset_dev_types[i], NULL));
         if (dev) {
-            qdev_reset_all(dev);
+            device_cold_reset(dev);
         }
     }
 }
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 5192b062d6f..88f99c05d53 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -791,7 +791,7 @@ static void usb_uas_task(UASDevice *uas, uas_iu *iu)
 
     case UAS_TMF_LOGICAL_UNIT_RESET:
         trace_usb_uas_tmf_logical_unit_reset(uas->dev.addr, tag, lun);
-        qdev_reset_all(&dev->qdev);
+        device_cold_reset(&dev->qdev);
         usb_uas_queue_response(uas, tag, UAS_RC_TMF_COMPLETE);
         break;
 
-- 
2.25.1


