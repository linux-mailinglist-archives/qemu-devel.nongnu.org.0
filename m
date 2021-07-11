Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8E3C3F7F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:22:07 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gtq-0002KK-E7
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaM-0008QZ-5f
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaK-0001Qw-5A
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id j34so9956020wms.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BW43eT/YMTWZC1AYauXSkubmTZfnC0cY3WoLVD92V9o=;
 b=ECqtBqINf0ah4Hbft1204RzjL12mu+Warltr+rrKq0dTas5d4alELSFP9D1nv7t6T0
 LuXxCItKuGDxyU2dgGYaWKId8DPD+lSD3QyM563L9xL5z0aI1yFfCUl8STtF8Asc9Z3b
 swAfdHHbEWXrKEKqdb63A4UmJUv/ISHsswBjpXoeuG21bcblrVAa5iMP4lG3fensPbxr
 f6vEU6Cry4gb66G7TJcUBUeppBzZoTz9jN9NC94nziKigA4VvocT8838WapI0trwo6oU
 T92rPvHr0JBadYuaRcFqvN556uAqKUEjaIUZouxzXV02KU7PLxGuoEGdc/eL/koZkSap
 PX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BW43eT/YMTWZC1AYauXSkubmTZfnC0cY3WoLVD92V9o=;
 b=oRantbVTsHPtiGPdKvqNUWNK6oiKnKidY9YoHlUJjRn85aaDOXeX6IJ/fzuZAOEH3Y
 o8YSCBUgp0MbhZpIjX0UWMb5SFWLhRnBKedRqB1kOXNQFBgzF5xAFFPbuxAXBj6svry8
 7iheSt8hX6t7qh0udINB1KOgjiDd7VaBVWPQEl3FxZLSpk2Hj31S8pabv/ruM642aGOc
 fNg1ig3pKN7tqLZk9hEV1GV/Sy/hBsOPM2OOkbXC7UUEHijW+5EIIsvMSqMM3GTOBO70
 AqFB5ArMrreTSppqkj9cbF/8Unz/9Un/FqJLNPPbadNpPrtO7PjQQvR5+KLkvudGjbJ5
 Q8uA==
X-Gm-Message-State: AOAM531+PNB2BBUBrhhTWsmUZTVPNnm+pja+r4OCAIbQmBQSuJX6fMxF
 nDTtzZtpUozlq1FxlZQC9wp79bi6JJNDH/6b
X-Google-Smtp-Source: ABdhPJw5NK6N3d0unrphjnemYLufhR3zDsRHdysR8pEtDzuKw3HIbikGnlC2dPXLrmBUp5SD7Dw5WQ==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr52018513wmb.60.1626037314771; 
 Sun, 11 Jul 2021 14:01:54 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f22sm10739013wmb.46.2021.07.11.14.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
Date: Sun, 11 Jul 2021 23:00:15 +0200
Message-Id: <20210711210016.2710100-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing N registers via a single address_space API
call using a temporary buffer (stored in the device state) and
updating each register, move the address_space call in the
register put/get. The load/store and word size checks are moved
to put/get too. This simplifies a bit, making the code easier
to read.

Co-developed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-8-f4bug@amsat.org>
---
 hw/net/dp8393x.c | 160 +++++++++++++++++++----------------------------
 1 file changed, 63 insertions(+), 97 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 283de9db0bf..4057a263de3 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -163,7 +163,6 @@ struct dp8393xState {
 
     /* Temporaries */
     uint8_t tx_buffer[0x10000];
-    uint16_t data[12];
     int loopback_packet;
 
     /* Memory access */
@@ -220,34 +219,48 @@ static uint32_t dp8393x_wt(dp8393xState *s)
     return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
 }
 
-static uint16_t dp8393x_get(dp8393xState *s, int width, int offset)
+static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, int offset)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint16_t val;
 
-    if (s->big_endian) {
-        val = be16_to_cpu(s->data[offset * width + width - 1]);
+    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+        addr += offset << 2;
+        if (s->big_endian) {
+            val = address_space_ldl_be(&s->as, addr, attrs, NULL);
+        } else {
+            val = address_space_ldl_le(&s->as, addr, attrs, NULL);
+        }
     } else {
-        val = le16_to_cpu(s->data[offset * width]);
+        addr += offset << 1;
+        if (s->big_endian) {
+            val = address_space_lduw_be(&s->as, addr, attrs, NULL);
+        } else {
+            val = address_space_lduw_le(&s->as, addr, attrs, NULL);
+        }
     }
+
     return val;
 }
 
