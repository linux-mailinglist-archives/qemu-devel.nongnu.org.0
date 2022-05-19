Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5552D7EB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriEd-0004iE-J8
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAn-0001cY-FX
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAh-0007ps-89
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:42 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 390A321EBE;
 Thu, 19 May 2022 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652974468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeWnil44tT+hHONeKx07OOPCoTcvcDXkdkPxA/V/xiI=;
 b=tsQxZ92QZN/KtT5ew97zFbSnmo+Vm7c+C4cjk8jU5GCoVC7amRidFG1FD0eMcDFRYsemJC
 2anUHHRY8yvnQeoa2jU3xiqWQbkljvfneJcBOlqIXYErK/rtHXZGZIr2RNw6OZOQ/JDUP4
 hnG6f73iHdb7r4McA20mzIr9v8kthTE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, edgari@xilinx.com,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 6/6] qapi/device_add: Allow execution in machine
 initialized phase
Date: Thu, 19 May 2022 17:34:02 +0200
Message-Id: <20220519153402.41540-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519153402.41540-1-damien.hedde@greensocs.com>
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mirela Grujic <mirela.grujic@greensocs.com>

This commit allows to use the QMP command to add a cold-plugged
device like we can do with the CLI option -device.

Note: for device_add command in qdev.json adding the 'allow-preconfig'
option has no effect because the command appears to bypass QAPI (see
TODO at qapi/qdev.json:61). The option is added there solely to
document the intent.
For the same reason, the flags have to be explicitly set in
monitor_init_qmp_commands() when the device_add command is registered.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v4:
 + use phase_until()
 + add missing flag in hmp-commands.hx
---
 qapi/qdev.json         | 3 ++-
 monitor/misc.c         | 2 +-
 softmmu/qdev-monitor.c | 4 ++++
 hmp-commands.hx        | 1 +
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 26cd10106b..2e2de41499 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -77,7 +77,8 @@
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
   'gen': false, # so we can get the additional arguments
-  'features': ['json-cli', 'json-cli-hotplug'] }
+  'features': ['json-cli', 'json-cli-hotplug'],
+  'allow-preconfig': true }
 
 ##
 # @device_del:
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c5bb82d3b..d3d413d70c 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -233,7 +233,7 @@ static void monitor_init_qmp_commands(void)
     qmp_init_marshal(&qmp_commands);
 
     qmp_register_command(&qmp_commands, "device_add",
-                         qmp_device_add, 0, 0);
+                         qmp_device_add, QCO_ALLOW_PRECONFIG, 0);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 7cbee2b0d8..c53f62be51 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -855,6 +855,10 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     QemuOpts *opts;
     DeviceState *dev;
 
+    if (!phase_until(PHASE_MACHINE_INITIALIZED, errp)) {
+        return;
+    }
+
     opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
     if (!opts) {
         return;
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 03e6a73d1f..0091b8e2dd 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -672,6 +672,7 @@ ERST
         .help       = "add device, like -device on the command line",
         .cmd        = hmp_device_add,
         .command_completion = device_add_completion,
+        .flags      = "p",
     },
 
 SRST
-- 
2.36.1


