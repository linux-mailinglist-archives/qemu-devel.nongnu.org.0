Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532F3C2768
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:17:28 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tBv-0004cG-8U
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t50-0001T3-Tz
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4u-0000uW-FE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k4so6549818wrc.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DB45w+Xf+giGngvepfeNyHkgFOBsKxRzO/+f+Z0SSXM=;
 b=eLBu/s//3SGtE7lNcx+3cEJpXDKMYsyNvB7A60tFYzN9ArQBkD666BBdI8Ab9yn1nB
 fsdTlKWXBBEasbqs+qt4h5mLMtuJZ0XbQVUMVVqI9DZdEJCTQDNihPruG5IQrHGuXo3D
 nJBFr8cHa3NiTjzr931CqNrFl5NNmKEDrmfTvRJ3/OvBt78e92Ggpp5+CBvuZT5jGrJm
 Lqa8RV1v92JamGWKTtzxg1nisCAvhwucSFBmR2fHDJCDvZY6Ftjxb2facikmz7MVeQJd
 ufiQh0k1aBSYsaqvYxVE5Iet6tmrWXj/lYt1kbeq4Re0j5GYG1tt6YWNA0rqhuppyEJe
 vEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DB45w+Xf+giGngvepfeNyHkgFOBsKxRzO/+f+Z0SSXM=;
 b=E/V3GeJSFjWdkh0kKKjxZqXPCLKuPoqqPsZkFvOqazJl3uMSMBvlB/Do3x5NRdq+C0
 hLvL716BBkxPdSNDCzjw3MTn9DmQxeAscgKzdYdLA6WZ1sz+6PINQKJPGYtaZQOtfTjg
 2M82cz5ggQTkGOPzG/rHteZzgOkTihHGbDDfK1cb7YofBKwX3vCv0J5YCmD+lUAO4cJs
 Ucz1m80czGSkUSH2UHzawGovspq9/AL6yy8KV/qvqu2Jzb9eVJYYC9fVz+Ig7R4Uk+GP
 u+ZAUZrSqAKDoimg+tdogwXdaLVd6VLItISrFCKEdssUEsKey0qr1iH8HR8I8VA07sy+
 5vVA==
X-Gm-Message-State: AOAM530MtPkqzd5KnEr8xLX3GObsIs+JqpQnG7UO1xj2VSyORLsAGVx2
 q7mG4gMwbF9tDjct03eWk03mEE33MarRjLDl
X-Google-Smtp-Source: ABdhPJw9Dcxw2JgcGxmIkFePVlELOtI+rM6JTAwr5Mcdy2XH/tf0LG0EwQzb1BDHHqHVjUyaRIaucw==
X-Received: by 2002:a5d:47a7:: with SMTP id 7mr11167489wrb.150.1625847010495; 
 Fri, 09 Jul 2021 09:10:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/17] hw/gpio/pl061: Clean up read/write offset handling logic
Date: Fri,  9 Jul 2021 17:09:53 +0100
Message-Id: <20210709161003.25874-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Currently the pl061_read() and pl061_write() functions handle offsets
using a combination of three if() statements and a switch().  Clean
this up to use just a switch, using case ranges.

