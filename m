Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62D319588
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:05:42 +0100 (CET)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK5l-00021H-AI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lAK2D-0000Es-2B; Thu, 11 Feb 2021 17:02:01 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lAK2A-0005oy-Dy; Thu, 11 Feb 2021 17:02:00 -0500
Received: by mail-ed1-x535.google.com with SMTP id t5so8537065eds.12;
 Thu, 11 Feb 2021 14:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kREa/WLvCSnwORBa58MC0Qb48ehGXAj/cQQKJfewFlE=;
 b=X7WsLVb7O/CO7df9YHZaoF8qUSwrfLo+ZqKuFKRrkIY/1T3LhHnObZo7S9yDHGrngO
 74vzAFsJAETY7xhEhYNb1/nmtqhDJHvDwUbQpJ1OX9yg2q+sddlw0e0B7U7Ot0CNQ8yU
 75Jd3GqHZAcfzYt1aMvCzV4VntMSRixmvVzsB6EagcsJlJT0W/eO/hYjpibKOlF5bveQ
 GVSWhlChADCqtDgXSvjUyg6Wxmv0iEbE/kNy6noZFGvpGmhdQWCxokxIMzTnirgYz9AA
 0zKg5HD0X6O80msHYwnq7/s1ro1T3M+CRMZIzVfV+nPXtf+WaIzdkK7ZWDrs/FINKTXj
 SjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kREa/WLvCSnwORBa58MC0Qb48ehGXAj/cQQKJfewFlE=;
 b=l0QStO8h8GzViKs5umkrJOuCEE7Xtcoor11/n3ygtAosRd8bHvArWemx4ZFCjT0MnF
 AWF2XfTGwTYfbMm1NZid7x5w6ZDeUUWLda/JDfqD2WoStj0AXMOpmvYF/5pJ0OTqgzbW
 myJDKNT9Xo7tfBzYMV1/Y65dVLNZkbeYDyEkrPjS7/0cWi0Kyd7/Iepegue7/DzkXuPK
 ZHKeiQHhW/OBxmXRt6QXvTqiSl84ZKXnvoEniDS2TulfcZS+b9oUxf/VM21BrK7VVwbt
 6FB724lgh98hglgnCLValyyoQ8sSU35YYixo9zCZuV32Gx2DK/fKjoYkKeN/HRwR+Mdp
 X7lg==
X-Gm-Message-State: AOAM530KwWlqq54t4o6FpIly5icfoLx8i3HNH5saff2lD7OVyfpOFwnh
 4ynnWc4C+WPX/J+nEAfHzN/jwFJRMVU=
X-Google-Smtp-Source: ABdhPJxJGoAA9iyo8El/L65A8L2Rby2UFIkkXCFu0r4y0wCPpRwyyLF6LxJr5vBwQrzK9YW2TQeeDQ==
X-Received: by 2002:a05:6402:31a3:: with SMTP id
 dj3mr229412edb.172.1613080916639; 
 Thu, 11 Feb 2021 14:01:56 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-df14-48c0-797d-7ff1.fixed6.kpn.net.
 [2a02:a456:6be8:1:df14:48c0:797d:7ff1])
 by smtp.gmail.com with ESMTPSA id n16sm5496588ejy.23.2021.02.11.14.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:01:56 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/net/allwinner-sun8i-emac: traverse transmit queue
 using TX_CUR_DESC register value
Date: Thu, 11 Feb 2021 23:00:55 +0100
Message-Id: <20210211220055.19047-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211220055.19047-1-nieklinnenbank@gmail.com>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the emulated EMAC for sun8i always traverses the transmit queue
from the head when transferring packets. It searches for a list of consecutive
descriptors whichs are flagged as ready for processing and transmits their payloads
accordingly. The controller stops processing once it finds a descriptor that is not
marked ready.

While the above behaviour works in most situations, it is not the same as the actual
EMAC in hardware. Actual hardware uses the TX_CUR_DESC register value to keep track
of the last position in the transmit queue and continues processing from that position
when software triggers the start of DMA processing. The currently emulated behaviour can
lead to packet loss on transmit when software fills the transmit queue with ready
descriptors that overlap the tail of the circular list.

This commit modifies the emulated EMAC for sun8i such that it processes
the transmit queue using the TX_CUR_DESC register in the same way as hardware.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/net/allwinner-sun8i-emac.c | 58 +++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 042768922c..e586c147e5 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -339,35 +339,40 @@ static void allwinner_sun8i_emac_update_irq(AwSun8iEmacState *s)
     qemu_set_irq(s->irq, (s->int_sta & s->int_en) != 0);
 }
 