-static void dp8393x_put(dp8393xState *s, int width, int offset,
-                        uint16_t val)
+static void dp8393x_put(dp8393xState *s,
+                        hwaddr addr, int offset, uint16_t val)
 {
-    if (s->big_endian) {
-        if (width == 2) {
-            s->data[offset * 2] = 0;
-            s->data[offset * 2 + 1] = cpu_to_be16(val);
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
+    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+        addr += offset << 2;
+        if (s->big_endian) {
+            address_space_stl_be(&s->as, addr, val, attrs, NULL);
         } else {
-            s->data[offset] = cpu_to_be16(val);
+            address_space_stl_le(&s->as, addr, val, attrs, NULL);
         }
     } else {
-        if (width == 2) {
-            s->data[offset * 2] = cpu_to_le16(val);
-            s->data[offset * 2 + 1] = 0;
+        addr += offset << 1;
+        if (s->big_endian) {
+            address_space_stw_be(&s->as, addr, val, attrs, NULL);
         } else {
-            s->data[offset] = cpu_to_le16(val);
+            address_space_stw_le(&s->as, addr, val, attrs, NULL);
         }
     }
 }
@@ -278,12 +291,10 @@ static void dp8393x_do_load_cam(dp8393xState *s)
 
     while (s->regs[SONIC_CDC] & 0x1f) {
         /* Fill current entry */
-        address_space_read(&s->as, dp8393x_cdp(s),
-                           MEMTXATTRS_UNSPECIFIED, s->data, size);
-        index = dp8393x_get(s, width, 0) & 0xf;
-        s->cam[index][0] = dp8393x_get(s, width, 1);
-        s->cam[index][1] = dp8393x_get(s, width, 2);
-        s->cam[index][2] = dp8393x_get(s, width, 3);
+        index = dp8393x_get(s, dp8393x_cdp(s), 0) & 0xf;
+        s->cam[index][0] = dp8393x_get(s, dp8393x_cdp(s), 1);
+        s->cam[index][1] = dp8393x_get(s, dp8393x_cdp(s), 2);
+        s->cam[index][2] = dp8393x_get(s, dp8393x_cdp(s), 3);
         trace_dp8393x_load_cam(index,
                                s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
                                s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
@@ -294,9 +305,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
     }
 
     /* Read CAM enable */
-    address_space_read(&s->as, dp8393x_cdp(s),
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
-    s->regs[SONIC_CE] = dp8393x_get(s, width, 0);
+    s->regs[SONIC_CE] = dp8393x_get(s, dp8393x_cdp(s), 0);
     trace_dp8393x_load_cam_done(s->regs[SONIC_CE]);
 
     /* Done */
@@ -312,14 +321,12 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     /* Read memory */
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
-    address_space_read(&s->as, dp8393x_rrp(s),
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
 
     /* Update SONIC registers */
-    s->regs[SONIC_CRBA0] = dp8393x_get(s, width, 0);
-    s->regs[SONIC_CRBA1] = dp8393x_get(s, width, 1);
-    s->regs[SONIC_RBWC0] = dp8393x_get(s, width, 2);
-    s->regs[SONIC_RBWC1] = dp8393x_get(s, width, 3);
+    s->regs[SONIC_CRBA0] = dp8393x_get(s, dp8393x_rrp(s), 0);
+    s->regs[SONIC_CRBA1] = dp8393x_get(s, dp8393x_rrp(s), 1);
+    s->regs[SONIC_RBWC0] = dp8393x_get(s, dp8393x_rrp(s), 2);
+    s->regs[SONIC_RBWC1] = dp8393x_get(s, dp8393x_rrp(s), 3);
     trace_dp8393x_read_rra_regs(s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
                                 s->regs[SONIC_RBWC0], s->regs[SONIC_RBWC1]);
 
@@ -415,28 +422,22 @@ static void dp8393x_do_receiver_disable(dp8393xState *s)
 static void dp8393x_do_transmit_packets(dp8393xState *s)
 {
     NetClientState *nc = qemu_get_queue(s->nic);
-    int width, size;
     int tx_len, len;
     uint16_t i;
 
-    width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
-
     while (1) {
         /* Read memory */
-        size = sizeof(uint16_t) * 6 * width;
         s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
         trace_dp8393x_transmit_packet(dp8393x_ttda(s));
-        address_space_read(&s->as, dp8393x_ttda(s) + sizeof(uint16_t) * width,
-                           MEMTXATTRS_UNSPECIFIED, s->data, size);
         tx_len = 0;
 
         /* Update registers */
-        s->regs[SONIC_TCR] = dp8393x_get(s, width, 0) & 0xf000;
-        s->regs[SONIC_TPS] = dp8393x_get(s, width, 1);
-        s->regs[SONIC_TFC] = dp8393x_get(s, width, 2);
-        s->regs[SONIC_TSA0] = dp8393x_get(s, width, 3);
-        s->regs[SONIC_TSA1] = dp8393x_get(s, width, 4);
-        s->regs[SONIC_TFS] = dp8393x_get(s, width, 5);
+        s->regs[SONIC_TCR] = dp8393x_get(s, dp8393x_ttda(s), 1) & 0xf000;
+        s->regs[SONIC_TPS] = dp8393x_get(s, dp8393x_ttda(s), 2);
+        s->regs[SONIC_TFC] = dp8393x_get(s, dp8393x_ttda(s), 3);
+        s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s), 4);
+        s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s), 5);
+        s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s), 6);
 
         /* Handle programmable interrupt */
         if (s->regs[SONIC_TCR] & SONIC_TCR_PINT) {
@@ -458,15 +459,12 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
             i++;
             if (i != s->regs[SONIC_TFC]) {
                 /* Read next fragment details */
-                size = sizeof(uint16_t) * 3 * width;
-                address_space_read(&s->as,
-                                   dp8393x_ttda(s)
-                                   + sizeof(uint16_t) * width * (4 + 3 * i),
-                                   MEMTXATTRS_UNSPECIFIED, s->data,
-                                   size);
-                s->regs[SONIC_TSA0] = dp8393x_get(s, width, 0);
-                s->regs[SONIC_TSA1] = dp8393x_get(s, width, 1);
-                s->regs[SONIC_TFS] = dp8393x_get(s, width, 2);
+                s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s),
+                                                  4 + 3 * i);
+                s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s),
+                                                  5 + 3 * i);
+                s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s),
+                                                 6 + 3 * i);
             }
         }
 