This requires that instead of catching accesses to the luminary-only
registers on a stock PL061 via a check on s->rsvd_start we use
an "is this luminary?" check in the cases for each luminary-only
register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/gpio/pl061.c | 104 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 25 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index a6ace88895d..b21b230402f 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -55,7 +55,6 @@ struct PL061State {
     qemu_irq irq;
     qemu_irq out[N_GPIOS];
     const unsigned char *id;
-    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
 };
 
 static const VMStateDescription vmstate_pl061 = {
@@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
 {
     PL061State *s = (PL061State *)opaque;
 
-    if (offset < 0x400) {
-        return s->data & (offset >> 2);
-    }
-    if (offset >= s->rsvd_start && offset <= 0xfcc) {
-        goto err_out;
-    }
-    if (offset >= 0xfd0 && offset < 0x1000) {
-        return s->id[(offset - 0xfd0) >> 2];
-    }
     switch (offset) {
+    case 0x0 ... 0x3ff: /* Data */
+        return s->data & (offset >> 2);
     case 0x400: /* Direction */
         return s->dir;
     case 0x404: /* Interrupt sense */
@@ -178,33 +170,68 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
     case 0x420: /* Alternate function select */
         return s->afsel;
     case 0x500: /* 2mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->dr2r;
     case 0x504: /* 4mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->dr4r;
     case 0x508: /* 8mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->dr8r;
     case 0x50c: /* Open drain */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->odr;
     case 0x510: /* Pull-up */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->pur;
     case 0x514: /* Pull-down */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->pdr;
     case 0x518: /* Slew rate control */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->slr;
     case 0x51c: /* Digital enable */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->den;
     case 0x520: /* Lock */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->locked;
     case 0x524: /* Commit */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->cr;
     case 0x528: /* Analog mode select */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->amsel;
+    case 0xfd0 ... 0xfff: /* ID registers */
+        return s->id[(offset - 0xfd0) >> 2];
     default:
+    bad_offset:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pl061_read: Bad offset %x\n", (int)offset);
         break;
     }
-err_out:
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "pl061_read: Bad offset %x\n", (int)offset);
     return 0;
 }
 
@@ -214,16 +241,12 @@ static void pl061_write(void *opaque, hwaddr offset,
     PL061State *s = (PL061State *)opaque;
     uint8_t mask;
 
-    if (offset < 0x400) {
+    switch (offset) {
+    case 0 ... 0x3ff:
         mask = (offset >> 2) & s->dir;
         s->data = (s->data & ~mask) | (value & mask);
         pl061_update(s);
         return;
-    }
-    if (offset >= s->rsvd_start) {
-        goto err_out;
-    }
-    switch (offset) {
     case 0x400: /* Direction */
         s->dir = value & 0xff;
         break;
@@ -247,47 +270,80 @@ static void pl061_write(void *opaque, hwaddr offset,
         s->afsel = (s->afsel & ~mask) | (value & mask);
         break;
     case 0x500: /* 2mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->dr2r = value & 0xff;
         break;
     case 0x504: /* 4mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->dr4r = value & 0xff;
         break;
     case 0x508: /* 8mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->dr8r = value & 0xff;
         break;
     case 0x50c: /* Open drain */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->odr = value & 0xff;
         break;
     case 0x510: /* Pull-up */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->pur = value & 0xff;
         break;
     case 0x514: /* Pull-down */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->pdr = value & 0xff;
         break;
     case 0x518: /* Slew rate control */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->slr = value & 0xff;
         break;
     case 0x51c: /* Digital enable */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->den = value & 0xff;
         break;
     case 0x520: /* Lock */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->locked = (value != 0xacce551);
         break;
     case 0x524: /* Commit */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         if (!s->locked)
             s->cr = value & 0xff;
         break;
     case 0x528:
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->amsel = value & 0xff;
         break;
     default:
-        goto err_out;
+    bad_offset:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pl061_write: Bad offset %x\n", (int)offset);
+        return;
     }
     pl061_update(s);
     return;
-err_out:
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "pl061_write: Bad offset %x\n", (int)offset);
 }
 
 static void pl061_reset(DeviceState *dev)
@@ -343,7 +399,6 @@ static void pl061_luminary_init(Object *obj)
     PL061State *s = PL061(obj);
 
     s->id = pl061_id_luminary;
-    s->rsvd_start = 0x52c;
 }
 
 static void pl061_init(Object *obj)
@@ -353,7 +408,6 @@ static void pl061_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->id = pl061_id;
-    s->rsvd_start = 0x424;
 
     memory_region_init_io(&s->iomem, obj, &pl061_ops, s, "pl061", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-- 
2.20.1


