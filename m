Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E62435A38
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 07:08:35 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQJe-0003VZ-6o
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 01:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZZ-0005fr-1Q; Thu, 21 Oct 2021 00:20:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZW-0000LR-NF; Thu, 21 Oct 2021 00:20:56 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p5RY6z4xdS; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=ags7wlUX/Q3oogmTMtkF2sLxWFtrxRkvHZVmkqQsFSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FLB63GbF/fpFhTbqrvVZVdSu1OSrmYmiswc5eshqCP3BlMGT4Rd7zw03yy/UDdQfR
 JDN6rf/Ai87H+Ie6fSe6weCQSiCe6tTL3xFJcCNDNYK7ycX7fXeNByHcOsIzfVmAnq
 GxtAYkGxA2eiZgyTtl4TP4V/00a4J/UfuTaktSD8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 18/25] ppc/pegasos2: Implement power-off RTAS function with VOF
Date: Thu, 21 Oct 2021 15:20:20 +1100
Message-Id: <20211021042027.345405-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This only helps Linux guests as only that seems to use it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <1c1e030f2bbc86e950b3310fb5922facdc21ef86.1634241019.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


