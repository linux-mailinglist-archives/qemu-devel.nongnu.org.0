Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01226024E3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:01:08 +0200 (CEST)
Received: from localhost ([::1]:38896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgb5-0001cm-Nw
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6C-0005gV-UO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg65-0001Ef-Hl
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bZLy/UuP4/woikt2VaoDGUdXWAIRm3o7vsT0B5RYOmo=;
 b=h1xiX1wRK1rBnQZGw8lRLk/mLoSfKjjKZ4JjBFSCN26Z8tE/pHLho7yF2ao/vYXNjgaXeR
 oqIDpEiiG0oN0L+rFJY5iQLFVYDLwIUzXEDo8PeFcU1Xc5Di5AW9WLhqElJgWIpzyjkJ/F
 NZVxhqMOoiE5NJG2sIYk+fyNQALe8n4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-5ee5HhfZMlKLds_Z7siM1Q-1; Tue, 18 Oct 2022 02:28:51 -0400
X-MC-Unique: 5ee5HhfZMlKLds_Z7siM1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADBF101A56C;
 Tue, 18 Oct 2022 06:28:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D201468208;
 Tue, 18 Oct 2022 06:28:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 28F9C21E691D; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	jsnow@redhat.com,
	eblake@redhat.com
Subject: [PATCH v2 00/28] qapi: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:21 +0200
Message-Id: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In QAPI, absent optional members are distinct from any present value.
We thus represent an optional schema member FOO as two C members: a
FOO with the member's type, and a bool has_FOO.  Likewise for function
arguments.

However, the has_FOO is actually redundant for a pointer-valued FOO,
which can be null only when has_FOO is false, i.e. has_FOO == !!FOO.
Except for arrays, where we a null FOO can also be a present empty
array.

The redundant has_FOO are a nuisance to work with.  Improve the
generator to elide them.

PATCH 01+02 are trivial documentation cleanups.

PATCH 03 tweaks an example in documentation so it'll show the change.

PATCH 04 improves the code generator, but nerfs the change for the
schema modules where handwritten code needs to be updated.

PATCH 05-27 un-nerf in reviewable chunks.  Their commit messages
refer back to PATCH 04 for an explanation of the transformation.
Please read that first.  Note that these patches combine the
mechanical transformation with obvious, local follow-up
simplifications.  If you want them separate for easier review, let me
know.

PATCH 28 drops the nerfing code.

v2:
* Rebased
  - Straighforward conflicts with commit bf0c50d4aa "monitor: expose
    monitor_puts to rest of code" resolved in PATCH 08+17
  - Commit 90c066cd68 "qmp: add QMP command x-query-virtio-status"
    necessitates nerfing qapi/virtio.json in PATCH 04, un-nerfing in
    new PATCH 26
* PATCH 14: Redundant check of params-tls_creds dropped [Philippe]
* PATCH 09+16+27: Fix for Windows

Markus Armbruster (28):
  docs/devel/qapi-code-gen: Update example to match current code
  qapi: Tidy up whitespace in generated code
  docs/devel/qapi-code-gen: Extend example for next commit's change
  qapi: Start to elide redundant has_FOO in generated C
  qapi tests: Elide redundant has_FOO in generated C
  qapi acpi: Elide redundant has_FOO in generated C
  qapi audio: Elide redundant has_FOO in generated C
  qapi block: Elide redundant has_FOO in generated C
  qapi char: Elide redundant has_FOO in generated C
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

 docs/devel/qapi-code-gen.rst             |  29 +++-
 docs/devel/writing-monitor-commands.rst  |  14 +-
 include/monitor/monitor.h                |   3 +-
 audio/alsaaudio.c                        |   2 +-
 audio/audio.c                            |   6 +-
 audio/audio_legacy.c                     |  17 +--
 audio/ossaudio.c                         |   8 +-
 audio/paaudio.c                          |  12 +-
 audio/wavaudio.c                         |   2 +-
 backends/tpm/tpm_passthrough.c           |   2 -
 block/block-backend.c                    |   2 +-
 block/copy-before-write.c                |   2 +-
 block/dirty-bitmap.c                     |   1 -
 block/export/export.c                    |   2 +-
 block/export/vduse-blk.c                 |   3 +-
 block/gluster.c                          |   3 -
 block/monitor/block-hmp-cmds.c           |  48 +++----
 block/qapi-sysemu.c                      |  73 ++++------
 block/qapi.c                             |  62 +++-----
 block/qcow.c                             |  10 +-
 block/qcow2.c                            |  18 ++-
 block/qed.c                              |   2 +-
 block/quorum.c                           |   2 +-
 block/rbd.c                              |  15 +-
 block/ssh.c                              |   2 +-
 blockdev-nbd.c                           |   9 +-
 blockdev.c                               | 173 +++++++++--------------
 blockjob.c                               |   2 -
 chardev/char-file.c                      |   4 +-
 chardev/char-socket.c                    |  10 +-
 chardev/char-udp.c                       |   1 -
 chardev/char.c                           |   6 +-
 crypto/block-luks.c                      |  16 +--
 dump/dump.c                              |   4 +-
 hw/acpi/core.c                           |  14 +-
 hw/acpi/cpu.c                            |   1 -
 hw/acpi/memory_hotplug.c                 |   3 +-
 hw/core/machine-hmp-cmds.c               |   2 +-
 hw/core/machine-qmp-cmds.c               |   9 +-
 hw/core/machine.c                        |  10 +-
 hw/core/numa.c                           |   8 +-
 hw/core/qdev.c                           |   2 +-
 hw/mem/pc-dimm.c                         |   1 -
 hw/net/rocker/rocker_of_dpa.c            |  13 +-
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
 migration/migration.c                    |  27 ++--
 monitor/hmp-cmds.c                       |  84 +++++------
 monitor/misc.c                           |  21 +--
 monitor/qmp-cmds.c                       |   6 +-
 nbd/server.c                             |   2 +-
 net/announce.c                           |   8 +-
 net/hub.c                                |   2 +-
 net/l2tpv3.c                             |   2 +-
 net/net.c                                |  25 ++--
 net/slirp.c                              |   4 +-
 net/socket.c                             |  18 +--
 net/tap-win32.c                          |   2 +-
 net/tap.c                                |  51 ++++---
 qemu-img.c                               |  13 +-
 qemu-nbd.c                               |   2 -
 qga/commands-posix.c                     |  33 ++---
 qga/commands-win32.c                     |  40 +-----
 qga/commands.c                           |  11 +-
 qom/qom-qmp-cmds.c                       |   7 +-
 replay/replay-debugging.c                |   1 -
 softmmu/runstate.c                       |  18 +--
 softmmu/vl.c                             |   2 +-
 target/arm/monitor.c                     |   1 -
 target/i386/cpu-sysemu.c                 |   7 +-
 target/i386/cpu.c                        |   1 -
 target/s390x/cpu_models_sysemu.c         |   1 -
 tests/qtest/fuzz/qos_fuzz.c              |   3 +-
 tests/qtest/qmp-cmd-test.c               |   2 +-
 tests/unit/test-char.c                   |   1 -
 tests/unit/test-crypto-block.c           |   6 -
 tests/unit/test-qmp-cmds.c               |  26 ++--
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
 scripts/qapi/schema.py                   |  14 ++
 scripts/qapi/types.py                    |   2 +-
 scripts/qapi/visit.py                    |  17 ++-
 101 files changed, 467 insertions(+), 712 deletions(-)

-- 
2.37.2


