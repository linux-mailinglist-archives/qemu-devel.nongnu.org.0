Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA745E934B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:13:10 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRRU-0002P5-Rh
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ocO5h-0002Lo-H1; Sun, 25 Sep 2022 05:38:25 -0400
Received: from mout-p-201.mailbox.org ([80.241.56.171]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ocO5f-0007AX-H1; Sun, 25 Sep 2022 05:38:25 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Mb1642HQZz9sQt;
 Sun, 25 Sep 2022 11:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1664098700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mb9gWOjdWajX8ukC5lRyB2s9oJCQT+pfk+SKOedQ2BU=;
 b=n3w1u1Am2sM4XBCNAUcAOHjy7HeIjgC/CxHCD9qKvoK/UfCPCuqWfyENBogBlCZ8IWRawG
 yq/Rn9oGF76n2rQ5z4cOQ/pibwnjAaIXoGEaGrpNbskn1i4MaOJdmn2ojHrJoGPMM46Qpe
 7+C4tRCrrFNbUXff8xIsX9ByMpKE1V0vmeqCZC8bplSa/ZrAApG0mwqJtO29VNv8pBjP/Q
 NOdZ05WdS7nBRsiXqvlzySgC1S4qMw9j2YGGa9dDS2EGZdYFx/zRL3NpNefx572WsebcyA
 YjZiuiaNrKVKKLjEGJOueiqAYEbsAvu+ndil2fyJMgQNxMAgVox4F10QXYgL+A==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1664098698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mb9gWOjdWajX8ukC5lRyB2s9oJCQT+pfk+SKOedQ2BU=;
 b=HEAZsvjJFSVZcW+JncKrSgnr1wllvon05EIHCLRff1yz/w98RHt+t59VvZwaqUzqGN9JN4
 dx2GNN3FQ4P8gwY+nRBvSgYkpqI47QGeM4hNYEMJhSJJ4liKfKIKoU7eDtCO4/Ggscueud
 qr4U6ZemS8aYOl5KcrcYwsgAm4v8Xz5WoYQ6Qo7COSOZOqqb2vxE0U4ZwGxOR00jLgI6b5
 dplFkcdiQnmiLLIkzDPBIblNfd39PbtYtjlJ8zfq4jMmy1EsQV1VauXOoyFCN2vN5gxBkV
 CYc+PWMmDgh024ECjvyb7XUD3aqKFBxXo1cNwAOqBp5P42wKHHy4kMaeLONFUw==
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH v3 2/2] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Date: Sun, 25 Sep 2022 09:37:59 +0000
Message-Id: <20220925093759.1598617-3-lkujaw@mailbox.org>
In-Reply-To: <20220925093759.1598617-1-lkujaw@mailbox.org>
References: <20220922060325-mutt-send-email-mst@kernel.org>
 <20220925093759.1598617-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1dc5d4de3c43414e8f9
X-MBO-RS-META: 8ze8ztyeermwt1knqn6irrqnbq5t1ihj
Received-SPF: pass client-ip=80.241.56.171; envelope-from=lkujaw@mailbox.org;
 helo=mout-p-201.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 25 Sep 2022 09:07:55 -0400
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

One method to enable PCI bus mastering for IDE controllers, often used
by x86 firmware, is to write 0x7 to the PCI command register.  Neither
the PIIX3 specification nor actual hardware (a Tyan S1686D system)
permit modification of the Memory Space Enable (MSE) bit, 1, and thus
the command register would be left in an unspecified state without
this patch.

* hw/ide/pci.c
  Call post_load if provided by derived IDE controller.
* hw/ide/piix.c
  a) Add references to the PIIX data sheets.
  b) Mask the MSE bit using the QEMU PCI device wmask field.
  c) Add a post_load function to mask bits from saved machine states.
  d) Specify post_load for both the PIIX3/4 IDE controllers.
* include/hw/ide/pci.h
  Switch from SIMPLE_TYPE to TYPE, explicitly create a PCIIDEClass
  that includes the post_load function pointer.
