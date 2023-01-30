Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB96680F65
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:52:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUVq-00042K-EP; Mon, 30 Jan 2023 08:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVm-0003xB-49
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:54 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVg-0003aY-Ny
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:53 -0500
Received: by mail-pl1-x635.google.com with SMTP id 5so11674925plo.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11tAn5i1ga6o2GC/G+0ctwzPxRVIwWHyxeT3xs8C5X4=;
 b=7UdkQ+jzWd44mj97Iy+dp3wc/a3U7p8fpnksVVvP/RiN374Tk5tJP31A5cWJgFdMyG
 xjiU0fdS/rWY6PQYkxhsWHtHXvXuNDEQi0l+XSXYLu5K9KDg6tuG07o1SFzrNUJTixcV
 uU3A2lr1q3sbd/AwnRiWJlVOzpaGW++0M4keN0NnMX9RUlkZHyWnGBNr0JQWBXvqhSYt
 kf6pPiLN19jKjvt7V47wotUynsvmKyUsY2fEOG2mx7dUlcIALI0lg94rWf+SqNjflBfo
 l9yiodJ36gkratPxCuAL1KaxNFBYD0aleZVy554kWacNw/yOOwvXa1iwIn7pIGKXLp8N
 rkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11tAn5i1ga6o2GC/G+0ctwzPxRVIwWHyxeT3xs8C5X4=;
 b=oQfBrwiRM20xpK73rNBm3J5YEfcAJl8AJH/KVEUTLPMu/IHDHqaKDKOx16dhuY/rbt
 rM5z0/Fs1P/ly1l0etsHgX5FTo5zjLM0ANsY7mdrDM4tFd6HG83GPb8/tMgIYKsU4FlT
 gegqkDd4rz6NrSmslwKGFGwl6mq/LCYqfh+sgCXowUkBdQ1cvMysPGATls/yy6ShoORr
 dDVjKPYUSSIVUBKus03iyAbD3xoo2/U35iRXrsla/shNfVqpFfSTd/Ca6iOvJ7DmovZV
 fKlwnMv95/UZWRew2QvEb5Vwm0wootJ3opL9qYrQ3HOW16t65WDueaurUmS6nmNFVmjE
 j7Aw==
X-Gm-Message-State: AO0yUKXDC67HlVYGT9x2KxfRxo0cCcOn5MyeSsDkVCjIAhLZ/nmiNk+n
 5LJld447FsGJdQO+gf3nMtkwGtq4Xn/mduOB
X-Google-Smtp-Source: AK7set+UW8ZSIXRXpptVR3jTyb2gVIl3FpUc2fNY8pded2INHdYek4FJLG9ocGAl2BFOQuDssp+x6w==
X-Received: by 2002:a17:902:e804:b0:196:15a6:7332 with SMTP id
 u4-20020a170902e80400b0019615a67332mr10202805plg.31.1675086467417; 
 Mon, 30 Jan 2023 05:47:47 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:47:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 07/28] e1000: Use more constant definitions
Date: Mon, 30 Jan 2023 22:46:54 +0900
Message-Id: <20230130134715.76604-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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

The definitions for E1000_VFTA_ENTRY_SHIFT, E1000_VFTA_ENTRY_MASK, and
E1000_VFTA_ENTRY_BIT_SHIFT_MASK were copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n306

The definitions for E1000_NUM_UNICAST, E1000_MC_TBL_SIZE, and
E1000_VLAN_FILTER_TBL_SIZE were copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n707

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000.c         | 50 +++++++++++++++++++++++-------------------
 hw/net/e1000_regs.h    |  9 ++++++++
 hw/net/e1000x_common.c |  5 +++--
 hw/net/e1000x_common.h |  2 +-
 4 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 0925a99511..d9d048f665 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -43,8 +43,6 @@
 #include "trace.h"
 #include "qom/object.h"
 
