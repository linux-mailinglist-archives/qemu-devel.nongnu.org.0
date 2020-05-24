Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6A91E00B3
	for <lists+qemu-devel@lfdr.de>; Sun, 24 May 2020 18:49:06 +0200 (CEST)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcto9-0004vl-LL
	for lists+qemu-devel@lfdr.de; Sun, 24 May 2020 12:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jctnH-00042n-1v; Sun, 24 May 2020 12:48:11 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jctnG-0007BK-B9; Sun, 24 May 2020 12:48:10 -0400
Received: by mail-wm1-x341.google.com with SMTP id u13so4640336wml.1;
 Sun, 24 May 2020 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d+AFOFh8gCQwnWPlMSLulMjA1GT+eEiX+AJqYwO+CG4=;
 b=RSEtAGWqAndGpdCQxoIr7cxn6G8UYZkzzjuDJ3LzMjrgXAY/NPFSqjULUvmN9fNpCa
 doquZseoZz5i0hLoOgb45Sh6ox7PjaeS7qT6g1VMMYG859b65sgN8PXboemh8EfveiJc
 vsTywHVsksxd0KW0fsmwqoNB0vOJfY9/JVNzeF6I7M74o8/6+FJi+TMEWk2byjR5rqvQ
 tFc41eqS1gysgD/UMA5Z2jZslIgnb3jzFkiqP3nCRxMKrbI2wjLoTDKUiKmbs2CrL2Do
 0J7o28qkOHQh8+oiVolY75V1KKcf2f2RvrjJi0KA4M/jOMvvzSgAokElcHmrlMZnoxLd
 85SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d+AFOFh8gCQwnWPlMSLulMjA1GT+eEiX+AJqYwO+CG4=;
 b=tnJjEGpCzOQY3Zbk+p/ZdXffnJNmyiv2ZO+pv0xRJr7oeZS5jkCgRpDo5h7QxGoAkD
 KcDqWXO9oxcmc1wxsmBLn7JV8mSOmaTLy+5Pk2CwbwMvARbMLGtm8oJx8ZFqaw2nAAx9
 HWQY8LHuxg5/LbrFjxcui3u7TwkiPwvAamzFs4ooi1ark2Y5eb0EkRKvN1ULdQUKyNlj
 qIlGLiMsH08SQsPgz6Epx/CDqA9juP5jtTXByu22vgk7V2JqTpE7+V8AuHOuTIJYyDFL
 c2U0Rcy2EPv7DkRfSq0V7k/OyVH0BC3SuGzdIddHoziQie+4mF2vszQJw2uYntkTsb1r
 71iA==
X-Gm-Message-State: AOAM5326T5RXZ/fb2/qhPPGaCf3CnUj8/lZZcTBkCym3/w4qC/EGelVa
 dkcUpnTVUfXD542X+v39Z9vYOpckynM=
X-Google-Smtp-Source: ABdhPJySVzDiJ0xFvvDt+W0uVgMpLntaPLbybphhuVJtwr1ypjInUvwpPvV9eKAGw2iKf0+VhJiFXQ==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr21641668wmk.63.1590338888293; 
 Sun, 24 May 2020 09:48:08 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id 37sm15540478wrk.61.2020.05.24.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 09:48:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/isa/apm: Convert debug printf()s to trace events
Date: Sun, 24 May 2020 18:48:06 +0200
Message-Id: <20200524164806.12658-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert APM_DPRINTF() to trace events and remove ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/apm.c        | 15 +++++----------
 hw/isa/trace-events |  4 ++++
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/isa/apm.c b/hw/isa/apm.c
index 6300b1ba7a..bce266b957 100644
--- a/hw/isa/apm.c
+++ b/hw/isa/apm.c
@@ -24,14 +24,8 @@
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
-//#define DEBUG
-
-#ifdef DEBUG
-# define APM_DPRINTF(format, ...)       printf(format, ## __VA_ARGS__)
-#else
-# define APM_DPRINTF(format, ...)       do { } while (0)
-#endif
 
 /* fixed I/O location */
 #define APM_STS_IOPORT  0xb3
@@ -41,8 +35,8 @@ static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
 {
     APMState *apm = opaque;
     addr &= 1;
-    APM_DPRINTF("apm_ioport_writeb addr=0x%" HWADDR_PRIx
-                " val=0x%02" PRIx64 "\n", addr, val);
+
+    trace_apm_io_write(addr, val);
     if (addr == 0) {
         apm->apmc = val;
 
@@ -65,7 +59,8 @@ static uint64_t apm_ioport_readb(void *opaque, hwaddr addr, unsigned size)
     } else {
         val = apm->apms;
     }
-    APM_DPRINTF("apm_ioport_readb addr=0x%" HWADDR_PRIx " val=0x%02x\n", addr, val);
+    trace_apm_io_read(addr, val);
+
     return val;
 }
 
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index 202f8938e7..3544c6213c 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -9,3 +9,7 @@ superio_create_ide(int id, uint16_t base, unsigned int irq) "id=%d, base 0x%03x,
 # pc87312.c
 pc87312_io_read(uint32_t addr, uint32_t val) "read addr=0x%x val=0x%x"
 pc87312_io_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
+
+# apm.c
+apm_io_read(uint8_t addr, uint8_t val) "read addr=0x%x val=0x%02x"
+apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
-- 
2.21.3


