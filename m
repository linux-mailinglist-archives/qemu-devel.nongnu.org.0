Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E4626C19
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 22:55:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otySN-00060b-Dr; Sat, 12 Nov 2022 16:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1otyNK-0003jJ-UG; Sat, 12 Nov 2022 16:49:19 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1otyNI-0004VO-Vz; Sat, 12 Nov 2022 16:49:18 -0500
Received: by mail-lf1-x136.google.com with SMTP id b3so13453195lfv.2;
 Sat, 12 Nov 2022 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S02TEjm/GNmKagyXn2JhGIZKxmhzbozJizt32g80yec=;
 b=HRVT02FJqjGYFuhDxJebzEiT+ptV7UaOXWPPKWNSzG3b90U61iBqLnyJ3c66gZ719b
 Lsam2ZMfWB+c0vImeFrM/qb3h39bUnt6cOBVRdD58j66cwkFWYvpbIDv5pYUaESYkK3u
 WRLInkxLj+ofQi21XfF1qREB5eb8x6EV+vrOA8GImToxu9uUc56UBPEt45btrm28sQaI
 hrXC2rIaDRgiEZpvNYEBQAXpd3qoI1nkLKtgCY1HYlP0315RlmWVNKSD+x5Jxb2JE1j8
 S96d/1YQqhJEfIMaDEdFns7qjBh4XG6nSWtxLbQFQyGqPFD88uRuCcrIUsL94aDS8xUM
 UyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S02TEjm/GNmKagyXn2JhGIZKxmhzbozJizt32g80yec=;
 b=GXI+Cw9q2sUq3qaVlhrX9zAOJYURQPP3nG1TqwSFmKeAXcM+45wpcJQ5qqY5LiH6VX
 3h9z9Gx4jsYd7TuClYa91QecuGcSyRParKnkaVN1KVWUIxngqN4cpR+VriQh3/ixfuS4
 0kPYo3MZaXwKxPKy44meZrI40kWiUGd0+JOCHygcVghBtTrc1nvyCK0vSEBj7W/cNPvD
 X73qlTSQgeQZQRMl+tb8OQOlEGLHjBRJ2LqC0qxt4kCQCZpyTwoOKPDqlbjfgQkHU5dy
 wAmhmBybmqQU26A7CEsNBh/99F73aiCz2cv2jfSuHSNpTOtJMs2hvovJXD/bBewLTgY8
 l1Hw==
X-Gm-Message-State: ANoB5pkFqS06nVUdErd+Zv0QVH+5koBJDkbCPTlcbqM4OBFKjz1FBwb2
 o71M2GURUIF8u6D8Fg3BGo7qY9XeztLAJXWgbT0=
X-Google-Smtp-Source: AA0mqf7+dAR7lrXTmbgJlwtHxZkXM+UO7mQDRl68/DzlQNzGSXdghJFkwYdHEykK0mLFl2fdXn7xKQ==
X-Received: by 2002:a05:6512:3a96:b0:4a2:2bac:e4fb with SMTP id
 q22-20020a0565123a9600b004a22bace4fbmr2835071lfu.297.1668289752362; 
 Sat, 12 Nov 2022 13:49:12 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 p11-20020a2ea4cb000000b002770473d813sm1083435ljm.140.2022.11.12.13.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 13:49:11 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
Date: Sat, 12 Nov 2022 22:49:00 +0100
Message-Id: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Nov 2022 16:54:29 -0500
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

Trying to run U-Boot for Cubieboard (Allwinner A10) fails because it cannot
access SD card. The problem is that FIFO register in current
allwinner-sdhost implementation is at the address corresponding to
Allwinner H3, but not A10.
Linux kernel is not affected since Linux driver uses DMA access and does
not use FIFO register for reading/writing.

This patch adds new class parameter `is_sun4i` and based on that
parameter uses register at offset 0x100 either as FIFO register (if
sun4i) or as threshold register (if not sun4i; in this case register at
0x200 is FIFO register).

Tested with U-Boot and Linux kernel image built for Cubieboard and
OrangePi PC.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/sd/allwinner-sdhost.c         | 67 ++++++++++++++++++++++----------
 include/hw/sd/allwinner-sdhost.h |  1 +
 2 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 455d6eabf6..51e5e90830 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -65,7 +65,7 @@ enum {
     REG_SD_DLBA       = 0x84,  /* Descriptor List Base Address */
     REG_SD_IDST       = 0x88,  /* Internal DMA Controller Status */
     REG_SD_IDIE       = 0x8C,  /* Internal DMA Controller IRQ Enable */
-    REG_SD_THLDC      = 0x100, /* Card Threshold Control */
+    REG_SD_THLDC      = 0x100, /* Card Threshold Control / FIFO (sun4i only)*/
     REG_SD_DSBD       = 0x10C, /* eMMC DDR Start Bit Detection Control */
     REG_SD_RES_CRC    = 0x110, /* Response CRC from card/eMMC */
     REG_SD_DATA7_CRC  = 0x114, /* CRC Data 7 from card/eMMC */
@@ -415,10 +415,29 @@ static void allwinner_sdhost_dma(AwSdHostState *s)
     }
 }
 
