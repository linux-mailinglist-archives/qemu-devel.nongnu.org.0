Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F106E89B3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9A-0006oo-Tx; Thu, 20 Apr 2023 01:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN94-0006nU-W5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:51 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN93-00013Q-6r
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-51efefe7814so594942a12.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969668; x=1684561668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olsD2xgUqYp8y9KV8yKVW3jfVHpAdqd+kCAwZWJ1hCE=;
 b=DDUnNdpSqD+W3P0Jm9SHxBSavOLTWshMioOiLewqX1GNN9vrLynCwAUl1SA8KbEb7w
 97ylK0j0XbP+/IiiBodw8OfK/WDyW+rPwoHv5gyAQkW7lCrpldv09rve66wwe9zweldL
 J26TvDBvYyg0d3FTCZF1gpEndEHfkQyQs+SgKgbCBecvNu+wWzU0zA/zPTBWr0PBKhDr
 b8D3vOblJsg4sDTMkm3yGWSYT74KnQpiXQHBPgVNE0IK738V9rvr8fEEm+lHxRRIaCEO
 zYNpGdz8xRvIQCIPEq0q5+Tfr3JFdqjyVUpZp5k1ORG534XXf98q7GD1cqow6TacpsNJ
 I7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969668; x=1684561668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olsD2xgUqYp8y9KV8yKVW3jfVHpAdqd+kCAwZWJ1hCE=;
 b=V2uiwilT50SqF/mtMVRIcm2pUv7gQYT92bfQumrcnMaK2zJDufyFRkchTYeLMCVN4y
 BpmXH0S4YHCf+M+Sco1G/vWFbnhz5ujTUy9D3emDENwG+PPPX5VByMqsEtm9r59TPTq9
 5Acb5/LtREo6xgYLmyx/Os1PN7pCgi0RahPPnIQv6FtYyfgIYWFGxrIN45YboR0CezW1
 zNryDZ9yRYpPl8uh6BxkHiq41PkvHYfVcld4xxuUghRJtEjBH3CGfgx8tCUnZiIwRsLz
 fa7+w1cVYalg+7qjW62YRayf9zQ9xl+56x1Bm9YbdX0T0XpkLO8N7DnvBFTcAOkm9hyk
 A1Xg==
X-Gm-Message-State: AAQBX9e4ZR+1eIVb42gpXyx2lBQCdv8RugwXd2Xa0uz6izReR2guR7II
 YzQra7++HJX+oSbuCE0InegDBQ==
X-Google-Smtp-Source: AKy350bKur9j2ZHdN8w1Ak8P7NrPG999UGYW43fFT5ITByfJJ7q3i8ZxjuzbIjqYKhQAAXShF/7JyA==
X-Received: by 2002:a17:90b:3d8:b0:249:87f0:604b with SMTP id
 go24-20020a17090b03d800b0024987f0604bmr532307pjb.30.1681969667978; 
 Wed, 19 Apr 2023 22:47:47 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:47:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 03/41] e1000x: Fix BPRC and MPRC
Date: Thu, 20 Apr 2023 14:46:19 +0900
Message-Id: <20230420054657.50367-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Before this change, e1000 and the common code updated BPRC and MPRC
depending on the matched filter, but e1000e and igb decided to update
those counters by deriving the packet type independently. This
inconsistency caused a multicast packet to be counted twice.

Updating BPRC and MPRC depending on are fundamentally flawed anyway as
a filter can be used for different types of packets. For example, it is
possible to filter broadcast packets with MTA.

Always determine what counters to update by inspecting the packets.

Fixes: 3b27430177 ("e1000: Implementing various counters")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000x_common.h |  5 +++--
 hw/net/e1000.c         |  6 +++---
 hw/net/e1000e_core.c   | 20 +++-----------------
 hw/net/e1000x_common.c | 25 +++++++++++++++++++------
 hw/net/igb_core.c      | 22 +++++-----------------
 5 files changed, 33 insertions(+), 45 deletions(-)

diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index 911abd8a90..0298e06283 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -91,8 +91,9 @@ e1000x_update_regs_on_link_up(uint32_t *mac, uint16_t *phy)
 }
 
 void e1000x_update_rx_total_stats(uint32_t *mac,
-                                  size_t data_size,
-                                  size_t data_fcs_size);
+                                  eth_pkt_types_e pkt_type,
+                                  size_t pkt_size,
+                                  size_t pkt_fcs_size);
 
 void e1000x_core_prepare_eeprom(uint16_t       *eeprom,
                                 const uint16_t *templ,
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 59bacb5d3b..18eb6d8876 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -826,12 +826,10 @@ receive_filter(E1000State *s, const uint8_t *buf, int size)
     }
 
     if (ismcast && (rctl & E1000_RCTL_MPE)) {          /* promiscuous mcast */
-        e1000x_inc_reg_if_not_full(s->mac_reg, MPRC);
         return 1;
     }
 
     if (isbcast && (rctl & E1000_RCTL_BAM)) {          /* broadcast enabled */
-        e1000x_inc_reg_if_not_full(s->mac_reg, BPRC);
         return 1;
     }
 
@@ -922,6 +920,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     size_t desc_offset;
     size_t desc_size;
     size_t total_size;
