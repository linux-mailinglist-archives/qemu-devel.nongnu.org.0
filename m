Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37786AD80E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRRm-0007Y9-1n; Tue, 07 Mar 2023 02:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRh-0007XG-L8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRf-0005O8-UD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZbEehoVtAGf1Nc19/QFj2HUous+hvRRAu2jpzqJ2JA=;
 b=dbBKy4vEZeBBCN8WkXZwpQamufMSsfxiYxffjJWAk9OmhyD4M+JjBS4E+CeSAWY66hwcrI
 iSC2SbkpKSxMHFCWu2BBuiojrSkldP98wK6g9zrPrzT44aA1nje9IOZ9DrPLfA2sANkp/W
 DBpzSKrWVUkG9sZTZrGfk+/QCXo8/rg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-P1UwE2dMO6qquzPw1mwKjw-1; Tue, 07 Mar 2023 02:09:07 -0500
X-MC-Unique: P1UwE2dMO6qquzPw1mwKjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D29D11C08781;
 Tue,  7 Mar 2023 07:09:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90B4E4014D1B;
 Tue,  7 Mar 2023 07:09:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 03/51] fsl_etsec: Use hw/net/mii.h
Date: Tue,  7 Mar 2023 15:07:28 +0800
Message-Id: <20230307070816.34833-4-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

hw/net/mii.h provides common definitions for MII.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/fsl_etsec/etsec.c | 11 ++++++-----
 hw/net/fsl_etsec/etsec.h | 17 -----------------
 hw/net/fsl_etsec/miim.c  |  5 +++--
 include/hw/net/mii.h     |  1 +
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index c753bfb..798ea33 100644
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
index 3c625c9..3860864 100644
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
index 6bba01c..b48d2cb 100644
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
index c6a767a..ed1bb52 100644
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
2.7.4


