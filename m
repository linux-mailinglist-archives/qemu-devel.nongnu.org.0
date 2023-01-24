Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945CC678F5D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:38:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAys-0002QG-HE; Mon, 23 Jan 2023 23:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyq-0002Pe-Ms
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:20 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyo-0002MI-Mw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:20 -0500
Received: by mail-pj1-x102b.google.com with SMTP id 88so2077637pjo.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/s1msb7FYntIfC/zCNxdz9yjGGhjcUimenvxfoR2xo=;
 b=BPAKXrOHIeUEa/CqpmwILDgcUfXESKUdR85ydZDcAqVH+veHqCh/XdxTPVdPge5wym
 WspX6rTq/0z7Y/PcVO6PulhefBUPdkkwGlxqDUurXNYuAvCHRlRCv9m5TPi8CyfWb0zd
 yGqQtbFvySmtQMLk+M/CgsuOJ8B4nFHvEfFH+1N3ePhdnPzjIm5ShHZQlPj116G95fZo
 Vw9hUokU/iTax6PV0J0ETMfjuQLqCiYJVEUzkfj8gTwv7FgOQH0eTb55jIl4jYa0+86u
 4MG9ddqIAIWfunvT+dIuishD2OqFpbWeDBpXMFV87r2xGcn48cj2HcaU/LtFbpLWmAd1
 QGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/s1msb7FYntIfC/zCNxdz9yjGGhjcUimenvxfoR2xo=;
 b=EBhfi7NIrRF/QLTlRcvCcKoCbnmlAg2hPnstbs3L0omLBDiPP6x8Idin9OMl6pzcP3
 N8HN7JGwjz1m6adcwxY2l0fo1HDRpd2xWYBXj7Gks2vDdzZsYgTB8pw2n2fryigvOXge
 d92FNWD3nK3y+1hmbYI1BVHekKzs2O5R5Gcki/ev4XrrKD5ZiRC0LvZmyy4Sz6oBp3qk
 EVj4TLVtrCLRfWCZ+6t+Ml0eieb9fXgKPk+3JKsD24jStzA7FX96Mzbhh4w7urPYnr+R
 pvfbvETpyZpeY5pWe73wESErrneNt/7S12oAq3OBxNb9iCPE8l6K3QADKB4gZLfh2LDo
 SHjQ==
X-Gm-Message-State: AFqh2krtDofwWo7sgH4OiJ8BvkCqg3xZmkgNmJOBNsnSqx2VXX456f5A
 zMYSbHCCxj0ofXmlTRCMpWeZLA==
X-Google-Smtp-Source: AMrXdXscF1++i5g5/C0wvNoGvGe0/cJ7F7tbrWEFvw+se995vR0+ZcNCsdroTjuhRO/+ypsXd8Cd8A==
X-Received: by 2002:a17:902:cec3:b0:194:d9b5:3bf0 with SMTP id
 d3-20020a170902cec300b00194d9b53bf0mr21892848plg.18.1674534737961; 
 Mon, 23 Jan 2023 20:32:17 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:17 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 08/26] e1000e: Use more constant definitions
Date: Tue, 24 Jan 2023 13:31:25 +0900
Message-Id: <20230124043143.5515-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The definitions of SW Semaphore Register were copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000e/defines.h?h=v6.0.9#n374

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000_regs.h  |  7 +++++++
 hw/net/e1000e_core.c | 49 ++++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 3f6b5d0c52..6a36573802 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -525,6 +525,13 @@
 #define M88E1000_PHY_VCO_REG_BIT8  0x100 /* Bits 8 & 11 are adjusted for */
 #define M88E1000_PHY_VCO_REG_BIT11 0x800    /* improved BER performance */
 
