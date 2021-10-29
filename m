Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7729C4405CD
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:34:12 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbNz-0005aR-Kd
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbMx-0004um-NH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:33:07 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbMu-0001ti-HH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:33:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F3ADB748F4B;
 Sat, 30 Oct 2021 01:33:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D3D8A7475FA; Sat, 30 Oct 2021 01:33:01 +0200 (CEST)
Message-Id: <b1cd196cf1395a602c7a08a4f858e69e50c446a1.1635550060.git.balaton@eik.bme.hu>
In-Reply-To: <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
References: <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 29/30] hw/timer/sh_timer: Fix timer memory region size
Date: Sat, 30 Oct 2021 01:27:40 +0200
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timer unit only has registers that fit in a region 0x30 bytes
long. No need to have the timer region larger than that.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/timer/sh_timer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 250ad41b48..587fa9414a 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -350,15 +350,14 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
                                     ch2_irq0); /* ch2_irq1 not supported */
     }
 
-    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
-                          "timer", 0x100000000ULL);
+    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer", 0x30);
 
     memory_region_init_alias(&s->iomem_p4, NULL, "timer-p4",
-                             &s->iomem, 0, 0x1000);
+                             &s->iomem, 0, memory_region_size(&s->iomem));
     memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
 
     memory_region_init_alias(&s->iomem_a7, NULL, "timer-a7",
-                             &s->iomem, 0, 0x1000);
+                             &s->iomem, 0, memory_region_size(&s->iomem));
     memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
     /* ??? Save/restore.  */
 }
-- 
2.21.4


