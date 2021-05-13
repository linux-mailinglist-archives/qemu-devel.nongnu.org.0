Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7337F412
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:31:39 +0200 (CEST)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6ks-0008EZ-5n
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gH-0004gW-F9
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gE-0001Bu-EW
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:53 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 1FD842078C;
 Thu, 13 May 2021 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HV3ZaB5Hc4YHH7TPeiD7fTq+xKr0E/Hlp0+FGkrv5CM=;
 b=VzYJAXip2JfHuwq2ds6V4ug6OZ6slS8Gw292V8XCxVhxcWMGD2526rcZVrOZ9SiC0qv0+i
 pFep9No9VQwVhxL9TA6LNEyAOzKD1WzedWuF5EfhAWuzgWGiGmJ6RdRsJ+TNYZJBpYpqJb
 EUX/KtaIXmtu/ZtnCDheg/9XoQkygl8=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/9] Initial support for machine creation via QMP
Date: Thu, 13 May 2021 10:25:40 +0200
Message-Id: <20210513082549.114275-1-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
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
 Mirela Grujic <mirela.grujic@greensocs.com>, mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The direction for this work has been set in the discussion thread:
"About creating machines on the command line" in January/February 2021:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01839.html
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01070.html

To customize a machine via QMP we need the ability to stop QEMU at a specific
machine initialization phase.

Currently, machine initialization phases are:
1) no-machine: machine does not exist yet (current_machine == NULL)
2) machine-created: machine exists, but its accelerator does not
   (current_machine->accelerator == NULL)
3) accel-created: machine's accelerator is configured
   (current_machine->accelerator != NULL), but machine class's init() has not
   been called (no properties validated, machine_init_done notifiers not
   registered, no sysbus, etc.)
4) initialized: machine class's init() has been called, thus machine properties
   are validated, machine_init_done notifiers registered, sysbus realized, etc.
   Devices added at this phase are considered to be cold-plugged.
5) ready: machine_init_done notifiers are called, then QEMU is ready to start
   CPUs. Devices added at this phase are considered to be hot-plugged.

QEMU can be stopped today using the -preconfig CLI option at phase 3
(accel-created). This option was introduced to enable the QMP configuration of
parameters that affect the machine initialization. We cannot add devices at
this point because the machine class's init() has not been called, thus sysbus
does not exist yet (a device cannot be added because there is no bus to attach
it to).

QEMU can be also stopped using the -S CLI option at the machine ready phase.
However, it is too late to add devices at this phase because the machine is
already configured, and any devices added at this point are considered to be
hot-plugged.

Since the existing -preconfig CLI option stops QEMU too early, and the -S option
stops too late, we need a way to stop QEMU in between (after the machine is
initialized and before it becomes ready).

We propose to add QMP commands to step through machine phases starting from the
initial CLI's '-preconfig' early stop point. With this addition, we may now
execute QMP commands at any machine phase.

The 'next-machine-phase' command would trigger QEMU to execute initialization
steps that are needed to enter the next phase. If it's more convenient to jump
to an initialization phase than to single-step through phases, the
'advance-machine-phase' command should be used instead of 'next-machine-phase'.
Additionally, we propose to add the command to query the current machine phase,
namely 'query-machine-phase'.

With this patch it would be possible to add devices via QMP. For example,
by running QEMU with:
$ qemu-system-riscv32 \
  -M sifive_dt \
  -qmp unix:./qmp-sock,server \
  -preconfig \
  ...

and scripts/qmp/qmp-shell as the QMP client:
$ qemu/scripts/qmp/qmp-shell ./qmp-sock
Welcome to the QMP low-level shell!
Connected to QEMU 6.0.0

(QEMU) query-machine-phase
{"return": {"phase": "accel-created"}}
(QEMU) next-machine-phase
{"return": {}}
(QEMU) query-machine-phase
{"return": {"phase": "initialized"}}
(QEMU) device_add driver=...
{"return": {}}
(QEMU) next-machine-phase
{"return": {}}
(QEMU) query-machine-phase
{"return": {"phase": "ready"}}

Note that with the introduced changes, devices can still be added via CLI, i.e.
we support a mixed configuration approach (CLI, QMP, or CLI/QMP). Any device
specified via CLI will be added before QEMU waits for the QMP configuration
in the machine 'initialized' phase.

Mirela Grujic (9):
  vl: Allow finer control in advancing machine through phases
  replace machine phase_check with machine_is_initialized/ready calls
  rename MachineInitPhase enumeration constants
  qapi: Implement 'query-machine-phase' command
  qapi: Implement 'next-machine-phase' command
  qapi: Implement 'advance-machine-phase' command
  qdev-monitor: Restructure and fix the check for command availability
  qapi: Introduce 'allow-init-config' option
  qapi: Allow some commands to be executed in machine 'initialized'
    phase

 docs/sphinx/qapidoc.py      |   2 +-
 qapi/machine.json           | 105 ++++++++++++++++++++++++++++++++++++
 qapi/qdev.json              |   3 +-
 include/hw/qdev-core.h      |  32 ++---------
 include/qapi/qmp/dispatch.h |   1 +
 include/sysemu/sysemu.h     |   3 ++
 hw/core/machine-qmp-cmds.c  |  33 +++++++++++-
 hw/core/machine.c           |   6 +--
 hw/core/qdev.c              |  17 +++++-
 hw/pci/pci.c                |   2 +-
 hw/usb/core.c               |   2 +-
 hw/virtio/virtio-iommu.c    |   2 +-
 monitor/hmp.c               |   2 +-
 monitor/misc.c              |   2 +-
 softmmu/qdev-monitor.c      |  31 +++++++----
 softmmu/vl.c                |  94 ++++++++++++++++++++------------
 ui/console.c                |   2 +-
 scripts/qapi/commands.py    |  10 ++--
 scripts/qapi/expr.py        |   5 +-
 scripts/qapi/introspect.py  |   3 +-
 scripts/qapi/schema.py      |  10 ++--
 21 files changed, 274 insertions(+), 93 deletions(-)

-- 
2.25.1


