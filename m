Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA2452D7EC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:40164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriEe-0004m7-Dn
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAd-0001ai-V4
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:36 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAY-0007oh-9l
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:33 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id EBFA321C39;
 Thu, 19 May 2022 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652974467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efJjLQhFD/JgowKYsCQ9T6+G0NfNbn6JDTD+53ql1K8=;
 b=IX4lK/ptrDpJ+TP5pHZdUkn0nal6kz/I37gJqpQ83vz/RVDXgHy4Ot+c0HpwjiJFnGvw/f
 OcY2l4UISj7qP7Eg46zf9wS2gMyyybtt//Y7dGMOavNfzS8DyR1C2FEWfLRx6G3hoR2gPK
 544J1k1xw+MBLbKvlTOGmO49DS91rKY=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, edgari@xilinx.com,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 3/6] vl: support machine-initialized target in phase_until()
Date: Thu, 19 May 2022 17:33:59 +0200
Message-Id: <20220519153402.41540-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519153402.41540-1-damien.hedde@greensocs.com>
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

v5: update due to refactor of previous commit
---
 softmmu/vl.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7f8d15b5b8..ea15e37973 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2698,8 +2698,9 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
-        error_setg(errp, "The command is permitted only before machine initialization");
+    if (phase_check(PHASE_MACHINE_READY)) {
+        error_setg(errp, "The command is permitted only before"
+                         " machine is ready");
         return;
     }
     phase_until(PHASE_MACHINE_READY, errp);
@@ -2707,9 +2708,6 @@ void qmp_x_exit_preconfig(Error **errp)
 
 static void qemu_phase_ready(Error **errp)
 {
-    qemu_init_board();
-    /* phase is now PHASE_MACHINE_INITIALIZED. */
-    qemu_create_cli_devices();
     cxl_fixed_memory_window_link_targets(errp);
     qemu_machine_creation_done();
     /* Phase is now PHASE_MACHINE_READY. */
@@ -2749,6 +2747,24 @@ bool phase_until(MachineInitPhase phase, Error **errp)
 
         switch (cur_phase) {
         case PHASE_ACCEL_CREATED:
+            qemu_init_board();
+            /* Phase is now PHASE_MACHINE_INITIALIZED. */
+            /*
+             * Handle CLI devices now in order leave this case in a state
+             * where we can cold plug devices with QMP. The following call
+             * handles the CLI options:
+             * + -fw_cfg (has side effects on device cold plug)
+             * + -device
+             */
+            qemu_create_cli_devices();
+            /*
+             * At this point all CLI options are handled apart:
+             * + -S (autostart)
+             * + -incoming
+             */
+            break;
+
+        case PHASE_MACHINE_INITIALIZED:
             qemu_phase_ready(errp);
             break;
 
-- 
2.36.1


