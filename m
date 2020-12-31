Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45712E829A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 00:00:34 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6vp-0006sj-VI
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 18:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lx-0002Ro-6N
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:22 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lv-0006fd-5Y
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id 91so21025589wrj.7
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/CZdAhxdZnoENonIoHzd7f1sQJAHt0dXIOFmHph9mF8=;
 b=Irr1/szBywhnnMeBE4QFxAMIlivuta+Dqz75Sk8ph105KIh8q4BXte9VKFceYt1JOH
 4ynSGqAk8w2sAYhdm3b3nvKn8HLXnfpp3peMK9enPRca0wagoAzeRJKLSRB4oVmniU3Z
 PrudWdwdPqQa+FiJaeybq/RQy1qAsvzL5Q5BrBthKv4R1FJQ1DLkPCWbeq0+VuaIxe3w
 qsAv/xZRuLHSfQmX8r4ANRgg9PF0/792YbTuC4FCWXeIfB+r4e1GnumowuCs5T1Cii0H
 TTgHOtGAz0cBBMRurgf9nXPAvLFMheBBBTfYgQZ/6D9mLBzVXLggEqXV47N/PCBvigSS
 9uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/CZdAhxdZnoENonIoHzd7f1sQJAHt0dXIOFmHph9mF8=;
 b=b5nYQd3eABzjkra0M0yNHnTa/rahv9T5fJ951VEZREhgrjoR1cEih9CDPFnArhjcI/
 hnhi7ZKxJ228aZQuGltJFp57NrgPKQgIkENIbvVC/y4Qn+YFEUVq+6+LZiORgtXljxT6
 +KpcQUg/HYVbQGqNve6xyI7pe1DosvjGtQtXAiBK9eYDk1zdU0ncHFck2G508VaAnVJJ
 ddjg1XWd48gQjxwE6OoNtwV//78Z2pCGsk+7cqmHbwURs7q3Vi1oKnSY5SgI3s4DSX3R
 AD3jNFBL4opIUkJBUgaVO7nS6ZNKqXN7bZvhy+o91ltYaDCp48BdrErexUmrPPdC+Z8h
 GBAA==
X-Gm-Message-State: AOAM533/7xwbXQcLlV/N1pXUBNPIZiIu9vapV4k1gAJ7fkOGWOOQ+ES4
 0PJrDWvr8/BZ+2i0aSSWF7rXbWUzq6s=
X-Google-Smtp-Source: ABdhPJwXubpBVxE6BSa1eUEB+/eXVQKGRFoxMt7sLhy0fpcpPsTsWYilcOllcQfUiMDijE/0IBZg1Q==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr67978145wra.68.1609455017745; 
 Thu, 31 Dec 2020 14:50:17 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id s63sm15819299wms.18.2020.12.31.14.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/18] hw/pci-host/bonito: Create PCI regions in
 bonito_host_realize()
Date: Thu, 31 Dec 2020 23:49:06 +0100
Message-Id: <20201231224911.1467352-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PCI regions belong to the 'host' device, not the PCI function.
Move the PCI regions creation there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 1c88ccc6af8..4dcaa2fa8bb 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -654,6 +654,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
+    MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
@@ -662,6 +663,14 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
                                      PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
 
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
+
+    memory_region_init_alias(pcimem_alias, NULL, "pci.mem.alias",
+                             &bs->pci_mem, 0, BONITO_PCIHI_SIZE);
+    memory_region_add_subregion(get_system_memory(),
+                                BONITO_PCIHI_BASE, pcimem_alias);
+    create_unimplemented_device("PCI_2",
+                                (hwaddr)BONITO_PCIHI_BASE + BONITO_PCIHI_SIZE,
+                                2 * GiB);
 }
 
 static void bonito_pci_realize(PCIDevice *dev, Error **errp)
@@ -669,8 +678,6 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     BonitoPciState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
-    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
-    MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
 
     assert(!target_words_bigendian()); /* FIXME not supported */
 
@@ -732,14 +739,6 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     create_unimplemented_device("IOCS[3]", BONITO_DEV_BASE + 3 * 256 * KiB,
                                 256 * KiB);
 
-    memory_region_init_alias(pcimem_alias, NULL, "pci.mem.alias",
-                             &bs->pci_mem, 0, BONITO_PCIHI_SIZE);
-    memory_region_add_subregion(get_system_memory(),
-                                BONITO_PCIHI_BASE, pcimem_alias);
-    create_unimplemented_device("PCI_2",
-                                (hwaddr)BONITO_PCIHI_BASE + BONITO_PCIHI_SIZE,
-                                2 * GiB);
-
     /* set the default value of north bridge pci config */
     pci_set_word(dev->config + PCI_COMMAND, 0x0000);
     pci_set_word(dev->config + PCI_STATUS, 0x0000);
-- 
2.26.2