-static const uint8_t bcast[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
-
 /* #define E1000_DEBUG */
 
 #ifdef E1000_DEBUG
@@ -67,9 +65,8 @@ static int debugflags = DBGBIT(TXERR) | DBGBIT(GENERAL);
 
 #define IOPORT_SIZE       0x40
 #define PNPMMIO_SIZE      0x20000
-#define MIN_BUF_SIZE      60 /* Min. octets in an ethernet frame sans FCS */
 
-#define MAXIMUM_ETHERNET_HDR_LEN (14+4)
+#define MAXIMUM_ETHERNET_HDR_LEN (ETH_HLEN + 4)
 
 /*
  * HW models:
@@ -239,10 +236,16 @@ static const uint16_t phy_reg_init[] = {
 
     [MII_PHYID1] = 0x141,
     /* [MII_PHYID2] configured per DevId, from e1000_reset() */
-    [MII_ANAR] = 0xde1,
-    [MII_ANLPAR] = 0x1e0,
-    [MII_CTRL1000] = 0x0e00,
-    [MII_STAT1000] = 0x3c00,
+    [MII_ANAR] = MII_ANAR_CSMACD | MII_ANAR_10 |
+                 MII_ANAR_10FD | MII_ANAR_TX |
+                 MII_ANAR_TXFD | MII_ANAR_PAUSE |
+                 MII_ANAR_PAUSE_ASYM,
+    [MII_ANLPAR] = MII_ANLPAR_10 | MII_ANLPAR_10FD |
+                   MII_ANLPAR_TX | MII_ANLPAR_TXFD,
+    [MII_CTRL1000] = MII_CTRL1000_FULL | MII_CTRL1000_PORT |
+                     MII_CTRL1000_MASTER,
+    [MII_STAT1000] = MII_STAT1000_HALF | MII_STAT1000_FULL |
+                     MII_STAT1000_ROK | MII_STAT1000_LOK,
     [M88E1000_PHY_SPEC_CTRL] = 0x360,
     [M88E1000_PHY_SPEC_STATUS] = 0xac00,
     [M88E1000_EXT_PHY_SPEC_CTRL] = 0x0d60,
@@ -548,9 +551,9 @@ putsum(uint8_t *data, uint32_t n, uint32_t sloc, uint32_t css, uint32_t cse)
 static inline void
 inc_tx_bcast_or_mcast_count(E1000State *s, const unsigned char *arr)
 {
-    if (!memcmp(arr, bcast, sizeof bcast)) {
+    if (is_broadcast_ether_addr(arr)) {
         e1000x_inc_reg_if_not_full(s->mac_reg, BPTC);
-    } else if (arr[0] & 1) {
+    } else if (is_multicast_ether_addr(arr)) {
         e1000x_inc_reg_if_not_full(s->mac_reg, MPTC);
     }
 }
@@ -804,14 +807,16 @@ static int
 receive_filter(E1000State *s, const uint8_t *buf, int size)
 {
     uint32_t rctl = s->mac_reg[RCTL];
-    int isbcast = !memcmp(buf, bcast, sizeof bcast), ismcast = (buf[0] & 1);
+    int isbcast = is_broadcast_ether_addr(buf);
+    int ismcast = is_multicast_ether_addr(buf);
 
     if (e1000x_is_vlan_packet(buf, le16_to_cpu(s->mac_reg[VET])) &&
         e1000x_vlan_rx_filter_enabled(s->mac_reg)) {
-        uint16_t vid = lduw_be_p(buf + 14);
-        uint32_t vfta = ldl_le_p((uint32_t *)(s->mac_reg + VFTA) +
-                                 ((vid >> 5) & 0x7f));
-        if ((vfta & (1 << (vid & 0x1f))) == 0) {
+        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
+        uint32_t vfta =
+            ldl_le_p((uint32_t *)(s->mac_reg + VFTA) +
+                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
+        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
             return 0;
         }
     }
@@ -909,7 +914,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint32_t rdh_start;
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
-    uint8_t min_buf[MIN_BUF_SIZE];
+    uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
@@ -1204,8 +1209,8 @@ static const readops macreg_readops[] = {
     [FFLT ... FFLT + 6]   = &mac_readreg,
     [RA ... RA + 31]      = &mac_readreg,
     [WUPM ... WUPM + 31]  = &mac_readreg,
-    [MTA ... MTA + 127]   = &mac_readreg,
-    [VFTA ... VFTA + 127] = &mac_readreg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1]   = &mac_readreg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1] = &mac_readreg,
     [FFMT ... FFMT + 254] = &mac_readreg,
     [FFVT ... FFVT + 254] = &mac_readreg,
     [PBM ... PBM + 16383] = &mac_readreg,
@@ -1236,8 +1241,8 @@ static const writeops macreg_writeops[] = {
     [FFLT ... FFLT + 6]   = &set_11bit,
     [RA ... RA + 31]      = &mac_writereg,
     [WUPM ... WUPM + 31]  = &mac_writereg,
-    [MTA ... MTA + 127]   = &mac_writereg,
-    [VFTA ... VFTA + 127] = &mac_writereg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = &mac_writereg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1] = &mac_writereg,
     [FFMT ... FFMT + 254] = &set_4bit,     [FFVT ... FFVT + 254] = &mac_writereg,
     [PBM ... PBM + 16383] = &mac_writereg,
 };
@@ -1603,8 +1608,9 @@ static const VMStateDescription vmstate_e1000 = {
         VMSTATE_UINT32(mac_reg[WUFC], E1000State),
         VMSTATE_UINT32(mac_reg[VET], E1000State),
         VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, RA, 32),
-        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, MTA, 128),
-        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, VFTA, 128),
+        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, MTA, E1000_MC_TBL_SIZE),
+        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, VFTA,
+                                 E1000_VLAN_FILTER_TBL_SIZE),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 59d6eb3189..3f6b5d0c52 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -1154,6 +1154,11 @@ struct e1000_data_desc {
     } upper;
 };
 
