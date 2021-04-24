Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C836A1B1
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 16:54:21 +0200 (CEST)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laJfo-0004Jh-8u
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 10:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laJeq-0003rO-7h; Sat, 24 Apr 2021 10:53:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laJeo-0001tp-PQ; Sat, 24 Apr 2021 10:53:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so2726116wmd.3; 
 Sat, 24 Apr 2021 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dcj02hY637ePPnBlD5sXEWdsMGDRflsUeWtCTI08c6A=;
 b=SbhVrlxzpRZCDe+eID+/3r9izdzp0xoTW2xuD6rRLFOcMywgpa2k1bPVIciVRyxokh
 mB5ngCnUWOvq90d5QgJsi2b9NDWzYLy1VAOBC8QbyIR3wj0VxSn4Oy4SMiukbAfIP6Mh
 LyskJQehLZQz7vAeR9PAu8j0pcRvUcB+594PF9MPFks1qUPs1flHp2v3MnjO6UXOC52G
 KIQ/BPHb22FtSFhA7umYNejWzODTs6XKf5wwz+GjAglAoT+u6wYWEAu7xyfT0OkFMpT9
 f6vndhe3kg3tZV8jNq88qkuQ2ey9ILguxuJYKgh1+DZlj/KpU/PRjYszdpSEo3aGIBWq
 rKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dcj02hY637ePPnBlD5sXEWdsMGDRflsUeWtCTI08c6A=;
 b=E/JdhQghW/HcxvbDKt21z725teqWZaCYkipE/vHOnygrInittBYfRQEABgPlhzK5xl
 wlDZbTs5CeFrVX1tD2LvJ46jHNs4iTAYZra+dDLTrywts+pvWKNqHDr3JH2RcMy6nlTS
 e/jd8GvypL/3m+Tif1eH77XuQzt9NAULR5rS57VhA9tEwjkkTBZApm7gdLNkeN7pRWNm
 bGNlr0qfP4ZKKOyZDXUrt1j2cCG/ytxZ4GkLy8EMC7mv5EQnssxsfg5KibXnt5KvsOqJ
 Xn/S4W2oafN6o1fxxHfLFpbmpTnaZ0eexGKhMub/h1mW28TMfiTivXK5oIescXmMgCNO
 HFyg==
X-Gm-Message-State: AOAM533Svf0w//LNDME6dJfXBxX0vkBeXIsDAQT3EzPLlH1afY3q3eo0
 sOTwA36iQvql8nwyroTTyKiAfHHsGwwFiA==
X-Google-Smtp-Source: ABdhPJwiC38bWd4erKLT+X2CpT+1pHlmsnz5O38SNXPNG5hvA/XmAVrWTerkLrD4Tjqz4chyHmiZgg==
X-Received: by 2002:a1c:156:: with SMTP id 83mr3092096wmb.186.1619275996051;
 Sat, 24 Apr 2021 07:53:16 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x23sm10506895wmj.43.2021.04.24.07.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 07:53:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hw/s390x/ccw: Register qbus type in abstract
 TYPE_CCW_DEVICE parent
Date: Sat, 24 Apr 2021 16:53:13 +0200
Message-Id: <20210424145313.3287400-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of having all TYPE_CCW_DEVICE children set the bus type to
TYPE_VIRTUAL_CSS_BUS, do it once in the abstract parent.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because I don't know these devices, maybe there is a reason
for setting the bus type in the children (but it should be documented
IMO).
---
 hw/s390x/ccw-device.h | 1 +
 hw/s390x/3270-ccw.c   | 1 -
 hw/s390x/ccw-device.c | 1 +
 hw/s390x/s390-ccw.c   | 2 --
 hw/s390x/virtio-ccw.c | 1 -
 5 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/ccw-device.h b/hw/s390x/ccw-device.h
index 832c78cd421..6dff95225df 100644
--- a/hw/s390x/ccw-device.h
+++ b/hw/s390x/ccw-device.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "hw/qdev-core.h"
 #include "hw/s390x/css.h"
+#include "hw/s390x/css-bridge.h"
 
 struct CcwDevice {
     DeviceState parent_obj;
diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index f3e7342b1e8..0757af60632 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -159,7 +159,6 @@ static void emulated_ccw_3270_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, emulated_ccw_3270_properties);
-    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
     dc->realize = emulated_ccw_3270_realize;
     dc->hotpluggable = false;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
diff --git a/hw/s390x/ccw-device.c b/hw/s390x/ccw-device.c
index c9707110e9c..95f269ab441 100644
--- a/hw/s390x/ccw-device.c
+++ b/hw/s390x/ccw-device.c
@@ -59,6 +59,7 @@ static void ccw_device_class_init(ObjectClass *klass, void *data)
     k->refill_ids = ccw_device_refill_ids;
     device_class_set_props(dc, ccw_device_properties);
     dc->reset = ccw_device_reset;
+    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
 }
 
 const VMStateDescription vmstate_ccw_dev = {
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index b497571863f..cb49f380a6b 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -177,10 +177,8 @@ static void s390_ccw_instance_init(Object *obj)
 
 static void s390_ccw_class_init(ObjectClass *klass, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(klass);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_CLASS(klass);
 
-    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
     cdc->realize = s390_ccw_realize;
     cdc->unrealize = s390_ccw_unrealize;
 }
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 8195f3546e4..71ec2bdcc31 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1235,7 +1235,6 @@ static void virtio_ccw_device_class_init(ObjectClass *klass, void *data)
     k->unplug = virtio_ccw_busdev_unplug;
     dc->realize = virtio_ccw_busdev_realize;
     dc->unrealize = virtio_ccw_busdev_unrealize;
-    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
     device_class_set_parent_reset(dc, virtio_ccw_reset, &vdc->parent_reset);
 }
 
-- 
2.26.3


