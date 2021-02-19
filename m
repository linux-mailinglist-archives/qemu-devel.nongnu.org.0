Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9B31FBB8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:12:57 +0100 (CET)
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Si-0001OX-QU
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73f-0002Uo-2x
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73H-0003Yj-Rq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v14so8881255wro.7
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QkE/LCPztd/fooCg8iFxYM64YiAVSgQbEacYkK19vlo=;
 b=JTrPe5Rzhf6K1cS3Ld+lwMBTyH5JUVWBN5nU675gtdDsjlVcsaVnFs0yNwa/XNt9cE
 OhI1cktUN+0WCno2LQdcX7cnD6BRQ2enMA+AAP0hO3CYcAyRKLn/rZ015lqAEW5SIE7k
 R696/FR54wH9OPsHzPJbdi5/hwFjvU5ezw01egGC3GmVmuj6OpU0Okk5HUjWztXzVcqW
 oIpMYRgecyiQIMWRpOGe4MB9ySpeaLm1EVx1mpFaqcmtqpu0prOwGp5O6vtVtqJEN9nV
 Zg5Kl0lvJtxR8X8HrMzAwG80gfywP//fMZePN6mUq+hxgiWDOimuqH3VWr2e3h7iq9t8
 1TXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QkE/LCPztd/fooCg8iFxYM64YiAVSgQbEacYkK19vlo=;
 b=QsDixWzJ3IYcV/j+i2Oj0QSBLRb8bTl4qzG5be3qqcaNoFAiiDwCZXxK5qZ7hkO1Ue
 c3vnqHfXjHnDPQ9JCzq8LLTDN4A4ht7QVxG32ppWUsg6tQrlzHh3bmz5P4e2rUkkzzUB
 eT8RVMjGuZEoy3+LyuqMMCmzMOkI77jmSFyhXZ3SN1xsU6EoojqAmXT6YiWszSJ53bAv
 3Hn+QqYX8B2dhuZcif/0DsSaekBzC1169qEm3lDlSVq197o5x+15ACXem0QukTyIdjls
 yq12Iho+7dDF2ydfsJUn6JVFXdnKvaEtUVLufGverAkUtz4ZCkGec3i07x7ONLu6rnof
 tvUQ==
X-Gm-Message-State: AOAM532QifcIn38KKSWSiW9Q7t6lAgxb97RJG46GelGfGO6upXtJgnXl
 aNNC5v35mo7m56QfVyuSDSF9kg==
X-Google-Smtp-Source: ABdhPJw5R9JtlOzlLjgLE1sPYw2rb4sQrbj1iCoDHHjtqCfbUzPVFDox/3JNyRCTr4ftlk2Y0j5dHA==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr9774198wrs.145.1613745998361; 
 Fri, 19 Feb 2021 06:46:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/44] hw/arm/armsse: Move dual-timer device into data-driven
 framework
Date: Fri, 19 Feb 2021 14:45:57 +0000
Message-Id: <20210219144617.4782-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the CMSDK dualtimer device handling into the data-driven
device placement framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 22dd437a4ba..f8da7fb00f9 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -105,6 +105,15 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc_port = 1,
         .irq = 4,
     },
+    {
+        .name = "dualtimer",
+        .type = TYPE_CMSDK_APB_DUALTIMER,
+        .index = 0,
+        .addr = 0x40002000,
+        .ppc = 0,
+        .ppc_port = 2,
+        .irq = 5,
+    },
     {
         .name = NULL,
     }
@@ -346,6 +355,10 @@ static void armsse_init(Object *obj)
             object_initialize_child(obj, devinfo->name,
                                     &s->timer[devinfo->index],
                                     TYPE_CMSDK_APB_TIMER);
+        } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_DUALTIMER)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->dualtimer,
+                                    TYPE_CMSDK_APB_DUALTIMER);
         } else {
             g_assert_not_reached();
         }
@@ -375,8 +388,6 @@ static void armsse_init(Object *obj)
     }
     object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
                             TYPE_CMSDK_APB_TIMER);
-    object_initialize_child(obj, "dualtimer", &s->dualtimer,
-                            TYPE_CMSDK_APB_DUALTIMER);
     object_initialize_child(obj, "s32kwatchdog", &s->s32kwatchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
     object_initialize_child(obj, "nswatchdog", &s->nswatchdog,
@@ -808,6 +819,14 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_DUALTIMER)) {
+            sbd = SYS_BUS_DEVICE(&s->dualtimer);
+
+            qdev_connect_clock_in(DEVICE(sbd), "TIMCLK", s->mainclk);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -844,16 +863,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
-                       armsse_get_common_irq_in(s, 5));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[2]", OBJECT(mr),
-                             &error_abort);
-
     if (info->has_mhus) {
         /*
          * An SSE-200 with only one CPU should have only one MHU created,
@@ -901,8 +910,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc[0]);
     dev_apb_ppc0 = DEVICE(&s->apb_ppc[0]);
 
-    mr = sysbus_mmio_get_region(sbd_apb_ppc0, 2);
-    memory_region_add_subregion(&s->container, 0x40002000, mr);
     if (info->has_mhus) {
         mr = sysbus_mmio_get_region(sbd_apb_ppc0, 3);
         memory_region_add_subregion(&s->container, 0x40003000, mr);
-- 
2.20.1


