Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E06619CBD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:13:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzEn-0000Q3-6B; Fri, 04 Nov 2022 12:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzEF-0008Ah-IP
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzDz-0007dI-Az
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QN+bciObNtxvWZqgB7jp+f+DDl0fCyBcqts/vRit0I0=;
 b=AW+UfAQMpsKT218wulDlPZXcNrFIWWgcDZNWO1rdMsLk/delpDk6bMs09Xp1gUXD3tlCH/
 /ljPWjGmMxkQ0i+kGnQlIwlGVTttNTR/wDZwpX1jYUp2fPAqeQ3E2ScL+E6UY3O3zlPNq8
 hoF5Fg2jC8dtwSSa13PICr8PEwrVyr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Y2nk9w51MT-826yy8UuIRQ-1; Fri, 04 Nov 2022 12:07:13 -0400
X-MC-Unique: Y2nk9w51MT-826yy8UuIRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97EE3101AA5D;
 Fri,  4 Nov 2022 16:07:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5237A1415139;
 Fri,  4 Nov 2022 16:07:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33E7A21E6900; Fri,  4 Nov 2022 17:07:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com,
	eblake@redhat.com,
	michael.roth@amd.com
Subject: [PATCH v3 00/30] qapi: Elide redundant has_FOO in generated C
Date: Fri,  4 Nov 2022 17:06:42 +0100
Message-Id: <20221104160712.3005652-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

PATCH 05-07,10-29 un-nerf in reviewable chunks.  Their commit messages
refer back to PATCH 04 for an explanation of the transformation.
Please read that first.  Note that these patches combine the
mechanical transformation with obvious, local follow-up
simplifications.  If you want them separate for easier review, let me
know.

PATCH 08+09 clean up in preparation for PATCH 10.

PATCH 28 drops the nerfing code.

v3:
* Rebased
  - Straighforward conflict with commit 58684155e4 "qcow: switch to
    *_co_* functions" resolved in PATCH 10
  - Straighforward conflict with commit 53b85d9574 "net: introduce
    qemu_set_info_str() function" in PATCH 18
  - Semantic conflict with commit 8801ccd050 "vhost-vdpa: allow
    passing opened vhostfd to vhost-vdpa" in PATCH 18
  - Straighforward conflict with commit a124109422 "qga: Move HW
    address getting to a separate function" in PATCH 29
* PATCH 07: Fix sndio backend [Stefan]
* PATCH 08+09: New; PATCH 10 adjusted for them
* PATCH 10: Fix for #ifndef LIBRBD_SUPPORTS_ENCRYPTION [Stefan]
* PATCH 10+26: Back out incorrect cleanup of qmp_transaction() in
  PATCH 10, adjust PATCH 26, and explain it in its commit message
* PATCH 11: Commit message tweaked [Philippe]
* PATCH 17: Drop superfluous conditional around g_strdup() [David]
* PATCH 20: Update stubs/qdev.c, too [Stefan]
* PATCH 23: Commit message tweaked [Philippe]

v2:
* Rebased
  - Straighforward conflicts with commit bf0c50d4aa "monitor: expose
    monitor_puts to rest of code" resolved in PATCH 08+17
  - Commit 90c066cd68 "qmp: add QMP command x-query-virtio-status"
    necessitates nerfing qapi/virtio.json in PATCH 04, un-nerfing in
    new PATCH 26
* PATCH 14: Redundant check of params-tls_creds dropped [Philippe]
* PATCH 09+16+27: Fix for Windows

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

 docs/devel/qapi-code-gen.rst             |  29 +++-
 docs/devel/writing-monitor-commands.rst  |  14 +-
 include/monitor/monitor.h                |   3 +-
 audio/alsaaudio.c                        |   2 +-
 audio/audio.c                            |   6 +-
 audio/audio_legacy.c                     |  17 +--
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
 block/monitor/block-hmp-cmds.c           |  48 +++---
 block/qapi-sysemu.c                      |  73 +++------
 block/qapi.c                             |  62 +++-----
 block/qcow.c                             |  10 +-
 block/qcow2.c                            |  18 +--
 block/qed.c                              |   2 +-
 block/quorum.c                           |   2 +-
 block/rbd.c                              |  15 +-
 block/ssh.c                              |   2 +-
 blockdev-nbd.c                           |   9 +-
 blockdev.c                               | 185 ++++++++++-------------
 blockjob.c                               |   2 -
 chardev/char-file.c                      |   4 +-
 chardev/char-socket.c                    |  10 +-
 chardev/char-udp.c                       |   1 -
 chardev/char.c                           |   6 +-
 crypto/block-luks.c                      |  16 +-
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
 migration/migration.c                    |  27 +---
 monitor/hmp-cmds.c                       |  84 +++++-----
 monitor/misc.c                           |  21 +--
 monitor/qmp-cmds.c                       |  11 +-
 nbd/server.c                             |  15 +-
 net/announce.c                           |   8 +-
 net/hub.c                                |   2 +-
 net/l2tpv3.c                             |   2 +-
 net/net.c                                |  25 ++-
 net/slirp.c                              |   4 +-
 net/socket.c                             |  18 +--
 net/tap-win32.c                          |   2 +-
 net/tap.c                                |  51 +++----
 net/vhost-vdpa.c                         |   6 +-
 qemu-img.c                               |  13 +-
 qemu-nbd.c                               |   2 -
 qga/commands-posix.c                     |  32 +---
 qga/commands-win32.c                     |  40 +----
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
 104 files changed, 487 insertions(+), 735 deletions(-)

-- 
2.37.3


