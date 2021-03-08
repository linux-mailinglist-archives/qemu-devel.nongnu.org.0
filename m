Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A333150A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:41:46 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJt3-0007IM-4P
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkW-0006Sw-NP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkU-00071b-2i
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so8298727wma.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ocFxpM3Id831muBIJ5hzrnRVlMKiDWzMHDQfp86Zrhc=;
 b=Imom97tjZkVR8PYA/qnHxkv/ZoiI6RUMb4Cb3K688HaEqEzhswQNwGI34YIAjm3T4q
 epfPYvEGJLV6sOqyGpFT9BfMEilzuqJ5ckj5h3fPvNGKMOlWfvTDK31nN4BdKf34KCCO
 rV/nr/uC2bDpouhcmlBtPiOZ/hatuhlYHOcIYpSI9/JuTanJaUJHPzkafYCvhMPs38Nd
 oGTTVpeXPcY5xoWJpy62l3uNAhd1IMPJq6E9i6uVSpwEeoHZpB2itJk6VtrP7pF8zrqM
 xnKdFfnV2X0/3gtLmDx8g53mynvaeAvvsqVrTl4p0guC4Ey+C26FqTrxZbKH/g8VOENg
 RZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocFxpM3Id831muBIJ5hzrnRVlMKiDWzMHDQfp86Zrhc=;
 b=NZ/q/x6jHSM9a3ldyULlSYtsg4n6XiclJ2oqAjSKlCL4f7Zsz/f3XiQ9cRnSwORSRE
 Msrd5GP5Kg3tncqSw7kKd/TiVxZ/V7xMMVEWNLO9BIuOPTkRq604ix3kql2vfU0A87q1
 ZxT6brFT/gjdkcPv/ISu2g0q4o9EuD/km7r7EgBi8mY2gyNXP3JFr2XioBkSjwJ1KrJ9
 3tQZPmCjnMN7NLGJr4Z5Lwiei9+zIS5axlG+2Tg/Dq2IRDv59+m8J/ndp7NC3ngH5ExJ
 5kjl7pjLfFTRVC4rYlQDFaBwCwYOMZQy1NRCW/lMAkTmnZoM+T5t3f+IbDo5zrNEYWGb
 sv/Q==
X-Gm-Message-State: AOAM533XDEjL2SIORS/fNB96sTYN224oLnm54BTetnV0S3oymT+OR1G5
 HtIGHCDH++hlzakV4Fz1zSRlViGlc8QFhQ==
X-Google-Smtp-Source: ABdhPJwEf1eq86uN2OfEFA2vwjpoUHOYmHDapwzhUZhLT5MGih/tP91xts9271zgI7aZP28adoXhxw==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr16623485wmf.3.1615224771938; 
 Mon, 08 Mar 2021 09:32:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/54] hw/misc/iotkit-secctl.c: Implement SSE-300 PID register
 values
Date: Mon,  8 Mar 2021 17:31:57 +0000
Message-Id: <20210308173244.20710-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-8-peter.maydell@linaro.org
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


