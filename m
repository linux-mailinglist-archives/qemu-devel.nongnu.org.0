Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B164D004
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 20:21:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5XIZ-00052Y-AR; Wed, 14 Dec 2022 14:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5XIV-00052I-Hb
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 14:20:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5XIR-0007Ug-Oi
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 14:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671045602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kzH76DvYwAd9Rk8+W8X3hXrSlAU3dTJpt8Rtrhi0Hrc=;
 b=dVViWyKDMHWrnwJfiAgr3iZ/Rfb3iUeXk7iyx+ps4KgfALWb2OnPQQpvkpdwIdTa+++Tb/
 pFArI0e+yTZw01NasDyhvw0PtSKcuIy5YZ0mei8GSZ62KrnDC4o/R5A1+y4CrRUuYohEMM
 35YS9WACGUOLaUNh2iiETOMuH3bewqc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-svPVb_EKNqy8Xh1EEL8pfA-1; Wed, 14 Dec 2022 14:19:59 -0500
X-MC-Unique: svPVb_EKNqy8Xh1EEL8pfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F067E3C0F676;
 Wed, 14 Dec 2022 19:19:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A982140C945A;
 Wed, 14 Dec 2022 19:19:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 965C021E6900; Wed, 14 Dec 2022 20:19:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 00/30] QAPI patches patches for 2022-12-14
Date: Wed, 14 Dec 2022 20:19:55 +0100
Message-Id: <20221214191957.1100171-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit ea3a008d2d9ced9c4f93871c823baee237047f93:

  Update VERSION for v7.2.0-rc4 (2022-12-06 19:53:34 -0500)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-12-14-v2

for you to fetch changes up to 5efb40d6571457c3cc35b7a91088cc2fceee5763:

  qapi: Drop temporary logic to support conversion step by step (2022-12-14 20:05:07 +0100)

----------------------------------------------------------------
QAPI patches patches for 2022-12-14

