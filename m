Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE668551B8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 16:30:23 +0200 (CEST)
Received: from localhost ([::1]:60866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfmSj-0002iU-7o
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 10:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44835)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hfmQB-0001My-4O
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 10:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hfmQ7-0005fJ-4t
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 10:27:40 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56562 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hfmQ6-0005ch-BI
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 10:27:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 960441A1D70;
 Tue, 25 Jun 2019 16:27:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 79B1F1A1CCA;
 Tue, 25 Jun 2019 16:27:35 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 16:27:17 +0200
Message-Id: <1561472838-32272-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561472838-32272-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561472838-32272-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 1/2] dma/rc4030: Fix off-by-one error in
 specified memory region size
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
Cc: arikalo@wavecomp.com, hpoussin@reactos.org, f4bug@amsat.org,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

The size is one byte less than it should be:

address-space: rc4030-dma
  0000000000000000-00000000fffffffe (prio 0, i/o): rc4030.dma

rc4030 is used in MIPS Jazz board context.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 hw/dma/rc4030.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 6ccafec..88ff271 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/mips/mips.h"
 #include "hw/sysbus.h"
@@ -678,7 +679,7 @@ static void rc4030_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_iommu(&s->dma_mr, sizeof(s->dma_mr),
                              TYPE_RC4030_IOMMU_MEMORY_REGION,
-                             o, "rc4030.dma", UINT32_MAX);
+                             o, "rc4030.dma", 4 * GiB);
     address_space_init(&s->dma_as, MEMORY_REGION(&s->dma_mr), "rc4030-dma");
 }
 
-- 
2.7.4


