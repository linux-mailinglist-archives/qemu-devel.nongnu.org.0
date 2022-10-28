Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098456117F3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSTG-0007go-E9; Fri, 28 Oct 2022 12:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSTD-0007C1-3O; Fri, 28 Oct 2022 12:44:35 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSTB-0000x4-85; Fri, 28 Oct 2022 12:44:34 -0400
Received: by mail-oi1-x22e.google.com with SMTP id t10so6715073oib.5;
 Fri, 28 Oct 2022 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAeQXdrkMetwm9uqzy/wODWPQSVGVNRUxj1EoJMdwYo=;
 b=bwzMVXa+52Kwvc7lbJXFc9uidBTk0J0h+nbfdWTjUq1yBgjv/T4YtFpO4kgs3EVPnl
 hCPb+CgxxHZ7tWr7QmB7070r21UCKVabYEUJrfhB2a1qnjXj2sdk42EkHvqoyLG/vkEc
 zMrkVg9OlItS68N6gQcH0XFCsrWX/RT5dAuMVrGThYDIEIbHXTej0YrpiZTUnM+lBs2t
 zIJjsrZqp42Z1aEzOFG0jmvx25J6wSAwASuYA7xCYi0jxeOtaXrM1RKGW5+E6hlEtCH9
 TDleKrZ5ekWJseOSxr1MDJKaPxkzUYUVhDbvDsI5DRmIC0ERF5haiyVP5IekqJvF281H
 5pCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAeQXdrkMetwm9uqzy/wODWPQSVGVNRUxj1EoJMdwYo=;
 b=pR0Xr9RlpyHjtBsq81WAbOH0/qrkVE1RD5tbwUIa5NUFfOgW1RPuTddodFnFr5EyXs
 VB629pebl8iV/SfFgl1EaZTsG2npUVX1pPUpbFRRiADHFiRNdh9VtsKPpJymoFrRXA+j
 BrhYdEqEo20qk+GEm/efPiHRxPr/+VmcxWmWIjdhVl0PsukbfHVn6iLAAUY/Wdx4cuXt
 kpBIFbg5LWv12ppFA3yU9uriQqHngRhO6vz6VFm66APo+nguW4FeOGj9Vna5f+cSTrTI
 toUmlvu9tfJwyHiuHDuBfkrxEeE+f/+2R+kiuxW2WNEIInq8OB2DRmGaPf/teIRR1+Mf
 sR1w==
X-Gm-Message-State: ACrzQf10ACG9FV0W3qz5ojDG2Vfz6oUDAxuFqFU74HTGx9mBl9aJJvwO
 +4A8g2L/cnglVTlwhUmnJSsIlEmQbTMQlQ==
X-Google-Smtp-Source: AMsMyM6QNQRt1ucvLbhkwuqB3eDChdgZ20PwcQoV0y0wQ4R8svI1e80IgpmgsVGpvzYqVpGhN5Tmqw==
X-Received: by 2002:aca:2215:0:b0:354:d4fb:7793 with SMTP id
 b21-20020aca2215000000b00354d4fb7793mr196111oic.256.1666975471924; 
 Fri, 28 Oct 2022 09:44:31 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 61/62] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
