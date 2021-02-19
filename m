Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05931FB6D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:54:20 +0100 (CET)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Ah-0001Dg-IA
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73H-000259-Bl
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:39 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD736-0003OS-6s
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a4so6661523wro.8
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hq96YPYIWAIHr8SDiQfrJt7AxA0+9R+fewTzgtcdfzM=;
 b=ABwxVvlnX1p9mScPn/apFyf8cN55bKe0se/50Tor9ianEji6u86Hbh+sphbrJq7sEG
 E9wfPpQCLq82qWq2UfDdpie8CK+HzUQsYetgcqiP/6tcxYL7osPickSWNIqMO1M6QPnU
 tsRgt/kwia9V3rtCQ/xplioBDu8rKmId1Ug0+y1x3PzlIcfxd55iNl2qPoVOn0x1ef4b
 za+MLJt9OHt9/Yx64aVA843aYYR2/HeZexCOR6RlRIW+i/4qGsFvtyiTGjvFwa1cBOs3
 jrCV1kYyElsp28t6glQiS6njjdssKPQvA/g15iFCISnmPZjYV06KxREMotO31gL+5wdu
 qO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hq96YPYIWAIHr8SDiQfrJt7AxA0+9R+fewTzgtcdfzM=;
 b=TxGow9U2lbYD9AE8DocNiqHFquyZ0zrP3h+X42NMfV6x6VlJqdq6JewJKAOL4OVEOP
 oDPtwqpd++jk882mekErLOnKa2UYOSWhYVHos8nP7GMnZyUhKUNKVIkxq9YPE2K117pO
 QOK13c3FInm0lG6NCC66Sgd9yDn55pKMHePXsGL3u16QpqCWo1Ja3L5QrDopR/kt+e27
 mwIp3KTq2Ja34zYr5x0jsv7Nk4iLCWC/82gE6uHU3GtnuEixZx1am9LvsRMErXgiVebb
 5ocu098QuM4ebf8EnUhiW/FC0ihxVXZL+pw1heTfh2z/cq6xlCeiWOurXhEb0dRrNENd
 reJg==
X-Gm-Message-State: AOAM530uo0qo1i8AxKbpO6NynmHnOuvZrYjV7lj6R+hQEdN8/Zfvsqxi
 SpTy02P8BD94iAvL76vFonh/NBkneSelPA==
X-Google-Smtp-Source: ABdhPJyZYCFs/hzYMOixfeqzhEuqK6be8ICXFWGv14cvUaT1YPdF4H+kVOS8KCVZNsmBpsVBAilUOA==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr2137005wrv.56.1613745985727;
 Fri, 19 Feb 2021 06:46:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/44] hw/misc/iotkit-secctl.c: Implement SSE-300 PID register
 values
Date: Fri, 19 Feb 2021 14:45:40 +0000
Message-Id: <20210219144617.4782-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

The versions of the Secure Access Configuration Register Block
and Non-secure Access Configuration Register Block in the SSE-300
are the same as those in the SSE-200, but the CIDR/PIDR ID
register values are different.

Plumb through the sse-version property and use it to select
the correct ID register values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-secctl.h |  2 ++
 hw/arm/armsse.c                 |  2 ++
 hw/misc/iotkit-secctl.c         | 50 +++++++++++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index 227d44abe49..79a36283201 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -120,6 +120,8 @@ struct IoTKitSecCtl {
     IoTKitSecCtlPPC apb[IOTS_NUM_APB_PPC];
     IoTKitSecCtlPPC apbexp[IOTS_NUM_APB_EXP_PPC];
     IoTKitSecCtlPPC ahbexp[IOTS_NUM_APB_EXP_PPC];
+
+    uint32_t sse_version;
 };
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index f509f59d4a8..9632c287351 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -654,6 +654,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     /* Security controller */
+    object_property_set_int(OBJECT(&s->secctl), "sse-version",
+                            info->sse_version, &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->secctl), errp)) {
         return;
     }
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 9fdb82056a8..7b41cfa8fc5 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -19,6 +19,8 @@
 #include "hw/registerfields.h"
 #include "hw/irq.h"
 #include "hw/misc/iotkit-secctl.h"
+#include "hw/arm/armsse-version.h"
+#include "hw/qdev-properties.h"
 
 /* Registers in the secure privilege control block */
 REG32(SECRESPCFG, 0x10)
@@ -95,6 +97,19 @@ static const uint8_t iotkit_secctl_ns_idregs[] = {
     0x0d, 0xf0, 0x05, 0xb1,
 };
 
+static const uint8_t iotkit_secctl_s_sse300_idregs[] = {
+    0x04, 0x00, 0x00, 0x00,
+    0x52, 0xb8, 0x2b, 0x00,
+    0x0d, 0xf0, 0x05, 0xb1,
+};
+
+static const uint8_t iotkit_secctl_ns_sse300_idregs[] = {
+    0x04, 0x00, 0x00, 0x00,
+    0x53, 0xb8, 0x2b, 0x00,
+    0x0d, 0xf0, 0x05, 0xb1,
+};
+
+
 /* The register sets for the various PPCs (AHB internal, APB internal,
  * AHB expansion, APB expansion) are all set up so that they are
  * in 16-aligned blocks so offsets 0xN0, 0xN4, 0xN8, 0xNC are PPCs
@@ -213,7 +228,14 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_CID1:
     case A_CID2:
     case A_CID3:
-        r = iotkit_secctl_s_idregs[(offset - A_PID4) / 4];
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            r = iotkit_secctl_s_sse300_idregs[(offset - A_PID4) / 4];
+            break;
+        default:
+            r = iotkit_secctl_s_idregs[(offset - A_PID4) / 4];
+            break;
+        }
         break;
     case A_SECPPCINTCLR:
     case A_SECMSCINTCLR:
@@ -473,7 +495,14 @@ static MemTxResult iotkit_secctl_ns_read(void *opaque, hwaddr addr,
     case A_CID1:
     case A_CID2:
     case A_CID3:
-        r = iotkit_secctl_ns_idregs[(offset - A_PID4) / 4];
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            r = iotkit_secctl_ns_sse300_idregs[(offset - A_PID4) / 4];
+            break;
+        default:
+            r = iotkit_secctl_ns_idregs[(offset - A_PID4) / 4];
+            break;
+        }
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -710,6 +739,16 @@ static void iotkit_secctl_init(Object *obj)
     sysbus_init_mmio(sbd, &s->ns_regs);
 }
 
+static void iotkit_secctl_realize(DeviceState *dev, Error **errp)
+{
+    IoTKitSecCtl *s = IOTKIT_SECCTL(dev);
+
+    if (!armsse_version_valid(s->sse_version)) {
+        error_setg(errp, "invalid sse-version value %d", s->sse_version);
+        return;
+    }
+}
+
 static const VMStateDescription iotkit_secctl_ppc_vmstate = {
     .name = "iotkit-secctl-ppc",
     .version_id = 1,
@@ -775,12 +814,19 @@ static const VMStateDescription iotkit_secctl_vmstate = {
     },
 };
 
+static Property iotkit_secctl_props[] = {
+    DEFINE_PROP_UINT32("sse-version", IoTKitSecCtl, sse_version, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void iotkit_secctl_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &iotkit_secctl_vmstate;
     dc->reset = iotkit_secctl_reset;
+    dc->realize = iotkit_secctl_realize;
+    device_class_set_props(dc, iotkit_secctl_props);
 }
 
 static const TypeInfo iotkit_secctl_info = {
-- 
2.20.1


