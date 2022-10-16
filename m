Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48A5FFF48
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:48:23 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok342-0005yC-IC
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kv-0002cI-N8; Sun, 16 Oct 2022 08:28:37 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kt-0000Ol-Fq; Sun, 16 Oct 2022 08:28:37 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ot12so19485040ejb.1;
 Sun, 16 Oct 2022 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XB8LzA+Xf7kj44ENBLw+h7JO3RpBY2E4p+/JbUGhS6k=;
 b=GJUOWWEWgZtAzMu3xFPrFJXsvE8CQf9Ncp16SzWt5tdlhwvY/g17F/fvI9g1Qm2fVK
 tpJlS6jI1ZeVaFOeArLjAT8kXwtl0qG1ifl83PiH10k0NQpm/y+bMDd7fuSMXqCVVmno
 tnFclTbEZDbWbmwZF5Ch3TeNsMCpuUlgfdTh+FUrNOlzEA7/0KuPhxYWUEmp86fZNA+R
 gFgyoALxoolpYxdyOstflKTDY0471Dng+RgbTtHPKhy1XldGvVQt4BUQlndyKYk9dNhT
 z8zFbSZo5XKjZLPcVTKkZ8R+QO9HMdyhPosH7wx8CXCx2NJtkZatbSEP+iypKElPjudK
 0cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XB8LzA+Xf7kj44ENBLw+h7JO3RpBY2E4p+/JbUGhS6k=;
 b=tOlSAwAjcF/W98ZTlsvxBQNLRXyrc8Fe+zXJSC8zEhgPW0bBYgMyH9hlFMBIYBxyvr
 mZSeKN3ATGALUflCyrxbl3JpdPxFA3osFuWuytV16Sj2WTrd2NDHnA1AHlweB071NyZ4
 /H5RjvF/+S0KBS+6BvVJlD0cs68voctTUQGQpif2vuBQwx5SuSVHRhoKEq48SHK/q6C8
 chQWjyp4QXeycBFW+B50DJ4GzA2N25IRpXUHA6N66dUJQ9VoNOgGN4DzfrHac1Sru+HT
 emU9ivP2jXgK7+SrxK341i0YrldilW30O3xAS+vv+eMUHUpGRjlX1NryUOHpvm5mwhcA
 eftA==
X-Gm-Message-State: ACrzQf28LrfJ4OwF4QkWol+dDAShoK6x8I3IZ5rN2/1rhpagySdvkOzw
 hE41XPpcWjhMWLNqgp16Giibe4dljCM=
X-Google-Smtp-Source: AMsMyM6P9nV0Q8uoVdjLHBTEmvg/XuQ2QPc1T3ppwkMYcleCVKrdFKyJy6jNGcQphre1wBOXiuBUKQ==
X-Received: by 2002:a17:907:7638:b0:78d:9e03:86a8 with SMTP id
 jy24-20020a170907763800b0078d9e0386a8mr5047765ejc.6.1665923313342; 
 Sun, 16 Oct 2022 05:28:33 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 6/9] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
Date: Sun, 16 Oct 2022 14:27:34 +0200
Message-Id: <20221016122737.93755-7-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device model's functions start with "usdhc_", so rename the defines
accordingly for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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
2.38.0


