Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A9338F67
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:07:13 +0100 (CET)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiRd-0004DO-0V
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD2-0002zJ-NB
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:08 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCr-0001yg-I4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:08 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so1815344wro.7
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9bWo2icBFqcJOrcIH29uZTN7h9AGM1WV1HrIrT+eHqI=;
 b=fpC0nkmA0IDlkGu9trb0h/Jdbam5lyAlJrK5wTatDbRap07zlb2Xw9SUXYRvS8O8z1
 v3V/t1CnKOqovU6/FoRRIZ8+JWlHt0XMsL4wFbcVg+cbjel5ryatxvACkhlTyljGfaAz
 8h7N3MvsvuIPEz29crhRKfh+KvZ1eU2gMxz6P4cbajNuRK++90ZxFuVrTzyLX/2PZiy2
 DvBkqvTmcX3zjiecMTu/vBuxbU+jYSwB0avM2hp6L1ZjMer7GDXpvgf/Kj2Oo7WJNyJ5
 qkOKkBaWxrwF9+196w0YZ4bEj31BVCC+QPPbQQfECll+zvgSmfRuleqerEEHiZ9kbe8O
 PSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bWo2icBFqcJOrcIH29uZTN7h9AGM1WV1HrIrT+eHqI=;
 b=cgNyGH7MVneglJAtw+OOZkiti0rESA8//8X+r4SZKM1to3A0K4vWoLgGUqorJfhXsJ
 B05mHmhyKjB/2j8fbjp5SmOIWBr41rNwnLO8IkoLN0QY1FML4fXTbk2sRpCB/2cQcEcN
 HNNBMjypGl7wcNHdvdqVV/8yLWdv7VXr8iZL3msw77SAad7LcVQRS7V5YJ2WkRK53zbw
 umkAfQpKc/YViepiRxw2gplmOsploZHJr0pSh2m4BxlBRfDyjnHdQwl9NHDQ4HZlfv5m
 jlP7f5VBEcNbr/TaUBtufidYcoZpJyt+IpzVBlxlYAeA4Ko6Wx2A/qdUlHqMfObhxWWn
 2IFw==
X-Gm-Message-State: AOAM530kRt/85H9C9s4Gk7L2f4okHvivuf3AP53wtZ45LUIlaZG0I3f+
 FXcE6Vlah4Vfn2bsdUKqB20CbKYI6FvRZIiP
X-Google-Smtp-Source: ABdhPJyPoqXOLetPIq2EU4vexpbQZ332PwyNU+bYZQxYSXl4Dfw1clP0qmvvkPipL17MiJtvwVKn7g==
X-Received: by 2002:adf:fac1:: with SMTP id a1mr14482530wrs.98.1615557114796; 
 Fri, 12 Mar 2021 05:51:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/39] hw/net/allwinner-sun8i-emac: traverse transmit queue
 using TX_CUR_DESC register value
Date: Fri, 12 Mar 2021 13:51:19 +0000
Message-Id: <20210312135140.1099-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Niek Linnenbank <nieklinnenbank@gmail.com>

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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210310195820.21950-2-nieklinnenbank@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/allwinner-sun8i-emac.c | 62 +++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index bf91803d65a..ff611f18fbd 100644
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
-
-    dma_memory_read(&s->dma_as, paddr, desc, sizeof(*desc));
-
-    if ((desc->status & DESC_STATUS_CTL) &&
-        (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
-        return paddr;
-    } else {
-        return 0;
-    }
+    return (desc->status & DESC_STATUS_CTL) && (min_buf_size == 0 ||
+           (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_buf_size);
 }
 
-static uint32_t allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
-                                              FrameDescriptor *desc,
-                                              uint32_t start_addr,
-                                              size_t min_size)
+static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
+                                          FrameDescriptor *desc,
+                                          uint32_t phys_addr)
+{
+    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc));
+}
+
+static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
+                                               FrameDescriptor *desc)
+{
+    const uint32_t nxt = desc->next;
+    allwinner_sun8i_emac_get_desc(s, desc, nxt);
+    return nxt;
+}
+
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
2.20.1


