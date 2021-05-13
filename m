Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5137F46E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:48:48 +0200 (CEST)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh71T-0007m8-49
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gc-0005Hd-Jo
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:14 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6ga-0001Ry-Dy
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:14 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7AF0621EC6;
 Thu, 13 May 2021 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgJPQXOU6NHeyg5t7nw6JCc7Cpd8OiIZ0yXW23WKC/M=;
 b=uhZGK8/o6HFjF8mYeT8B06LQ6XuwE8fqdDgspYtoylU84kNfUJPkh/gtE8ZIdUHYnKfVYo
 TRxsxNtn08raeW0vH8BaHcwcNlfhBWYyEyAqCF9BqaehctSnnVhneO+a/k5QTAdFNOoqc8
 ZSwiJRLNJG+XnD3wfyIzWQUyZGZpH5I=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] qapi: Allow some commands to be executed in machine
 'initialized' phase
Date: Thu, 13 May 2021 10:25:49 +0200
Message-Id: <20210513082549.114275-10-mirela.grujic@greensocs.com>
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following commands are allowed to execute during the machine
'initialized' phase (enabled with 'allow-init-config' option):
1) query-machine-phase
2) next-machine-phase
3) advance-machine-phase
3) device_add

Note: for device_add command in qdev.json adding the 'allow-init-config'
option has no effect because the command appears to bypass QAPI (see
TODO at qapi/qdev.json:61). The option is added there solely to document
the intent.
For the same reason, the flags have to be explicitly set in
monitor_init_qmp_commands() when the device_add command is registered.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json | 7 ++++---
 qapi/qdev.json    | 3 ++-
 monitor/misc.c    | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 31872aae72..c77ea03acb 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1327,7 +1327,7 @@
 #
 ##
 { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
-             'allow-preconfig': true }
+             'allow-preconfig': true, 'allow-init-config': true }
 
 ##
 # @next-machine-phase:
@@ -1351,7 +1351,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'next-machine-phase', 'allow-preconfig': true }
+{ 'command': 'next-machine-phase', 'allow-preconfig': true,
+             'allow-init-config': true }
 
 ##
 # @advance-machine-phase:
@@ -1377,4 +1378,4 @@
 #
 ##
 { 'command': 'advance-machine-phase', 'data' : {'phase': 'MachineInitPhase'},
-             'allow-preconfig': true }
+             'allow-preconfig': true, 'allow-init-config': true }
diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..2706ef3efa 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -67,7 +67,8 @@
 ##
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
-  'gen': false } # so we can get the additional arguments
+  'gen': false, # so we can get the additional arguments
+  'allow-init-config': true }
 
 ##
 # @device_del:
diff --git a/monitor/misc.c b/monitor/misc.c
index 55f3744053..88a0edff0a 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -232,7 +232,7 @@ static void monitor_init_qmp_commands(void)
     qmp_init_marshal(&qmp_commands);
 
     qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
-                         QCO_NO_OPTIONS);
+                         QCO_ALLOW_INIT_CONFIG);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
-- 
2.25.1


