Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC62BB02D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:23:38 +0100 (CET)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9CD-00042X-SD
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg98N-0007yF-Km
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:19:40 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg98L-0005DW-Fn
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:19:39 -0500
Received: by mail-wr1-x444.google.com with SMTP id l1so10572111wrb.9
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6h63TJEE3VuOKTgE2tz+nb1wD/cQ4WmCS4pSnpNEH5Q=;
 b=uH27zsQ/tgY+ASSTzOKiIvCMiP69AztE6PcZsUD3N7btzdzEzbWiFdlxcOA9hnbR1I
 xSCBqyo3DocYrSQJSYESL+hkXcuyjooqzmzIBFDRGxDqHspUN3I2b9iXY46wy1xwpbbG
 iTY0w3xcx02AtrLMZHgqLJ24OCRgvJ78fKTqeHfGt99w79lDSCutWebqhBJP5uGOI/P9
 wEio52JKIY0StRQAzAf5DeDJ/uKlTW14jjvl69Be4UjINPZ7amuIHfyYiNx2USG5rB51
 A4p+Bq0MIbb3aqxvCwthdQ6lMBkgTlEnibhN6xEPV8x69IjyClpj4UZ3ff4Xx7KjN7mH
 RWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6h63TJEE3VuOKTgE2tz+nb1wD/cQ4WmCS4pSnpNEH5Q=;
 b=EqVynNW/igbzORXI41oNL9aSKptOXgOIC2WaRYjOLfnKbYaD6sQBY7awKla80f3ebt
 QuOPlIVK1MV05l2echABlORjrlT4U7A9rYJLlECsff/20gmNbiob/qMHW2H+AqR62Tgn
 whL6d4NMQoRa2/lmMbHqyx80PzV2vh9MIlX5YmkfARjmZwSQLx/96TCQu5CSyTRlHv2M
 T4P0GL90ee3Qix15i+e+RGrCE8+/BjC+WUNdS8KBHfa2c1b0kn8NVk9vIrb+tpAcQ0J9
 aKLpLKF1ea/ne6dIaq49Cy9nZwL5DdWw8WCwsD+5ejJedOn1A7KylI8M+6TALDH2/xnp
 xwYQ==
X-Gm-Message-State: AOAM5320Wc/zqO4CLW+SxKFQ/hvdGqh+UxdUN6A0ksDkd6mqPuM9RjV6
 MmWDnltRQFO//OG+kPNny1AWViD5H+U=
X-Google-Smtp-Source: ABdhPJyapvxIGHOl7HYgX0RMfCiHbdQsFtm+zr7rNb2jjrmWRnd5iFum5LvybSWwD/nBy4trkWlunQ==
X-Received: by 2002:adf:916e:: with SMTP id j101mr10401256wrj.55.1605889175700; 
 Fri, 20 Nov 2020 08:19:35 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w10sm5714691wra.34.2020.11.20.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 08:19:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2?] hw/char/serial: Clean up unnecessary code
Date: Fri, 20 Nov 2020 17:19:33 +0100
Message-Id: <20201120161933.2514089-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bug 1904331 <1904331@bugs.launchpad.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Jonathan D . Belanger" <jbelanger1@rochester.rr.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 5ec3a23e6c8 ("serial: convert PIO to new memory
api read/write") we don't need to worry about accesses bigger
than 8-bit. Use the extract()/deposit() functions to access
the correct part of the 16-bit 'divider' register.

Reported-by: Jonathan D. Belanger <jbelanger1@rochester.rr.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1904331
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Bug 1904331 <1904331@bugs.launchpad.net>
---
 hw/char/serial.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 97f71879ff2..62c627f486f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "hw/char/serial.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
@@ -338,11 +339,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     default:
     case 0:
         if (s->lcr & UART_LCR_DLAB) {
-            if (size == 1) {
-                s->divider = (s->divider & 0xff00) | val;
-            } else {
-                s->divider = val;
-            }
+            s->divider = deposit32(s->divider, 8 * addr, 8, val);
             serial_update_parameters(s);
         } else {
             s->thr = (uint8_t) val;
@@ -364,7 +361,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
         break;
     case 1:
         if (s->lcr & UART_LCR_DLAB) {
-            s->divider = (s->divider & 0x00ff) | (val << 8);
+            s->divider = deposit32(s->divider, 8 * addr, 8, val);
             serial_update_parameters(s);
         } else {
             uint8_t changed = (s->ier ^ val) & 0x0f;
@@ -478,7 +475,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
     default:
     case 0:
         if (s->lcr & UART_LCR_DLAB) {
-            ret = s->divider & 0xff;
+            ret = extract16(s->divider, 8 * addr, 8);
         } else {
             if(s->fcr & UART_FCR_FE) {
                 ret = fifo8_is_empty(&s->recv_fifo) ?
@@ -502,7 +499,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case 1:
         if (s->lcr & UART_LCR_DLAB) {
-            ret = (s->divider >> 8) & 0xff;
+            ret = extract16(s->divider, 8 * addr, 8);
         } else {
             ret = s->ier;
         }
-- 
2.26.2


