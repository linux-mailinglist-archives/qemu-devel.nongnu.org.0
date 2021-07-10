Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795803C35FB
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:57:02 +0200 (CEST)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HDp-0003Yt-Hk
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7Y-0006bA-MC
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7W-0001K1-OE
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so17237164wri.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpejGWoz5Nmfd87EjGAxFcydJ+NMlbDRUhwnif2uZFA=;
 b=JPC2FjB6u3xg2xnMJxiN8yVOA+Ax4QSWVn3VTzvt7vq3OqzsLp9N/yGTopoqWI/lO/
 fxnO7YyI0fbEvKIqRPg4K5M69wYX0pEHwMc2oOJK7qyqUlCFSnAXTH2va/cFHvQOKLj0
 q2+dt96VP2K7lbh87/7q4mec7euNogVdQC0zlL+9iKeV/flfeyfSmL9RpphRE76BN/im
 GE1y27Mfg0JeEeOPR3re4cDt0VBrRA+/sMeQxMb7kpjacfxNJ39jaaRsnOwmOTpL1mOU
 9pzyhu1VCmBL+ue/epWCHzew9ryZpU675DmSB+hqlQvn3ZdrogUdFQNp4pfr7/Zt4Qx4
 /PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fpejGWoz5Nmfd87EjGAxFcydJ+NMlbDRUhwnif2uZFA=;
 b=PV9C34SIIJ9XI+FEtwXwCiWKoF6iG6axcBdM7XdDJlWTiyAzjM77JiHHj4UJ6a2wyx
 En6D0rFtmhitGTqVvF+qlvrOB4a+KWtotRA4cY8lB3zAkNvBkgEYkIUPU4VIyOKOyDde
 jmTTsAw8/DdgQLI+6t4Xp1w8yd5YKuaqlfx0ZuF3h1+MkgDPLLbW2Fa6oy/ziENTfobJ
 YWZ/TkpVjJMD7Kn+3va4Qxre4ddNn2S3v6lssHKIsZqJACYnUAjm+h29ueW12Vj3EjlU
 +Hd90Uz0XXTWxl1lTPHb9IsaSCnyrsUkMrLk5vEc2qSIh3FJGTMKJmsf4Tlw7REgVeaw
 lUDA==
X-Gm-Message-State: AOAM532satc5R9kTSf+g2mEnb8RmhO2AyJymvjNdHwr5C01zwL2gtDYC
 3u4veCW+pkcBHvF7PUj+e9HxOxV9ZSjPeg==
X-Google-Smtp-Source: ABdhPJw+53icMTa+wpdA8ZutG87A+aNjv8BbSKnNfQ+ouOrAmbjJFA6v5oI/ywY2odSaPA8cSo+DUg==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr24865434wru.196.1625939429212; 
 Sat, 10 Jul 2021 10:50:29 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm7828247wmc.0.2021.07.10.10.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH v3 7/8] dp8393x: Rewrite dp8393x_get() /
 dp8393x_put()
Date: Sat, 10 Jul 2021 19:49:53 +0200
Message-Id: <20210710174954.2577195-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
---
Missing:
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 160 +++++++++++++++++++----------------------------
 1 file changed, 63 insertions(+), 97 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index ac93412f70b..a9224a5bc88 100644
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
@@ -874,32 +852,20 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
 
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


