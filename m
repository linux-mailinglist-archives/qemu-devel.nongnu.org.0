Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865FD609E8A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:07:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omu3m-00029O-QY; Mon, 24 Oct 2022 05:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omu2y-0001mY-VG; Mon, 24 Oct 2022 05:47:05 -0400
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omu2a-0002da-Nt; Mon, 24 Oct 2022 05:47:04 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MwqwF2f9Qz9sHC;
 Mon, 24 Oct 2022 11:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666604797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKdaeuGHlJPfzfaLRMfa378kLqDoCKmJnyWKUAy12hQ=;
 b=eu+PMy6fm2oVVpAQlqywmF2yKcaa3NlDvfOBkVPYFJ00RUZXQi30UMir/4PgZmi+sNulkr
 m7btiwsJ2FlPQmzZjHdvjHu+DbD1Q7vZXDnaMwegyShh/Gt00zt6+yB8WmCjuPkFnEz2bE
 nUSZPTtve3bQRADUEN8t0rFL0y+oA11vqfHfs+WcnzserJAN3YgdxNq7gSICUCCebDPO4L
 TgGIBt8L07VjS7weGQXVq2nLtrS0pYeT19k8cz8UljEWmZkV3GAMGhIKHjda6ozOu3EU7O
 JKcOE7XK0C9MH4ySpcpvfV4pMbBmcab0u+kTEjuBGv1+o0RFyViFG7GxDxJIPw==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666604795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKdaeuGHlJPfzfaLRMfa378kLqDoCKmJnyWKUAy12hQ=;
 b=SvhYj2cEkcHH8Ui2wvZOFfhdgMi4U7pkkTlPX3X6kRvMAYu+866mMjWhx+X1KPZ7j/kLsP
 mpn/JQs10m5jP+huesR4/KKu2ACTzfZ5f9bTqPSZh7QE8pajy2oCgNwQKjC8nQNtXLhF1R
 yPZSi90aFQVf71iF2hrqjsSQ3iMJqxTWJ/W1E82IOe0v6zlQCh2v4k07wMDfARN9NSh1u1
 rC6xQBMd3fceEmgjdN5dzAbP5SfcHk1vh2PPlbb83zGKi46Z8fhvlxjuaxVBnSgrl0cWX8
 QD9fhiEXvnzIp6pQ2kZuip/PYyVL3865SJXPKF8lyHvCC+O0wY3LkagQG8PJ0g==
To: qemu-devel@nongnu.org,
	mst@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH 2/2] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Date: Mon, 24 Oct 2022 09:46:21 +0000
Message-Id: <20221024094621.512806-3-lkujaw@mailbox.org>
In-Reply-To: <20221024094621.512806-1-lkujaw@mailbox.org>
References: <20221007095229-mutt-send-email-mst@kernel.org>
 <20221024094621.512806-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6866f68cd3856ad6fcb
X-MBO-RS-META: xs8mhydbnmd1ydrh4aj7w4qo5jjjnhsn
X-Rspamd-Queue-Id: 4MwqwF2f9Qz9sHC
Received-SPF: pass client-ip=80.241.56.151; envelope-from=lkujaw@mailbox.org;
 helo=mout-p-101.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

One method to enable PCI bus mastering for IDE controllers, often used
by x86 firmware, is to write 0x7 to the PCI command register.  Neither
the PIIX 3/4 specifications nor actual PIIX 3 hardware (a Tyan S1686D
system) permit setting the Memory Space Enable (MSE) bit, thus the
command register would be left in an unspecified state without this
patch.

* hw/core/machine.c
  Facilitate migration by not masking writes to the PIIX 3/4 PCICMD
  register for machine states of QEMU versions prior to 7.2.
* hw/ide/piix.c
  a) Add a reference to the PIIX 4 data sheet.
  b) Mask the MSE bit using the QEMU PCI device wmask field.
  c) Define a new boolean property, x-filter-pcicmd, to control
     whether the write mask is enabled and enable it by default
     for both the PIIX 3 and PIIX 4 IDE controllers.
* include/hw/ide/pci.h
  Add the boolean filter_pcicmd field to the PCIIDEState structure,
  because the PIIX IDE controllers do not define their own state.
* tests/qtest/ide-test.c
  Use the command_disabled field of the QPCIDevice testing model to
  indicate that PCI_COMMAND_MEMORY is hardwired within PIIX 3/4 IDE
  controllers.

Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
---
 hw/core/machine.c      |  5 ++++-
 hw/ide/piix.c          | 24 ++++++++++++++++++++++++
 include/hw/ide/pci.h   |  1 +
 tests/qtest/ide-test.c |  1 +
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..8e8e69c081 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,7 +40,10 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
-GlobalProperty hw_compat_7_1[] = {};
+GlobalProperty hw_compat_7_1[] = {
+    { "piix3-ide", "x-filter-pcicmd", "false" },
+    { "piix4-ide", "x-filter-pcicmd", "false" },
+};
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
 GlobalProperty hw_compat_7_0[] = {
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index de1f4f0efb..a3af32e126 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -25,6 +25,8 @@
  * References:
  *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
  *      290550-002, Intel Corporation, April 1997.
+ *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
+ *      Intel Corporation, April 1997.
  */
 
 #include "qemu/osdep.h"
@@ -160,6 +162,21 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf = dev->config;
     int rc;
 
+    /*
+     * Mask all IDE PCI command register bits except for Bus Master
+     * Function Enable (bit 2) and I/O Space Enable (bit 0), as the
+     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
+     *
+     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
+     * Enable (MSE, bit 1) is hardwired to 1, but this is contradicted
+     * by actual PIIX3 hardware, the datasheet itself (viz., Default
+     * Value: 0000h), and the PIIX4 datasheet [2].
+     */
+    if (d->filter_pcicmd) {
+        pci_set_word(dev->wmask + PCI_COMMAND,
+                     PCI_COMMAND_MASTER | PCI_COMMAND_IO);
+    }
+
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
@@ -185,6 +202,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property pci_piix_ide_properties[] = {
+    DEFINE_PROP_BOOL("x-filter-pcicmd", PCIIDEState, filter_pcicmd, TRUE),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -198,6 +220,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, pci_piix_ide_properties);
     dc->hotpluggable = false;
 }
 
@@ -220,6 +243,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, pci_piix_ide_properties);
     dc->hotpluggable = false;
 }
 
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..5424b00a9e 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -53,6 +53,7 @@ struct PCIIDEState {
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
+    bool filter_pcicmd; /* used only for piix3/4 */
 };
 
 static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dbe1563b23..d5cec7c14c 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -174,6 +174,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
 
     *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
 
+    dev->command_disabled = PCI_COMMAND_MEMORY;
     qpci_device_enable(dev);
 
     return dev;
-- 
2.34.1