+    eth_pkt_types_e pkt_type;
 
     if (!e1000x_hw_rx_enabled(s->mac_reg)) {
         return -1;
@@ -971,6 +970,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         size -= 4;
     }
 
+    pkt_type = get_eth_packet_type(PKT_GET_ETH_HDR(filter_buf));
     rdh_start = s->mac_reg[RDH];
     desc_offset = 0;
     total_size = size + e1000x_fcs_len(s->mac_reg);
@@ -1036,7 +1036,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         }
     } while (desc_offset < total_size);
 
-    e1000x_update_rx_total_stats(s->mac_reg, size, total_size);
+    e1000x_update_rx_total_stats(s->mac_reg, pkt_type, size, total_size);
 
     n = E1000_ICS_RXT0;
     if ((rdt = s->mac_reg[RDT]) < s->mac_reg[RDH])
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 15821a75e0..c2d864a504 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1488,24 +1488,10 @@ e1000e_write_to_rx_buffers(E1000ECore *core,
 }
 
 static void
-e1000e_update_rx_stats(E1000ECore *core,
-                       size_t data_size,
-                       size_t data_fcs_size)
+e1000e_update_rx_stats(E1000ECore *core, size_t pkt_size, size_t pkt_fcs_size)
 {
-    e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
-
-    switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
-    case ETH_PKT_BCAST:
-        e1000x_inc_reg_if_not_full(core->mac, BPRC);
-        break;
-
-    case ETH_PKT_MCAST:
-        e1000x_inc_reg_if_not_full(core->mac, MPRC);
-        break;
-
-    default:
-        break;
-    }
+    eth_pkt_types_e pkt_type = net_rx_pkt_get_packet_type(core->rx_pkt);
+    e1000x_update_rx_total_stats(core->mac, pkt_type, pkt_size, pkt_fcs_size);
 }
 
 static inline bool
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index 4c8e7dcf70..7694673bcc 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -80,7 +80,6 @@ bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf)
     f = mta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
     f = (((buf[5] << 8) | buf[4]) >> f) & 0xfff;
     if (mac[MTA + (f >> 5)] & (1 << (f & 0x1f))) {
-        e1000x_inc_reg_if_not_full(mac, MPRC);
         return true;
     }
 
@@ -212,13 +211,14 @@ e1000x_rxbufsize(uint32_t rctl)
 
 void
 e1000x_update_rx_total_stats(uint32_t *mac,
-                             size_t data_size,
-                             size_t data_fcs_size)
+                             eth_pkt_types_e pkt_type,
+                             size_t pkt_size,
+                             size_t pkt_fcs_size)
 {
     static const int PRCregs[6] = { PRC64, PRC127, PRC255, PRC511,
                                     PRC1023, PRC1522 };
 
-    e1000x_increase_size_stats(mac, PRCregs, data_fcs_size);
+    e1000x_increase_size_stats(mac, PRCregs, pkt_fcs_size);
     e1000x_inc_reg_if_not_full(mac, TPR);
     e1000x_inc_reg_if_not_full(mac, GPRC);
     /* TOR - Total Octets Received:
@@ -226,8 +226,21 @@ e1000x_update_rx_total_stats(uint32_t *mac,
     * Address> field through the <CRC> field, inclusively.
     * Always include FCS length (4) in size.
     */
-    e1000x_grow_8reg_if_not_full(mac, TORL, data_size + 4);
-    e1000x_grow_8reg_if_not_full(mac, GORCL, data_size + 4);
+    e1000x_grow_8reg_if_not_full(mac, TORL, pkt_size + 4);
+    e1000x_grow_8reg_if_not_full(mac, GORCL, pkt_size + 4);
+
+    switch (pkt_type) {
+    case ETH_PKT_BCAST:
+        e1000x_inc_reg_if_not_full(mac, BPRC);
+        break;
+
+    case ETH_PKT_MCAST:
+        e1000x_inc_reg_if_not_full(mac, MPRC);
+        break;
+
+    default:
+        break;
+    }
 }
 
 void
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index abfdce9aaf..464a41d0aa 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1438,29 +1438,17 @@ igb_write_to_rx_buffers(IGBCore *core,
 
 static void
 igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
-                    size_t data_size, size_t data_fcs_size)
+                    size_t pkt_size, size_t pkt_fcs_size)
 {
-    e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
-
-    switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
-    case ETH_PKT_BCAST:
-        e1000x_inc_reg_if_not_full(core->mac, BPRC);
-        break;
-
-    case ETH_PKT_MCAST:
-        e1000x_inc_reg_if_not_full(core->mac, MPRC);
-        break;
-
-    default:
-        break;
-    }
+    eth_pkt_types_e pkt_type = net_rx_pkt_get_packet_type(core->rx_pkt);
+    e1000x_update_rx_total_stats(core->mac, pkt_type, pkt_size, pkt_fcs_size);
 
     if (core->mac[MRQC] & 1) {
         uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;
 
-        core->mac[PVFGORC0 + (pool * 64)] += data_size + 4;
+        core->mac[PVFGORC0 + (pool * 64)] += pkt_size + 4;
         core->mac[PVFGPRC0 + (pool * 64)]++;
-        if (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) {
+        if (pkt_type == ETH_PKT_MCAST) {
             core->mac[PVFMPRC0 + (pool * 64)]++;
         }
     }
-- 
2.40.0


