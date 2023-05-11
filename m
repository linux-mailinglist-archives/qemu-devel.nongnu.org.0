Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CB6FEE26
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px29G-0008A9-Px; Thu, 11 May 2023 04:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28p-0007bM-P0
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28o-0003tH-Dc
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/1EAtV9ozIx5RqiGdVoVYzK1DrV4ewSAV9CmS+LTqtk=; b=d4HLyS/YnCRWoUdMvWe+L46IJy
 US/K0W/tOJBIuBBLEl1NnFCSz2zZaFYuoRMNfreZ4wji0PeXcGmNTN5kDCwG22oEcHNqLN4oE7tGN
 xydSPZwUqKFFnvQB1qQ3ePnxwJ5ZfbYJam3XwyGBMkqdJJDrluShz5SnV4NrPXIScFtKJBcL+x2ck
 aG60Xb/d02hPhHsSy7L0mTMXE79PdY85uW+FvvS4emXfTz98kWnnRYmHAu2WjdLkHERMxB/JAOczP
 oR3ujRtCVTtoK2dAjl98JjBRVskMBxm+HuXxfEqzpqpHBEWxuLQ2d6iuuKs8vf9UHZ2GJ6STouGsJ
 oCSlIEF3VkkGANO2mPcfvUIbX+B8pGy8KTGJA4YUIYCLMERaPhVZfKTkKVeMPxiH4hMJQc5qdWc7B
 Q6rGBN5cc4jgL3uwztTlnrnBVVW9qhwD1ah2sm5xR8bnbXGhoOqvcIAgmskwEHYEy570e8TintzKs
 CbR859m+9xaMzuUhDpOmlFPW7sjLcdoUxKnmBOmoNL04vzDmmBLHeg+7ZNt76fIeZGX6AWOTsdwSO
 QlrpzjKM66l5tb+uanakc3dgeE19AIk3ofFoD60dkzjHRGaI7iSGnugVxAICiEADZJ3qh4z4EL6ja
 zPN8kJ9ua3Phn2jBIBGKQAc/baXzZB5/5G/XjRQYc=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27c-0008g9-V3; Thu, 11 May 2023 09:58:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:31 +0100
Message-Id: <20230511085731.171565-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 18/18] hw/pci/pci.c: remove pci_allocate_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function is no longer used and can now be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci/pci.c         | 8 --------
 include/hw/pci/pci.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0dd3b24b62..79eb427709 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1670,14 +1670,6 @@ static void pci_bus_irq_handler(void *opaque, int devfn, int level)
     pci_irq_handler(pci_dev, intx, level);
 }
 
-qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
-{
-    int intx = pci_intx(pci_dev);
-    assert(0 <= intx && intx < PCI_NUM_PINS);
-
-    return qemu_allocate_irq(pci_irq_handler, pci_dev, intx);
-}
-
 void pci_set_irq(PCIDevice *pci_dev, int level)
 {
     qemu_set_irq(pci_dev->irq, level);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 935b4b91b4..080c5a0df2 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -587,7 +587,6 @@ PCIDevice *pci_create_simple(PCIBus *bus, int devfn, const char *name);
 
 void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev);
 
-qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
 void pci_set_irq(PCIDevice *pci_dev, int level);
 
 static inline void pci_irq_assert(PCIDevice *pci_dev)
-- 
2.30.2