+/* SW Semaphore Register */
+#define E1000_SWSM_SMBI         0x00000001 /* Driver Semaphore bit */
+#define E1000_SWSM_SWESMBI      0x00000002 /* FW Semaphore bit */
+#define E1000_SWSM_DRV_LOAD     0x00000008 /* Driver Loaded Bit */
+
+#define E1000_SWSM2_LOCK        0x00000002 /* Secondary driver semaphore bit */
+
 /* Interrupt Cause Read */
 #define E1000_ICR_TXDW          0x00000001 /* Transmit desc written back */
 #define E1000_ICR_TXQE          0x00000002 /* Transmit Queue empty */
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index e6fc85ea51..6a4da72bd3 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1022,10 +1022,11 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 
     if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
         e1000x_vlan_rx_filter_enabled(core->mac)) {
-        uint16_t vid = lduw_be_p(buf + 14);
-        uint32_t vfta = ldl_le_p((uint32_t *)(core->mac + VFTA) +
-                                 ((vid >> 5) & 0x7f));
-        if ((vfta & (1 << (vid & 0x1f))) == 0) {
+        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
+        uint32_t vfta =
+            ldl_le_p((uint32_t *)(core->mac + VFTA) +
+                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
+        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
             trace_e1000e_rx_flt_vlan_mismatch(vid);
             return false;
         } else {
@@ -1679,16 +1680,13 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
     }
 }
 
-/* Min. octets in an ethernet frame sans FCS */
-#define MIN_BUF_SIZE 60
-
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 {
-    static const int maximum_ethernet_hdr_len = (14 + 4);
+    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint32_t n = 0;
-    uint8_t min_buf[MIN_BUF_SIZE];
+    uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     uint8_t *filter_buf;
     size_t size, orig_size;
@@ -2627,7 +2625,7 @@ static uint32_t
 e1000e_mac_swsm_read(E1000ECore *core, int index)
 {
     uint32_t val = core->mac[SWSM];
-    core->mac[SWSM] = val | 1;
+    core->mac[SWSM] = val | E1000_SWSM_SMBI;
     return val;
 }
 
@@ -3092,8 +3090,8 @@ static const readops e1000e_macreg_readops[] = {
     [IP4AT ... IP4AT + 6]  = e1000e_mac_readreg,
     [RA ... RA + 31]       = e1000e_mac_readreg,
     [WUPM ... WUPM + 31]   = e1000e_mac_readreg,
-    [MTA ... MTA + 127]    = e1000e_mac_readreg,
-    [VFTA ... VFTA + 127]  = e1000e_mac_readreg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = e1000e_mac_readreg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]  = e1000e_mac_readreg,
     [FFMT ... FFMT + 254]  = e1000e_mac_readreg,
     [FFVT ... FFVT + 254]  = e1000e_mac_readreg,
     [MDEF ... MDEF + 7]    = e1000e_mac_readreg,
@@ -3245,8 +3243,8 @@ static const writeops e1000e_macreg_writeops[] = {
     [IP4AT ... IP4AT + 6]    = e1000e_mac_writereg,
     [RA + 2 ... RA + 31]     = e1000e_mac_writereg,
     [WUPM ... WUPM + 31]     = e1000e_mac_writereg,
-    [MTA ... MTA + 127]      = e1000e_mac_writereg,
-    [VFTA ... VFTA + 127]    = e1000e_mac_writereg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = e1000e_mac_writereg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]    = e1000e_mac_writereg,
     [FFMT ... FFMT + 254]    = e1000e_set_4bit,
     [FFVT ... FFVT + 254]    = e1000e_mac_writereg,
     [PBM ... PBM + 10239]    = e1000e_mac_writereg,
@@ -3276,7 +3274,7 @@ static const uint16_t mac_reg_access[E1000E_MAC_SIZE] = {
     [TDH_A]   = 0x0cf8, [TDT_A]   = 0x0cf8, [TIDV_A] = 0x0cf8,
     [TDFH_A]  = 0xed00, [TDFT_A]  = 0xed00,
     [RA_A ... RA_A + 31]      = 0x14f0,
-    [VFTA_A ... VFTA_A + 127] = 0x1400,
+    [VFTA_A ... VFTA_A + E1000_VLAN_FILTER_TBL_SIZE - 1] = 0x1400,
     [RDBAL0_A ... RDLEN0_A] = 0x09bc,
     [TDBAL_A ... TDLEN_A]   = 0x0cf8,
     /* Access options */
@@ -3433,13 +3431,20 @@ e1000e_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
 
         [MII_PHYID1]            = 0x141,
         [MII_PHYID2]            = E1000_PHY_ID2_82574x,
-        [MII_ANAR]              = 0xde1,
-        [MII_ANLPAR]            = 0x7e0,
-        [MII_ANER]              = BIT(2),
-        [MII_ANNP]              = BIT(0) | BIT(13),
-        [MII_CTRL1000]          = BIT(8) | BIT(9) | BIT(10) | BIT(11),
-        [MII_STAT1000]          = 0x3c00,
-        [MII_EXTSTAT]           = BIT(12) | BIT(13),
+        [MII_ANAR]              = MII_ANAR_CSMACD | MII_ANAR_10 |
+                                  MII_ANAR_10FD | MII_ANAR_TX |
+                                  MII_ANAR_TXFD | MII_ANAR_PAUSE |
+                                  MII_ANAR_PAUSE_ASYM,
+        [MII_ANLPAR]            = MII_ANLPAR_10 | MII_ANLPAR_10FD |
+                                  MII_ANLPAR_TX | MII_ANLPAR_TXFD |
+                                  MII_ANLPAR_T4 | MII_ANLPAR_PAUSE,
+        [MII_ANER]              = MII_ANER_NP,
+        [MII_ANNP]              = 1 | MII_ANNP_MP,
+        [MII_CTRL1000]          = MII_CTRL1000_HALF | MII_CTRL1000_FULL |
+                                  MII_CTRL1000_PORT | MII_CTRL1000_MASTER,
+        [MII_STAT1000]          = MII_STAT1000_HALF | MII_STAT1000_FULL |
+                                  MII_STAT1000_ROK | MII_STAT1000_LOK,
+        [MII_EXTSTAT]           = MII_EXTSTAT_1000T_HD | MII_EXTSTAT_1000T_FD,
 
         [PHY_COPPER_CTRL1]      = BIT(5) | BIT(6) | BIT(8) | BIT(9) |
                                   BIT(12) | BIT(13),
-- 
2.39.0


