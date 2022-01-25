Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AEC6A3486
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPI1-0003Lw-Ao; Sun, 26 Feb 2023 17:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHy-0003Km-Vf; Sun, 26 Feb 2023 17:14:38 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHx-00051P-2F; Sun, 26 Feb 2023 17:14:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8AE6F746FCF;
 Sun, 26 Feb 2023 23:14:35 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4874C746F2F; Sun, 26 Feb 2023 23:14:35 +0100 (CET)
Message-Id: <6f0980fdc3753624be6f3935a6ab0a2dc1df4b30.1677445307.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Tue, 25 Jan 2022 20:48:36 +0100
Subject: [PATCH v3 7/8] hw/audio/ac97: Split off some definitions to a header
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 vr_qemu@t-online.de, ReneEngel80@emailn.de
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

These can be shared with other AC97 implementations.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/audio/ac97.c | 43 +-------------------------------
 hw/audio/ac97.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 42 deletions(-)
 create mode 100644 hw/audio/ac97.h

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 364cdfa733..b3fb10284c 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -26,43 +26,7 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 #include "qom/object.h"
-
-enum {
-    AC97_Reset                     = 0x00,
-    AC97_Master_Volume_Mute        = 0x02,
-    AC97_Headphone_Volume_Mute     = 0x04,
-    AC97_Master_Volume_Mono_Mute   = 0x06,
-    AC97_Master_Tone_RL            = 0x08,
-    AC97_PC_BEEP_Volume_Mute       = 0x0A,
-    AC97_Phone_Volume_Mute         = 0x0C,
-    AC97_Mic_Volume_Mute           = 0x0E,
-    AC97_Line_In_Volume_Mute       = 0x10,
-    AC97_CD_Volume_Mute            = 0x12,
-    AC97_Video_Volume_Mute         = 0x14,
-    AC97_Aux_Volume_Mute           = 0x16,
-    AC97_PCM_Out_Volume_Mute       = 0x18,
-    AC97_Record_Select             = 0x1A,
-    AC97_Record_Gain_Mute          = 0x1C,
-    AC97_Record_Gain_Mic_Mute      = 0x1E,
-    AC97_General_Purpose           = 0x20,
-    AC97_3D_Control                = 0x22,
-    AC97_AC_97_RESERVED            = 0x24,
-    AC97_Powerdown_Ctrl_Stat       = 0x26,
-    AC97_Extended_Audio_ID         = 0x28,
-    AC97_Extended_Audio_Ctrl_Stat  = 0x2A,
-    AC97_PCM_Front_DAC_Rate        = 0x2C,
-    AC97_PCM_Surround_DAC_Rate     = 0x2E,
-    AC97_PCM_LFE_DAC_Rate          = 0x30,
-    AC97_PCM_LR_ADC_Rate           = 0x32,
-    AC97_MIC_ADC_Rate              = 0x34,
-    AC97_6Ch_Vol_C_LFE_Mute        = 0x36,
-    AC97_6Ch_Vol_L_R_Surround_Mute = 0x38,
-    AC97_Vendor_Reserved           = 0x58,
-    AC97_Sigmatel_Analog           = 0x6c, /* We emulate a Sigmatel codec */
-    AC97_Sigmatel_Dac2Invert       = 0x6e, /* We emulate a Sigmatel codec */
-    AC97_Vendor_ID1                = 0x7c,
-    AC97_Vendor_ID2                = 0x7e
-};
+#include "ac97.h"
 
 #define SOFT_VOLUME
 #define SR_FIFOE 16             /* rwc */
@@ -121,11 +85,6 @@ enum {
 #define BD_IOC (1 << 31)
 #define BD_BUP (1 << 30)
 
-#define EACS_VRA 1
-#define EACS_VRM 8
-
-#define MUTE_SHIFT 15
-
 #define TYPE_AC97 "AC97"
 OBJECT_DECLARE_SIMPLE_TYPE(AC97LinkState, AC97)
 
diff --git a/hw/audio/ac97.h b/hw/audio/ac97.h
new file mode 100644
index 0000000000..0358b56ff4
--- /dev/null
+++ b/hw/audio/ac97.h
@@ -0,0 +1,65 @@
+/*
+ * Copyright (C) 2006 InnoTek Systemberatung GmbH
+ *
+ * This file is part of VirtualBox Open Source Edition (OSE), as
+ * available from http://www.virtualbox.org. This file is free software;
+ * you can redistribute it and/or modify it under the terms of the GNU
+ * General Public License as published by the Free Software Foundation,
+ * in version 2 as it comes in the "COPYING" file of the VirtualBox OSE
+ * distribution. VirtualBox OSE is distributed in the hope that it will
+ * be useful, but WITHOUT ANY WARRANTY of any kind.
+ *
+ * If you received this file as part of a commercial VirtualBox
+ * distribution, then only the terms of your commercial VirtualBox
+ * license agreement apply instead of the previous paragraph.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#ifndef AC97_H
+#define AC97_H
+
+enum {
+    AC97_Reset                     = 0x00,
+    AC97_Master_Volume_Mute        = 0x02,
+    AC97_Headphone_Volume_Mute     = 0x04,
+    AC97_Master_Volume_Mono_Mute   = 0x06,
+    AC97_Master_Tone_RL            = 0x08,
+    AC97_PC_BEEP_Volume_Mute       = 0x0A,
+    AC97_Phone_Volume_Mute         = 0x0C,
+    AC97_Mic_Volume_Mute           = 0x0E,
+    AC97_Line_In_Volume_Mute       = 0x10,
+    AC97_CD_Volume_Mute            = 0x12,
+    AC97_Video_Volume_Mute         = 0x14,
+    AC97_Aux_Volume_Mute           = 0x16,
+    AC97_PCM_Out_Volume_Mute       = 0x18,
+    AC97_Record_Select             = 0x1A,
+    AC97_Record_Gain_Mute          = 0x1C,
+    AC97_Record_Gain_Mic_Mute      = 0x1E,
+    AC97_General_Purpose           = 0x20,
+    AC97_3D_Control                = 0x22,
+    AC97_AC_97_RESERVED            = 0x24,
+    AC97_Powerdown_Ctrl_Stat       = 0x26,
+    AC97_Extended_Audio_ID         = 0x28,
+    AC97_Extended_Audio_Ctrl_Stat  = 0x2A,
+    AC97_PCM_Front_DAC_Rate        = 0x2C,
+    AC97_PCM_Surround_DAC_Rate     = 0x2E,
+    AC97_PCM_LFE_DAC_Rate          = 0x30,
+    AC97_PCM_LR_ADC_Rate           = 0x32,
+    AC97_MIC_ADC_Rate              = 0x34,
+    AC97_6Ch_Vol_C_LFE_Mute        = 0x36,
+    AC97_6Ch_Vol_L_R_Surround_Mute = 0x38,
+    AC97_Vendor_Reserved           = 0x58,
+    AC97_Sigmatel_Analog           = 0x6c, /* We emulate a Sigmatel codec */
+    AC97_Sigmatel_Dac2Invert       = 0x6e, /* We emulate a Sigmatel codec */
+    AC97_Vendor_ID1                = 0x7c,
+    AC97_Vendor_ID2                = 0x7e
+};
+
+#define EACS_VRA 1
+#define EACS_VRM 8
+
+#define MUTE_SHIFT 15
+
+#endif /* AC97_H */
-- 
2.30.7


