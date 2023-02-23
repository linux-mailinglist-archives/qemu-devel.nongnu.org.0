Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08816A1124
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI7g-0005gv-7c; Thu, 23 Feb 2023 15:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7d-0005eH-F1; Thu, 23 Feb 2023 15:23:21 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7a-0002SD-Vp; Thu, 23 Feb 2023 15:23:21 -0500
Received: by mail-ed1-x533.google.com with SMTP id da10so47967013edb.3;
 Thu, 23 Feb 2023 12:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MS0ZGLde6R4F7SLXyReoLgCFKJGSfDk8cd4H9K+qMro=;
 b=LCkHSslmiZiqhLHkHUDka301inVbzBmYw5kDtRRK7TydjBijMxZgVF8EQ4TG41rvQG
 o7BzI0iDh0wQFpFG3WR2V9YSWZbBn6yxjDMBG90ok+o3DRSFJ1cWKXnXyt8c3L36oFCn
 Q6QH1wNJZWMpuv/ERR5GlOe61YIbwicXDtAJl49CiIV8rOpJUqwBLDdZUI0gmMqSkgbt
 FRgtEiZ9VZC1UTSF5Y8N8ggmTBKw/xUksMUvgDtaPtJ0HjOMDDn2pFHJSzJ0Oxv+ZaH8
 SoeoX0QODTnemUikN7EQ6EiriyZdCMvAR8bOaYsJdkUUWCigP1jswtijkMMByN1yS8eS
 6Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MS0ZGLde6R4F7SLXyReoLgCFKJGSfDk8cd4H9K+qMro=;
 b=GEUrmBlPmYpCw6D+he+K5d5gNgxIZlkd4a4kYfCiE7RzyXi4tdairrixxLB5EIJFm/
 KXQkeI0erK4Bd+QF2aGIAifsaXEUNN0CpXLA1TOR5XpWASiG51xPH7c5pjKD3CccOk7Y
 vOGU2VgbGosyG2AwzFme/fQmvfPawRjKErDXlM6gJpxKYDRN6DevbA+7DiAbtVmiGThN
 QL7tfkC4BbezTNR4VEUIT5OSS5/erLC9AmGimhKVX988ohrQhEB3kY7RzC4IvvpFwRhB
 Fkc7iLY3ICSHULeN+T6MP04yMzaP5JIJQWNqwQwWJcECg3pXwlJbSV1G/ECohc2lFw6N
 unjQ==
X-Gm-Message-State: AO0yUKV9+THIpImyvzEWjd94hRyj5NjjVZhTkptWOU1zisJk5SOqRdFg
 U9jOWEqTfXes7TEZmA2KbmSx2QfPUCA=
X-Google-Smtp-Source: AK7set91UsZYu1YBE485tLG6xfBqmkLxQv+oiWka+BSD1bN87HZ5HGHiuhPOJVo9IuBVkTDKF0zLsA==
X-Received: by 2002:a17:906:8e8f:b0:82e:a57b:cc9b with SMTP id
 ru15-20020a1709068e8f00b0082ea57bcc9bmr24296892ejc.24.1677183796217; 
 Thu, 23 Feb 2023 12:23:16 -0800 (PST)
Received: from osoxes.fritz.box (pd9ed7433.dip0.t-ipconnect.de.
 [217.237.116.51]) by smtp.gmail.com with ESMTPSA id
 jj1-20020a170907984100b008d606b1bbb1sm5200917ejc.9.2023.02.23.12.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:23:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/5] hw/audio/ac97: Split off some definitions to a header
Date: Thu, 23 Feb 2023 21:20:52 +0100
Message-Id: <20230223202053.117050-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223202053.117050-1-shentey@gmail.com>
References: <20230223202053.117050-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

These can be shared with other AC97 implementations.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/audio/ac97.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 hw/audio/ac97.c | 43 +-------------------------------
 2 files changed, 66 insertions(+), 42 deletions(-)
 create mode 100644 hw/audio/ac97.h

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
 
-- 
2.39.2


