Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB4D37F44E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:42:31 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6vO-0002ub-Tr
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gX-0005F6-Nq
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:10 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gV-0001OX-G8
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:09 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CE4D421EC0;
 Thu, 13 May 2021 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiWLtyGLuAVcM/hrboY5jmDN8vqn4i469A740x/y/Kg=;
 b=yMdj6Tp72RYttVCPYYTbmj9P0F/jPzmLRQ47VXP0H6lZgFyC9/e3fjyEaWGdJ6+xWUnDFT
 ExZCL9knve8jbSJXi927TWa82p9zqYKGB9SziZdpFs6RoHFcpOCAG3RhIr7tPlic4k6pLu
 OdN6ScHgVi1Ar4tKpDRo50Fl3LZMY0A=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/9] qdev-monitor: Restructure and fix the check for
 command availability
Date: Thu, 13 May 2021 10:25:47 +0200
Message-Id: <20210513082549.114275-8-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing code had to be restructured to make room for adding
checks that are specific to the machine phases.

The fix is related to the way that commands with the 'allow-preconfig'
option are treated.

Commands labelled with the 'allow-preconfig' option were meant to be allowed
during the 'preconfig' state, i.e. before the machine is initialized.
The equivalent of 'preconfig' state (after its removal) is machine init
phase MACHINE_INIT_PHASE_ACCEL_CREATED. Therefore, commands with
'allow-preconfig' option should be allowed to run while the machine is
in MACHINE_INIT_PHASE_ACCEL_CREATED phase.
Before this patch, those commands were allowed to run if the machine is
not ready, which includes three more phases besides the accel-created
phase. Since there were no means to enter other phases via QMP, the
implementation was fine. However, with the introduction of
'next-machine-phase' and 'advance-machine-phase' commands, one could
enter machine 'initialized' phase and still have available 'preconfig'
commands, which is incorrect.

This patch makes available 'allow-preconfig' commands only when they're
needed - before the machine is initialized, in the accel-created phase.
To enable a command after the machine gets initialized and before it
becomes ready, one should use 'allow-init-config' option that will be
introduced in the following patch.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 softmmu/qdev-monitor.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index be8a892517..448f9dbb6f 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -998,10 +998,19 @@ int qemu_global_option(const char *str)
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
 {
-    if (!machine_is_ready() && !(cmd->options & QCO_ALLOW_PRECONFIG)) {
-        error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
-                   cmd->name);
-        return false;
+    switch (phase_get()) {
+    case MACHINE_INIT_PHASE_ACCEL_CREATED:
+        if (cmd->options & QCO_ALLOW_PRECONFIG) {
+            return true;
+        }
+        break;
+    case MACHINE_INIT_PHASE_READY:
+        /* All commands are available when the machine is ready */
+        return true;
+    default:
+        break;
     }
-    return true;
+    error_setg(errp, "The command '%s' is not permitted at this phase",
+               cmd->name);
+    return false;
 }
-- 
2.25.1


