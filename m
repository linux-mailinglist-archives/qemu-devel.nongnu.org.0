Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475D4C0F97
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:52:14 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoJg-0008OY-20
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncc-0001Tx-FH
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncP-0001zS-Qc
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:36 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1EE4921C6C;
 Wed, 23 Feb 2022 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fK//uTVRDEVguoVlIYMceoQvqPjIUKZhtPzueFDLdN8=;
 b=RyF1Y2XrrYTdeCE6ex2l5r4njs1SWF+Ew2G0Pk4uiLXvDtQYoMZ4TXkNgR6aPWvqZkDZ/Y
 1Nb615lGzed7PoPOv5wBiX9WrNMr3aZwlkcIg/Mj+aDUCoxhgDUrN8lcMM+II34SRqtICy
 P/ApJZpEDoLkrxc84N3SZxPi8VwRyZA=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 03/14] vl: support machine-initialized target in
 phase_until()
Date: Wed, 23 Feb 2022 10:06:55 +0100
Message-Id: <20220223090706.4888-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

phase_until() now supports the following transitions:
+ accel-created -> machine-initialized
+ machine-initialized -> machine-ready

As a consequence we can now support the use of qmp_exit_preconfig()
from phases _accel-created_ and _machine-initialized_.

This commit is a preparation to support cold plugging a device
using qapi (which will be introduced in a following commit). For this
we need fine grain control of the phase.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 softmmu/vl.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5689d0be88..50337d68b9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2737,8 +2737,8 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
-        error_setg(errp, "The command is permitted only before machine initialization");
+    if (phase_check(PHASE_MACHINE_READY)) {
+        error_setg(errp, "The command is permitted only before machine is ready");
         return;
     }
     phase_until(PHASE_MACHINE_READY, errp);
@@ -2759,7 +2759,17 @@ bool phase_until(MachineInitPhase phase, Error **errp)
         case PHASE_ACCEL_CREATED:
             qemu_init_board();
             /* We are now in PHASE_MACHINE_INITIALIZED. */
+            /*
+             * Handle CLI devices now in order leave the function in a state
+             * where we can cold plug devices with QMP. The following call
+             * handles the CLI options:
+             * + -fw_cfg (has side effects on device cold plug)
+             * + -device
+             */
             qemu_create_cli_devices();
+            break;
+
+        case PHASE_MACHINE_INITIALIZED:
             /*
              * At this point all CLI options are handled apart:
              * + -S (autostart)
-- 
2.35.1


