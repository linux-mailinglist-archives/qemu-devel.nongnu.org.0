Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50A60D1CC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN30-0007AQ-0K; Tue, 25 Oct 2022 12:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2u-0006uY-Sq; Tue, 25 Oct 2022 12:44:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2s-0002Gf-VE; Tue, 25 Oct 2022 12:44:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5D9C975A160;
 Tue, 25 Oct 2022 18:44:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 407DA75A15C; Tue, 25 Oct 2022 18:44:52 +0200 (CEST)
Message-Id: <f75db0c5ea6c92c3f8ed61ed6ffddcb6bdc549fd.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 17/19] mac_newworld: Deprecate mac99 with G5 CPU
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 25 Oct 2022 18:44:52 +0200 (CEST)
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

Besides resolving the confusing behaviour mentioned in previous commit
this might also allow unifying qemu-system-ppc and qemu-system-ppc64
in the future.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7321ac925e..d6f504eef2 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -165,6 +165,12 @@ static void ppc_core99_init(MachineState *machine)
         qemu_register_reset(ppc_core99_reset, cpu);
     }
 
+    if (object_property_find(OBJECT(machine), "via")) {
+        if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
+            warn_report("mac99 with G5 CPU is deprecated, "
+                        "use powermac7_3 instead");
+        }
+    }
     /* allocate RAM */
     if (machine->ram_size > 2 * GiB) {
         error_report("RAM size more than 2 GiB is not supported");
-- 
2.30.4


