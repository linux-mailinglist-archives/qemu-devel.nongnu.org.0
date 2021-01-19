Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4D2FB634
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:04:18 +0100 (CET)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qgD-0007zX-SL
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qeA-0006Tz-Rx
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:10 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:44249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qe4-0005vV-0K
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:10 -0500
Received: by mail-lf1-x136.google.com with SMTP id m25so28888905lfc.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eF3PdkZp88Dtx8+Gjn51Fph38Ji7ew7FQX7/6hEKv5w=;
 b=hgogRVOcMOo2v1ThHrdeeUdouzs/HmoVUCToY+6k4NxxJfdVIvi8UyZX7vYUDjoF90
 DaTwycskKkrV7oknCI7vH/7SO7cC6JENZc/KIHkjTdV4QfzsVZoYf1kPfxKOByfaO9NT
 1glOQ7QVwAu+j+0VkDfAx6ti1WTSL0U27lhVwuVlQa8v4QA550vVzJ2bc4uqYNmMKMvZ
 DKgoMJM77E8We4o0m8+6HKM/J0RrEI4ILDin8WM2KYdp9gnMjWKnrgQUgAyr1HYEVUgX
 59XUdjaYDzIR1yT2fXIoFkIHsAF1shlhjUBzvMBsFgw8A5ecf1uFccDv5MQ1XRAizKK/
 6TMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eF3PdkZp88Dtx8+Gjn51Fph38Ji7ew7FQX7/6hEKv5w=;
 b=gCAIqXXpenGBRVZ9JBXiRnIvgjWobL5f6iy01ntUY7SpYsZWSglgpBB0al3o+Ccdnr
 ywj+RLdGxW+1HRvmWRR9ZCeWoWDuzZmAwomGJ6mZeWRyR77YarwaWFwlgNgsv6HUDkkb
 Z3V7zFu0A+WiYV89Ga/TVbuD90fQBzwJc4WY/tuBh95+968/NIOIIq9ppkZbZx4xHdRw
 sSTZEaCZFaj0PW9I1UzQLor/WBYaEtuGhM9C5bIj58gXnja/+tUvzKWIM59egYnvbSJ9
 vveX7w4zv87aZtVJe2c1INzExZ/CwHrhTWgjqcFYLuyOLzJvisaE/4GB0x6y1oI/rbaE
 tnOw==
X-Gm-Message-State: AOAM533VKLzWL9sqxH4UJ1Vd7LnByQHxvN0fmwVPoz3VeDxEoATpyp35
 j6Lv5b6Gyw+/GEtzkvnLoukbe4Q1RLyvmA==
X-Google-Smtp-Source: ABdhPJyWp1XqxgL91u7wVZE4Fbm0Ntzy4nSGIKpyiVrJeUvoV2p4NSXoJz2lHlNnGL0iqNHhomEQKw==
X-Received: by 2002:a05:6512:338e:: with SMTP id
 h14mr1856046lfg.324.1611061319068; 
 Tue, 19 Jan 2021 05:01:59 -0800 (PST)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id e25sm2356745lfc.40.2021.01.19.05.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:01:58 -0800 (PST)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	frasse.iglesias@gmail.com
Subject: [RFC PATCH v1 2/3] hw: block: m25p80: Support dummy byte accuracy
Date: Tue, 19 Jan 2021 14:01:54 +0100
Message-Id: <20210119130155.30194-3-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119130155.30194-1-frasse.iglesias@gmail.com>
References: <20210119130155.30194-1-frasse.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, alistair@alistair23.me,
 bin.meng@windriver.com, mreitz@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support to toggle the accuracy in m25p80 between dummy
clock cycle to dummy byte. By being able to do this the SPI controllers
transfering through a txfifo will be able to support commands with dummy
clock cycles.

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
---
 hw/block/m25p80.c | 112 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 92 insertions(+), 20 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 1b3f2405a1..c9342e1842 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -462,6 +462,7 @@ struct Flash {
 
     const FlashPartInfo *pi;
 
+    bool dummy_byte_accuracy;
 };
 
 struct M25P80Class {
@@ -862,26 +863,59 @@ static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
     return num_dummies;
 }
 
