Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF275F1097
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:14:19 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJac-00014U-N9
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFu-0006j9-Jb
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFs-0006gx-Bw
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HT7T/HkWKC/NM2SbMQ2WV/s0SKbZN/EVppx2z6uS4w=;
 b=RgTg+gqlJVxmbvn+adyDw14+lIGz9TBmAioxGJVaitZQlZZ4gk2fAd+pc1YXPvtpFCWG0C
 19XL32t2NCKpcqHQqNFLnXzxnaY6FVH3c4Dp0dU7eQZB+QcnaoxAst5PyX5qMOnF/lb2Br
 qSB/FeGpYRgdT0PH/908G0wI+8wEm4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-W7AZmlGkNIGjkaq9FsUJsA-1; Fri, 30 Sep 2022 12:52:48 -0400
X-MC-Unique: W7AZmlGkNIGjkaq9FsUJsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E830D80A0B9;
 Fri, 30 Sep 2022 16:52:47 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 097AB17582;
 Fri, 30 Sep 2022 16:52:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 14/18] piix_ide_reset: Use pci_set_* functions instead of
 direct access
Date: Fri, 30 Sep 2022 18:52:18 +0200
Message-Id: <20220930165222.249716-15-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Lev Kujawski <lkujaw@member.fsf.org>

Eliminate the remaining TODOs in hw/ide/piix.c by:
* Using pci_set_{size} functions to write the PIIX PCI configuration
  space instead of manipulating it directly as an array; and
* Documenting the default register values by reference to the
  controlling specification.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220707031140.158958-1-lkujaw@member.fsf.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.37.3