-static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
-                                               FrameDescriptor *desc,
-                                               size_t min_size)
+static bool allwinner_sun8i_emac_desc_owned(FrameDescriptor *desc,
+                                            size_t min_buf_size)
 {
-    uint32_t paddr = desc->next;
+    return (desc->status & DESC_STATUS_CTL) && (min_buf_size == 0 ||
+           (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_buf_size);
+}
 
-    dma_memory_read(&s->dma_as, paddr, desc, sizeof(*desc));
+static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
+                                          FrameDescriptor *desc,
+                                          uint32_t phys_addr)
+{
+    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc));
+}
 
-    if ((desc->status & DESC_STATUS_CTL) &&
-        (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
-        return paddr;
-    } else {
-        return 0;
-    }
+static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
+                                               FrameDescriptor *desc)
+{
+    const uint32_t nxt = desc->next;
+    allwinner_sun8i_emac_get_desc(s, desc, nxt);
+    return nxt;
 }
 
-static uint32_t allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
-                                              FrameDescriptor *desc,
-                                              uint32_t start_addr,
-                                              size_t min_size)
+static uint32_t allwinner_sun8i_emac_find_desc(AwSun8iEmacState *s,
+                                               FrameDescriptor *desc,
+                                               uint32_t start_addr,
+                                               size_t min_size)
 {
     uint32_t desc_addr = start_addr;
 
     /* Note that the list is a cycle. Last entry points back to the head. */
     while (desc_addr != 0) {
-        dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc));
+        allwinner_sun8i_emac_get_desc(s, desc, desc_addr);
 
-        if ((desc->status & DESC_STATUS_CTL) &&
-            (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
+        if (allwinner_sun8i_emac_desc_owned(desc, min_size)) {
             return desc_addr;
         } else if (desc->next == start_addr) {
             break;
@@ -383,14 +388,14 @@ static uint32_t allwinner_sun8i_emac_rx_desc(AwSun8iEmacState *s,
                                              FrameDescriptor *desc,
                                              size_t min_size)
 {
-    return allwinner_sun8i_emac_get_desc(s, desc, s->rx_desc_curr, min_size);
+    return allwinner_sun8i_emac_find_desc(s, desc, s->rx_desc_curr, min_size);
 }
 
 static uint32_t allwinner_sun8i_emac_tx_desc(AwSun8iEmacState *s,
-                                             FrameDescriptor *desc,
-                                             size_t min_size)
+                                             FrameDescriptor *desc)
 {
-    return allwinner_sun8i_emac_get_desc(s, desc, s->tx_desc_head, min_size);
+    allwinner_sun8i_emac_get_desc(s, desc, s->tx_desc_curr);
+    return s->tx_desc_curr;
 }
 
 static void allwinner_sun8i_emac_flush_desc(AwSun8iEmacState *s,
@@ -470,7 +475,8 @@ static ssize_t allwinner_sun8i_emac_receive(NetClientState *nc,
         bytes_left -= desc_bytes;
 
         /* Move to the next descriptor */
-        s->rx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc, 64);
+        s->rx_desc_curr = allwinner_sun8i_emac_find_desc(s, &desc, desc.next,
+                                                         AW_SUN8I_EMAC_MIN_PKT_SZ);
         if (!s->rx_desc_curr) {
             /* Not enough buffer space available */
             s->int_sta |= INT_STA_RX_BUF_UA;
@@ -495,10 +501,10 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
     size_t transmitted = 0;
     static uint8_t packet_buf[2048];
 
-    s->tx_desc_curr = allwinner_sun8i_emac_tx_desc(s, &desc, 0);
+    s->tx_desc_curr = allwinner_sun8i_emac_tx_desc(s, &desc);
 
     /* Read all transmit descriptors */
-    while (s->tx_desc_curr != 0) {
+    while (allwinner_sun8i_emac_desc_owned(&desc, 0)) {
 
         /* Read from physical memory into packet buffer */
         bytes = desc.status2 & DESC_STATUS2_BUF_SIZE_MASK;
@@ -524,7 +530,7 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
             packet_bytes = 0;
             transmitted++;
         }
-        s->tx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc, 0);
+        s->tx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc);
     }
 
     /* Raise transmit completed interrupt */
-- 
2.25.1


