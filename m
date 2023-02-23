Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F375F6A0610
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8il-0005wK-R8; Thu, 23 Feb 2023 05:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8ij-0005v5-Mi
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:01 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8ih-0001GF-5E
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:01 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso12032021pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuOZkh7/FsK7pTAIZRY0T7k4W6zYsds58jVwZOXAh5g=;
 b=EgPJ68twT3m5OfwiW9mFdpczro8oYI8enwGViG9lIGyeOQheY0r4hUS1IAbPuls454
 /IOV3wrp4kxQWtgtnBcj60GIvv8D/Tefq8+uUrP4yFak9qbh2jGJd8jdX6bhXDTUKiLD
 27SrVZDPWM0vi+/2GC5I/iWpD7NCZy18yfNunPuZyzxFgQGLOyET93MVs5ymLHxv9vwp
 riK/rCgX8HfBkbgrlFUFGyp9bA4NiD1+490xFvh3LweUpfasBaT+6hZbsYRjGUN083fS
 hRqXIzmCfLM+6iujy/7sxmWSQrMFoMdErj25LX/lbLSYHOo5QBwrgGW24whVRr0su+XE
 XLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuOZkh7/FsK7pTAIZRY0T7k4W6zYsds58jVwZOXAh5g=;
 b=0B7CzaxkVLRgH/NadOUM9618UaSsYaajmJyWXLop4d3IIz54XKS77OqmDlY8rBVNRJ
 b19Ekf5QTB32YKMOvN6nRKQFFCch0Cki85YKgruEZWaazaQsgKTgBIA8iXk/s8OJeNji
 bX48t6dL60UAIPPDHNxuPW+fgcStF6T5Zlei8YCO0Da/DgApnjjNr/g0lkgYvQWhS17w
 j3j6d9SFrRF6MG7/R1CsKJ1nfizJZkel1gj8JcgzDW+Ara5dqlg5T+srym77075eOZYo
 4uJIwCBMAcFpguGHaJkAvNBzyXR8gtRL6D+Er3gu+qYyIBCKNJlQ2Xx8hQTOy5Tfi9IO
 ErdA==
X-Gm-Message-State: AO0yUKV8agio4+FvAXsbAHdBEqGJW+YyMHMtHKU5PVLGgQjmlKTmPJuv
 teTxI5vqwdRuFAhqWkIzsW0ALg==
X-Google-Smtp-Source: AK7set+sL4+fUUBtxBcitE0Q/TpHWmd1b2VAmWSz7Mv6jYtAmt8Y0AS2+M2WIhwXtZjsagQ612Lu4A==
X-Received: by 2002:a17:903:1ca:b0:199:41a5:1085 with SMTP id
 e10-20020a17090301ca00b0019941a51085mr15861093plh.33.1677147657619; 
 Thu, 23 Feb 2023 02:20:57 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:20:57 -0800 (PST)
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
Subject: [PATCH v6 04/34] e1000: Use hw/net/mii.h
Date: Thu, 23 Feb 2023 19:19:48 +0900
Message-Id: <20230223102018.141748-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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

hw/net/mii.h provides common definitions for MII.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000.c         | 86 ++++++++++++++++++------------------
 hw/net/e1000_regs.h    | 46 --------------------
 hw/net/e1000e.c        |  1 +
 hw/net/e1000e_core.c   | 99 +++++++++++++++++++++---------------------
 hw/net/e1000x_common.c |  5 ++-
 hw/net/e1000x_common.h |  8 ++--
 6 files changed, 101 insertions(+), 144 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 8ee30aa37c..9619a2e481 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -26,6 +26,7 @@
 
 
 #include "qemu/osdep.h"
