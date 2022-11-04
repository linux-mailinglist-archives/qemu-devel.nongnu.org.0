Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE37619CD7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMd-0007iv-Rn; Fri, 04 Nov 2022 12:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLy-0006Vq-Gh
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLr-0000hh-GT
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so3486392wmg.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTkwi7Kgw/qzL36aV64p1zqgyIMatepywYUB/dB5ZGQ=;
 b=re9Ld2U7i0MrouSpvW7FQHSDE76UKP1JTox3T+A4joPvemuAMZkuuR5UtrBOmcfPG7
 XXKPW7rFkG0rl116yUERt/Q7QTtXfeJ2NrxoHNUkU/nss0pO8tczCL33k5P+nYEG6BJs
 9F0m126CqU0d0sHOHX/xR+AkoHm4Me7pdPP6NxGnXW+KQQ4H6Z+JKfQpYd8xQMpK6Cni
 XOZ6zsoiBT5hi9rp2UWm/lFdxx4ssskcXRdlxNHvMzsbdy1VrQzDw5tMos3HA7OQV8JR
 ilODHt/AUbSAhXjjHu3AnNDXJ+J28acBGDueihSSPXPi37kgv42E++24ZJZaIVH6hxQT
 LzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTkwi7Kgw/qzL36aV64p1zqgyIMatepywYUB/dB5ZGQ=;
 b=DWaE5mydWhmO/46WfNG0oWcXsbOC9z64WLdldNUHeFhBAEjB0yYS388TiXHDZJzY4j
 5fH3ca3RXaGJl+gxifJe0Is5BntchBceAEDXp6wuJ1FACI8sAj1h2xbz9zn/4q/+6z7C
 9yJfCTofJHpxy4LeFURyA/srIQW6aroKM7T7VDirM1wVloZrYNxXe6Eg8tNTwUkvEBM7
 XlZC1Pn87vAq8GfLfKtiqFhD/sJrdXuTfBm8HupweikjZtNP83Tcf3YpjzuH5uV0D/jE
 AcSHJDV9Y6CCbTwt7+2bIwaRbOZJljlSe3hmJSooM27DInSOLpLu6Px8oG0L2WPNhQnw
 GrGQ==
X-Gm-Message-State: ACrzQf2OcmYgMpfNKY4J7KXTwwwQhzhVEeccgNvNasRojk9M/uQF6R+w
 PlCetQz7YFgYoXCIuzxRKcUga7XkX+e22A==
X-Google-Smtp-Source: AMsMyM77O+INJOuOhsvCtyqwvd6bVoj+gSxv0T4pH7DCXHrd+rW9vBHqkthGaDRWMl1Hi38gAPWV6Q==
X-Received: by 2002:a05:600c:1f11:b0:3cf:73f0:b753 with SMTP id
 bd17-20020a05600c1f1100b003cf73f0b753mr17848736wmb.100.1667578526126; 
 Fri, 04 Nov 2022 09:15:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 7/9] Replace use of qdev_reset_all() with
 device_cold_reset()
Date: Fri,  4 Nov 2022 16:15:11 +0000
Message-Id: <20221104161513.2455862-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index c6cc53acf2d..6ff14e0b9c0 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -685,7 +685,7 @@ static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
         return 0;
     }
 
-    qdev_reset_all(DEVICE(o->pci_dev));
+    device_cold_reset(DEVICE(o->pci_dev));
 
     return 0;
 }
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 806de32034c..13a9ca62800 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -110,7 +110,7 @@ static void subsystem_reset(void)
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


