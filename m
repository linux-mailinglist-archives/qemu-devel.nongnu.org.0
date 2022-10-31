Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6284A613ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCC-0007pc-Pc; Mon, 31 Oct 2022 16:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC6-0007oH-OC; Mon, 31 Oct 2022 16:15:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC5-0000rJ-0q; Mon, 31 Oct 2022 16:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kstXfHnErQZUF6Wap6hUKqfvaq6xSCaNh+lwjMRDNgU=; b=qgEOQ1NFHGbkPGsSJ49E/8VjVq
 qZcl9R1PewKh0IbaAWxte5XDgLIFJBo3S4Clh2KX4T2VGo4hQ5BYHkvstLHcTzvo2JajjzlcQB5Hq
 9Tdbu9QMFcZdpWmR1kmIaOD1uXE3lM0lXi3rvTH8yuMUkl2FmxX/kFiw29eJ9YdEWeb+deN9Q4UN5
 8Ai6s0m/BkEnVRFKnpqOyZ+2KqdEZhCtMpcNomC3lTGfJUGvblnNoB/++Zq/sqp09ijdelor/MbIQ
 bLYhTUd5iDygmf9hRCEzhDeN6K6LRh8r6rhKXKaCDaMiPg9CJVolkjv17Zh22aO8uD65tRepq5AXM
 yJc61KsRI/7yac5pD4Xlx0aMUIrJcmIBAIolXVgN7TueVYj+HvsLHu2eIxEoFNts1mgZQX4BG+ne+
 KATtsUaPgmeb5LHPl7bz7aWsQd1uRCsbCi7yP27hJz9/GMiuh8ckUheXhS+RgSOIn68RGF7+z0jgF
 mgcLyDlRbxDIqcUldyhg49EgxymJTrMna5z5Yw910OhRSC1UIF5L3KvxYgTlbBgWS16/Bb5UtzYSK
 eElsvnHutweUIWGFaAseQ7h3hTm+0EMyxOWBU4vae4rWG/THkOojnQKEOhFMRM8sTWPH0VhMI4tjR
 7N1mMeU6bR9n1ZO/PxZvQYC6ZgueP3Nx/wamZBOOY=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBw-0003Dd-Iz; Mon, 31 Oct 2022 20:15:32 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:29 +0000
Message-Id: <20221031201435.677168-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 08/14] hw/ppc/mac.h: Move macio specific parts out from shared
 header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Move the parts specific to and only used by macio out from the shared
mac.h into macio.c where they better belong.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <ac570ce9dcbae169310503689053807b8b4b86bc.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c         |  5 +++--
 hw/ppc/mac.h                  | 23 -----------------------
 include/hw/misc/macio/macio.h | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index c1fad43f6c..f9f0758b03 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -37,8 +37,9 @@
 #include "hw/intc/heathrow_pic.h"
 #include "trace.h"
 
-/* Note: this code is strongly inspirated from the corresponding code
- * in PearPC */
+#define ESCC_CLOCK 3686400
+
+/* Note: this code is strongly inspired by the corresponding code in PearPC */
 
 /*
  * The mac-io has two interfaces to the ESCC. One is called "escc-legacy",
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index e97087c7e7..55cb02c990 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -35,29 +35,6 @@
 #define KERNEL_LOAD_ADDR 0x01000000
 #define KERNEL_GAP       0x00100000
 
-#define ESCC_CLOCK 3686400
-
-/* Old World IRQs */
-#define OLDWORLD_CUDA_IRQ      0x12
-#define OLDWORLD_ESCCB_IRQ     0x10
-#define OLDWORLD_ESCCA_IRQ     0xf
-#define OLDWORLD_IDE0_IRQ      0xd
-#define OLDWORLD_IDE0_DMA_IRQ  0x2
-#define OLDWORLD_IDE1_IRQ      0xe
-#define OLDWORLD_IDE1_DMA_IRQ  0x3
-
-/* New World IRQs */
-#define NEWWORLD_CUDA_IRQ      0x19
-#define NEWWORLD_PMU_IRQ       0x19
-#define NEWWORLD_ESCCB_IRQ     0x24
-#define NEWWORLD_ESCCA_IRQ     0x25
-#define NEWWORLD_IDE0_IRQ      0xd
-#define NEWWORLD_IDE0_DMA_IRQ  0x2
-#define NEWWORLD_IDE1_IRQ      0xe
-#define NEWWORLD_IDE1_DMA_IRQ  0x3
-#define NEWWORLD_EXTING_GPIO1  0x2f
-#define NEWWORLD_EXTING_GPIO9  0x37
-
 /* Grackle PCI */
 #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
 
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 6c05f3bfd2..26cf15b1ce 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -38,6 +38,27 @@
 #include "hw/ppc/openpic.h"
 #include "qom/object.h"
 
+/* Old World IRQs */
+#define OLDWORLD_CUDA_IRQ      0x12
+#define OLDWORLD_ESCCB_IRQ     0x10
+#define OLDWORLD_ESCCA_IRQ     0xf
+#define OLDWORLD_IDE0_IRQ      0xd
+#define OLDWORLD_IDE0_DMA_IRQ  0x2
+#define OLDWORLD_IDE1_IRQ      0xe
+#define OLDWORLD_IDE1_DMA_IRQ  0x3
+
+/* New World IRQs */
+#define NEWWORLD_CUDA_IRQ      0x19
+#define NEWWORLD_PMU_IRQ       0x19
+#define NEWWORLD_ESCCB_IRQ     0x24
+#define NEWWORLD_ESCCA_IRQ     0x25
+#define NEWWORLD_IDE0_IRQ      0xd
+#define NEWWORLD_IDE0_DMA_IRQ  0x2
+#define NEWWORLD_IDE1_IRQ      0xe
+#define NEWWORLD_IDE1_DMA_IRQ  0x3
+#define NEWWORLD_EXTING_GPIO1  0x2f
+#define NEWWORLD_EXTING_GPIO9  0x37
+
 /* MacIO virtual bus */
 #define TYPE_MACIO_BUS "macio-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(MacIOBusState, MACIO_BUS)
-- 
2.30.2


