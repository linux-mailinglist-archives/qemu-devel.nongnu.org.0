Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66337F417
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:32:43 +0200 (CEST)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6lu-00015Z-5M
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gV-0005B7-Gd
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:07 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gT-0001Ni-Ki
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:07 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 093CB21EC1;
 Thu, 13 May 2021 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6fBhBS3b7o3WLpluUkd8tn+mi7/KDouKZJvPHu/ugo=;
 b=UaDR4nwW8dPHDuAD7C1U81Q8pEXmSiWeCoDVQ8bwC+IEexuU7/y8qCvHysjvPgo7COoAyj
 co/hZrTCk6jkCXNDFzwKnSfZuYL2poHY0ZdLLMMZCrsToeM4vYTbtuiJOc3sj9CCo+3cJv
 VaUf7dg+49ipz6e/baMsYBN8slb/Uw8=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/9] qapi: Implement 'advance-machine-phase' command
Date: Thu, 13 May 2021 10:25:46 +0200
Message-Id: <20210513082549.114275-7-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command takes the target initialization phase as the argument
and triggers QEMU to advance the machine to the target phase (i.e.
execute all initialization steps required to enter the target phase).

This command would be used as an alternative to 'next-machine-phase'
if it's more convenient to jump to a target initialization phase than
to single-step through phases.

The command is used in combination with the -preconfig CLI option.

Note: advancing the machine to the 'ready' phase has the same effect as
executing the 'x-exit-preconfig' command when the machine is in
'accel-created' phase.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json          | 26 ++++++++++++++++++++++++++
 hw/core/machine-qmp-cmds.c | 10 ++++++++++
 2 files changed, 36 insertions(+)

diff --git a/qapi/machine.json b/qapi/machine.json
index 968d67dd95..31872aae72 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1352,3 +1352,29 @@
 #
 ##
 { 'command': 'next-machine-phase', 'allow-preconfig': true }
+
+##
+# @advance-machine-phase:
+#
+# Advance machine initialization phase to the target phase
+#
+# @phase: target machine initialization phase
+#
+# Since: #FIXME
+#
+# Returns: If successful, nothing
+#
+# Notes: This command will trigger QEMU to execute initialization steps
+#        that are required to enter the target machine initialization phase.
+#        If the target phase is the final initialization phase, the guest will
+#        start running immediately unless the -S option is used. The command
+#        is available only if the -preconfig command line option was passed.
+#
+# Example:
+#
+# -> { "execute": "advance-machine-phase", "arguments": { "phase": "ready" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'advance-machine-phase', 'data' : {'phase': 'MachineInitPhase'},
+             'allow-preconfig': true }
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 8aa743d59b..6b21a3fdd5 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -219,3 +219,13 @@ void qmp_next_machine_phase(Error **errp)
 
     qemu_machine_enter_phase(target_phase, errp);
 }
+
+void qmp_advance_machine_phase(MachineInitPhase phase, Error **errp)
+{
+    if (phase_get() == phase) {
+        error_setg(errp, "Machine is already in the target phase");
+        return;
+    }
+
+    qemu_machine_enter_phase(phase, errp);
+}
-- 
2.25.1