+static uint32_t allwinner_sdhost_fifo_read(AwSdHostState *s)
+{
+    uint32_t res = 0;
+
+    if (sdbus_data_ready(&s->sdbus)) {
+        sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
+        le32_to_cpus(&res);
+        allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
+        allwinner_sdhost_auto_stop(s);
+        allwinner_sdhost_update_irq(s);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
+                      __func__);
+    }
+
+    return res;
+}
+
 static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
                                       unsigned size)
 {
     AwSdHostState *s = AW_SDHOST(opaque);
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
     uint32_t res = 0;
 
     switch (offset) {
@@ -508,8 +527,12 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
     case REG_SD_IDIE:      /* Internal DMA Controller Interrupt Enable */
         res = s->dmac_irq;
         break;
-    case REG_SD_THLDC:     /* Card Threshold Control */
-        res = s->card_threshold;
+    case REG_SD_THLDC:     /* Card Threshold Control or FIFO register (sun4i) */
+        if (sc->is_sun4i) {
+            res = allwinner_sdhost_fifo_read(s);
+        } else {
+            res = s->card_threshold;
+        }
         break;
     case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
         res = s->startbit_detect;
@@ -531,16 +554,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
         res = s->status_crc;
         break;
     case REG_SD_FIFO:      /* Read/Write FIFO */
-        if (sdbus_data_ready(&s->sdbus)) {
-            sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
-            le32_to_cpus(&res);
-            allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
-            allwinner_sdhost_auto_stop(s);
-            allwinner_sdhost_update_irq(s);
-        } else {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
-                          __func__);
-        }
+        res = allwinner_sdhost_fifo_read(s);
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
@@ -553,11 +567,20 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
     return res;
 }
 
+static void allwinner_sdhost_fifo_write(AwSdHostState *s, uint64_t value)
+{
+    uint32_t u32 = cpu_to_le32(value);
+    sdbus_write_data(&s->sdbus, &u32, sizeof(u32));
+    allwinner_sdhost_update_transfer_cnt(s, sizeof(u32));
+    allwinner_sdhost_auto_stop(s);
+    allwinner_sdhost_update_irq(s);
+}
+
 static void allwinner_sdhost_write(void *opaque, hwaddr offset,
                                    uint64_t value, unsigned size)
 {
     AwSdHostState *s = AW_SDHOST(opaque);
-    uint32_t u32;
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
 
     trace_allwinner_sdhost_write(offset, value, size);
 
@@ -657,18 +680,18 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
         s->dmac_irq = value;
         allwinner_sdhost_update_irq(s);
         break;
-    case REG_SD_THLDC:     /* Card Threshold Control */
-        s->card_threshold = value;
+    case REG_SD_THLDC:     /* Card Threshold Control or FIFO (sun4i) */
+        if (sc->is_sun4i) {
+            allwinner_sdhost_fifo_write(s, value);
+        } else {
+            s->card_threshold = value;
+        }
         break;
     case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
         s->startbit_detect = value;
         break;
     case REG_SD_FIFO:      /* Read/Write FIFO */
-        u32 = cpu_to_le32(value);
-        sdbus_write_data(&s->sdbus, &u32, sizeof(u32));
-        allwinner_sdhost_update_transfer_cnt(s, sizeof(u32));
-        allwinner_sdhost_auto_stop(s);
-        allwinner_sdhost_update_irq(s);
+        allwinner_sdhost_fifo_write(s, value);
         break;
     case REG_SD_RES_CRC:   /* Response CRC from card/eMMC */
     case REG_SD_DATA7_CRC: /* CRC Data 7 from card/eMMC */
@@ -834,12 +857,14 @@ static void allwinner_sdhost_sun4i_class_init(ObjectClass *klass, void *data)
 {
     AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
     sc->max_desc_size = 8 * KiB;
+    sc->is_sun4i = true;
 }
 
 static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
 {
     AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
     sc->max_desc_size = 64 * KiB;
+    sc->is_sun4i = false;
 }
 
 static const TypeInfo allwinner_sdhost_info = {
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index bfe08ff4ef..30c1e60404 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -130,6 +130,7 @@ struct AwSdHostClass {
 
     /** Maximum buffer size in bytes per DMA descriptor */
     size_t max_desc_size;
+    bool   is_sun4i;
 
 };
 
-- 
2.30.2


