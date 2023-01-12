Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165E667014
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:45:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuM2-0003LE-PF; Thu, 12 Jan 2023 04:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLy-0003Ik-8w
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:34 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLw-0004On-A3
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 17so19761655pll.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRMcrQNWuNH3M5P4wc2a1MOlo+ywdHox1S8uAnSAJSs=;
 b=Iafksnf2qKbSGt8mo3GQNQ5DzRUPfM2BAezqlipOq1jfD8zAKTZ/VciG87vvGg7GNT
 clcwdzx7SCQM3TcA2lh5iFyLZS3wcW4EuSPc/+ddZpZ3diXD7rmDjSa+rrgOAlmy1E9e
 uGKZlAmzNwUrn3bb521RT4p67+5WchpW8R0X6deS4n0Z8WhIIvimT3ZEYmvG4ojU5+0K
 Egj0g3Lxp72y/PaWUOKy2QyL+87F4fCJfw3Rfe3cX7GAnjNSy9PUaSuC5SQ0+tA7quP1
 rTqdjAgU70ErskplzwVFudHupcvSkBjdm6nMWxx/XwalhcckiHVttcYsOPcizsZbCZU/
 ob+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRMcrQNWuNH3M5P4wc2a1MOlo+ywdHox1S8uAnSAJSs=;
 b=qJbDYqhAWfb4J35lrlhrbEdyuPqxuIvFuRRLh70IQJ84iI9tbF4lWNproyLRQjcuRs
 4SC3Aog+8zHBVEPeDqKGeMk9vSXA5h5JwOoiPWdRrRlFsj31TcmjHsLas5kjfKA5riDL
 WDYy5bq2MSxfuqttTxc85Gt0+T24ENTznyHlyHew/ajYa+gHepw4J+PX0BudcD3L7aa2
 5oYTMC+ntZ8H5GxwdpZWNVBcI1m9FzNBQDpzIHKq5NWo1lKWzB4734upr+/xpvyPz5pu
 woiNxd8eiS1LZm1tWumHFDRfYE6OV9wFnMx9MrSzO6IM7W0Y0Yt2MJ8vhdN2eZMXpNO4
 GCvw==
X-Gm-Message-State: AFqh2koU141/UETWYdMhl+3+DIcFDZJWRiL/hdm2x7lNk494TZ5F+8K6
 3H6YT/r406hOoEI4doNU2C2Xnw==
X-Google-Smtp-Source: AMrXdXulW0oZzbK5DHBUQ/nWuALgTSeBtNwo2au/CATp5c2jpYKH9ayInPIsnFRPq0fqz3ZHN7QRBQ==
X-Received: by 2002:a17:90b:101:b0:229:1190:44ae with SMTP id
 p1-20020a17090b010100b00229119044aemr190017pjz.7.1673517510424; 
 Thu, 12 Jan 2023 01:58:30 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:30 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 07/31] e1000: Use more constant definitions
Date: Thu, 12 Jan 2023 18:57:19 +0900
Message-Id: <20230112095743.20123-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/net/e1000.c         | 50 +++++++++++++++++++++++-------------------
 hw/net/e1000_regs.h    |  9 ++++++++
 hw/net/e1000x_common.c |  5 +++--
 hw/net/e1000x_common.h |  2 +-
 4 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 7c28200cab..8412a751ae 100644
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
index 34176189ae..5bddd235bb 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "hw/net/mii.h"
 #include "hw/pci/pci.h"
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
2.39.0


