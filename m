Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8342DAEE1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:26:59 +0100 (CET)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBI2-0002zc-JI
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4k-0001ds-Pv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4Z-0007Bo-DC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id x22so17002724wmc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iwN8xvm/zL8pYcvIAxnIOen7Kx3k9vmW7ZQu1bw5NlI=;
 b=yywqEv8xhprbUlYnT0+imlSo14RDDjO/vsg/e5jvv3f8nPT00ynir02DAaphNXW3N7
 uYND73nbL5ydi57A3atqU7OkAN9DO6FYQ45XVAh12uGjWWMi6DBIuU4yArDOlsC9Ts1p
 gyBeAe6xG+3UoN0+5h/RnDDfch7fdpBXDg1VUOt0wQg6zqERSVff6EQtcm4jkSJ5HkwO
 oK8DVl+aOFudlNUQeG7gRFYcuPVX389izbsFS0uFX01oULoqt0YSRCgtcWV5jqqdDuIy
 L43CmyuuS6uxn4mQdh3daXdAdWuzEk60Aor9aZsgFaspYHO6Xv3e8qd+6PWoFD3XDILM
 yTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwN8xvm/zL8pYcvIAxnIOen7Kx3k9vmW7ZQu1bw5NlI=;
 b=j9HCJUSlJFGGHiGfOkYsAzTrHlv0wXikQRTBJziaDBI9IoJxvah4CQ4kHEDH9HAiZb
 BfGs52HGGI3HyBimCiNNydQLEwDhbII6kMJ3VXJ2KsCiHmbBk13n7W6mMMTEKNzSPtnb
 hdG2b2eO+UVjJfcz9hZ+2tJkVISe3Xz8h1Qn44xiCMOpRrSDpm1TVbdD7S0DnQCuYu0C
 ZNC7z2+xV4xY+SZSw5UGURhfXDt/Si9SwBHq0XW5zvlEd2PWwPQ0kSiJES2rikZnzeKp
 8n5GkAusssLOOsBoh9wpjSaI3rMcgbFc0eg4Y/0rDapcJQu1SnMJ8kGU4ji4m7ywGGm2
 qObw==
X-Gm-Message-State: AOAM530XqvsCRETWVPs8siSUiENQ9YvkOcsO5oBfLLXDXzM3oUZOUO2A
 LXFrdFXvetknxsMTiBIjepGx0xfq3u88mg==
X-Google-Smtp-Source: ABdhPJzuEF8O5xfrG/lHonMYjEK4RQCzk9OPN80G7g6x/CFbQ/fFbTdY5gNFqbLexyk07jOGE5bRaA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr32066096wmi.20.1608041581415; 
 Tue, 15 Dec 2020 06:13:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.13.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:13:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] hw/block/m25p80: Check SPI mode before running some
 Numonyx commands
Date: Tue, 15 Dec 2020 14:12:36 +0000
Message-Id: <20201215141237.17868-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Joe Komlodi <joe.komlodi@xilinx.com>

Some Numonyx flash commands cannot be executed in DIO and QIO mode, such as
trying to do DPP or DOR when in QIO mode.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Message-id: 1605568264-26376-4-git-send-email-komlodi@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 114 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 95 insertions(+), 19 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 7e1d56442f3..f1d7da65c85 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -413,6 +413,12 @@ typedef enum {
     MAN_GENERIC,
 } Manufacturer;
 
+typedef enum {
+    MODE_STD = 0,
+    MODE_DIO = 1,
+    MODE_QIO = 2
+} SPIMode;
+
 #define M25P80_INTERNAL_DATA_BUFFER_SZ 16
 
 struct Flash {
@@ -820,6 +826,17 @@ static void reset_memory(Flash *s)
     trace_m25p80_reset_done(s);
 }
 
+static uint8_t numonyx_mode(Flash *s)
+{
+    if (!(s->enh_volatile_cfg & EVCFG_QUAD_IO_DISABLED)) {
+        return MODE_QIO;
+    } else if (!(s->enh_volatile_cfg & EVCFG_DUAL_IO_DISABLED)) {
+        return MODE_DIO;
+    } else {
+        return MODE_STD;
+    }
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
@@ -950,14 +967,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case ERASE4_32K:
     case ERASE_SECTOR:
     case ERASE4_SECTOR:
-    case READ:
-    case READ4:
-    case DPP:
-    case QPP:
-    case QPP_4:
     case PP:
     case PP4:
-    case PP4_4:
     case DIE_ERASE:
     case RDID_90:
     case RDID_AB:
@@ -966,24 +977,84 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->len = 0;
         s->state = STATE_COLLECTING_DATA;
         break;
+    case READ:
+    case READ4:
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
+            s->needed_bytes = get_addr_length(s);
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO or QIO mode\n", s->cmd_in_progress);
+        }
+        break;
+    case DPP:
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
+            s->needed_bytes = get_addr_length(s);
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
+        break;
+    case QPP:
+    case QPP_4:
+    case PP4_4:
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
+            s->needed_bytes = get_addr_length(s);
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
+        break;
 
     case FAST_READ:
     case FAST_READ4:
+        decode_fast_read_cmd(s);
+        break;
     case DOR:
     case DOR4:
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
+        break;
     case QOR:
     case QOR4:
-        decode_fast_read_cmd(s);
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case DIOR:
     case DIOR4:
-        decode_dio_read_cmd(s);
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
+            decode_dio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case QIOR:
     case QIOR4:
-        decode_qio_read_cmd(s);
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
+            decode_qio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case WRSR:
@@ -1035,17 +1106,22 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case JEDEC_READ:
-        trace_m25p80_populated_jedec(s);
-        for (i = 0; i < s->pi->id_len; i++) {
-            s->data[i] = s->pi->id[i];
-        }
-        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
-            s->data[i] = 0;
-        }
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
+            trace_m25p80_populated_jedec(s);
+            for (i = 0; i < s->pi->id_len; i++) {
+                s->data[i] = s->pi->id[i];
+            }
+            for (; i < SPI_NOR_MAX_ID_LEN; i++) {
+                s->data[i] = 0;
+            }
 
-        s->len = SPI_NOR_MAX_ID_LEN;
-        s->pos = 0;
-        s->state = STATE_READING_DATA;
+            s->len = SPI_NOR_MAX_ID_LEN;
+            s->pos = 0;
+            s->state = STATE_READING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute JEDEC read "
+                          "in DIO or QIO mode\n");
+        }
         break;
 
     case RDCR:
-- 
2.20.1


