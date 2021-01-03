Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE72E8E51
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:11:09 +0100 (CET)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAea-00005Y-AW
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMO-0004H9-0N
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:20 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMK-0006Eg-Qo
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:19 -0500
Received: by mail-wm1-x336.google.com with SMTP id g185so16658000wmf.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojhC/M+0W8vFwZN1jjIy9RKgtD0KzrFoNNVj6x+2kmE=;
 b=k3yfD31dKhRgHTGcfJ1GMORS+vCW0IevfCtv9z66HDRS8DK/luFRPLcQ3H9+AmlUTO
 Aj/+UHO50rye36TDJwlL40YpEynVrrTYKJWa+YIZlAFT2N21PRSWJM1x4yDGtms6cLJP
 IrJJdY2s3L77ZpDWfTVvITM5QajHDo/WkjajtVQeTXb382G/Bh4Ckb8DIQ+xvul5pIVg
 YygTtSHXViUqrjqqigV9/8KJszQeZo3oH1Lm8xmGIz183MzD5NvPOFlJBE5p1vwHFVNL
 sJSFSQp8rH5JHsLSXRTd/hYDvCA7EoxOyoSYKparqTda4/oVDafr1/rCYvM9fftB6QML
 khvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ojhC/M+0W8vFwZN1jjIy9RKgtD0KzrFoNNVj6x+2kmE=;
 b=DReBLl+iLjrVTkBN50mqUCHgh8Psh9GDeB1nZ9yx5npq2Eu+jsqnBPSO216UcrRV/Y
 PTQWOAR+htLkCJIMWAi2qVjAEaFZBcgV0JHC2L5T1XjjNeVsDOwHmNqH4xgKhQ3RAMZE
 8tUs5rlB7cV12NPCZ5UrabMe7Tcn4MHE34UPhqYc2oSVlR2gWteG0V4qB3kHwxCDuyqJ
 /vOWQYxsy3GUp8MvUKPveCVAA/V23J7jp/GiZjVj4yjIr7eXU0fQHaMlWEf7gWESxnBw
 WYByWXB/6Ls+Td3qcupN4Ww8ODOiO3dkJlqyZjx6Vd60/jdASRaLldPO6gTSL+oCD+Bm
 EJ6Q==
X-Gm-Message-State: AOAM532Y92liQd7lJVkBEBDs8Rlv+2NzIEQ3YvCX1tFcCwZner07bDMG
 nV4THClryARWOj6d5cMd1CW8wglVSHg=
X-Google-Smtp-Source: ABdhPJwPdUDC+//PKGaxDb41MsBnWOxRLO+GFYvtRxSYbSm1ZL7E7SdfZzErWCXNuS+U1H2pPWhxjg==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr24393409wme.182.1609707135117; 
 Sun, 03 Jan 2021 12:52:15 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id 189sm29798832wma.22.2021.01.03.12.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
Date: Sun,  3 Jan 2021 21:50:09 +0100
Message-Id: <20210103205021.2837760-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <chenhuacai@kernel.org>

As suggested by Philippe Mathieu-Daudé, rework Loongson's liointc:
1, Move macro definitions to loongson_liointc.h;
2, Remove magic values and use macros instead;
3, Replace dead D() code by trace events.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201221110538.3186646-2-chenhuacai@kernel.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
 hw/intc/loongson_liointc.c         | 36 +++++++++++++-----------------
 2 files changed, 38 insertions(+), 20 deletions(-)
 create mode 100644 include/hw/intc/loongson_liointc.h

diff --git a/include/hw/intc/loongson_liointc.h b/include/hw/intc/loongson_liointc.h
new file mode 100644
index 00000000000..848e65eb359
--- /dev/null
+++ b/include/hw/intc/loongson_liointc.h
@@ -0,0 +1,22 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
+ * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ */
+
+#ifndef LOONGSON_LIOINTC_H
+#define LOONGSON_LIOINTC_H
+
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
+DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
+                         TYPE_LOONGSON_LIOINTC)
+
+#endif /* LOONGSON_LIOINTC_H */
diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index fbbfb57ee9c..f823d484e08 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -1,6 +1,7 @@
 /*
  * QEMU Loongson Local I/O interrupt controler.
  *
+ * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
  * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
  *
  * This program is free software: you can redistribute it and/or modify
@@ -19,13 +20,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/sysbus.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
-#include "qom/object.h"
-
-#define D(x)
+#include "hw/intc/loongson_liointc.h"
 
 #define NUM_IRQS                32
 
@@ -40,13 +39,10 @@
 #define R_IEN                   0x24
 #define R_IEN_SET               0x28
 #define R_IEN_CLR               0x2c
-#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
+#define R_ISR_SIZE              0x8
+#define R_START                 0x40
 #define R_END                   0x64
 
-#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
-DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
-                         TYPE_LOONGSON_LIOINTC)
-
 struct loongson_liointc {
     SysBusDevice parent_obj;
 
@@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
         goto out;
     }
 
-    /* Rest is 4 byte */
+    /* Rest are 4 bytes */
     if (size != 4 || (addr % 4)) {
         goto out;
     }
 
-    if (addr >= R_PERCORE_ISR(0) &&
-        addr < R_PERCORE_ISR(NUM_CORES)) {
-        int core = (addr - R_PERCORE_ISR(0)) / 8;
+    if (addr >= R_START && addr < R_END) {
+        int core = (addr - R_START) / R_ISR_SIZE;
         r = p->per_core_isr[core];
         goto out;
     }
@@ -147,7 +142,8 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
     }
 
 out:
-    D(qemu_log("%s: size=%d addr=%lx val=%x\n", __func__, size, addr, r));
+    qemu_log_mask(CPU_LOG_INT, "%s: size=%d, addr=%"HWADDR_PRIx", val=%x\n",
+                  __func__, size, addr, r);
     return r;
 }
 
@@ -158,7 +154,8 @@ liointc_write(void *opaque, hwaddr addr,
     struct loongson_liointc *p = opaque;
     uint32_t value = val64;
 
-    D(qemu_log("%s: size=%d, addr=%lx val=%x\n", __func__, size, addr, value));
+    qemu_log_mask(CPU_LOG_INT, "%s: size=%d, addr=%"HWADDR_PRIx", val=%x\n",
+                  __func__, size, addr, value);
 
     /* Mapper is 1 byte */
     if (size == 1 && addr < R_MAPPER_END) {
@@ -166,14 +163,13 @@ liointc_write(void *opaque, hwaddr addr,
         goto out;
     }
 
-    /* Rest is 4 byte */
+    /* Rest are 4 bytes */
     if (size != 4 || (addr % 4)) {
         goto out;
     }
 
-    if (addr >= R_PERCORE_ISR(0) &&
-        addr < R_PERCORE_ISR(NUM_CORES)) {
-        int core = (addr - R_PERCORE_ISR(0)) / 8;
+    if (addr >= R_START && addr < R_END) {
+        int core = (addr - R_START) / R_ISR_SIZE;
         p->per_core_isr[core] = value;
         goto out;
     }
@@ -224,7 +220,7 @@ static void loongson_liointc_init(Object *obj)
     }
 
     memory_region_init_io(&p->mmio, obj, &pic_ops, p,
-                         "loongson.liointc", R_END);
+                         TYPE_LOONGSON_LIOINTC, R_END);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
 }
 
-- 
2.26.2


