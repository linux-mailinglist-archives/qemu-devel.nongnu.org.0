Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0896A4449
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAx-0002Re-9D; Mon, 27 Feb 2023 09:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAm-0001zx-JW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:12 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAk-0000OK-7x
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:12 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bv17so6364900wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Eii2CWpjR1rk5swmvP65mG8yo3Fbs09KNYOOJTPu4DM=;
 b=XMMJvb5y9ZTVRxHcBLasSeqwhTW5ACjbgC3msZW+8ZIK4vUWvQ7mcmi4jxBycgfBXl
 MA7ktY/RyY4raGARff7Nb4OYnIKpj7ensSh3VnJhLCynDAZgGwsExFgj6ScBIENNjUa4
 ZWAckBM525olZEjB9JK5y+a9W/JMnTduwQDXrJcUG9KyM2Ie/0AwW25xSXA6sGLys79S
 Qbnal5CsL2C2Cq3pomfrBAq8BeBnOyFu46oSCko0TV6LdKv6kF410yHcallmF20ceeoI
 /JDS9fG9/E5ixIkPbBR4LVoPxQD9HYvQxPSFbdccGMf5y/CNPE1PZWLhz/tVRaMO+PGd
 J90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eii2CWpjR1rk5swmvP65mG8yo3Fbs09KNYOOJTPu4DM=;
 b=E/WO4VjLBDm+J0BDDxKrPLUf6oTIgh36tjqhoeSGKx2e+r665xEHhLSUQ/dUPah2fB
 SX0ygloFaSZgF1VLF7gBLffLpi5LzXAiegnm9EkkNp+Rpt41L34nOJ9SMLPxsy/GwtqD
 z6tWnmi+DCuuAfxow1f8XOItnQyDwWUm5IaAUqZFVgLleQiQ49i5Ydxgr2D1pxzdRDpJ
 BiXRFo9T6znVv3q24+uJH7Pgj+cUulKPOi3+Kw8DjHjz+R8EtvY+6B3PqBeW5S5yGsR8
 kZycGwGZXcqObxHCkJwKZT30subVAos1QhV/CVYNbxjcHQ40IXT4ZQqrpbyqLHx2pl+2
 /6mg==
X-Gm-Message-State: AO0yUKXBG6GjuVNKO2BR+d2i+wGKWQtJdOgeHz3+EMDYnafu52eKshSN
 CcIO4mi2yReYvQFPTFfoE4AFoycSWACkheFL
X-Google-Smtp-Source: AK7set+NcJmXzm6zUANW926kBood+At1zrpdBKytioBejwZsK0z/nGQ7k6JHjSYe/6IaciavU0SR+Q==
X-Received: by 2002:a5d:6785:0:b0:2c7:a9ec:3 with SMTP id
 v5-20020a5d6785000000b002c7a9ec0003mr8120064wru.65.1677506888196; 
 Mon, 27 Feb 2023 06:08:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adff891000000b002c553e061fdsm7144268wrp.112.2023.02.27.06.08.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 074/126] hw/audio/ac97: Split off some definitions to a header
Date: Mon, 27 Feb 2023 15:01:21 +0100
Message-Id: <20230227140213.35084-65-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <6f0980fdc3753624be6f3935a6ab0a2dc1df4b30.1677445307.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/ac97.c | 43 +-------------------------------
 hw/audio/ac97.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 42 deletions(-)
 create mode 100644 hw/audio/ac97.h

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index b3a45bb49f..c2a5ce062a 100644
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
2.38.1


