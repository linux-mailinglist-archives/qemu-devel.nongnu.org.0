Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2ED6FEE42
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px287-0004o7-4W; Thu, 11 May 2023 04:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px284-0004jY-4w
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px282-0003mo-Ey
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mrtzQIt9LK6S+ps56iCzIQu15XyYgsBpPmtrBYQTHnM=; b=XVtiwbGuB//IpMhKkPKjr6wk3S
 2PfLIOdIeMqC7O/aiSRbY9/jg1rgcZfMjj8ywwNJoTKqrmSLqwNEDWp+FSllcg+6t18TSgg7e7R9o
 O2lwL23sDOMAanmOOjXo4RCWQfcPvgmHgKC/4rS7RtQbMUKsyjXfsduJbR4nty3e0/RUhWU5804eg
 omv+g+EqgbzXrrLF4KCL0UOCIbVm4ArtnG7X34tuSTGUPvqMFb0YWSLYnnoye0+KJDmQ+Sn2BxjtV
 3zBoC2eqAyzWDYbUQ06RjkX7DJ6utE9HLaMs2oZM4cFVyssukPjiEuaud4ueCXQXqjAQJaW97TBKi
 Qa3AhEYaIYwR+yTwEWiuQ43XirXAVw5+Zel81GdTbJ+iWmllaCNLArqxsX+pKPdPQ/lio88CTVcWf
 9vnJR58uxbbLVzpmYt5q/w3iSEOUFzvbb7rRm57kMInYhVljtEOFeduyxR2y9SpveqVL1AOKeLl1o
 rhNYeas2CyRZrStaFSAd4I/48Qmtljy34i1v95/9Wmj/cnzqPg4m/wh7YCUkUdt4PLF3XkS9Rn28b
 vt0/WR7TeqBOHwhs5B7Kzbv5MaimZywiPoXfTxG2dm2U/lUdomILx++7c++RdfNfMWVU0ow6xp3I9
 RwDyrMSO7Mi9bx29Gz6KKQqfFkA37RbW5lnXBdltg=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px273-0008g9-Oi; Thu, 11 May 2023 09:57:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:21 +0100
Message-Id: <20230511085731.171565-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 08/18] hw/net/can/can_pcm3680_pci.c: switch SerialState to
 use PCI device input gpio
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

This replaces the call to pci_allocate_irq() and also allows the corresponding
qemu_free_irq() to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/can/can_pcm3680_pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index 8ef3e4659c..50f01d02bd 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -163,7 +163,7 @@ static void pcm3680i_pci_realize(PCIDevice *pci_dev, Error **errp)
     pci_conf = pci_dev->config;
     pci_conf[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
 
-    d->irq = pci_allocate_irq(&d->dev);
+    d->irq = qdev_get_gpio_in_named(DEVICE(pci_dev), "pci-input-irq", 0);
 
     for (i = 0; i < PCM3680i_PCI_SJA_COUNT; i++) {
         can_sja_init(&d->sja_state[i], d->irq);
@@ -196,8 +196,6 @@ static void pcm3680i_pci_exit(PCIDevice *pci_dev)
     for (i = 0; i < PCM3680i_PCI_SJA_COUNT; i++) {
         can_sja_disconnect(&d->sja_state[i]);
     }
-
-    qemu_free_irq(d->irq);
 }
 
 static const VMStateDescription vmstate_pcm3680i_pci = {
-- 
2.30.2


