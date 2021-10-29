Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB3440149
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:26:28 +0200 (CEST)
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVdz-0006C7-Q1
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUw5-0007db-4o
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUw1-0006TL-PV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C21C17561B3;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D227D7561D2; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <81857d926c6de2fdb4a5655e56262ad2e6821b06.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 24/25] hw/timer/sh_timer: Fix timer memory region size
Date: Fri, 29 Oct 2021 18:23:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The timer memory region is only accessed via aliases that are 0x1000
bytes long, no need to have the timer region larger than that.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/timer/sh_timer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 250ad41b48..a6445092e4 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -350,8 +350,7 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
                                     ch2_irq0); /* ch2_irq1 not supported */
     }
 
-    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
-                          "timer", 0x100000000ULL);
+    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer", 0x1000);
 
     memory_region_init_alias(&s->iomem_p4, NULL, "timer-p4",
                              &s->iomem, 0, 0x1000);
-- 
2.21.4


