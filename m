Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEB3315C9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:21:42 +0100 (CET)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKVh-0002Kt-IP
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl3-00075z-NT
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:30 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkm-00076q-Aw
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:29 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w11so12318681wrr.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+UAH9jldTpiu2zS2S4ZOTd3U0GZLp/CiokZFgy1K23U=;
 b=hBx+OZatB3odYuwrrU/FskvqyIFCMoO2Fcjf5Cjjuq4mOoP77OhIvOOmG5SRZLwlCF
 ivX5OkDK3RmUaQH8/cfqRPI9sgmXljC8neqXpYg/vW51Ku1Qm12dSKivb1l9oh6oWXh8
 C4JXa1DQKxCbZnrRGFmJgi9qeIdWqH0iP+Q7leN1yHdWXo2Dh0JA3y+SFkMknvZVlW4e
 uBDWehJ4merEnvcncLvx/Qk74hhvZ+T9di6XM2HE8/31u/ZmUoaucK7oMsX4+BHfMcUi
 +ad/Ehp2kjlnr+aN51eh/a9k5oZC50nf7wU1KXcQVFEBWWO+m9rFRkjqepuKvwT3XpiS
 K8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UAH9jldTpiu2zS2S4ZOTd3U0GZLp/CiokZFgy1K23U=;
 b=gEuK4iaTx6slMVnKeVXeJPCFsY+XJ8vqoRaKCgbs2hip04jdwqXptvfBZ/9/6RysFA
 0rZyVwh5NQ/LNHyQ4MJsqu6kj2LzmMSwkdT4rNb1pFB4zwAT1XJq+lvANGmBH/uMiiB5
 ZLiiyKBpN0Ocg2usTOqmcCI8VtAQDJikeaRmUZl1jRsG4eRTsjWGOGSOpveCSNTEMFeT
 lUr5WB+U6OjJRAdcpauON7v+Y6acR2/Jj1t4mjSaEMIm18VJMxnQEDXjGNEaXkzxJ+5a
 0BbjP0oGuQ7opE3DRBpQdTVeBi88etfEAt4BOUgcoda0/BwVqBhWHmlZQ+36dsQIUZBp
 ETPA==
X-Gm-Message-State: AOAM531YtfzH5W7qxc5ZC0hdBFFTz9a4ApXZl7TzJ3Td92hIxgvvOWLA
 u8AQUkgX94rxvRwDmsyz9JIoYzQupKHTtQ==
X-Google-Smtp-Source: ABdhPJyrn0+G/MfzRok8OhSMV58z217ItYf9CXGUYW12YlTjxoPZKGYP33WVyKAdVB4C91ryX7/tQA==
X-Received: by 2002:adf:ebc9:: with SMTP id v9mr24182472wrn.387.1615224790942; 
 Mon, 08 Mar 2021 09:33:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/54] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
Date: Mon,  8 Mar 2021 17:32:23 +0000
Message-Id: <20210308173244.20710-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
the code for having these in an ARMSSEDeviceInfo array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-34-peter.maydell@linaro.org
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


