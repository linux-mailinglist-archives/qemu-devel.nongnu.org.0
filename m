Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7225698AB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 05:14:18 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Hy5-0005iy-5S
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 23:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hvk-0003oH-IO; Wed, 06 Jul 2022 23:11:52 -0400
Received: from mout-u-107.mailbox.org ([80.241.59.207]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hvi-0007bR-UJ; Wed, 06 Jul 2022 23:11:52 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LdhJx0TYtz9sSg;
 Thu,  7 Jul 2022 05:11:45 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v2 1/7] piix_ide_reset: Use pci_set_* functions instead of
 direct access
Date: Thu,  7 Jul 2022 03:11:34 +0000
Message-Id: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4LdhJx0TYtz9sSg
Received-SPF: pass client-ip=80.241.59.207; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-107.mailbox.org
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

Eliminate the remaining TODOs in hw/ide/piix.c by:
* Using pci_set_{size} functions to write the PIIX PCI configuration
  space instead of manipulating it directly as an array; and
* Documenting the default register values by reference to the
  controlling specification.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/piix.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 9a9b28078e..de1f4f0efb 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -21,6 +21,10 @@
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
+ *
+ * References:
+ *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
+ *      290550-002, Intel Corporation, April 1997.
  */
 
 #include "qemu/osdep.h"
@@ -114,14 +118,11 @@ static void piix_ide_reset(DeviceState *dev)
         ide_bus_reset(&d->bus[i]);
     }
 
-    /* TODO: this is the default. do not override. */
-    pci_conf[PCI_COMMAND] = 0x00;
-    /* TODO: this is the default. do not override. */
-    pci_conf[PCI_COMMAND + 1] = 0x00;
-    /* TODO: use pci_set_word */
-    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
-    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
-    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
+    /* PCI command register default value (0000h) per [1, p.48].  */
+    pci_set_word(pci_conf + PCI_COMMAND, 0x0000);
+    pci_set_word(pci_conf + PCI_STATUS,
+                 PCI_STATUS_DEVSEL_MEDIUM | PCI_STATUS_FAST_BACK);
+    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
 static int pci_piix_init_ports(PCIIDEState *d)
-- 
2.34.1