+/* Filters */
+#define E1000_NUM_UNICAST          16  /* Unicast filter entries */
+#define E1000_MC_TBL_SIZE          128 /* Multicast Filter Table (4096 bits) */
+#define E1000_VLAN_FILTER_TBL_SIZE 128 /* VLAN Filter Table (4096 bits) */
+
 /* Management Control */
 #define E1000_MANC_SMBUS_EN      0x00000001 /* SMBus Enabled - RO */
 #define E1000_MANC_ASF_EN        0x00000002 /* ASF Enabled - RO */
@@ -1202,4 +1207,8 @@ struct e1000_data_desc {
 #define E1000_IOADDR 0x00
 #define E1000_IODATA 0x04
 
+#define E1000_VFTA_ENTRY_SHIFT          5
+#define E1000_VFTA_ENTRY_MASK           0x7F
+#define E1000_VFTA_ENTRY_BIT_SHIFT_MASK 0x1F
+
 #endif /* HW_E1000_REGS_H */
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index e79d4c79bd..b3bbf31582 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "hw/net/mii.h"
 #include "hw/pci/pci_device.h"
+#include "net/eth.h"
 #include "net/net.h"
 
 #include "e1000x_common.h"
@@ -48,7 +49,7 @@ bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac)
 
 bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet)
 {
-    uint16_t eth_proto = lduw_be_p(buf + 12);
+    uint16_t eth_proto = lduw_be_p(&PKT_GET_ETH_HDR(buf)->h_proto);
     bool res = (eth_proto == vet);
 
     trace_e1000x_vlan_is_vlan_pkt(res, eth_proto, vet);
@@ -67,7 +68,7 @@ bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf)
         }
         ra[0] = cpu_to_le32(rp[0]);
         ra[1] = cpu_to_le32(rp[1]);
-        if (!memcmp(buf, (uint8_t *)ra, 6)) {
+        if (!memcmp(buf, (uint8_t *)ra, ETH_ALEN)) {
             trace_e1000x_rx_flt_ucast_match((int)(rp - mac - RA) / 2,
                                             MAC_ARG(buf));
             return true;
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index 3501e4855a..b991d814b1 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -102,7 +102,7 @@ enum {
 static inline void
 e1000x_inc_reg_if_not_full(uint32_t *mac, int index)
 {
-    if (mac[index] != 0xffffffff) {
+    if (mac[index] != UINT32_MAX) {
         mac[index]++;
     }
 }
-- 
2.39.1


