Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B028F3BA8E9
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:24:18 +0200 (CEST)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgZ7-0007w0-Pn
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVG-0007WH-MK
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVF-0000PQ-2p
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l1so8364305wme.4
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BBcm2+wolkRxeEQOcXfgwJq5vFDQEScUBa14FBrpn3k=;
 b=Ae+hrxsI1VSH7L+2I1trurB0AO6G23kUV4BogxdwP5XYzy0o8itrEvdLaKz5T01xh9
 TW/KLds9aAx1QmAMnhp8BXm96RvuiMnARs1t1LTS5GDD6BqR5wNfYlkYSBr8MsX8Yu9H
 2mLNheO7LIfYmlQ2cO+byEE0Ncrlgp6FCpghQYPbDn2lfkBA6WOldrfD7s/cSg8U+f18
 eYg9HgHU2RTVm8f0V+Fjm6rWE8OsGXIgxaZv4UpipDb4X/Y2J1kFazK/9p/j149eSo9t
 7jtXsLmAN4mdrnqZzBroK/4ljoew2/UUZmoFf0Gt3WK1BbJo9hK5pebL/cDq9mJ2Aof1
 GSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BBcm2+wolkRxeEQOcXfgwJq5vFDQEScUBa14FBrpn3k=;
 b=P01EOHrHhGAJt0jA982dBa3DisU0gEvH/wtCqaqQDLEv8mOYtUkxz22/TVLQgPZ5gq
 8XCbR8H9Kge98DyDdsqEeFgwFmV1Cy9cjSJdMFItW6up7HD6M5ehAJZ/ordBIdk3kIpx
 jtMN9YoYxdg9bMUdAwsoIMDgGeBn4xJHr5ywNoKzjGu9EUY8ecXPXk7TMPHS3QOLMpTV
 GHb2a/BplULraPJYkLfkF/NayAeQQT4ZZWjFTzT55rJH9Bil+HAGZI6Y83g+6gmvZCU4
 M0Sj6vxezng9q+dMxmiMEDHqadCWeRPHdt+dOqmlVXO0/Ple/jvvRCZ5SItCoM5dhdfL
 Wa1g==
X-Gm-Message-State: AOAM531SEfa9GILOsLCSpnC8p8Ty7pe8WMPIlMboBkM4LSIFt6nb3QBM
 xAiN1/V1JGbveC/Yi8hSefpSdMHlSOTkCw==
X-Google-Smtp-Source: ABdhPJxUB+YnD2kavDllvKLJe5nPqx0ujN+2pJ5uQm3RYTh4qI+RY7juayefUvc5a+v9HvES1B3FAw==
X-Received: by 2002:a05:600c:21da:: with SMTP id
 x26mr5221843wmj.141.1625322015568; 
 Sat, 03 Jul 2021 07:20:15 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id q5sm6445998wrx.57.2021.07.03.07.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:20:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/6] dp8393x: Store CAM registers as 16-bit
Date: Sat,  3 Jul 2021 16:19:45 +0200
Message-Id: <20210703141947.352295-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703141947.352295-1-f4bug@amsat.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the DP83932C datasheet from July 1995:

  4.0 SONIC Registers
  4.1 THE CAM UNIT

    The Content Addressable Memory (CAM) consists of sixteen
    48-bit entries for complete address filtering of network
    packets. Each entry corresponds to a 48-bit destination
    address that is user programmable and can contain any
    combination of Multicast or Physical addresses. Each entry
    is partitioned into three 16-bit CAM cells accessible
    through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
    CAP0 corresponding to the least significant 16 bits of
    the Destination Address and CAP2 corresponding to the
    most significant bits.

Store the CAM registers as 16-bit as it simplifies the code.
There is no change in the migration stream.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index c9b478c127c..e0055b178b1 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -157,7 +157,7 @@ struct dp8393xState {
     MemoryRegion mmio;
 
     /* Registers */
-    uint8_t cam[16][6];
+    uint16_t cam[16][3];
     uint16_t regs[0x40];
 
     /* Temporaries */
@@ -280,15 +280,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
         index = dp8393x_get(s, width, 0) & 0xf;
-        s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
-        s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
-        s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
-        s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
-        s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
-        s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
-        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1],
-                               s->cam[index][2], s->cam[index][3],
-                               s->cam[index][4], s->cam[index][5]);
+        s->cam[index][0] = dp8393x_get(s, width, 1);
+        s->cam[index][1] = dp8393x_get(s, width, 2);
+        s->cam[index][2] = dp8393x_get(s, width, 3);
+        trace_dp8393x_load_cam(index,
+                               s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
+                               s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
+                               s->cam[index][2] >> 8, s->cam[index][2] & 0xff);
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
@@ -591,8 +589,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
     case SONIC_CAP1:
     case SONIC_CAP0:
         if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg) + 1] << 8;
-            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
+            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
         }
         break;
     /* All other registers have no special contraints */
@@ -987,7 +984,7 @@ static const VMStateDescription vmstate_dp8393x = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
+        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
         VMSTATE_END_OF_LIST()
     }
-- 
2.31.1


