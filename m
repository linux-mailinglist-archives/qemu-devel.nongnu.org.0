Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD76C3299
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebuz-00009v-Ev; Tue, 21 Mar 2023 09:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebux-00008H-IE
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuv-0006eo-PC
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so9456779wmq.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iwkiT7Zpz45TeXAiHKpnDMHEOhc1nyveHRog1XQ/w7I=;
 b=e8kO6iqs88eDLoiAlYMCfMuNaA+bL6ONcAJx95/BdvhMrk3fRPKgB3maY8xE803mp4
 nLLdY7r2wYiKxTZkcKLB0WEbQ56k9WrrmQ+oK70vxCvF/dzmtK+FiI/LF+AawRFXI8Nq
 PVxdmOYU+0A9YQVymTEAchY67mWxdj6sIgL5Cyl486oTf9LYTn4O+/uE/Rdenr9Tv0H7
 cSGM/jXphUbAt2dtKk+h4wXNKr7+EDaPYZh1x7WhBS9ELIb7EW3JTns+rLJjE/Awzmv8
 eMmX4q/u4XuQY6ExBGAqeUzH/q1dM+mcVww4hTm5HlbTo6veNM1lenMjlNnmPRmR0Ne6
 24gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwkiT7Zpz45TeXAiHKpnDMHEOhc1nyveHRog1XQ/w7I=;
 b=jLmLnztGmJxonLYPhBrmHnMi36XtLmO7Lw+BmzztVtRFfzLt60kF9f77DHffpVgozD
 SVLqPnO4kUjsQ5azjiEYNsH6dC6GBUjSy3p8RXyNITePrbwLAUtSk7pDV3L4NchYXkH3
 M02LhTiXizoLwglVbyR1muCXC6kWx3rrNLYUkRbn3E/IYuvjkvYfR3mZzSx2qGMeNzSd
 lWEPZjfQ/69JnI1OFpXnuIa+xX26zgNuuixJjqXJOzfAuI8gUoWywK+1+WNNrkh50bRC
 l1Rh1H+PZn1G4MhXDvE148oEZMhSSC4bG1/VWXVDIZ/fbxdARAN1eP41usxmAvdWft8B
 GhnQ==
X-Gm-Message-State: AO0yUKXa/5qT5cQ6nWQr0NrlbrkLGdU4h8CVN5jqQ6pmnd2MUadse5IO
 m5Ylg1KPUvHgTaLQ9uCHsIt9y+cibgL4ifsCc1E=
X-Google-Smtp-Source: AK7set/6qSLcYrHqkUVQM2VjGS4OoMqapfwytgzYVEeGKkI+70QS/KXnD6eOd9GmdKWQ5cHkq+Ywaw==
X-Received: by 2002:a1c:ed18:0:b0:3eb:4162:7344 with SMTP id
 l24-20020a1ced18000000b003eb41627344mr2264534wmh.22.1679404844462; 
 Tue, 21 Mar 2023 06:20:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
Date: Tue, 21 Mar 2023 13:20:34 +0000
Message-Id: <20230321132036.1836617-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Guenter Roeck <linux@roeck-us.net>

The i.MX USB Phy driver does not check register ranges, resulting in out of
bounds accesses if an attempt is made to access non-existing PHY registers.
Add range check and conditionally report bad accesses to fix the problem.

While at it, also conditionally log attempted writes to non-existing or
read-only registers.

Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Message-id: 20230316234926.208874-1-linux@roeck-us.net
Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/imx-usb-phy.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
index 5d7a549e34d..1a97b36a119 100644
--- a/hw/usb/imx-usb-phy.c
+++ b/hw/usb/imx-usb-phy.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "migration/vmstate.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 
 static const VMStateDescription vmstate_imx_usbphy = {
@@ -90,7 +91,15 @@ static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
         value = s->usbphy[index - 3];
         break;
     default:
-        value = s->usbphy[index];
+        if (index < USBPHY_MAX) {
+            value = s->usbphy[index];
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Read from non-existing USB PHY register 0x%"
+                          HWADDR_PRIx "\n",
+                          __func__, offset);
+            value = 0;
+        }
         break;
     }
     return (uint64_t)value;
@@ -168,7 +177,13 @@ static void imx_usbphy_write(void *opaque, hwaddr offset, uint64_t value,
         s->usbphy[index - 3] ^= value;
         break;
     default:
-        /* Other registers are read-only */
+        /* Other registers are read-only or do not exist */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to %s USB PHY register 0x%"
+                      HWADDR_PRIx "\n",
+                      __func__,
+                      index >= USBPHY_MAX ? "non-existing" : "read-only",
+                      offset);
         break;
     }
 }
-- 
2.34.1