* tests/qtest/ide-test.c
  Use the command_disabled field of the QPCIDevice testing model to
  indicate that PCI_COMMAND_MEMORY is hardwired in the PIIX3/4 IDE
  controller.

Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
---
(v2) Use QEMU's built-in PCI bit-masking support rather than attempting
     to manually filter writes.  Thanks to Philippe Mathieu-Daude and
     Michael S. Tsirkin for review and the pointer.
(v3) Handle migration of older machine states, which may have set bits
     masked by this patch, via a new post_load method of PCIIDEClass.
     Thanks to Michael S. Tsirkin for catching this via review.

 hw/ide/pci.c           |  5 +++++
 hw/ide/piix.c          | 39 +++++++++++++++++++++++++++++++++++++++
 include/hw/ide/pci.h   |  7 ++++++-
 tests/qtest/ide-test.c |  1 +
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 84ba733548..e42c7b9415 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -447,6 +447,7 @@ static const VMStateDescription vmstate_bmdma = {
 
 static int ide_pci_post_load(void *opaque, int version_id)
 {
+    PCIIDEClass *dc = PCI_IDE_GET_CLASS(opaque);
     PCIIDEState *d = opaque;
     int i;
 
@@ -457,6 +458,10 @@ static int ide_pci_post_load(void *opaque, int version_id)
         ide_bmdma_post_load(&d->bmdma[i], -1);
     }
 
+    if (dc->post_load) {
+        dc->post_load(d, version_id);
+    }
+
     return 0;
 }
 
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 9a9b28078e..fd55ecbd36 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -21,6 +21,12 @@
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
+ *
+ * References:
+ *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
+ *      290550-002, Intel Corporation, April 1997.
+ *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
+ *      Intel Corporation, April 1997.
  */
 
 #include "qemu/osdep.h"
@@ -159,6 +165,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
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
+    pci_set_word(dev->wmask + PCI_COMMAND,
+                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
+
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
@@ -184,11 +203,28 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static int pci_piix_ide_post_load(PCIIDEState *s, int version_id)
+{
+    PCIDevice *dev = PCI_DEVICE(s);
+    uint8_t *pci_conf = dev->config;
+
+    /*
+     * To preserve backward compatibility, handle saved machine states
+     * with reserved bits set (see comment in pci_piix_ide_realize()).
+     */
+    pci_set_word(pci_conf + PCI_COMMAND,
+                 pci_get_word(pci_conf + PCI_COMMAND) &
+                 (PCI_COMMAND_MASTER | PCI_COMMAND_IO));
+
+    return 0;
+}
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    PCIIDEClass *ic = PCI_IDE_CLASS(klass);
 
     dc->reset = piix_ide_reset;
     k->realize = pci_piix_ide_realize;
@@ -196,6 +232,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    ic->post_load = pci_piix_ide_post_load;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
 }
@@ -211,6 +248,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    PCIIDEClass *ic = PCI_IDE_CLASS(klass);
 
     dc->reset = piix_ide_reset;
     k->realize = pci_piix_ide_realize;
@@ -218,6 +256,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    ic->post_load = pci_piix_ide_post_load;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
 }
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..727c748a0f 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -40,7 +40,12 @@ typedef struct BMDMAState {
 } BMDMAState;
 
 #define TYPE_PCI_IDE "pci-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
+OBJECT_DECLARE_TYPE(PCIIDEState, PCIIDEClass, PCI_IDE)
+
+struct PCIIDEClass {
+    IDEDeviceClass parent_class;
+    int (*post_load)(PCIIDEState *s, int version_id);
+};
 
 struct PCIIDEState {
     /*< private >*/
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..85a3967063 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -173,6 +173,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
 
     *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
 
+    dev->command_disabled = PCI_COMMAND_MEMORY;
     qpci_device_enable(dev);
 
     return dev;
-- 
2.34.1