+static uint8_t to_dummy_bytes(Flash *s, uint8_t dummy_clk_cycles)
+{
+    uint8_t lines = 1;
+
+    switch (s->cmd_in_progress) {
+    case DOR:
+    case DOR4:
+    case DIOR:
+    case DIOR4:
+        lines = 2;
+        break;
+    case QOR:
+    case QOR4:
+    case QIOR:
+    case QIOR4:
+        lines = 4;
+        break;
+    default:
+        break;
+    }
+
+    if ((dummy_clk_cycles * lines) % 8) {
+        qemu_log_mask(LOG_UNIMP, "M25P80: Non multiple of 8 number of dummy"
+                     " clock cycles while operating with dummy byte"
+                     " accuracy\n");
+    }
+
+    return (dummy_clk_cycles * lines) / 8;
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
+    uint8_t dummy_clk_cycles = 0;
+    uint8_t extra_bytes;
+
     s->needed_bytes = get_addr_length(s);
     switch (get_man(s)) {
     /* Dummy cycles - modeled with bytes writes instead of bits */
     case MAN_WINBOND:
-        s->needed_bytes += 8;
+        dummy_clk_cycles = 8;
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
+        dummy_clk_cycles = numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         if (extract32(s->volatile_cfg, 6, 2) == 1) {
-            s->needed_bytes += 6;
+            dummy_clk_cycles = 6;
         } else {
-            s->needed_bytes += 8;
+            dummy_clk_cycles = 8;
         }
         break;
     case MAN_SPANSION:
-        s->needed_bytes += extract32(s->spansion_cr2v,
+        dummy_clk_cycles = extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
                                     );
@@ -889,6 +923,14 @@ static void decode_fast_read_cmd(Flash *s)
     default:
         break;
     }
+
+    if (s->dummy_byte_accuracy) {
+        extra_bytes = to_dummy_bytes(s, dummy_clk_cycles);
+    } else {
+        extra_bytes = dummy_clk_cycles;
+    }
+
+    s->needed_bytes += extra_bytes;
     s->pos = 0;
     s->len = 0;
     s->state = STATE_COLLECTING_DATA;
@@ -896,38 +938,49 @@ static void decode_fast_read_cmd(Flash *s)
 
 static void decode_dio_read_cmd(Flash *s)
 {
+    uint8_t dummy_clk_cycles = 0;
+    uint8_t extra_bytes;
+
     s->needed_bytes = get_addr_length(s);
     /* Dummy cycles modeled with bytes writes instead of bits */
     switch (get_man(s)) {
     case MAN_WINBOND:
-        s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
+        dummy_clk_cycles = WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
         break;
     case MAN_SPANSION:
-        s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
-        s->needed_bytes += extract32(s->spansion_cr2v,
+        dummy_clk_cycles = SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
+        dummy_clk_cycles = extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
                                     );
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
+        dummy_clk_cycles = numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
         case 1:
-            s->needed_bytes += 6;
+            dummy_clk_cycles = 6;
             break;
         case 2:
-            s->needed_bytes += 8;
+            dummy_clk_cycles = 8;
             break;
         default:
-            s->needed_bytes += 4;
+            dummy_clk_cycles = 4;
             break;
         }
         break;
     default:
         break;
     }
+
+    if (s->dummy_byte_accuracy) {
+        extra_bytes = to_dummy_bytes(s, dummy_clk_cycles);
+    } else {
+        extra_bytes = dummy_clk_cycles;
+    }
+
+    s->needed_bytes += extra_bytes;
     s->pos = 0;
     s->len = 0;
     s->state = STATE_COLLECTING_DATA;
@@ -935,39 +988,50 @@ static void decode_dio_read_cmd(Flash *s)
 
 static void decode_qio_read_cmd(Flash *s)
 {
+    uint8_t dummy_clk_cycles = 0;
+    uint8_t extra_bytes;
+
     s->needed_bytes = get_addr_length(s);
     /* Dummy cycles modeled with bytes writes instead of bits */
     switch (get_man(s)) {
     case MAN_WINBOND:
-        s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
-        s->needed_bytes += 4;
+        dummy_clk_cycles = WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
+        dummy_clk_cycles += 4;
         break;
     case MAN_SPANSION:
-        s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
-        s->needed_bytes += extract32(s->spansion_cr2v,
+        dummy_clk_cycles = SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
+        dummy_clk_cycles += extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
                                     );
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
+        dummy_clk_cycles = numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
         case 1:
-            s->needed_bytes += 4;
+            dummy_clk_cycles = 4;
             break;
         case 2:
-            s->needed_bytes += 8;
+            dummy_clk_cycles = 8;
             break;
         default:
-            s->needed_bytes += 6;
+            dummy_clk_cycles = 6;
             break;
         }
         break;
     default:
         break;
     }
+
+    if (s->dummy_byte_accuracy) {
+        extra_bytes = to_dummy_bytes(s, dummy_clk_cycles);
+    } else {
+        extra_bytes = dummy_clk_cycles;
+    }
+
+    s->needed_bytes += extra_bytes;
     s->pos = 0;
     s->len = 0;
     s->state = STATE_COLLECTING_DATA;
@@ -1291,6 +1355,13 @@ static int m25p80_cs(SSIPeripheral *ss, bool select)
     return 0;
 }
 
+static void m25p80_dummy_byte_accuracy(SSIPeripheral *ss, bool val)
+{
+    Flash *s = M25P80(ss);
+
+    s->dummy_byte_accuracy = val;
+}
+
 static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
 {
     Flash *s = M25P80(ss);
@@ -1494,6 +1565,7 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
     k->transfer = m25p80_transfer8;
     k->set_cs = m25p80_cs;
     k->cs_polarity = SSI_CS_LOW;
+    k->set_dummy_byte_accuracy = m25p80_dummy_byte_accuracy;
     dc->vmsd = &vmstate_m25p80;
     device_class_set_props(dc, m25p80_properties);
     dc->reset = m25p80_reset;
-- 
2.20.1


