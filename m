Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6FE65DFAF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:14:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBrm-0007Mh-7H; Wed, 04 Jan 2023 17:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpv-0006Gk-IF; Wed, 04 Jan 2023 17:02:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpn-0003Gv-Oh; Wed, 04 Jan 2023 17:02:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C868B7496B4;
 Wed,  4 Jan 2023 22:59:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB6307496AB; Wed,  4 Jan 2023 22:59:40 +0100 (CET)
Message-Id: <a5147317122bb760b1184cf73829fc6fce61e611.1672868854.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1672868854.git.balaton@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 5/7] mac_newworld: Deprecate mac99 with G5 CPU
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed,  4 Jan 2023 22:59:40 +0100 (CET)
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Besides resolving the confusing behaviour mentioned in previous commit
this might also allow unifying qemu-system-ppc and qemu-system-ppc64
in the future.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 3f5d1ec097..f07c37328b 100644
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
2.30.6


