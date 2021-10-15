Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B742E60A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:18:43 +0200 (CEST)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBru-0002vA-Nx
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqP-0000n1-5k
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:50156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqH-0006a7-FG
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4A10B75606C;
 Fri, 15 Oct 2021 03:16:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CFC3A756060; Fri, 15 Oct 2021 03:16:57 +0200 (CEST)
Message-Id: <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
Date: Fri, 15 Oct 2021 03:06:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use via_isa_set_irq() which better encapsulates irq handling in the
vt82xx model and avoids using isa_get_irq() that has a comment saying
it should not be used.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/via.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 94cc2142c7..252d18f4ac 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -29,7 +29,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
-
+#include "hw/isa/vt82c686.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
 
@@ -112,7 +112,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
         d->config[0x70 + n * 8] &= ~0x80;
     }
 
-    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
+    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
 }
 
 static void via_ide_reset(DeviceState *dev)
-- 
2.21.4


