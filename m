Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BDF6BDD30
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 00:50:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcxLk-00005P-5p; Thu, 16 Mar 2023 19:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcxLh-0008UN-OJ; Thu, 16 Mar 2023 19:49:33 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcxLf-0003s9-KW; Thu, 16 Mar 2023 19:49:33 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b5so1595806iow.0;
 Thu, 16 Mar 2023 16:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679010570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7cR1MFFt9H0RsFWhzLxzzWJ08Nwrh+em36qJZBKIEwE=;
 b=FZLn9Rlc6RwA3UNkOF9Xn+/mVrkGGFes4l+7luFIp9fQL5+xyi+gq9iplFgXGC9fGo
 bzqv2if5gwEcwJEGmXIbR9ne73f8pdsCcUaofjxG92Izp8Q8t+ffskAUrZfBRruwCSZT
 fQhtGBMUjfqdVnSQeP9uSms3tEoIsmP63qBStFr5kIJbLVGN41go12sI7DF6tKmfsJq9
 MVZ1nOcaKCaRd0mKd26379lIXbwgCNoixwaEFHudjLbGiU8aGCkMZcShw3NoQc2hN8cK
 +v29vq94zRwx6FMM57vmLoAv/V/8j1RSHPovFVAMYP68fsulyxndg4L2D6E9TQsIRYSe
 3s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679010570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cR1MFFt9H0RsFWhzLxzzWJ08Nwrh+em36qJZBKIEwE=;
 b=yxnluqGDUtDaUoPQ7HEXcZqwC6HiBlnjwJKSNreuKrBiolRB532cFGKUxB0dXzaCTr
 8ALhqzijTf+gy7yMDYrvLcbJCPTVq5jtHqwkWvQIoUF7OUzuGQOu6DGnZ36BU8vJ69vs
 SDcFIWH49TD1zvifOMYseHSNDgMLxrNbG+82cH67Flq8NBnO3jg4kRWF8vDJYzRW1ww6
 eFjjr59tcEP6ObBwFX7qiEeQ+uA78vHxh2BV1QiyfeCPk66CQva0J+lSqNeWlCpdgNN9
 NV2ioLoKANHk3V5qXl87MNMrqqcoUD7CYZJR4av9TYTZJRfpujrSDY1LQ5dKUblNz2+v
 Bc8A==
X-Gm-Message-State: AO0yUKXodKFVWSm7/XcR4c/Y5Twq8/AU9yhBzeWgk4a1dl4leNTjvFDW
 3ZR8r3e/gomUiYNYWqXAAuI=
X-Google-Smtp-Source: AK7set9/3yXLVa/pqkv5XJmrjk+LvvYrzLGE+jVbY3SpWyf9vrnv0a3GTaA7v+nxLf8duuISlzLZBg==
X-Received: by 2002:a6b:dc11:0:b0:750:92c7:f63c with SMTP id
 s17-20020a6bdc11000000b0075092c7f63cmr430908ioc.21.1679010570068; 
 Thu, 16 Mar 2023 16:49:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b004035b26b6d8sm213828jai.2.2023.03.16.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 16:49:29 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Qiang Liu <cyruscyliu@gmail.com>
Subject: [PATCH] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
Date: Thu, 16 Mar 2023 16:49:26 -0700
Message-Id: <20230316234926.208874-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=groeck7@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The i.MX USB Phy driver does not check register ranges, resulting in out of
bounds accesses if an attempt is made to access non-existing PHY registers.
Add range check and conditionally report bad accesses to fix the problem.

While at it, also conditionally log attempted writes to non-existing or
read-only registers.

Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/usb/imx-usb-phy.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
index 5d7a549e34..1a97b36a11 100644
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
2.39.2


