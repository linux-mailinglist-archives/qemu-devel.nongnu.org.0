Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776AE45495F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:56:13 +0100 (CET)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMM8-0003ZJ-Hj
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnME2-0004kN-37
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:50 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnME0-0000p3-4j
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:49 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1A68421EB6;
 Wed, 17 Nov 2021 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637160466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KQLb65SkXZKtlxt5HOSASbo+9p09N+teG3AW4qf7rg=;
 b=m3tRPgYE7MEeIm0hyszCO4DCkW3avU27gWyDY3GkAZI3cWs8jS57jXwW3jDj3ChRp/RfmW
 VwtgQbAEC1R5+ag7b+gliI8N9nsQ/cSmLnLTgbYGD8GWa0vCJjjOOJdhz4XsaqTjdmJYJb
 SAyQEFWsp3wgsrcfco5yRsxp446E6I4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 4/5] qapi: Allow device_add to execute in machine
 initialized phase
Date: Wed, 17 Nov 2021 15:47:02 +0100
Message-Id: <20211117144703.16305-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117144703.16305-1-damien.hedde@greensocs.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, edgar.iglesias@xilinx.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 qapi/qdev.json         | 3 ++-
 monitor/misc.c         | 2 +-
 softmmu/qdev-monitor.c | 6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 69656b14df..51c5b2fbcf 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -74,7 +74,8 @@
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
   'gen': false, # so we can get the additional arguments
-  'features': ['json-cli'] }
+  'features': ['json-cli'],
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
index 1d6a1c4716..06729145b7 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -842,6 +842,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     QemuOpts *opts;
     DeviceState *dev;
 
+    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
+        error_setg(errp, "The command is permitted only after "
+                         "the machine is initialized");
+        return;
+    }
+
     opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
     if (!opts) {
         return;
-- 
2.33.0


