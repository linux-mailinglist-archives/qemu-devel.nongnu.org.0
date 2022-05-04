Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5ED519C79
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:59:25 +0200 (CEST)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBn2-0004H6-Bc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIX-0000DV-Pr
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIV-00047e-9R
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:53 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHM-0002VG-Ov; Wed, 04 May 2022 10:26:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:39 +0100
Message-Id: <20220504092600.10048-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 29/50] lasi: define IRQ inputs as qdev GPIOs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/lasi.c | 2 ++
 hw/hppa/lasi.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index ec079601a1..9489a80bad 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -290,6 +290,8 @@ static void lasi_init(Object *obj)
                           s, "lasi", 0x100000);
 
     sysbus_init_mmio(sbd, &s->this_mem);
+
+    qdev_init_gpio_in(DEVICE(obj), lasi_set_irq, LASI_IRQS);
 }
 
 static void lasi_class_init(ObjectClass *klass, void *data)
diff --git a/hw/hppa/lasi.h b/hw/hppa/lasi.h
index f40546da6e..63a2be3740 100644
--- a/hw/hppa/lasi.h
+++ b/hw/hppa/lasi.h
@@ -38,6 +38,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
 #define ICR_BUS_ERROR_BIT  LASI_BIT(8)  /* bit 8 in ICR */
 #define ICR_TOC_BIT        LASI_BIT(1)  /* bit 1 in ICR */
 
+#define LASI_IRQS           27
+
 #define LASI_IRQ_HPA        14
 #define LASI_IRQ_UART_HPA   5
 #define LASI_IRQ_LPT_HPA    7
-- 
2.20.1


