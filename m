Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCFA32DB45
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:41:28 +0100 (CET)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuml-00066z-SZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhW-0001g1-6X; Thu, 04 Mar 2021 15:36:03 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhQ-0005Jl-8i; Thu, 04 Mar 2021 15:36:01 -0500
Received: by mail-ej1-x634.google.com with SMTP id ci14so32985748ejc.7;
 Thu, 04 Mar 2021 12:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFj03blwbcM66TuxYye9XnlpLa3NkLZCnKGhAwTXsCo=;
 b=ZPNU1XIveNLCQj0m/Hv+rSR2fxKvOhEBf9TpxLzoTgeWfhh/iEUTuGmr4IdNBW56KH
 ZtEAkXGB5X5x0yDOEXIYpdnBQUCgiyR4bRzrSbc3jMsNVdxe4T+AspNbavIXOaggwOOC
 yrZqFGNFFy1ayd8hQUwayCLSTV7rT4XonFBsYgJ7o26R8GwfnAOXG1obmdYiPWaSNreu
 7n71stLpGfZvXrtgcgxUADR4iH0qGJCrZX1CsiW2bRr0epGjSgF87S9JRSm/NddtUziw
 EMbMgG5bAXhcb1JcRTVzQlMOo5hfkRlK7CK1YI8Ey7c5gNdU/xWZrMEFPnYQU/LwzeYp
 DKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFj03blwbcM66TuxYye9XnlpLa3NkLZCnKGhAwTXsCo=;
 b=eHVJfYe/kRWgZ5iFxUBPGA8MsAZ9mI+BkY97+BfebD1H6JG1x8+pvfygHl628Y0bvU
 MBp9CawVWbVDzpVyFvOiMpIQdEeaL/G8715lcjoBXspQF6zoKzK2lY/Q0t/EhXjYIimc
 LbcbMz8nUs5DmHReizdLdGghPYD4TNb+ebINfkkL8rUxSZLucf1hy12ACgzgUs+t/fe8
 4vZmPVMveMreD5cl4178MR+8UTibRIkYM9JNxqX9dcloAEWvuhMQyVxg18oZdBX/Fasd
 Ll7vqnj4vurcfSid32Cv30rHww7p4vfHH/hq711cF0p8ditQF4GACXUldQxNHAADWzRg
 JqVQ==
X-Gm-Message-State: AOAM530z6468y2Pz0FJANTFxno3Xb1MJI/++KG2ZqPLAn2mzAQ9rzu6e
 E+EHDBNHsZDxwvQwueCqEZqhVO91VAsX3w==
X-Google-Smtp-Source: ABdhPJx1u2pOp5Hm9SEKoNfc+tVXeqm+9U8M/A23G9McmeWk0f/aZNhH3j6/Zp0GCwgCc55gqhOImw==
X-Received: by 2002:a17:906:32da:: with SMTP id
 k26mr4740008ejk.483.1614890154363; 
 Thu, 04 Mar 2021 12:35:54 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-ebf2-7b2-6f3d-5954.fixed6.kpn.net.
 [2a02:a456:6be8:1:ebf2:7b2:6f3d:5954])
 by smtp.gmail.com with ESMTPSA id t8sm289956edv.16.2021.03.04.12.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:35:53 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] hw/net/allwinner-sun8i-emac: traverse transmit queue
 using TX_CUR_DESC register value
Date: Thu,  4 Mar 2021 21:35:36 +0100
Message-Id: <20210304203540.41614-2-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304203540.41614-1-nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com,
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