@@ -499,22 +497,12 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         s->regs[SONIC_TCR] |= SONIC_TCR_PTX;
 
         /* Write status */
-        dp8393x_put(s, width, 0,
-                    s->regs[SONIC_TCR] & 0x0fff); /* status */
-        size = sizeof(uint16_t) * width;
-        address_space_write(&s->as, dp8393x_ttda(s),
-                            MEMTXATTRS_UNSPECIFIED, s->data, size);
+        dp8393x_put(s, dp8393x_ttda(s), 0, s->regs[SONIC_TCR] & 0x0fff);
 
         if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
             /* Read footer of packet */
-            size = sizeof(uint16_t) * width;
-            address_space_read(&s->as,
-                               dp8393x_ttda(s)
-                               + sizeof(uint16_t) * width
-                                 * (4 + 3 * s->regs[SONIC_TFC]),
-                               MEMTXATTRS_UNSPECIFIED, s->data,
-                               size);
-            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
+            s->regs[SONIC_CTDA] = dp8393x_get(s, dp8393x_ttda(s),
+                                              4 + 3 * s->regs[SONIC_TFC]);
             if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
                 /* EOL detected */
                 break;
@@ -762,7 +750,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     dp8393xState *s = qemu_get_nic_opaque(nc);
     int packet_type;
     uint32_t available, address;
-    int width, rx_len, padded_len;
+    int rx_len, padded_len;
     uint32_t checksum;
     int size;
 
@@ -775,10 +763,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
 
     rx_len = pkt_size + sizeof(checksum);
     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
-        width = 2;
         padded_len = ((rx_len - 1) | 3) + 1;
     } else {
-        width = 1;
         padded_len = ((rx_len - 1) | 1) + 1;
     }
 
@@ -799,11 +785,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     /* Check for EOL */
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* Are we still in resource exhaustion? */
-        size = sizeof(uint16_t) * 1 * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
-        address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                           s->data, size);
-        s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+        s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
         if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
             /* Still EOL ; stop reception */
             return -1;
@@ -811,11 +793,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         /* Link has been updated by host */
 
         /* Clear in_use */
-        size = sizeof(uint16_t) * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        dp8393x_put(s, width, 0, 0);
-        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                            s->data, size);
+        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
@@ -869,32 +847,20 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
 
     /* Write status to memory */
     trace_dp8393x_receive_write_status(dp8393x_crda(s));
-    dp8393x_put(s, width, 0, s->regs[SONIC_RCR]); /* status */
-    dp8393x_put(s, width, 1, rx_len); /* byte count */
-    dp8393x_put(s, width, 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
-    dp8393x_put(s, width, 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
-    dp8393x_put(s, width, 4, s->regs[SONIC_RSC]); /* seq_no */
-    size = sizeof(uint16_t) * 5 * width;
-    address_space_write(&s->as, dp8393x_crda(s),
-                        MEMTXATTRS_UNSPECIFIED,
-                        s->data, size);
+    dp8393x_put(s, dp8393x_crda(s), 0, s->regs[SONIC_RCR]); /* status */
+    dp8393x_put(s, dp8393x_crda(s), 1, rx_len); /* byte count */
+    dp8393x_put(s, dp8393x_crda(s), 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
+    dp8393x_put(s, dp8393x_crda(s), 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
+    dp8393x_put(s, dp8393x_crda(s), 4, s->regs[SONIC_RSC]); /* seq_no */
 
     /* Check link field */
-    size = sizeof(uint16_t) * width;
-    address_space_read(&s->as,
-                       dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
-    s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+    s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* EOL detected */
         s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
     } else {
         /* Clear in_use */
-        size = sizeof(uint16_t) * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        dp8393x_put(s, width, 0, 0);
-        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                            s->data, size);
+        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
-- 
2.31.1


