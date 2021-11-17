Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AF454942
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:52:34 +0100 (CET)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMIb-0007ai-DY
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnMDz-0004cv-FS
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:47 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnMDx-0000nS-0B
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:47 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4FDAC20777;
 Wed, 17 Nov 2021 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637160461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mPQvtnVZ+1pJAT+v9E6WdPoA6ioe/Nirtpc3BY4lIGA=;
 b=saFdDy7H/e+Up5V6KTiTJ0SH9FuEupRDahM9s6i57Yys/s6yCTXq0zIW2VGgkcgMr8GpTY
 iqHuUPffD4qlcjtsf//+961hyA1P97JaKCmIxy8cJfPtdJ9jhNtJtjNq84Ig5XkGK11kz5
 /b8TepFrSNYP0bF1O/dziJ1awIhPUpI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
Date: Wed, 17 Nov 2021 15:46:58 +0100
Message-Id: <20211117144703.16305-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
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

Hi all,

This series adds support for cold-plugging devices using QMP
commands. It is a step towards machine configuration using QMP, but
it does not allow the user to add more devices than he could do with
the CLI options before.

Right now we can add a device using 2 ways:
+ giving "-device" CLI option. In that case the device is
  cold-plugged: it is created before the machine becomes ready.
+ issuing device_add QMP command. In that case the device is
  hot-plugged (the command can not be issued before the machine is
  ready).

This series allows to issue device_add QMP to cold-plug a device
like we do with "-device" CLI option. All added QMP commands are
marked as 'unstable' in qapi as they are part of preconfig.
We achieve this by introducing a new 'x-machine-init' command to
stop the VM creation at a point where we can cold-plug devices.

We are aware of the ongoing discussion about preconfig future (see
[1]). This patchset includes no major modifications from the v2 (but
the scope is reduced) and "x-machine-init" simply stops the
configuration between qemu_board_init() and qemu_create_cli_devices()
function calls.

As a consequence, in the current state, the timeline is:
+ "x-machine-init" command
+ "device_add" cold-plug commands (no fw_cfg legacy order support)
+ "x-exit-preconfig" command will then trigger the following
+ "-soundhw" CLI options
+ "-fw_cfg" CLI options
+ usb devices creation
+ "-device" CLI options (with fw_cfg legacy order support)
+ some other devices creation (with fw_cfg legacy order support)

We don't know if the differences between -device/device_add are
acceptable or not. To reduce/remove them we could move the
"x-machine-init" stopping point. What do you think ?

Patches 1, 3 and 5 miss a review.

The series is organized as follow:

+ Patches 1 and 2 converts the MachinePhase enum to a qapi definition
  and add the 'query-machine-phase'. It allows to introspect the
  current machine phase during preconfig as we will now be able to
  reach several machine phases using QMP.
+ Patch 3 adds the 'x-machine-init' QMP command to stop QEMU at
  machine-initialized phase during preconfig.
+ Patch 4 allows issuing device_add QMP command during the
  machine-initialized phase.
+ Patch 5 improves the doc about preconfig in consequence. 

[1]: https://lore.kernel.org/qemu-devel/b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com

Thanks for your feedback.

---
Damien

v3:
 + extracted patches related to cold-plugging devices from the v2 rfc
 + updated for rebase (qapi 'unstable' feature addition and 7.0 version bump)
 + fix check for x-machine-init command (and drop Alistair's ack-by on
   patch 4)
 + extracted only a bit of the doc patch
 + drop qdev_set_id patch because it was merged in Kevin's
   "qdev: Add JSON -device" series which did a lot of cleanups in
   device_add related functions:
   https://lore.kernel.org/qemu-devel/20211008133442.141332-1-kwolf@redhat.com

v2 was part of this rfc:
https://lore.kernel.org/qemu-devel/20210922161405.140018-1-damien.hedde@greensocs.com

Damien Hedde (1):
  docs/system: improve doc about preconfig

Mirela Grujic (4):
  rename MachineInitPhase enum constants for QAPI compatibility
  qapi: Implement query-machine-phase QMP command
  qapi: Implement x-machine-init QMP command
  qapi: Allow device_add to execute in machine initialized phase

 docs/system/managed-startup.rst | 20 +++++++-
 qapi/machine.json               | 87 +++++++++++++++++++++++++++++++++
 qapi/qdev.json                  |  3 +-
 include/hw/qdev-core.h          | 30 +-----------
 hw/core/machine-qmp-cmds.c      | 11 ++++-
 hw/core/machine.c               |  6 +--
 hw/core/qdev.c                  |  7 ++-
 hw/pci/pci.c                    |  2 +-
 hw/usb/core.c                   |  2 +-
 hw/virtio/virtio-iommu.c        |  2 +-
 monitor/hmp.c                   |  2 +-
 monitor/misc.c                  |  2 +-
 softmmu/qdev-monitor.c          | 15 ++++--
 softmmu/vl.c                    | 23 ++++++---
 ui/console.c                    |  3 +-
 15 files changed, 164 insertions(+), 51 deletions(-)

-- 
2.33.0


