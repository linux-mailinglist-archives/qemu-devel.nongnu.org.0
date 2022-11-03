Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BCF617688
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 07:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqTIC-0004a4-PE; Thu, 03 Nov 2022 02:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqTHz-0004XU-KL
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 02:01:21 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqTHv-0005Gp-H3
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 02:01:18 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r18so781791pgr.12
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iadsvkrOuAV9uSiiWKK1ow6hUysRuQosx3dMCxITHBw=;
 b=z18O9sKItsaSCJ4JjIzr2FNXsv880uyJEDKRgfBGZ8Ho8yJ5D1aJAAlA32RUlYFZka
 K1QHrWnhXqZIfOegB5AelOeBkIS2pVnVXsStcCmVkp6BJe56dokRYk7bewof6w2NVCCp
 lws8BQbG5p2aourhlyS09E5EMm9KC/oMwHUdfNvCg5skKF1h8lLbOA7GBMivIok2QVyB
 c2D4nVdMSiQcYkHIOD7qgnAYlWRksrf56rZ1PkHhrh/Sq7sBkz942cGgG/WbkqP85A3L
 PEzA74fyk+hGpIWzKK/Qw2eeiPrjJ1uq0bPjoCmAC2Se2wjs+Z2efjObjaLiofPPowqC
 kiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iadsvkrOuAV9uSiiWKK1ow6hUysRuQosx3dMCxITHBw=;
 b=13vhUjlFYaBJ/WZPvoP5nhHdn5ul/KH95uRsnC6aaKPSSi9SJGTkF0P57fvHCT0RfK
 +MXwgDij3VRU05+MQUyFHP8mzpAv50CZz0hXOcwN8TvHIVO0Wl+x9Edpptaz1tm/ReMq
 IO4TixAaRjINUPnw5XzJfpwt2tzUA7wGlqyPtnAMh65dh0lCOpeXqiYQsdva3kh8sjux
 zBgo7c1gsa3ryNhkZnvewEtaqkN6X6c1Za3lBiVCL4MLgW9VPUs6qaoN2RUKweVZVDoy
 PdEfDR3jJ0DwxAXPGYKxiDTTUz+dqSwNLTZFX/5m0WREtOq6gX7Jm0wNZRUB6VNMzoAM
 NlNA==
X-Gm-Message-State: ACrzQf2B+Z4Pnoq/8Ciu5oKT4SR3dyIwkG1Kok1ZkKDBh4x2GaDLz4aN
 0uxSrpHI0bVryVnha78zBlw83+gdewm+MAlk
X-Google-Smtp-Source: AMsMyM4a5GAMCXgdwKo/9qr03ZL5uxaVBmnhlIHxJbRc3sY20GLUq5bfAAo55v+5vJY1n2GY3PdBuw==
X-Received: by 2002:a63:eb4a:0:b0:46f:63f:a892 with SMTP id
 b10-20020a63eb4a000000b0046f063fa892mr25120826pgk.33.1667455273568; 
 Wed, 02 Nov 2022 23:01:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 pj14-20020a17090b4f4e00b0020b21019086sm4944196pjb.3.2022.11.02.23.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 23:01:13 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] fsl_etsec: Use hw/net/mii.h
Date: Thu,  3 Nov 2022 15:01:03 +0900
Message-Id: <20221103060103.83363-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hw/net/mii.h provides common definitions for MII.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/fsl_etsec/etsec.h | 17 -----------------
 include/hw/net/mii.h     |  1 +
 hw/net/fsl_etsec/etsec.c | 11 ++++++-----
 hw/net/fsl_etsec/miim.c  |  5 +++--
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index 3c625c955c..3860864a3f 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -76,23 +76,6 @@ typedef struct eTSEC_rxtx_bd {
 #define FCB_TX_CTU     (1 << 1)
 #define FCB_TX_NPH     (1 << 0)
 
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
 /* eTSEC */
 
 /* Number of register in the device */
diff --git a/include/hw/net/mii.h b/include/hw/net/mii.h
index 4ae4dcce7e..305612831e 100644
--- a/include/hw/net/mii.h
+++ b/include/hw/net/mii.h
@@ -55,6 +55,7 @@
 #define MII_BMCR_CTST       (1 << 7)  /* Collision test */
 #define MII_BMCR_SPEED1000  (1 << 6)  /* MSB of Speed (1000) */
 
+#define MII_BMSR_100T4      (1 << 15) /* Can do 100mbps T4 */
 #define MII_BMSR_100TX_FD   (1 << 14) /* Can do 100mbps, full-duplex */
 #define MII_BMSR_100TX_HD   (1 << 13) /* Can do 100mbps, half-duplex */
 #define MII_BMSR_10T_FD     (1 << 12) /* Can do 10mbps, full-duplex */
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index b75d8e3dce..b008dbb274 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -29,6 +29,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "hw/net/mii.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "etsec.h"
@@ -339,11 +340,11 @@ static void etsec_reset(DeviceState *d)
     etsec->rx_buffer_len = 0;
 
     etsec->phy_status =
-        MII_SR_EXTENDED_CAPS    | MII_SR_LINK_STATUS   | MII_SR_AUTONEG_CAPS  |
-        MII_SR_AUTONEG_COMPLETE | MII_SR_PREAMBLE_SUPPRESS |
-        MII_SR_EXTENDED_STATUS  | MII_SR_100T2_HD_CAPS | MII_SR_100T2_FD_CAPS |
-        MII_SR_10T_HD_CAPS      | MII_SR_10T_FD_CAPS   | MII_SR_100X_HD_CAPS  |
-        MII_SR_100X_FD_CAPS     | MII_SR_100T4_CAPS;
+        MII_BMSR_EXTCAP   | MII_BMSR_LINK_ST  | MII_BMSR_AUTONEG  |
+        MII_BMSR_AN_COMP  | MII_BMSR_MFPS     | MII_BMSR_EXTSTAT  |
+        MII_BMSR_100T2_HD | MII_BMSR_100T2_FD |
+        MII_BMSR_10T_HD   | MII_BMSR_10T_FD   |
+        MII_BMSR_100TX_HD | MII_BMSR_100TX_FD | MII_BMSR_100T4;
 
     etsec_update_irq(etsec);
 }
diff --git a/hw/net/fsl_etsec/miim.c b/hw/net/fsl_etsec/miim.c
index 6bba01c82a..b48d2cb57b 100644
--- a/hw/net/fsl_etsec/miim.c
+++ b/hw/net/fsl_etsec/miim.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/net/mii.h"
 #include "etsec.h"
 #include "registers.h"
 
@@ -140,8 +141,8 @@ void etsec_miim_link_status(eTSEC *etsec, NetClientState *nc)
 {
     /* Set link status */
     if (nc->link_down) {
-        etsec->phy_status &= ~MII_SR_LINK_STATUS;
+        etsec->phy_status &= ~MII_BMSR_LINK_ST;
     } else {
-        etsec->phy_status |= MII_SR_LINK_STATUS;
+        etsec->phy_status |= MII_BMSR_LINK_ST;
     }
 }
-- 
2.38.1


