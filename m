Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3D3BA920
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 17:04:45 +0200 (CEST)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzhCG-0003Ag-JQ
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 11:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhAD-0000Wr-D1
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhAB-0002hb-Tk
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id g7so16188125wri.7
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CD4705Cw8bDOEOSQX+bvLucda0Kfkxx7BdKEQvUolXw=;
 b=LvbGdsmzO58Gz/ms66ZnCG7bDEtBfqwyBZjWLM7au+7id4C0AEfeF2CmG3C5YafbsF
 4TMwIsEctSr3/78C59luy/do38chw+pIwFS0HWFK8/0annYlzLv1h8FJz0DknvMagA/1
 33E9KkIl5l0wFNVHu5arGiV/4JfiLgy9vx1KUh16Jusf/A3AWv/PCqnWD+SIAbrTpxKd
 CK0RgV+/iPZ+116bL38+sl9QqCoJmGriXiPl+lWYYVTNrQX9E0Uw00gM4a66P+VDY5Ki
 ZAsPfp82B/VGtzPblunaxnFdrA5AksvYDrmG9OdyTvGQRXONGw7H7Amne3/ze5Dt/xS0
 I4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CD4705Cw8bDOEOSQX+bvLucda0Kfkxx7BdKEQvUolXw=;
 b=Nm52tH+nwT15RPL4av8EL024jYlfR9QdrnqwXoDboItoDtiol6CU6xurwbYcrAU8FN
 QAwM0PvY+aHzXYLmOI5QQ9ImI5QWiJ+8TAWsYqIa+KFttPYZFaKWcBYvobw6M0pgn9TZ
 /u9b1Z0bISjgligGyb71QI0w2V1F0PQrCdK7ZYCWir9vNB+x1KvK6rgzWJKwQNZTtNQa
 i49/xzswkMxWEfXEbyshDiRSanwRfVuLZkaVPppS4ks+mqcrfPs+TORyxSxL0SHgYhCv
 0QhP1TavdS7nM022sWZKEBwBzdZS8huhwU92v1kZD1Jp46/Gr1nNjtzGE9rXTC+FFcn7
 /rgQ==
X-Gm-Message-State: AOAM531qWe20rF2wTSbkF86GRsA0QyJZHrsjGPw51ClaxQQWEItcBrOm
 0GC8DW8HUwNxWJNiiggt5qxljPSutBDO3g==
X-Google-Smtp-Source: ABdhPJyJA2clixyrBVs4M+brbdTzevWdRVzqOT7toWu0e9tDOzyBbQTzirUDhmEidPF13Y+hwt1Vjg==
X-Received: by 2002:a05:6000:2c7:: with SMTP id o7mr1510481wry.0.1625324554454; 
 Sat, 03 Jul 2021 08:02:34 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id l20sm6614866wmq.3.2021.07.03.08.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 08:02:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] dp8393x: Do not amend CRC if it is inhibited (CRCI
 bit set)
Date: Sat,  3 Jul 2021 17:02:18 +0200
Message-Id: <20210703150219.364582-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703150219.364582-1-f4bug@amsat.org>
References: <20210703150219.364582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

When the CRCI (CRC INHIBIT) bit is set, the 4-byte FCS field
is not transmitted.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 99e179a5e86..dee8236400c 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -472,6 +472,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
              */
         } else {
             /* Remove existing FCS */
+            /* TODO check crc */
             tx_len -= 4;
             if (tx_len < 0) {
                 trace_dp8393x_transmit_txlen_error(tx_len);
@@ -758,7 +759,10 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         return pkt_size;
     }
 
-    rx_len = pkt_size + sizeof(checksum);
+    rx_len = pkt_size;
+    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {
+        rx_len += sizeof(checksum);
+    }
     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
         padded_len = ((rx_len - 1) | 3) + 1;
     } else {
@@ -801,9 +805,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     s->regs[SONIC_TRBA1] = s->regs[SONIC_CRBA1];
     s->regs[SONIC_TRBA0] = s->regs[SONIC_CRBA0];
 
-    /* Calculate the ethernet checksum */
-    checksum = crc32(0, buf, pkt_size);
-
     /* Put packet into RBA */
     trace_dp8393x_receive_packet(dp8393x_crba(s));
     address = dp8393x_crba(s);
@@ -811,10 +812,15 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
                         buf, pkt_size);
     address += pkt_size;
 
-    /* Put frame checksum into RBA */
-    address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFIED,
-                         NULL);
-    address += sizeof(checksum);
+    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {
+        /* Calculate the ethernet checksum */
+        checksum = crc32(0, buf, pkt_size);
+
+        /* Put frame checksum into RBA */
+        address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFIED,
+                             NULL);
+        address += sizeof(checksum);
+    }
 
     /* Pad short packets to keep pointers aligned */
     if (rx_len < padded_len) {
-- 
2.31.1


