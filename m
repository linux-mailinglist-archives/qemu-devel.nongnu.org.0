Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0F39710C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:14:17 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1Pc-00043z-Oj
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lo1JR-0001Uq-Na
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:07:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lo1JO-0001N3-RR
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:07:53 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E8B9920775;
 Tue,  1 Jun 2021 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1622542066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=5vEyFIn0hat4Soz4d6PIKXr8fmc5BKSw+hHGDueaV/0=;
 b=fATrEj2UwJGli+YZJI/ZnovFLvpohnz5wgj21UytACrn4o0R9dYOD2cYI9PZpy6Zxy33Xb
 PPdisEmeUqlbKchm36nrGJDAx8lIk3fy2wutduvPrDWKvceSSM+Ef5pLu7iniuGjdR2D/4
 q26xWFHTS9dRFH33yIy54JCtu+CbDuI=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/specs: QMP configuration design specification
Date: Tue,  1 Jun 2021 12:07:29 +0200
Message-Id: <20210601100729.23006-1-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.17.1
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
Cc: edgar.iglesias@xilinx.com, damien.hedde@greensocs.com,
 mark.burton@greensocs.com, armbru@redhat.com,
 Mirela Grujic <mirela.grujic@greensocs.com>, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This document describes the design specification for the
configuration of machines using QMP.

The QMP configuration will be built on top of the existing:
1) machine initialization phases
2) -preconfig command line option
3) x-exit-preconfig QMP command

We plan to implement query-machine-phase and x-machine-init QMP commands,
and to enable the device_add QMP command in machine initialized phase.

The configuration flow would look like this:
1) Run qemu instance:
$ qemu-system-aarch64 \
  -qmp unix:./qmp-sock,server \
  -preconfig \
  ...

2) Run QMP client, e.g. qmp-shell:
qemu/scripts/qmp/qmp-shell ./qmp-sock
Welcome to the QMP low-level shell!
Connected to QEMU 6.0.0

(QEMU) query-machine-phase
{"return": {"phase": "accel-created"}}
(QEMU) x-machine-init
{"return": {}}
(QEMU) device_add driver=...
...
(QEMU) x-exit-preconfig
{"return": {}}

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 docs/specs/qmp-configuration.txt | 112 +++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 docs/specs/qmp-configuration.txt

diff --git a/docs/specs/qmp-configuration.txt b/docs/specs/qmp-configuration.txt
new file mode 100644
index 0000000000..69ff49cae6
--- /dev/null
+++ b/docs/specs/qmp-configuration.txt
@@ -0,0 +1,112 @@
+
+Overview
+--------
+
+The QMP configuration in the context of this design stands for customizing an
+existing machine using the QEMU Monitor Protocol (QMP). The requirement for such
+a configuration comes from the use cases where a complete system-on-chip can be
+customized: from the number of cores, available peripherals, memories, IRQ
+mapping, etc. Our goal is to enable the emulation of customized platforms
+without requiring modifications in QEMU, and thus the QEMU recompilation.
+
+We will perform the QMP configuration from a QMP client that will communicate
+with QEMU via a socket. As an example of a QMP client, we will include a script,
+namely the QMP configurator, that will read QMP commands from a configuration
+file and send them to QEMU, one by one. The configuration file will be a text
+file that includes only a list of QMP commands to be executed.
+
+We will start QEMU with the -preconfig command-line option, thus QEMU will wait
+for the QMP configuration at an early initialization phase, before the machine
+initialization. The following configuration flow will rely on the machine
+initialization phases. In each initialization phase, a set of QMP commands will
+be available for configuring the machine and advancing it to the next
+initialization phase. Upon reaching the final initialization phase, the machine
+shall be ready to run. We specify detailed configuration flow in
+"QMP configuration flow in QEMU."
+
+
+QMP configurator
+----------------
+
+We decided to include the QMP configurator, a QMP client script that will
+communicate with QEMU, to automate the configuration. The QMP configurator will
+read the QMP commands from the configuration file, send each QMP command to
+QEMU, and quit at the end or exit earlier in the case of an error. We have not
+envisioned the QMP configurator to be interactive. For debugging purposes, one
+could use the QMP shell instead (scripts/qmp/qmp-shell).
+
+
+QMP configuration file
+----------------------
+
+The QMP configuration file will be a text file that includes only a list of
+QMP commands which configure the machine. QMP commands in the configuration file
+shall be in the same format and order as if they were issued using the QMP
+shell. The QMP configurator will convert each command into JSON format before
+sending it to QEMU, similarly as the QMP shell does.
+
+There are several ways to create a configuration file. One approach is to
+manually create a list of QMP commands which specify how to configure the
+machine. Another convenient method is to generate QMP commands from existing
+descriptions, such as the device tree or a proprietary format. Either way, the
+creation of the configuration file is out of the scope of this work.
+
+However, along with the QMP configurator, we will include an example of the
+machine and its configuration file to demonstrate the QMP configuration
+approach.
+
+
+QMP configuration flow in QEMU
+------------------------------
+
+We will build the QMP configuration flow on top of the machine initialization
+phases, that are:
+1) no-machine: machine does not exist yet (current_machine == NULL)
+2) machine-created: machine exists, but its accelerator does not
+   (current_machine->accelerator == NULL)
+3) accel-created: machine's accelerator is configured
+   (current_machine->accelerator != NULL), but machine class's init() has not
+   been called (no properties validated, machine_init_done notifiers not
+   registered, no sysbus, etc.)
+4) initialized: machine class's init() has been called, thus machine properties
+   are validated, machine_init_done notifiers registered, sysbus realized, etc.
+   Devices added at this phase are considered to be cold-plugged.
+5) ready: machine_init_done notifiers are called, then QEMU is ready to start
+   CPUs. Devices added at this phase are considered to be hot-plugged.
+
+We can stop QEMU today using the -preconfig command-line option at phase 3
+('accel-created'). This option was introduced to enable the QMP configuration of
+parameters that affect the machine initialization. We cannot add devices at
+this point because the machine class's init() has not been called, thus sysbus
+does not exist yet (a device cannot be added because there is no bus to attach
+it to).
+
+QEMU can be also stopped using the -S command-line option at the machine 'ready'
+phase. However, it is too late to add devices at this phase because the machine
+is already configured, and any devices added at this point are considered to be
+hot-plugged.
+
+Since the existing -preconfig command-line option stops QEMU too early, and the
+-S option stops too late, we need a way to stop QEMU in between (after the
+machine is initialized and before it becomes ready).
+
+We will reuse the existing -preconfig command-line option to stop QEMU at the
+'accel-created' phase. Then, we will add a QMP command, namely 'x-machine-init',
+to advance and stop the machine in the next initialization phase
+('initialized' phase). We will configure the machine during this phase using the
+existing 'device_add' QMP command. Note that the use of 'device_add' QMP command
+is currently not allowed before the machine is ready. We will enable the use of
+'device_add' during the 'initialized' phase.
+
+Once we complete the configuration, we will advance the machine to the 'ready'
+phase using the existing 'x-exit-preconfig' command. Upon the execution of
+'x-exit-preconfig' command, the machine will immediately start running the guest
+unless the -S option is provided as the command-line argument.
+
+We will also implement a QMP command to query the current machine initialization
+phase, namely the 'query-machine-phase' command.
+
+--------------------------------------------------------------------------------
+
+This work is supported by Xilinx, SiFive, and Greensocs.
+
-- 
2.17.1


