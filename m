Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F3B4C0F6B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:43:13 +0100 (CET)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoAy-0002zc-DI
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnch-0001UD-Me
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnce-00022r-Oy
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:47 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 7B97B21EBA;
 Wed, 23 Feb 2022 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saHwrJRZtMfgZkanr0jmyHUux2j0Im+vXN3vMdIgf10=;
 b=rruXzPzRg2p5VTQK7T0MwHeKrfTraehCcD2PdtKZ5zthw0+k7i55/wZ8LFtOwG9+WaxF4e
 4xkOZdBWQyRWKUumeSlUov87GSIw8poSJ+elh516AwKJeY+fqQ29opdsHGzQCbw0af7W2Z
 2U0MUIqSawsKWEBVzyTzurc8vTbaMSg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 06/14] qapi/device_add: Allow execution in machine
 initialized phase
Date: Wed, 23 Feb 2022 10:06:58 +0100
Message-Id: <20220223090706.4888-7-damien.hedde@greensocs.com>
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
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
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
index a3a6e47844..fd56dd8f08 100644
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
index 9ec3e0ebff..ec0eddaf72 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -853,6 +853,10 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
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
index 70a9136ac2..3237085e22 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -668,6 +668,7 @@ ERST
         .help       = "add device, like -device on the command line",
         .cmd        = hmp_device_add,
         .command_completion = device_add_completion,
+        .flags      = "p",
     },
 
 SRST
-- 
2.35.1


