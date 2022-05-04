Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268C519C52
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:51:39 +0200 (CEST)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBfW-00012u-4H
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHo-0007xz-An
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHl-000429-Iy
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:06 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGe-0002VG-3F; Wed, 04 May 2022 10:26:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:26 +0100
Message-Id: <20220504092600.10048-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 16/50] dino: define IRQ inputs as qdev GPIOs
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
 hw/hppa/dino.c | 2 ++
 hw/hppa/dino.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 82f301653b..f58aebf94d 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -513,6 +513,8 @@ static void dino_pcihost_init(Object *obj)
     pci_setup_iommu(phb->bus, dino_pcihost_set_iommu, s);
 
     sysbus_init_mmio(sbd, &s->this_mem);
+
+    qdev_init_gpio_in(DEVICE(obj), dino_set_irq, DINO_IRQS);
 }
 
 static Property dino_pcihost_properties[] = {
diff --git a/hw/hppa/dino.h b/hw/hppa/dino.h
index 70fb8c52c8..ca380515f2 100644
--- a/hw/hppa/dino.h
+++ b/hw/hppa/dino.h
@@ -134,6 +134,8 @@ struct DinoState {
     MemoryRegion bm_ram_alias;
     MemoryRegion bm_pci_alias;
     MemoryRegion bm_cpu_alias;
+
+    qemu_irq irqs[DINO_IRQS];
 };
 
 #endif
-- 
2.20.1