+#include "hw/net/mii.h"
 #include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -181,67 +182,67 @@ e1000_autoneg_done(E1000State *s)
 static bool
 have_autoneg(E1000State *s)
 {
-    return chkflag(AUTONEG) && (s->phy_reg[PHY_CTRL] & MII_CR_AUTO_NEG_EN);
+    return chkflag(AUTONEG) && (s->phy_reg[MII_BMCR] & MII_BMCR_AUTOEN);
 }
 
 static void
 set_phy_ctrl(E1000State *s, int index, uint16_t val)
 {
-    /* bits 0-5 reserved; MII_CR_[RESTART_AUTO_NEG,RESET] are self clearing */
-    s->phy_reg[PHY_CTRL] = val & ~(0x3f |
-                                   MII_CR_RESET |
-                                   MII_CR_RESTART_AUTO_NEG);
+    /* bits 0-5 reserved; MII_BMCR_[ANRESTART,RESET] are self clearing */
+    s->phy_reg[MII_BMCR] = val & ~(0x3f |
+                                   MII_BMCR_RESET |
+                                   MII_BMCR_ANRESTART);
 
     /*
      * QEMU 1.3 does not support link auto-negotiation emulation, so if we
      * migrate during auto negotiation, after migration the link will be
      * down.
      */
-    if (have_autoneg(s) && (val & MII_CR_RESTART_AUTO_NEG)) {
+    if (have_autoneg(s) && (val & MII_BMCR_ANRESTART)) {
         e1000x_restart_autoneg(s->mac_reg, s->phy_reg, s->autoneg_timer);
     }
 }
 
 static void (*phyreg_writeops[])(E1000State *, int, uint16_t) = {
-    [PHY_CTRL] = set_phy_ctrl,
+    [MII_BMCR] = set_phy_ctrl,
 };
 
 enum { NPHYWRITEOPS = ARRAY_SIZE(phyreg_writeops) };
 
 enum { PHY_R = 1, PHY_W = 2, PHY_RW = PHY_R | PHY_W };
 static const char phy_regcap[0x20] = {
-    [PHY_STATUS]      = PHY_R,     [M88E1000_EXT_PHY_SPEC_CTRL] = PHY_RW,
-    [PHY_ID1]         = PHY_R,     [M88E1000_PHY_SPEC_CTRL]     = PHY_RW,
-    [PHY_CTRL]        = PHY_RW,    [PHY_1000T_CTRL]             = PHY_RW,
-    [PHY_LP_ABILITY]  = PHY_R,     [PHY_1000T_STATUS]           = PHY_R,
-    [PHY_AUTONEG_ADV] = PHY_RW,    [M88E1000_RX_ERR_CNTR]       = PHY_R,
-    [PHY_ID2]         = PHY_R,     [M88E1000_PHY_SPEC_STATUS]   = PHY_R,
-    [PHY_AUTONEG_EXP] = PHY_R,
+    [MII_BMSR]   = PHY_R,     [M88E1000_EXT_PHY_SPEC_CTRL] = PHY_RW,
+    [MII_PHYID1] = PHY_R,     [M88E1000_PHY_SPEC_CTRL]     = PHY_RW,
+    [MII_BMCR]   = PHY_RW,    [MII_CTRL1000]               = PHY_RW,
+    [MII_ANLPAR] = PHY_R,     [MII_STAT1000]               = PHY_R,
+    [MII_ANAR]   = PHY_RW,    [M88E1000_RX_ERR_CNTR]       = PHY_R,
+    [MII_PHYID2] = PHY_R,     [M88E1000_PHY_SPEC_STATUS]   = PHY_R,
+    [MII_ANER]   = PHY_R,
 };
 
-/* PHY_ID2 documented in 8254x_GBe_SDM.pdf, pp. 250 */
+/* MII_PHYID2 documented in 8254x_GBe_SDM.pdf, pp. 250 */
 static const uint16_t phy_reg_init[] = {
-    [PHY_CTRL]   = MII_CR_SPEED_SELECT_MSB |
-                   MII_CR_FULL_DUPLEX |
-                   MII_CR_AUTO_NEG_EN,
-
-    [PHY_STATUS] = MII_SR_EXTENDED_CAPS |
-                   MII_SR_LINK_STATUS |   /* link initially up */
-                   MII_SR_AUTONEG_CAPS |
-                   /* MII_SR_AUTONEG_COMPLETE: initially NOT completed */
-                   MII_SR_PREAMBLE_SUPPRESS |
-                   MII_SR_EXTENDED_STATUS |
-                   MII_SR_10T_HD_CAPS |
-                   MII_SR_10T_FD_CAPS |
-                   MII_SR_100X_HD_CAPS |
-                   MII_SR_100X_FD_CAPS,
-
-    [PHY_ID1] = 0x141,
-    /* [PHY_ID2] configured per DevId, from e1000_reset() */
-    [PHY_AUTONEG_ADV] = 0xde1,
-    [PHY_LP_ABILITY] = 0x1e0,
-    [PHY_1000T_CTRL] = 0x0e00,
-    [PHY_1000T_STATUS] = 0x3c00,
+    [MII_BMCR] = MII_BMCR_SPEED1000 |
+                 MII_BMCR_FD |
+                 MII_BMCR_AUTOEN,
+
+    [MII_BMSR] = MII_BMSR_EXTCAP |
+                 MII_BMSR_LINK_ST |   /* link initially up */
+                 MII_BMSR_AUTONEG |
+                 /* MII_BMSR_AN_COMP: initially NOT completed */
+                 MII_BMSR_MFPS |
+                 MII_BMSR_EXTSTAT |
+                 MII_BMSR_10T_HD |
+                 MII_BMSR_10T_FD |
+                 MII_BMSR_100TX_HD |
+                 MII_BMSR_100TX_FD,
+
+    [MII_PHYID1] = 0x141,
+    /* [MII_PHYID2] configured per DevId, from e1000_reset() */
+    [MII_ANAR] = 0xde1,
+    [MII_ANLPAR] = 0x1e0,
+    [MII_CTRL1000] = 0x0e00,
+    [MII_STAT1000] = 0x3c00,
     [M88E1000_PHY_SPEC_CTRL] = 0x360,
     [M88E1000_PHY_SPEC_STATUS] = 0xac00,
     [M88E1000_EXT_PHY_SPEC_CTRL] = 0x0d60,
@@ -387,7 +388,7 @@ static void e1000_reset(void *opaque)
     d->mit_ide = 0;
     memset(d->phy_reg, 0, sizeof d->phy_reg);
     memmove(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
-    d->phy_reg[PHY_ID2] = edc->phy_id2;
+    d->phy_reg[MII_PHYID2] = edc->phy_id2;
     memset(d->mac_reg, 0, sizeof d->mac_reg);
     memmove(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
     d->rxbuf_min_shift = 1;
@@ -561,7 +562,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf, int size)
                                     PTC1023, PTC1522 };
 
     NetClientState *nc = qemu_get_queue(s->nic);
-    if (s->phy_reg[PHY_CTRL] & MII_CR_LOOPBACK) {
+    if (s->phy_reg[MII_BMCR] & MII_BMCR_LOOPBACK) {
         qemu_receive_packet(nc, buf, size);
     } else {
         qemu_send_packet(nc, buf, size);
@@ -842,7 +843,7 @@ e1000_set_link_status(NetClientState *nc)
         e1000x_update_regs_on_link_down(s->mac_reg, s->phy_reg);
     } else {
         if (have_autoneg(s) &&
-            !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
+            !(s->phy_reg[MII_BMSR] & MII_BMSR_AN_COMP)) {
             e1000x_restart_autoneg(s->mac_reg, s->phy_reg, s->autoneg_timer);
         } else {
             e1000_link_up(s);
@@ -1416,10 +1417,10 @@ static int e1000_pre_save(void *opaque)
     /*
      * If link is down and auto-negotiation is supported and ongoing,
      * complete auto-negotiation immediately. This allows us to look
-     * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
+     * at MII_BMSR_AN_COMP to infer link status on load.
      */
     if (nc->link_down && have_autoneg(s)) {
-        s->phy_reg[PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
+        s->phy_reg[MII_BMSR] |= MII_BMSR_AN_COMP;
     }
 
     /* Decide which set of props to migrate in the main structure */
@@ -1458,8 +1459,7 @@ static int e1000_post_load(void *opaque, int version_id)
      * Alternatively, restart link negotiation if it was in progress. */
     nc->link_down = (s->mac_reg[STATUS] & E1000_STATUS_LU) == 0;
 
-    if (have_autoneg(s) &&
-        !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
+    if (have_autoneg(s) && !(s->phy_reg[MII_BMSR] & MII_BMSR_AN_COMP)) {
         nc->link_down = false;
         timer_mod(s->autoneg_timer,
                   qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 500);
diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 59e050742b..59d6eb3189 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -474,20 +474,6 @@
 #define E1000_TARC_ENABLE BIT(10)
 
 /* PHY 1000 MII Register/Bit Definitions */
-/* PHY Registers defined by IEEE */
-#define PHY_CTRL         0x00 /* Control Register */
-#define PHY_STATUS       0x01 /* Status Regiser */
-#define PHY_ID1          0x02 /* Phy Id Reg (word 1) */
-#define PHY_ID2          0x03 /* Phy Id Reg (word 2) */
-#define PHY_AUTONEG_ADV  0x04 /* Autoneg Advertisement */
-#define PHY_LP_ABILITY   0x05 /* Link Partner Ability (Base Page) */
-#define PHY_AUTONEG_EXP  0x06 /* Autoneg Expansion Reg */
-#define PHY_NEXT_PAGE_TX 0x07 /* Next Page TX */
-#define PHY_LP_NEXT_PAGE 0x08 /* Link Partner Next Page */
-#define PHY_1000T_CTRL   0x09 /* 1000Base-T Control Reg */
-#define PHY_1000T_STATUS 0x0A /* 1000Base-T Status Reg */
-#define PHY_EXT_STATUS   0x0F /* Extended Status Reg */
-
 /* 82574-specific registers */
 #define PHY_COPPER_CTRL1      0x10 /* Copper Specific Control Register 1 */
 #define PHY_COPPER_STAT1      0x11 /* Copper Specific Status Register 1 */
@@ -539,38 +525,6 @@
 #define M88E1000_PHY_VCO_REG_BIT8  0x100 /* Bits 8 & 11 are adjusted for */
 #define M88E1000_PHY_VCO_REG_BIT11 0x800    /* improved BER performance */
 
-/* PHY Control Register */
-#define MII_CR_SPEED_SELECT_MSB 0x0040 /* bits 6,13: 10=1000, 01=100, 00=10 */
-#define MII_CR_COLL_TEST_ENABLE 0x0080 /* Collision test enable */
-#define MII_CR_FULL_DUPLEX      0x0100 /* FDX =1, half duplex =0 */
-#define MII_CR_RESTART_AUTO_NEG 0x0200 /* Restart auto negotiation */
-#define MII_CR_ISOLATE          0x0400 /* Isolate PHY from MII */
-#define MII_CR_POWER_DOWN       0x0800 /* Power down */
-#define MII_CR_AUTO_NEG_EN      0x1000 /* Auto Neg Enable */
-#define MII_CR_SPEED_SELECT_LSB 0x2000 /* bits 6,13: 10=1000, 01=100, 00=10 */
-#define MII_CR_LOOPBACK         0x4000 /* 0 = normal, 1 = loopback */
-#define MII_CR_RESET            0x8000 /* 0 = normal, 1 = PHY reset */
-
-/* PHY Status Register */
-#define MII_SR_EXTENDED_CAPS     0x0001    /* Extended register capabilities */
-#define MII_SR_JABBER_DETECT     0x0002    /* Jabber Detected */
-#define MII_SR_LINK_STATUS       0x0004    /* Link Status 1 = link */
-#define MII_SR_AUTONEG_CAPS      0x0008    /* Auto Neg Capable */
-#define MII_SR_REMOTE_FAULT      0x0010    /* Remote Fault Detect */
-#define MII_SR_AUTONEG_COMPLETE  0x0020    /* Auto Neg Complete */
-#define MII_SR_PREAMBLE_SUPPRESS 0x0040    /* Preamble may be suppressed */
-#define MII_SR_EXTENDED_STATUS   0x0100    /* Ext. status info in Reg 0x0F */
-#define MII_SR_100T2_HD_CAPS     0x0200    /* 100T2 Half Duplex Capable */
-#define MII_SR_100T2_FD_CAPS     0x0400    /* 100T2 Full Duplex Capable */
-#define MII_SR_10T_HD_CAPS       0x0800    /* 10T   Half Duplex Capable */
-#define MII_SR_10T_FD_CAPS       0x1000    /* 10T   Full Duplex Capable */
-#define MII_SR_100X_HD_CAPS      0x2000    /* 100X  Half Duplex Capable */
-#define MII_SR_100X_FD_CAPS      0x4000    /* 100X  Full Duplex Capable */
-#define MII_SR_100T4_CAPS        0x8000    /* 100T4 Capable */
-
-/* PHY Link Partner Ability Register */
-#define MII_LPAR_LPACK           0x4000 /* Acked by link partner */
-
 /* Interrupt Cause Read */
 #define E1000_ICR_TXDW          0x00000001 /* Transmit desc written back */
 #define E1000_ICR_TXQE          0x00000002 /* Transmit Queue empty */
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 8635ca16c6..d591d01c07 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -42,6 +42,7 @@
 #include "qemu/range.h"
 #include "sysemu/sysemu.h"
 #include "hw/hw.h"
+#include "hw/net/mii.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index c4be782558..181c1e0c2a 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -37,6 +37,7 @@
 #include "qemu/log.h"
 #include "net/net.h"
 #include "net/tap.h"
+#include "hw/net/mii.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "sysemu/runstate.h"
@@ -659,7 +660,7 @@ e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
 
     net_tx_pkt_dump(tx->tx_pkt);
 
-    if ((core->phy[0][PHY_CTRL] & MII_CR_LOOPBACK) ||
+    if ((core->phy[0][MII_BMCR] & MII_BMCR_LOOPBACK) ||
         ((core->mac[RCTL] & E1000_RCTL_LBM_MAC) == E1000_RCTL_LBM_MAC)) {
         return net_tx_pkt_send_loopback(tx->tx_pkt, queue);
     } else {
@@ -1797,13 +1798,13 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 static inline bool
 e1000e_have_autoneg(E1000ECore *core)
 {
-    return core->phy[0][PHY_CTRL] & MII_CR_AUTO_NEG_EN;
+    return core->phy[0][MII_BMCR] & MII_BMCR_AUTOEN;
 }
 
 static void e1000e_update_flowctl_status(E1000ECore *core)
 {
     if (e1000e_have_autoneg(core) &&
-        core->phy[0][PHY_STATUS] & MII_SR_AUTONEG_COMPLETE) {
+        core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP) {
         trace_e1000e_link_autoneg_flowctl(true);
         core->mac[CTRL] |= E1000_CTRL_TFCE | E1000_CTRL_RFCE;
     } else {
@@ -1821,12 +1822,12 @@ e1000e_link_down(E1000ECore *core)
 static inline void
 e1000e_set_phy_ctrl(E1000ECore *core, int index, uint16_t val)
 {
-    /* bits 0-5 reserved; MII_CR_[RESTART_AUTO_NEG,RESET] are self clearing */
-    core->phy[0][PHY_CTRL] = val & ~(0x3f |
-                                     MII_CR_RESET |
-                                     MII_CR_RESTART_AUTO_NEG);
+    /* bits 0-5 reserved; MII_BMCR_[ANRESTART,RESET] are self clearing */
+    core->phy[0][MII_BMCR] = val & ~(0x3f |
+                                     MII_BMCR_RESET |
+                                     MII_BMCR_ANRESTART);
 
-    if ((val & MII_CR_RESTART_AUTO_NEG) &&
+    if ((val & MII_BMCR_ANRESTART) &&
         e1000e_have_autoneg(core)) {
         e1000x_restart_autoneg(core->mac, core->phy[0], core->autoneg_timer);
     }
@@ -1860,7 +1861,7 @@ e1000e_core_set_link_status(E1000ECore *core)
         e1000x_update_regs_on_link_down(core->mac, core->phy[0]);
     } else {
         if (e1000e_have_autoneg(core) &&
-            !(core->phy[0][PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
+            !(core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP)) {
             e1000x_restart_autoneg(core->mac, core->phy[0],
                                    core->autoneg_timer);
         } else {
@@ -2002,7 +2003,7 @@ static
 void(*e1000e_phyreg_writeops[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE])
 (E1000ECore *, int, uint16_t) = {
     [0] = {
-        [PHY_CTRL]     = e1000e_set_phy_ctrl,
+        [MII_BMCR]     = e1000e_set_phy_ctrl,
         [PHY_PAGE]     = e1000e_set_phy_page,
         [PHY_OEM_BITS] = e1000e_set_phy_oem_bits
     }
@@ -2274,19 +2275,19 @@ e1000e_get_reg_index_with_offset(const uint16_t *mac_reg_access, hwaddr addr)
 
 static const char e1000e_phy_regcap[E1000E_PHY_PAGES][0x20] = {
     [0] = {
-        [PHY_CTRL]          = PHY_ANYPAGE | PHY_RW,
-        [PHY_STATUS]        = PHY_ANYPAGE | PHY_R,
-        [PHY_ID1]           = PHY_ANYPAGE | PHY_R,
-        [PHY_ID2]           = PHY_ANYPAGE | PHY_R,
-        [PHY_AUTONEG_ADV]   = PHY_ANYPAGE | PHY_RW,
-        [PHY_LP_ABILITY]    = PHY_ANYPAGE | PHY_R,
-        [PHY_AUTONEG_EXP]   = PHY_ANYPAGE | PHY_R,
-        [PHY_NEXT_PAGE_TX]  = PHY_ANYPAGE | PHY_RW,
-        [PHY_LP_NEXT_PAGE]  = PHY_ANYPAGE | PHY_R,
-        [PHY_1000T_CTRL]    = PHY_ANYPAGE | PHY_RW,
-        [PHY_1000T_STATUS]  = PHY_ANYPAGE | PHY_R,
-        [PHY_EXT_STATUS]    = PHY_ANYPAGE | PHY_R,
-        [PHY_PAGE]          = PHY_ANYPAGE | PHY_RW,
+        [MII_BMCR]              = PHY_ANYPAGE | PHY_RW,
+        [MII_BMSR]              = PHY_ANYPAGE | PHY_R,
+        [MII_PHYID1]            = PHY_ANYPAGE | PHY_R,
+        [MII_PHYID2]            = PHY_ANYPAGE | PHY_R,
+        [MII_ANAR]              = PHY_ANYPAGE | PHY_RW,
+        [MII_ANLPAR]            = PHY_ANYPAGE | PHY_R,
+        [MII_ANER]              = PHY_ANYPAGE | PHY_R,
+        [MII_ANNP]              = PHY_ANYPAGE | PHY_RW,
+        [MII_ANLPRNP]           = PHY_ANYPAGE | PHY_R,
+        [MII_CTRL1000]          = PHY_ANYPAGE | PHY_RW,
+        [MII_STAT1000]          = PHY_ANYPAGE | PHY_R,
+        [MII_EXTSTAT]           = PHY_ANYPAGE | PHY_R,
+        [PHY_PAGE]              = PHY_ANYPAGE | PHY_RW,
 
         [PHY_COPPER_CTRL1]      = PHY_RW,
         [PHY_COPPER_STAT1]      = PHY_R,
@@ -3355,7 +3356,7 @@ static void
 e1000e_autoneg_resume(E1000ECore *core)
 {
     if (e1000e_have_autoneg(core) &&
-        !(core->phy[0][PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
+        !(core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP)) {
         qemu_get_queue(core->owner_nic)->link_down = false;
         timer_mod(core->autoneg_timer,
                   qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 500);
@@ -3430,29 +3431,29 @@ e1000e_core_pci_uninit(E1000ECore *core)
 static const uint16_t
 e1000e_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
     [0] = {
-        [PHY_CTRL] =   MII_CR_SPEED_SELECT_MSB  |
-                       MII_CR_FULL_DUPLEX       |
-                       MII_CR_AUTO_NEG_EN,
-
-        [PHY_STATUS] = MII_SR_EXTENDED_CAPS     |
-                       MII_SR_LINK_STATUS       |
-                       MII_SR_AUTONEG_CAPS      |
-                       MII_SR_PREAMBLE_SUPPRESS |
-                       MII_SR_EXTENDED_STATUS   |
-                       MII_SR_10T_HD_CAPS       |
-                       MII_SR_10T_FD_CAPS       |
-                       MII_SR_100X_HD_CAPS      |
-                       MII_SR_100X_FD_CAPS,
-
-        [PHY_ID1]               = 0x141,
-        [PHY_ID2]               = E1000_PHY_ID2_82574x,
-        [PHY_AUTONEG_ADV]       = 0xde1,
-        [PHY_LP_ABILITY]        = 0x7e0,
-        [PHY_AUTONEG_EXP]       = BIT(2),
-        [PHY_NEXT_PAGE_TX]      = BIT(0) | BIT(13),
-        [PHY_1000T_CTRL]        = BIT(8) | BIT(9) | BIT(10) | BIT(11),
-        [PHY_1000T_STATUS]      = 0x3c00,
-        [PHY_EXT_STATUS]        = BIT(12) | BIT(13),
+        [MII_BMCR] = MII_BMCR_SPEED1000 |
+                     MII_BMCR_FD        |
+                     MII_BMCR_AUTOEN,
+
+        [MII_BMSR] = MII_BMSR_EXTCAP    |
+                     MII_BMSR_LINK_ST   |
+                     MII_BMSR_AUTONEG   |
+                     MII_BMSR_MFPS      |
+                     MII_BMSR_EXTSTAT   |
+                     MII_BMSR_10T_HD    |
+                     MII_BMSR_10T_FD    |
+                     MII_BMSR_100TX_HD  |
+                     MII_BMSR_100TX_FD,
+
+        [MII_PHYID1]            = 0x141,
+        [MII_PHYID2]            = E1000_PHY_ID2_82574x,
+        [MII_ANAR]              = 0xde1,
+        [MII_ANLPAR]            = 0x7e0,
+        [MII_ANER]              = BIT(2),
+        [MII_ANNP]              = BIT(0) | BIT(13),
+        [MII_CTRL1000]          = BIT(8) | BIT(9) | BIT(10) | BIT(11),
+        [MII_STAT1000]          = 0x3c00,
+        [MII_EXTSTAT]           = BIT(12) | BIT(13),
 
         [PHY_COPPER_CTRL1]      = BIT(5) | BIT(6) | BIT(8) | BIT(9) |
                                   BIT(12) | BIT(13),
@@ -3546,10 +3547,10 @@ void e1000e_core_pre_save(E1000ECore *core)
     /*
      * If link is down and auto-negotiation is supported and ongoing,
      * complete auto-negotiation immediately. This allows us to look
-     * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
+     * at MII_BMSR_AN_COMP to infer link status on load.
      */
     if (nc->link_down && e1000e_have_autoneg(core)) {
-        core->phy[0][PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
+        core->phy[0][MII_BMSR] |= MII_BMSR_AN_COMP;
         e1000e_update_flowctl_status(core);
     }
 
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index 2f43e8cd13..e79d4c79bd 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "hw/net/mii.h"
 #include "hw/pci/pci_device.h"
 #include "net/net.h"
 
@@ -152,8 +153,8 @@ void e1000x_reset_mac_addr(NICState *nic, uint32_t *mac_regs,
 void e1000x_update_regs_on_autoneg_done(uint32_t *mac, uint16_t *phy)
 {
     e1000x_update_regs_on_link_up(mac, phy);
-    phy[PHY_LP_ABILITY] |= MII_LPAR_LPACK;
-    phy[PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
+    phy[MII_ANLPAR] |= MII_ANLPAR_ACK;
+    phy[MII_BMSR] |= MII_BMSR_AN_COMP;
     trace_e1000x_link_negotiation_done();
 }
 
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index bc1ee75b04..3501e4855a 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -152,16 +152,16 @@ static inline void
 e1000x_update_regs_on_link_down(uint32_t *mac, uint16_t *phy)
 {
     mac[STATUS] &= ~E1000_STATUS_LU;
-    phy[PHY_STATUS] &= ~MII_SR_LINK_STATUS;
-    phy[PHY_STATUS] &= ~MII_SR_AUTONEG_COMPLETE;
-    phy[PHY_LP_ABILITY] &= ~MII_LPAR_LPACK;
+    phy[MII_BMSR] &= ~MII_BMSR_LINK_ST;
+    phy[MII_BMSR] &= ~MII_BMSR_AN_COMP;
+    phy[MII_ANLPAR] &= ~MII_ANLPAR_ACK;
 }
 
 static inline void
 e1000x_update_regs_on_link_up(uint32_t *mac, uint16_t *phy)
 {
     mac[STATUS] |= E1000_STATUS_LU;
-    phy[PHY_STATUS] |= MII_SR_LINK_STATUS;
+    phy[MII_BMSR] |= MII_BMSR_LINK_ST;
 }
 
 void e1000x_update_rx_total_stats(uint32_t *mac,
-- 
2.39.1


