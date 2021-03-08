Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7F3315C8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:21:36 +0100 (CET)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKVb-000244-9g
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl4-000769-8r
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkm-00076x-SP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l12so12332492wry.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W+4bTUyGK28yi6/dxTf2egKfdicu748cNaQiFvA6QJw=;
 b=QcXiXBTRBEuj/GYCh99rTxcXc7xTqFrYIr8mI5JZIYPfI65gCk4ztNQUYG79CAsITO
 4GztoinxBboIT7PXDBsxp6nX6ggM6RkDPJsaKGDym8X4djNXcFQwdXJSsVlEsm7wVGvJ
 1CRTQUdTSJMm1zJI4Vco0/iQQpSQtHAw0gO/7BnRbjtXukA5dCT45mEj22A9QmwFeihX
 dP1bPKVPCmuF2n/WC+xrTIsPMjMWAYZpSf/xODHJ02t50cECzyzDFJuICobCcqPzqY/Q
 f1XE5YrdvprxPjs4a1T3suTkDiGGtC5G9rNjbXlUk12h2VQMWfWsQGf2vmFGylUWd4WU
 zRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W+4bTUyGK28yi6/dxTf2egKfdicu748cNaQiFvA6QJw=;
 b=m52E/7BYhQ90XWR4m44PyXnC7nWYqVYwta4OdLtQWNQxA59ZKBGkJrKgKzFBqN8FBi
 ddICQSmB+9hi4jKjSquEB4QiRvBL3WR1PsyiSRTE872pduL9j4G4l8nMAgXwcXQSgOB3
 tq32FCnfhwXIWhavMfDtQQtIqjlehbhkcCrIAW6On1CWUwywq2iKjETj9GuHuGxjRqG9
 IAh1tA+0VF/r7nJAmd/M8fiTj1a1CZyNDbGR6b1T3iMxh/8lLoGF8d0RCMoLK0dDcJNg
 roNJCfUT4xe88ZSp6Kznqcq2m9QzASpum8F6SbXe8LIpxuawT2rUQgX/UmuPeGDNykWy
 KvdQ==
X-Gm-Message-State: AOAM530NNIdxphY0QpvvKI02eo3ibn1IN6YZjZgtgsQ79NM6yiss5DOY
 4j0/x6C6LKHwYJDseVhtH/61d8oy/bcOLA==
X-Google-Smtp-Source: ABdhPJy3WUVtjNepMbw4RptZVf6rrjb+YwOXSI0OTIAv5jncA9I9HGNLLFJOSHAhw3SlySrPPB3nag==
X-Received: by 2002:adf:f841:: with SMTP id d1mr23804336wrq.36.1615224791583; 
 Mon, 08 Mar 2021 09:33:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/54] hw/arm/armsse: Support variants with ARMSSE_CPU_PWRCTRL
 block
Date: Mon,  8 Mar 2021 17:32:24 +0000
Message-Id: <20210308173244.20710-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Support SSE variants like the SSE-300 with an ARMSSE_CPU_PWRCTRL register
block. Because this block is per-CPU and does not clash with any of the
SSE-200 devices, we handle it with a has_cpu_pwrctrl flag like the
existing has_cachectrl, has_cpusectrl and has_cpuid, rather than
trying to add per-CPU-device support to the devinfo array handling code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-35-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h |  3 +++
 hw/arm/armsse.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index f4e2b680479..21d239c381c 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -104,6 +104,7 @@
 #include "hw/misc/iotkit-sysinfo.h"
 #include "hw/misc/armsse-cpuid.h"
 #include "hw/misc/armsse-mhu.h"
+#include "hw/misc/armsse-cpu-pwrctrl.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/clock.h"
@@ -179,6 +180,8 @@ struct ARMSSE {
 
     ARMSSECPUID cpuid[SSE_MAX_CPUS];
 
+    ARMSSECPUPwrCtrl cpu_pwrctrl[SSE_MAX_CPUS];
+
     /*
      * 'container' holds all devices seen by all CPUs.
      * 'cpu_container[i]' is the view that CPU i has: this has the
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index ec9c30e0996..2366c49376d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -66,6 +66,7 @@ struct ARMSSEInfo {
     bool has_cachectrl;
     bool has_cpusecctrl;
     bool has_cpuid;
+    bool has_cpu_pwrctrl;
     bool has_sse_counter;
     Property *props;
     const ARMSSEDeviceInfo *devinfo;
@@ -364,6 +365,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cachectrl = false,
         .has_cpusecctrl = false,
         .has_cpuid = false,
+        .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
         .props = iotkit_properties,
         .devinfo = iotkit_devices,
@@ -381,6 +383,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cachectrl = true,
         .has_cpusecctrl = true,
         .has_cpuid = true,
+        .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
         .props = armsse_properties,
         .devinfo = sse200_devices,
@@ -660,6 +663,15 @@ static void armsse_init(Object *obj)
             g_free(name);
         }
     }
+    if (info->has_cpu_pwrctrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("cpu_pwrctrl%d", i);
+
+            object_initialize_child(obj, name, &s->cpu_pwrctrl[i],
+                                    TYPE_ARMSSE_CPU_PWRCTRL);
+            g_free(name);
+        }
+    }
     if (info->has_sse_counter) {
         object_initialize_child(obj, "sse-counter", &s->sse_counter,
                                 TYPE_SSE_COUNTER);
@@ -1255,6 +1267,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      *  0x50010000: L1 icache control registers
      *  0x50011000: CPUSECCTRL (CPU local security control registers)
      *  0x4001f000 and 0x5001f000: CPU_IDENTITY register block
+     * The SSE-300 has an extra:
+     *  0x40012000 and 0x50012000: CPU_PWRCTRL register block
      */
     if (info->has_cachectrl) {
         for (i = 0; i < info->num_cpus; i++) {
@@ -1301,6 +1315,18 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             memory_region_add_subregion(&s->cpu_container[i], 0x4001F000, mr);
         }
     }
+    if (info->has_cpu_pwrctrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            MemoryRegion *mr;
+
+            if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpu_pwrctrl[i]), errp)) {
+                return;
+            }
+
+            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpu_pwrctrl[i]), 0);
+            memory_region_add_subregion(&s->cpu_container[i], 0x40012000, mr);
+        }
+    }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[1]), errp)) {
         return;
-- 
2.20.1


