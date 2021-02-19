Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E431FBC0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:13:49 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7TY-0002fy-KL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73q-0002iR-T9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:14 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73N-0003ca-UI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:14 -0500
Received: by mail-wm1-x32d.google.com with SMTP id x4so7882238wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ou09H48NtnRHyRFT/ewuJC3FR8Ak/PHc4n9tF+Stryo=;
 b=ouS9eXghQsYzwGTIROUfoXCVce9rqNdrMiXXnMMIElX+nUFEoje+FI94YWNxG+IzZ0
 tUHE/5eRLbd/F25mKj9D9RtIp97bSpRbRv5WvoLwcOGOrwWZjxi+u30EStdLMap+AwNv
 vjfjWqwAJ4kGrCoDrZtelvlcvymVo9zDPRsQ9LfB8eoQvbcjC0mgeMDAfr4cRmLas0sB
 CXSdJBMHEtRXned/qOvYfLEPBWIkAdQ7F2RfLTJONASTTV9xJRRkvaOaUrGHkXPEkP1y
 nT09Ihs3Sqvtm4hCe6eBGYjAWCUYsr4zNCehKIfcVoq3sIlgYHF328aifZ32TAxBOyrW
 EEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ou09H48NtnRHyRFT/ewuJC3FR8Ak/PHc4n9tF+Stryo=;
 b=E9x2KHYr8JXXlJzPmtNyUbWhGxDgSqr+8O0rRMhxs0x+s2DPpa/cXoK8j5zE+JrMiP
 kHc6cqpxUHnwT1eRIKyTzLrZoK6LQvcsbShfG8NRICC9BVgZU2h8bgZB4F2U+DzPNriN
 I4cZzn3U8m//lGeL1zBkAI8c8XjeOSq7+m+1u5urjMmRWo5DB0r3NLS2dW4I072d6eZc
 zeirZ1mut4hHDKMQK17b5Q20YhCTWYarstpYr7BA5q5k1rc668GKQOcajDTZMpEzuRCy
 5ujqyKgFFfOfychR5JUrFaKzFIfecVkQGhD+7cIo+EO9mQXmu6ZrPIL2mN4bYcnrlwjV
 MzhQ==
X-Gm-Message-State: AOAM531fimSeBl7qBZRr0f8MBPZOzlzOxf4aqtn3aKqozajhtDIuvac+
 pDpEL5KVXzVSRYbwZXFGbwgyN28uHMg4jQ==
X-Google-Smtp-Source: ABdhPJxfMU/Zl4dUXdv3OTpUem3+YoAX+d1hrr2ZA5jg+GWSrWg8uOJLZq3E44zN6JRZOcY6rmDsjQ==
X-Received: by 2002:a1c:20c7:: with SMTP id g190mr8437861wmg.156.1613746004698; 
 Fri, 19 Feb 2021 06:46:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/44] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
Date: Fri, 19 Feb 2021 14:46:06 +0000
Message-Id: <20210219144617.4782-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
the code for having these in an ARMSSEDeviceInfo array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  2 ++
 hw/arm/armsse.c         | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 149f17dfc88..f4e2b680479 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -98,6 +98,7 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/timer/sse-counter.h"
+#include "hw/timer/sse-timer.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/misc/iotkit-sysinfo.h"
@@ -166,6 +167,7 @@ struct ARMSSE {
     CMSDKAPBWatchdog cmsdk_watchdog[3];
 
     SSECounter sse_counter;
+    SSETimer sse_timer[4];
 
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 4387e98376c..ec9c30e0996 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -578,6 +578,11 @@ static void armsse_init(Object *obj)
             assert(devinfo->index == 0);
             object_initialize_child(obj, devinfo->name, &s->dualtimer,
                                     TYPE_CMSDK_APB_DUALTIMER);
+        } else if (!strcmp(devinfo->type, TYPE_SSE_TIMER)) {
+            assert(devinfo->index < ARRAY_SIZE(s->sse_timer));
+            object_initialize_child(obj, devinfo->name,
+                                    &s->sse_timer[devinfo->index],
+                                    TYPE_SSE_TIMER);
         } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_WATCHDOG)) {
             assert(devinfo->index < ARRAY_SIZE(s->cmsdk_watchdog));
             object_initialize_child(obj, devinfo->name,
@@ -1058,6 +1063,16 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_SSE_TIMER)) {
+            sbd = SYS_BUS_DEVICE(&s->sse_timer[devinfo->index]);
+
+            assert(info->has_sse_counter);
+            object_property_set_link(OBJECT(sbd), "counter",
+                                     OBJECT(&s->sse_counter), &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_WATCHDOG)) {
             sbd = SYS_BUS_DEVICE(&s->cmsdk_watchdog[devinfo->index]);
 
-- 
2.20.1


