Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A02DEDAE
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:20:36 +0100 (CET)
Received: from localhost ([::1]:49576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWXb-0001Q8-6n
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWVp-0000WU-7J
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:18:45 -0500
Received: from relay2.mymailcheap.com ([217.182.66.162]:43392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWVn-0006K5-5M
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:18:44 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 219783ECD9;
 Sat, 19 Dec 2020 08:18:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 4642E2A374;
 Sat, 19 Dec 2020 02:18:40 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608362320;
 bh=9GAlcZiIpk5OxCQ9VlVskCbXgWc7zag2riobEZWFmJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wqcYbRuip5ayattSQh6GnXnn6UZTviNF1uZmK0/q3NuVETU098JZwyAvwCkIJi/Cj
 kAZYTlUBSFbSPOkq4BJC4XFygiO2tHi/jhNk/QfyyPax4E8Nimx+YADkZrVNZ76qO1
 kinZ0fAFEWyK9z0YH1gbSSuRCdpfFdx5eIlhPFW8=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVhZg5Wvecso; Sat, 19 Dec 2020 02:18:39 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 02:18:39 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 71DF742F8B;
 Sat, 19 Dec 2020 07:18:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="aLu2DX3G"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0572541009;
 Sat, 19 Dec 2020 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608362313;
 bh=9GAlcZiIpk5OxCQ9VlVskCbXgWc7zag2riobEZWFmJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aLu2DX3GXjWHqamq+HcbBjkzxIDPdBxx8UdXPcEDnzCehaF/wnUDe+/9tycvqDNTV
 WiPujqPINTzqG9D37jr8P4DmUpr+UpWTzuEs8ST+161XX5MXlvPYzNwSHgn7R7CxHZ
 OLRxUdaK+WqOSITOlWlDA3jFjT03rE3NZRbSrDH4=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/pci-host/bonito: Fixup IRQ mapping
Date: Sat, 19 Dec 2020 15:18:15 +0800
Message-Id: <20201219071816.37963-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [8.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_XBL(3.00)[180.97.240.22:received];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_CSS(1.00)[180.97.240.22:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[6];
 ARC_NA(0.00)[]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 71DF742F8B
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=217.182.66.162;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: chenhuacai@kernel.org, f4bug@amsat.org, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accroading to arch/mips/pci/fixup-fuloong2e.c in kernel,
despites south bridge IRQs needs special care, all other
IRQ pins are mapped by 'LOONGSON_IRQ_BASE + 25 + pin'.

As south bridge IRQs are all handled by ISA bus, we can simply
remove BONITO_IRQ_BASE and direct map IRQs here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/pci-host/bonito.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced065..43b79448a9 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -546,19 +546,16 @@ static const MemoryRegionOps bonito_spciconf_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-#define BONITO_IRQ_BASE 32
-
 static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
 {
     BonitoState *s = opaque;
     qemu_irq *pic = s->pic;
     PCIBonitoState *bonito_state = s->pci_dev;
-    int internal_irq = irq_num - BONITO_IRQ_BASE;
 
-    if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
+    if (bonito_state->regs[BONITO_INTEDGE] & (1 << irq_num)) {
         qemu_irq_pulse(*pic);
     } else {   /* level triggered */
-        if (bonito_state->regs[BONITO_INTPOL] & (1 << internal_irq)) {
+        if (bonito_state->regs[BONITO_INTPOL] & (1 << irq_num)) {
             qemu_irq_raise(*pic);
         } else {
             qemu_irq_lower(*pic);
@@ -566,25 +563,10 @@ static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-/* map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) */
-static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
+/* PCI slots IRQ pins started from 25 */
+static int pci_bonito_map_irq(PCIDevice *pci_dev, int pin)
 {
-    int slot;
-
-    slot = (pci_dev->devfn >> 3);
-
-    switch (slot) {
-    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
-        return irq_num % 4 + BONITO_IRQ_BASE;
-    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
-        return 4 + BONITO_IRQ_BASE;
-    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
-        return 5 + BONITO_IRQ_BASE;
-    case 8 ... 12: /* PCI slot 1 to 4 */
-        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
-    default:  /* Unknown device, don't do any translation */
-        return irq_num;
-    }
+    return 25 + pin;
 }
 
 static void bonito_reset(void *opaque)
-- 
2.29.2

