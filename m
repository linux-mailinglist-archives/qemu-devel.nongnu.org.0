Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89D50A999
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:56:54 +0200 (CEST)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcv7-0007vJ-6K
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcY4-0000VF-Ob
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:33:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcY2-0005nj-N0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:33:04 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcX2-000Caf-Qm; Thu, 21 Apr 2022 20:32:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:59 +0100
Message-Id: <20220421193100.5098-50-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 49/50] hppa: fold machine_hppa_machine_init() into
 machine_hppa_machine_init_class_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There is no need for a separate function to set the machine class properties
separately from the others.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/machine.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index dc9950d5d5..3176c7897e 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -446,8 +446,11 @@ static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
     }
 }
 
-static void machine_hppa_machine_init(MachineClass *mc)
+static void machine_hppa_machine_init_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+    NMIClass *nc = NMI_CLASS(oc);
+
     mc->desc = "HPPA generic machine";
     mc->default_cpu_type = TYPE_HPPA_CPU;
     mc->init = machine_hppa_init;
@@ -459,14 +462,7 @@ static void machine_hppa_machine_init(MachineClass *mc)
     mc->default_ram_size = 512 * MiB;
     mc->default_boot_order = "cd";
     mc->default_ram_id = "ram";
-}
 
-static void machine_hppa_machine_init_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    machine_hppa_machine_init(mc);
-
-    NMIClass *nc = NMI_CLASS(oc);
     nc->nmi_monitor_handler = hppa_nmi;
 }
 
-- 
2.20.1


