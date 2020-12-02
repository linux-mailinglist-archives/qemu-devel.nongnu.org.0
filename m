Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5D2CB93E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:41:36 +0100 (CET)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOdj-0006hg-3x
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNLs-0006ZU-Hx
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNLq-0006tu-36
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j0ej27u8zxwgL7LeSFqNpOuVMHclK6x3HPUz7oQDyTE=;
 b=gkGGEl2Hw1XUFBDclnuGNyTG/eEgS6MVIKk5eyzkI6b+g3pNHtajQ9mcYcR8VU+UHHObdL
 PZPdQmAP9FcHzTZv/muoTIK2pWxLjUQjg3y+/0bQcP2evLhK6Nh3KFwuFLVb6Bqp828c/4
 fNGOpyN34qao0v02bWNuyWVzmeZ3lLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-yZxbK-mfM1mL6nhYBWDXxA-1; Wed, 02 Dec 2020 03:18:56 -0500
X-MC-Unique: yZxbK-mfM1mL6nhYBWDXxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FF131084C84
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:18:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB0B10013C1;
 Wed,  2 Dec 2020 08:18:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] Finish cleaning up qemu_init
Date: Wed,  2 Dec 2020 03:18:39 -0500
Message-Id: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are the patches that needed another review, had some conflicts,
or were not quite ready for the previous posting.

Highlights include:

- fixing the HMP prompt for -preconfig

- enabling the qtest server with -object instead of -qtest

- decoupling target machine code from QemuOpts

Based-on: <20201202080849.4125477-1-pbonzini@redhat.com>

Paolo Bonzini (15):
  remove preconfig state
  vl: remove separate preconfig main_loop
  vl: allow -incoming defer with -preconfig
  vl: extract softmmu/runstate.c
  vl: extract softmmu/globals.c
  vl: move all generic initialization out of vl.c
  chardev: do not use machine_init_done
  machine: introduce MachineInitPhase
  machine: record whether nvdimm= was set
  vl: make qemu_get_machine_opts static
  qtest: add a QOM object for qtest
  plugin: propagate errors
  memory: allow creating MemoryRegions before accelerators
  null-machine: do not create a default memdev
  monitor: allow quitting while in preconfig state

 accel/kvm/kvm-all.c           |  11 +-
 chardev/char-mux.c            |  38 +-
 chardev/chardev-sysemu.c      |  69 ---
 chardev/meson.build           |   2 +-
 hmp-commands.hx               |   1 +
 hw/arm/boot.c                 |   2 +-
 hw/core/machine-qmp-cmds.c    |   7 +-
 hw/core/machine.c             |  56 +-
 hw/core/null-machine.c        |   2 +-
 hw/core/qdev.c                |  28 +-
 hw/microblaze/boot.c          |   9 +-
 hw/nios2/boot.c               |   9 +-
 hw/pci/pci.c                  |   2 +-
 hw/ppc/e500.c                 |   5 +-
 hw/ppc/spapr_nvdimm.c         |   4 +-
 hw/ppc/virtex_ml507.c         |   2 +-
 hw/riscv/sifive_u.c           |   6 +-
 hw/riscv/virt.c               |   6 +-
 hw/usb/core.c                 |   2 +-
 hw/virtio/virtio-iommu.c      |   2 +-
 hw/xtensa/xtfpga.c            |   9 +-
 include/chardev/char.h        |   6 +-
 include/exec/cpu-common.h     |   3 +
 include/exec/exec-all.h       |   3 -
 include/hw/mem/nvdimm.h       |   2 +-
 include/hw/qdev-core.h        |  33 +-
 include/qapi/qmp/dispatch.h   |   1 +
 include/qemu/plugin.h         |   4 +-
 include/sysemu/runstate.h     |   1 -
 include/sysemu/sysemu.h       |   7 +-
 linux-user/main.c             |   4 +-
 monitor/hmp.c                 |   7 +-
 monitor/qmp-cmds.c            |  10 -
 plugins/loader.c              |  34 +-
 qapi/control.json             |   3 +-
 qapi/qmp-dispatch.c           |   5 +-
 qapi/run-state.json           |   5 +-
 softmmu/device_tree.c         |   2 +-
 softmmu/globals.c             |  74 +++
 softmmu/memory.c              |  12 +-
 softmmu/meson.build           |   2 +
 softmmu/qdev-monitor.c        |  34 +-
 softmmu/qtest.c               | 144 ++++-
 softmmu/runstate.c            | 800 ++++++++++++++++++++++++++++
 softmmu/vl.c                  | 958 ++--------------------------------
 stubs/machine-init-done.c     |   8 -
 stubs/meson.build             |   2 +-
 stubs/qmp-command-available.c |   7 +
 tests/qtest/qmp-test.c        |   2 +-
 ui/console.c                  |   2 +-
 50 files changed, 1312 insertions(+), 1135 deletions(-)
 delete mode 100644 chardev/chardev-sysemu.c
 create mode 100644 softmmu/globals.c
 create mode 100644 softmmu/runstate.c
 delete mode 100644 stubs/machine-init-done.c
 create mode 100644 stubs/qmp-command-available.c

-- 
2.26.2