----------------------------------------------------------------
Markus Armbruster (30):
      docs/devel/qapi-code-gen: Update example to match current code
      qapi: Tidy up whitespace in generated code
      docs/devel/qapi-code-gen: Extend example for next commit's change
      qapi: Start to elide redundant has_FOO in generated C
      qapi tests: Elide redundant has_FOO in generated C
      qapi acpi: Elide redundant has_FOO in generated C
      qapi audio: Elide redundant has_FOO in generated C
      blockdev: Clean up abuse of DriveBackup member format
      nbd/server: Clean up abuse of BlockExportOptionsNbd member @arg
      qapi block: Elide redundant has_FOO in generated C
      qapi chardev: Elide redundant has_FOO in generated C
      qapi crypto: Elide redundant has_FOO in generated C
      qapi dump: Elide redundant has_FOO in generated C
      qapi job: Elide redundant has_FOO in generated C
      qapi machine: Elide redundant has_FOO in generated C
      qapi migration: Elide redundant has_FOO in generated C
      qapi misc: Elide redundant has_FOO in generated C
      qapi net: Elide redundant has_FOO in generated C
      qapi pci: Elide redundant has_FOO in generated C
      qapi qdev qom: Elide redundant has_FOO in generated C
      qapi replay: Elide redundant has_FOO in generated C
      qapi rocker: Elide redundant has_FOO in generated C
      qapi run-state: Elide redundant has_FOO in generated C
      qapi stats: Elide redundant has_FOO in generated C
      qapi tpm: Elide redundant has_FOO in generated C
      qapi transaction: Elide redundant has_FOO in generated C
      qapi ui: Elide redundant has_FOO in generated C
      qapi virtio: Elide redundant has_FOO in generated C
      qapi qga: Elide redundant has_FOO in generated C
      qapi: Drop temporary logic to support conversion step by step

 docs/devel/qapi-code-gen.rst             |  29 ++++-
 docs/devel/writing-monitor-commands.rst  |  14 +--
 include/monitor/monitor.h                |   3 +-
 audio/alsaaudio.c                        |   2 +-
 audio/audio.c                            |   6 +-
 audio/audio_legacy.c                     |  17 ++-
 audio/ossaudio.c                         |   8 +-
 audio/paaudio.c                          |  12 +-
 audio/sndioaudio.c                       |   2 +-
 audio/wavaudio.c                         |   2 +-
 backends/tpm/tpm_passthrough.c           |   2 -
 block/block-backend.c                    |   2 +-
 block/copy-before-write.c                |   2 +-
 block/dirty-bitmap.c                     |   1 -
 block/export/export.c                    |   2 +-
 block/export/vduse-blk.c                 |   3 +-
 block/gluster.c                          |   3 -
 block/monitor/block-hmp-cmds.c           |  48 ++++----
 block/qapi-sysemu.c                      |  73 +++++-------
 block/qapi.c                             |  62 ++++-------
 block/qcow.c                             |  10 +-
 block/qcow2.c                            |  18 ++-
 block/qed.c                              |   2 +-
 block/quorum.c                           |   2 +-
 block/rbd.c                              |  17 +--
 block/ssh.c                              |   2 +-
 blockdev-nbd.c                           |   9 +-
 blockdev.c                               | 185 +++++++++++++------------------
 blockjob.c                               |   2 -
 chardev/char-file.c                      |   4 +-
 chardev/char-socket.c                    |  10 +-
 chardev/char-udp.c                       |   1 -
 chardev/char.c                           |   6 +-
 crypto/block-luks.c                      |  16 +--
 dump/dump.c                              |   4 +-
 hw/acpi/core.c                           |  14 +--
 hw/acpi/cpu.c                            |   1 -
 hw/acpi/memory_hotplug.c                 |   3 +-
 hw/core/machine-hmp-cmds.c               |   2 +-
 hw/core/machine-qmp-cmds.c               |   9 +-
 hw/core/machine.c                        |  10 +-
 hw/core/numa.c                           |   8 +-
 hw/core/qdev.c                           |   2 +-
 hw/mem/pc-dimm.c                         |   1 -
 hw/net/rocker/rocker_of_dpa.c            |  13 +--
 hw/net/virtio-net.c                      |   3 +-
 hw/nvram/fw_cfg.c                        |   2 +-
 hw/pci/pci.c                             |   2 -
 hw/ppc/spapr.c                           |   2 +-
 hw/ppc/spapr_drc.c                       |   3 +-
 hw/virtio/virtio-mem-pci.c               |   4 +-
 hw/virtio/virtio-pmem-pci.c              |   1 -
 hw/virtio/virtio.c                       |   1 -
 job-qmp.c                                |   3 +-
 migration/block-dirty-bitmap.c           |   4 +-
 migration/colo.c                         |   1 -
 migration/migration.c                    |  27 ++---
 monitor/hmp-cmds.c                       |  84 +++++++-------
 monitor/misc.c                           |  21 +---
 monitor/qmp-cmds.c                       |  11 +-
 nbd/server.c                             |  15 +--
 net/announce.c                           |   8 +-
 net/hub.c                                |   2 +-
 net/l2tpv3.c                             |   2 +-
 net/net.c                                |  25 ++---
 net/slirp.c                              |   4 +-
 net/socket.c                             |  18 +--
 net/tap-win32.c                          |   2 +-
 net/tap.c                                |  51 +++++----
 net/vhost-vdpa.c                         |   6 +-
 net/vmnet-host.c                         |  20 ++--
 net/vmnet-shared.c                       |  16 +--
 qemu-img.c                               |  13 +--
 qemu-nbd.c                               |   2 -
 qga/commands-posix.c                     |  32 ++----
 qga/commands-win32.c                     |  40 ++-----
 qga/commands.c                           |  11 +-
 qom/qom-qmp-cmds.c                       |   7 +-
 replay/replay-debugging.c                |   1 -
 softmmu/runstate.c                       |  18 +--
 softmmu/vl.c                             |   2 +-
 stubs/qdev.c                             |   6 +-
 target/arm/monitor.c                     |   1 -
 target/i386/cpu-sysemu.c                 |   7 +-
 target/i386/cpu.c                        |   1 -
 target/s390x/cpu_models_sysemu.c         |   1 -
 tests/qtest/fuzz/qos_fuzz.c              |   3 +-
 tests/qtest/qmp-cmd-test.c               |   2 +-
 tests/unit/test-char.c                   |   1 -
 tests/unit/test-crypto-block.c           |   6 -
 tests/unit/test-qmp-cmds.c               |  26 ++---
 tests/unit/test-qmp-event.c              |   4 +-
 tests/unit/test-qobject-input-visitor.c  |   2 +-
 tests/unit/test-qobject-output-visitor.c |   2 -
 tests/unit/test-visitor-serialization.c  |   3 +-
 ui/console.c                             |   4 +-
 ui/input.c                               |   4 +-
 ui/spice-core.c                          |   5 -
 ui/vnc.c                                 |  10 --
 util/qemu-config.c                       |  17 +--
 scripts/qapi/commands.py                 |   9 +-
 scripts/qapi/events.py                   |   3 +-
 scripts/qapi/gen.py                      |   2 +-
 scripts/qapi/schema.py                   |  14 +++
 scripts/qapi/types.py                    |   2 +-
 scripts/qapi/visit.py                    |  17 ++-
 ui/cocoa.m                               |  11 +-
 107 files changed, 511 insertions(+), 760 deletions(-)

-- 
2.37.3