Date: Fri, 28 Oct 2022 13:39:50 -0300
Message-Id: <20221028163951.810456-62-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The device model's functions start with "usdhc_", so rename the defines
accordingly for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20221018210146.193159-5-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/sd/sdhci.c | 66 +++++++++++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6da5e2c781..306070c872 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1577,24 +1577,24 @@ static const TypeInfo sdhci_bus_info = {
 
 /* --- qdev i.MX eSDHC --- */
 
-#define ESDHC_MIX_CTRL                  0x48
+#define USDHC_MIX_CTRL                  0x48
 
-#define ESDHC_VENDOR_SPEC               0xc0
-#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
+#define USDHC_VENDOR_SPEC               0xc0
+#define USDHC_IMX_FRC_SDCLK_ON          (1 << 8)
 
-#define ESDHC_DLL_CTRL                  0x60
+#define USDHC_DLL_CTRL                  0x60
 
-#define ESDHC_TUNING_CTRL               0xcc
-#define ESDHC_TUNE_CTRL_STATUS          0x68
-#define ESDHC_WTMK_LVL                  0x44
+#define USDHC_TUNING_CTRL               0xcc
+#define USDHC_TUNE_CTRL_STATUS          0x68
+#define USDHC_WTMK_LVL                  0x44
 
 /* Undocumented register used by guests working around erratum ERR004536 */
-#define ESDHC_UNDOCUMENTED_REG27        0x6c
+#define USDHC_UNDOCUMENTED_REG27        0x6c
 
-#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
-#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
+#define USDHC_CTRL_4BITBUS              (0x1 << 1)
+#define USDHC_CTRL_8BITBUS              (0x2 << 1)
 
-#define ESDHC_PRNSTS_SDSTB              (1 << 3)
+#define USDHC_PRNSTS_SDSTB              (1 << 3)
 
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
@@ -1615,11 +1615,11 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
         hostctl1 = SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
 
         if (s->hostctl1 & SDHC_CTRL_8BITBUS) {
-            hostctl1 |= ESDHC_CTRL_8BITBUS;
+            hostctl1 |= USDHC_CTRL_8BITBUS;
         }
 
         if (s->hostctl1 & SDHC_CTRL_4BITBUS) {
-            hostctl1 |= ESDHC_CTRL_4BITBUS;
+            hostctl1 |= USDHC_CTRL_4BITBUS;
         }
 
         ret  = hostctl1;
@@ -1630,21 +1630,21 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 
     case SDHC_PRNSTS:
         /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
-        ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
+        ret = sdhci_read(opaque, offset, size) & ~USDHC_PRNSTS_SDSTB;
         if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
-            ret |= ESDHC_PRNSTS_SDSTB;
+            ret |= USDHC_PRNSTS_SDSTB;
         }
         break;
 
-    case ESDHC_VENDOR_SPEC:
+    case USDHC_VENDOR_SPEC:
         ret = s->vendor_spec;
         break;
-    case ESDHC_DLL_CTRL:
-    case ESDHC_TUNE_CTRL_STATUS:
-    case ESDHC_UNDOCUMENTED_REG27:
-    case ESDHC_TUNING_CTRL:
-    case ESDHC_MIX_CTRL:
-    case ESDHC_WTMK_LVL:
+    case USDHC_DLL_CTRL:
+    case USDHC_TUNE_CTRL_STATUS:
+    case USDHC_UNDOCUMENTED_REG27:
+    case USDHC_TUNING_CTRL:
+    case USDHC_MIX_CTRL:
+    case USDHC_WTMK_LVL:
         ret = 0;
         break;
     }
@@ -1660,18 +1660,18 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     uint32_t value = (uint32_t)val;
 
     switch (offset) {
-    case ESDHC_DLL_CTRL:
-    case ESDHC_TUNE_CTRL_STATUS:
-    case ESDHC_UNDOCUMENTED_REG27:
-    case ESDHC_TUNING_CTRL:
-    case ESDHC_WTMK_LVL:
+    case USDHC_DLL_CTRL:
+    case USDHC_TUNE_CTRL_STATUS:
+    case USDHC_UNDOCUMENTED_REG27:
+    case USDHC_TUNING_CTRL:
+    case USDHC_WTMK_LVL:
         break;
 
-    case ESDHC_VENDOR_SPEC:
+    case USDHC_VENDOR_SPEC:
         s->vendor_spec = value;
         switch (s->vendor) {
         case SDHCI_VENDOR_IMX:
-            if (value & ESDHC_IMX_FRC_SDCLK_ON) {
+            if (value & USDHC_IMX_FRC_SDCLK_ON) {
                 s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
             } else {
                 s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
@@ -1740,12 +1740,12 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
          * Second, split "Data Transfer Width" from bits 2 and 1 in to
          * bits 5 and 1
          */
-        if (value & ESDHC_CTRL_8BITBUS) {
+        if (value & USDHC_CTRL_8BITBUS) {
             hostctl1 |= SDHC_CTRL_8BITBUS;
         }
 
-        if (value & ESDHC_CTRL_4BITBUS) {
-            hostctl1 |= ESDHC_CTRL_4BITBUS;
+        if (value & USDHC_CTRL_4BITBUS) {
+            hostctl1 |= USDHC_CTRL_4BITBUS;
         }
 
         /*
@@ -1768,7 +1768,7 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         sdhci_write(opaque, offset, value, size);
         break;
 
-    case ESDHC_MIX_CTRL:
+    case USDHC_MIX_CTRL:
         /*
          * So, when SD/MMC stack in Linux tries to write to "Transfer
          * Mode Register", ESDHC i.MX quirk code will translate it
-- 
2.37.3


