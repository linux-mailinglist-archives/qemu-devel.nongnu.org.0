Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F7611042
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:59:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNzf-0002o3-0l; Fri, 28 Oct 2022 07:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNyd-0001kh-VZ; Fri, 28 Oct 2022 07:56:44 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNya-0006Nc-SU; Fri, 28 Oct 2022 07:56:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 110FC75A168;
 Fri, 28 Oct 2022 13:56:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E526A75A135; Fri, 28 Oct 2022 13:56:33 +0200 (CEST)
Message-Id: <685726e4e3a196493530ab0677e7e82d89bcb123.1666957578.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666957578.git.balaton@eik.bme.hu>
References: <cover.1666957578.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 17/19] mac_newworld: Deprecate mac99 "via" option
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri, 28 Oct 2022 13:56:33 +0200 (CEST)
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

Setting emulated machine type with a property called "via" is
confusing users so deprecate the "via" option in favour of newly added
explicit machine types. The default via=cuda option is not a valid
config (no real Mac has this combination of hardware) so no machine
type could be defined for that therefore it is kept for backwards
compatibility with older QEMU versions for now but other options
resembling real machines are deprecated.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 2bba29686d..4ca9ab3e03 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -169,6 +169,15 @@ static void ppc_core99_init(MachineState *machine)
         if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
             warn_report("mac99 with G5 CPU is deprecated, "
                         "use powermac7_3 instead");
+        } else {
+            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU) {
+                warn_report("mac99,via=pmu is deprecated, "
+                            "use powermac3_1 instead");
+            }
+            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB) {
+                warn_report("mac99,via=pmu-adb is deprecated, "
+                            "use powerbook3_2 instead");
+            }
         }
     }
     /* allocate RAM */
-- 
2.30.6


