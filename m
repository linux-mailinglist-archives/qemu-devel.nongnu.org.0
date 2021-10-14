Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352842E2A5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:19:06 +0200 (CEST)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb7Bx-0007zV-8C
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75X-0006YN-1j; Thu, 14 Oct 2021 16:12:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75V-0002VQ-H8; Thu, 14 Oct 2021 16:12:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C734775604D;
 Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5708A75605F; Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Message-Id: <1c1e030f2bbc86e950b3310fb5922facdc21ef86.1634241019.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634241019.git.balaton@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 6/6] ppc/pegasos2: Implement power-off RTAS function with VOF
Date: Thu, 14 Oct 2021 21:50:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This only helps Linux guests as only that seems to use it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 39e96d323f..e427ac2fe0 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -22,6 +22,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/fw-path-provider.h"
@@ -429,6 +430,16 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
         qemu_log_mask(LOG_UNIMP, "%c", ldl_be_phys(as, args));
         stl_be_phys(as, rets, 0);
         return H_SUCCESS;
+    case RTAS_POWER_OFF:
+    {
+        if (nargs != 2 || nrets != 1) {
+            stl_be_phys(as, rets, -1);
+            return H_PARAMETER;
+        }
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        stl_be_phys(as, rets, 0);
+        return H_SUCCESS;
+    }
     default:
         qemu_log_mask(LOG_UNIMP, "Unknown RTAS token %u (args=%u, rets=%u)\n",
                       token, nargs, nrets);
-- 
2.21.4


