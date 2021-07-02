Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9A3B9F3A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:45:46 +0200 (CEST)
Received: from localhost ([::1]:39986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGg5-0004V4-HG
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaz-0004fA-TT
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:47047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGau-0006Zq-CF
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so4932562wms.5
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yLZPF7xM8ZCBR3B2tWpuKNDyEXma9ARshxBKe1boF+8=;
 b=aoeaECMlWLk9zvfstylw19ZTyNYpc6fGOL9SrnV1oJxq3vWxUL5QXM17Hzw6Ut8kFn
 M8h13oqd0UmqyuT0L8ZCJVlW2gRUEBkxautyGUi4i/SepRYl3wNth/G8YjToWSr9I6eu
 lQXdEZ2mQoZO31E2/TA/4C1griKwZr2gbJ/3G5QymrUF6bOT8C2NdqEys3V6LL9wtzDB
 fx4SNqRsTQPNdvXk3O5COaOU5c64EuT999LRiOn8ZHiF4dANbTupu8Gs3l3Wls47xxt3
 mKkDf50dQHvGSNePb7C6e3EZrFkkV2pR1RBKwn5ug+kPIa2F6O8QoaAsRPd0d3zbmncK
 /YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yLZPF7xM8ZCBR3B2tWpuKNDyEXma9ARshxBKe1boF+8=;
 b=VYis6MSSowxvOeQD2SzTX08Nixf2yDsCERC51uXS+DPwfJ4cmJjECAt9Notld+O2Pa
 Og0mpo8q81lT33XGhdC4TDxbdhEW/vrwWW/CB6cl79p+N0KmUA6rX8WXueUK2YkbCucu
 mcv67152I6sMw/NSMuNncpXlXF3RH99giLuOJ8xprcEPMSIxgO+r8jdIE6ReWYDekVWO
 1HlhO1rSruJFvOGqzjayTtMsgV196hmQC1fOn2Cmlj6eo6zH4XBTspj8OlSOgjepkWkF
 uuLpTFUyANzRRzPbbkgdDZgrHBPmnGjxdTpx2P+EWzSVwwQj9f9XFkUUVHBkKGz9VQRP
 HCfg==
X-Gm-Message-State: AOAM531XXn0ac+mpCTl6u6Dz7vVxwRFKnl7U4QaVBgRn6x37p8ofZfpT
 ysl/qzYvYVmil7VHI89VSdtFuQ==
X-Google-Smtp-Source: ABdhPJzYZlZjtM/PYJiHziW2cNvrU6Nm5Y+7+oGeO+1H2Px837SH3zFd/mdUKqn0rwMsb+Lo8az4oQ==
X-Received: by 2002:a7b:c4ca:: with SMTP id g10mr15932042wmk.148.1625222423019; 
 Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling logic
Date: Fri,  2 Jul 2021 11:40:10 +0100
Message-Id: <20210702104018.19881-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
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
---
 hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 25 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index a6ace88895d..0f5d12e6d5a 100644
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
+    case 0x0 ... 0x3fc: /* Data */
+        return s->data & (offset >> 2);
     case 0x400: /* Direction */
         return s->dir;
     case 0x404: /* Interrupt sense */
@@ -178,33 +170,70 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
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
+    case 0x52c ... 0xfcc: /* Reserved */
+        goto bad_offset;
+    case 0xfd0 ... 0xffc: /* ID registers */
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
 
@@ -214,16 +243,12 @@ static void pl061_write(void *opaque, hwaddr offset,
     PL061State *s = (PL061State *)opaque;
     uint8_t mask;
 
-    if (offset < 0x400) {
+    switch (offset) {
+    case 0 ... 0x3fc:
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
@@ -247,47 +272,80 @@ static void pl061_write(void *opaque, hwaddr offset,
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
@@ -343,7 +401,6 @@ static void pl061_luminary_init(Object *obj)
     PL061State *s = PL061(obj);
 
     s->id = pl061_id_luminary;
-    s->rsvd_start = 0x52c;
 }
 
 static void pl061_init(Object *obj)
@@ -353,7 +410,6 @@ static void pl061_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->id = pl061_id;
-    s->rsvd_start = 0x424;
 
     memory_region_init_io(&s->iomem, obj, &pl061_ops, s, "pl061", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-- 
2.20.1


