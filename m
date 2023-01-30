Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A456680F7E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUVm-0003wY-N4; Mon, 30 Jan 2023 08:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVb-0003pm-8Y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:44 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVY-0003Y8-Ds
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:42 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z1so4123426plg.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIOeRLbPMJAuFIcNQlo+uN8HcDv0eMoJ6T+gd5Ur6Ps=;
 b=6MN1ayIXiH2EYkBfGW+QA16IAfl42YjEZkyaYo60J2qjmWykJtMTldxBUdVfHLuRua
 spWx1O7EWjQjc7PL0+IDow8dVvOqt+TBOLhN5wYjkGBScj855IyMbIx7xLgzlmcvrTV5
 ApeA5RdcdMpGcOdFn16it2O3qv9n1nl37i1jBu/k3hoOKZtuho2Z5uuRXpLaBmARGoeL
 kNRrqGAxm8ZHnP3YwB2xruKEg1abZUDboZL/lMQgoKzYs/rrI4iTWIc3G1sLWzPNygQw
 tw20g7fU0yreEzLxPON0yhYZk8oiJO+GfOSpFPvHkFkgz+HluKd16DvQTCJmFNzIcUgi
 MiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIOeRLbPMJAuFIcNQlo+uN8HcDv0eMoJ6T+gd5Ur6Ps=;
 b=NBVonKuKg5OXsU5xkus+mZi9dj5P7hS5d45pgt4b3Sp5eVd24DoCLAGXZs7ioJl7/x
 SfxOU9CEX+GIVDQeWJJZAHYO3bC5qeRBgn2gAr5ikbAj221EXtfKMbyKlsz9FbOajnFm
 4ewWB0lKbHAh3OL0pOlrpvX3Cq4Qi0dB1ut6fRAUilWWSZqRFMfOlzn1pzRXgAlOW2Cx
 Rb/Bcq+B7t9Ce8Lb8LIkLA5k4LCmRSRsArGCZu/pQfWOpRtut3Dv/C4vjW1XzQUOfM5j
 bNmvoxqHvwZUSm+8ueUkwSzF8B1A1Mc34jmrw21Ki87/9gXXPmtffuM2dDNbcdOuMOnf
 hU+Q==
X-Gm-Message-State: AO0yUKVIEIyhERyZ1mwTBWgaEZLvYiz0i/tVAuQNYzDOBgzSYLGrnlLm
 xXuojrr2ru8rFu6h7hj3LUacZQ==
X-Google-Smtp-Source: AK7set/JvmcDl20zpM7sSQJfck/Gjzacz28pa8NqcKCQDFwnFZNr4/kwiY/LNo6TtT5ohciCrRGZlQ==
X-Received: by 2002:a17:902:e84b:b0:196:6496:85fa with SMTP id
 t11-20020a170902e84b00b00196649685famr10923215plg.26.1675086454747; 
 Mon, 30 Jan 2023 05:47:34 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:47:34 -0800 (PST)
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
Subject: [PATCH v4 03/28] fsl_etsec: Use hw/net/mii.h
Date: Mon, 30 Jan 2023 22:46:50 +0900
Message-Id: <20230130134715.76604-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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
 hw/net/fsl_etsec/etsec.c | 11 ++++++-----
 hw/net/fsl_etsec/etsec.h | 17 -----------------
 hw/net/fsl_etsec/miim.c  |  5 +++--
 include/hw/net/mii.h     |  1 +
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index c753bfb3a8..798ea33d08 100644
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
diff --git a/include/hw/net/mii.h b/include/hw/net/mii.h
index c6a767a49a..ed1bb52b0f 100644
--- a/include/hw/net/mii.h
+++ b/include/hw/net/mii.h
@@ -55,6 +55,7 @@
 #define MII_BMCR_CTST       (1 << 7)  /* Collision test */
 #define MII_BMCR_SPEED1000  (1 << 6)  /* MSB of Speed (1000) */
 
+#define MII_BMSR_100T4      (1 << 15) /* Can do 100mbps T4 */
 #define MII_BMSR_100TX_FD   (1 << 14) /* Can do 100mbps, full-duplex */
 #define MII_BMSR_100TX_HD   (1 << 13) /* Can do 100mbps, half-duplex */
 #define MII_BMSR_10T_FD     (1 << 12) /* Can do 10mbps, full-duplex */
-- 
2.39.1


