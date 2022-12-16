Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7CA64F436
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:34:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV7-0006lv-R6; Fri, 16 Dec 2022 16:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUC-00064y-Ok
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU8-0000fW-B2
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:17 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so2697903wms.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DtGHfxlSIosEKRzthGSrmphkcLPWydnWnesqa9WQ6L0=;
 b=NStxHI19wq88jy4P5MkMiy7uPWtWuqLOhlqKxggvvifXB7wRKhwc4D3+5F5JY69PrU
 HbscvupdRpiJhqdwrLu9wBNDyu02WOS3Z/8oS2Jjr/piKRe3CBt/tpMs3XoVZsj0QzQN
 GZPTi3uQ9V1J5qVHZdSSmK5v71KSY/eDvBg0Wyozm7xoGdBFgEWWNTpKrOHejofGajFh
 NHbxtb1eHTVDbfRo/ankmn7w/Jdq5DLuyoyZABFBv9pGjm2HqXEhoAebf5Az+ccqGMyE
 Lei/h4rjGE3PQwZiHum6jY+rqzw9BTQxKjynyAwN2BL4puZEyo3FYvZYEEVEhN+mI+nO
 AANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtGHfxlSIosEKRzthGSrmphkcLPWydnWnesqa9WQ6L0=;
 b=ooqORtmmmu5hkbXXD0+NbMsmHOVvcaUN+0tLljncQh+OnqJRyo2KERGTtLNxRwq3JR
 k15f7Q+R+Vvu5tVXK8NEAu46iEWkiAYYiXqhCsSvPI9YEER/NRja3btmZQ2jm/RPlUed
 CcAO3GmyFo7rUfRym8b0pof+Ff9KspusXMMSXwlDuwwNlShJ5oJXVHIWJ7d2LLhvKvm1
 Ar7UxggexWLivIjFvH0moCcK20TA4tN2DsER1lleX2Lmb1Y8J4K4lRVuYBcAp408Y5ug
 iJD/TY4lUksvIUA7CEP/wVBbcy7Ew7p25IvVOlPATE5OwHbApyoAeuuYyeF0g7BZkIbR
 RssQ==
X-Gm-Message-State: ANoB5pkX8fFpcjloRRIPIpFcfSzyh7/EqkcFB0k4/AUleuT+R4ZYtD+r
 FFPXkAMmJ9m9ReQUhkyOQ6KbdTzZgW7rxqN8
X-Google-Smtp-Source: AA0mqf5Hx145HmdAf7FciSFiDTdjPHWkfpoG6bWV1Wx0JjOX1zy8CkbyZJ4HB+sOZ63e6GhAJ885hw==
X-Received: by 2002:a05:600c:1e8c:b0:3d2:381f:2db5 with SMTP id
 be12-20020a05600c1e8c00b003d2381f2db5mr11139069wmb.22.1671226995607; 
 Fri, 16 Dec 2022 13:43:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] hw/display/virtio-vga: Convert TYPE_VIRTIO_VGA_BASE to
 3-phase reset
Date: Fri, 16 Dec 2022 21:42:39 +0000
Message-Id: <20221216214244.1391647-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Convert the TYPE_VIRTIO_VGA_BASE class to 3-phase reset, so we
don't need to use device_class_set_parent_reset() any more.

Note that this is an abstract class itself; none of the subclasses
override its reset method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221125115240.3005559-3-peter.maydell@linaro.org
---
 hw/display/virtio-vga.h |  2 +-
 hw/display/virtio-vga.c | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/display/virtio-vga.h b/hw/display/virtio-vga.h
index 977ad5edc29..0bd9db1ceea 100644
--- a/hw/display/virtio-vga.h
+++ b/hw/display/virtio-vga.h
@@ -23,7 +23,7 @@ struct VirtIOVGABase {
 struct VirtIOVGABaseClass {
     VirtioPCIClass parent_class;
 
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #endif /* VIRTIO_VGA_H */
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 4dcb34c4a74..e6fb0aa876c 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -165,13 +165,15 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     }
 }
 
-static void virtio_vga_base_reset(DeviceState *dev)
+static void virtio_vga_base_reset_hold(Object *obj)
 {
-    VirtIOVGABaseClass *klass = VIRTIO_VGA_BASE_GET_CLASS(dev);
-    VirtIOVGABase *vvga = VIRTIO_VGA_BASE(dev);
+    VirtIOVGABaseClass *klass = VIRTIO_VGA_BASE_GET_CLASS(obj);
+    VirtIOVGABase *vvga = VIRTIO_VGA_BASE(obj);
 
     /* reset virtio-gpu */
-    klass->parent_reset(dev);
+    if (klass->parent_phases.hold) {
+        klass->parent_phases.hold(obj);
+    }
 
     /* reset vga */
     vga_common_reset(&vvga->vga);
@@ -203,13 +205,14 @@ static void virtio_vga_base_class_init(ObjectClass *klass, void *data)
     VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
     VirtIOVGABaseClass *v = VIRTIO_VGA_BASE_CLASS(klass);
     PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     device_class_set_props(dc, virtio_vga_base_properties);
     dc->vmsd = &vmstate_virtio_vga_base;
     dc->hotpluggable = false;
-    device_class_set_parent_reset(dc, virtio_vga_base_reset,
-                                  &v->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, virtio_vga_base_reset_hold,
+                                       NULL, &v->parent_phases);
 
     k->realize = virtio_vga_base_realize;
     pcidev_k->romfile = "vgabios-virtio.bin";
-- 
2.25.1


