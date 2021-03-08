Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0B331555
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:56:44 +0100 (CET)
Received: from localhost ([::1]:48606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK7X-0008Uc-KQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJki-0006VD-Mo
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkU-00071k-Im
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u16so12325298wrt.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=im7UTZdzDSCV7D41gh2X8NhtA0RBhH/jIIa6oQnN+fY=;
 b=DGpfJE9pNYzFxkUT2BEFgaAomlPOME3lo6KTa29fLIrlXVrB3ciQ2dLYY5oX6FZqmK
 fvAVpfp0/gQej5XlpKC4Mfg1l6u1MmrGWCTsDWEEFREwhbGEu528aPUvfDBiKolHA+iz
 xs+Us+q0YUXjjeuvki1fsUSyxdZTPbRqhby/Un1ibYByHbs/kTuhR3HECXsrjuSmn6xG
 FSNuovlqFlFyeMl5Y/qvj7QFQNMNiqArdBuc2uzu2nlv0uqjFgBAfPfYElEsRtAGbVo2
 mRtI0UlOThFL2eQ17rq3eiO6O5T/vgFfdZMbWGArUpJnVt5JmhiIrdyyDBGsNGR0cRqj
 gahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=im7UTZdzDSCV7D41gh2X8NhtA0RBhH/jIIa6oQnN+fY=;
 b=K98kfJGYWM9vr+YLST6gmrHQS0pEQv+sxaQptGIoIPud8MQNoNW+g1V14GKg8hTbYX
 WPXDHksjlwBNN5D5l6ypdpm8ddX3kJUt6Pt7hBvXN1HF5MvIHROgq0fzvgnKEFcgRGFz
 geWY+mHrQ26f4VfYhS/8NsUQX61LznPcN1o0aQ8oUDuRW/vBrxn/LPBrUarjBlo+kiVg
 6MRXE9jJQYI684wc6zZX2Or+eXkkCDiME382xVJggNoTxaIz86XQ2t66hFv4Lwb1l4F/
 9DIVrPWL86/rLBoIfxMMwQ1BaGj7zbxwi6dsP6SttaHvhg2rQVWRT32DzaqohJHITvqR
 aoJw==
X-Gm-Message-State: AOAM532mfAoOaIZBC2+87IheB+e4z1u1GNOZYFzXJsbEVX4PL34lr+gR
 ilmBAMBKv3LuJC559azT6CfWQolYwRWpzg==
X-Google-Smtp-Source: ABdhPJxJElsOM+ZVLndev2L6VUNMpL5dwjWNICS3kNh4Qtsz2/BcA7PGx5qZErok8bCp3aZXspeohA==
X-Received: by 2002:adf:d236:: with SMTP id k22mr24073953wrh.144.1615224772602; 
 Mon, 08 Mar 2021 09:32:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/54] hw/misc/iotkit-sysinfo.c: Implement SSE-300 PID register
 values
Date: Mon,  8 Mar 2021 17:31:58 +0000
Message-Id: <20210308173244.20710-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The version of the SYSINFO Register Block in the SSE-300 has
different CIDR/PIDR register values to the SSE-200; pass in
the sse-version property and use it to select the correct
ID register values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-9-peter.maydell@linaro.org
---
 include/hw/misc/iotkit-sysinfo.h |  1 +
 hw/arm/armsse.c                  |  2 ++
 hw/misc/iotkit-sysinfo.c         | 29 +++++++++++++++++++++++++++--
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 055771d2098..91bd14bdbff 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -38,6 +38,7 @@ struct IoTKitSysInfo {
     /* Properties */
     uint32_t sys_version;
     uint32_t sys_config;
+    uint32_t sse_version;
 };
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 9632c287351..67fa4ffe34a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -951,6 +951,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                                  armsse_sys_config_value(s, info), errp)) {
         return;
     }
+    object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
+                            info->sse_version, &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysinfo), errp)) {
         return;
     }
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index 52e70053df7..4bd3fd4c8f3 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -26,6 +26,7 @@
 #include "hw/registerfields.h"
 #include "hw/misc/iotkit-sysinfo.h"
 #include "hw/qdev-properties.h"
+#include "hw/arm/armsse-version.h"
 
 REG32(SYS_VERSION, 0x0)
 REG32(SYS_CONFIG, 0x4)
@@ -49,6 +50,12 @@ static const int sysinfo_id[] = {
     0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
 };
 
+static const int sysinfo_sse300_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0x58, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
 static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
@@ -64,7 +71,14 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
         r = s->sys_config;
         break;
     case A_PID4 ... A_CID3:
-        r = sysinfo_id[(offset - A_PID4) / 4];
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            r = sysinfo_sse300_id[(offset - A_PID4) / 4];
+            break;
+        default:
+            r = sysinfo_id[(offset - A_PID4) / 4];
+            break;
+        }
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -99,6 +113,7 @@ static const MemoryRegionOps iotkit_sysinfo_ops = {
 static Property iotkit_sysinfo_props[] = {
     DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysInfo, sys_version, 0),
     DEFINE_PROP_UINT32("SYS_CONFIG", IoTKitSysInfo, sys_config, 0),
+    DEFINE_PROP_UINT32("sse-version", IoTKitSysInfo, sse_version, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -112,6 +127,16 @@ static void iotkit_sysinfo_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static void iotkit_sysinfo_realize(DeviceState *dev, Error **errp)
+{
+    IoTKitSysInfo *s = IOTKIT_SYSINFO(dev);
+
+    if (!armsse_version_valid(s->sse_version)) {
+        error_setg(errp, "invalid sse-version value %d", s->sse_version);
+        return;
+    }
+}
+
 static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -120,7 +145,7 @@ static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
      * This device has no guest-modifiable state and so it
      * does not need a reset function or VMState.
      */
-
+    dc->realize = iotkit_sysinfo_realize;
     device_class_set_props(dc, iotkit_sysinfo_props);
 }
 
-- 
2.20.1


