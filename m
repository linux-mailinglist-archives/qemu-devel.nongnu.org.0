Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356795BA213
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:57:14 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvv7-0005ct-7y
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhq-0001tF-3J
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhl-0000I8-Ki
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Db8bsJMwplZET7hH+hNXd8QFESEJ0B4MRWw+b89JSgI=;
 b=GXMzPVsrl5WTaFRasC6TTnH27QCfg/5aeSVkLFAWZ886ZskUpXd5LGbIog8hqqSHmrpnK6
 lQkRvnDcRpU1hD6AawWNY91sQuRPYrLDeBL6cEea0DKogxi08i+zRTbUY0QN4SGVdgSSac
 j9kcyxxBOplMkzWLt2d+kc036py9U1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-V9MTHIt9OvOIh75cYV-Wpw-1; Thu, 15 Sep 2022 16:43:23 -0400
X-MC-Unique: V9MTHIt9OvOIh75cYV-Wpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 976DF8027ED;
 Thu, 15 Sep 2022 20:43:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 300A217595;
 Thu, 15 Sep 2022 20:43:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D464621E6900; Thu, 15 Sep 2022 22:43:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Kanda <mark.kanda@oracle.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Subject: [PATCH 00/27] qapi: Elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:42:50 +0200
Message-Id: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

PATCH 05-26 un-nerfs in reviewable chunks.  Their commit messages
refer back to PATCH 04 for an explanation of the transformation.
Please read that first.  Note that these patches combine the
mechanical transformation with obvious, local follow-up
simplifications.  If you want them separate for easier review, let me
know.

PATCH 27 drops the nerfing code.

Cc: Ani Sinha <ani@anisinha.ca>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Daniel P. Berrangé" <berrange@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: John Snow <jsnow@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Mark Kanda <mark.kanda@oracle.com>
Cc: Michael Roth <michael.roth@amd.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Yanan Wang <wangyanan55@huawei.com>
Cc: qemu-block@nongnu.org

Markus Armbruster (27):
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
 chardev/char-file.c                      |   2 +-
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
 job-qmp.c                                |   3 +-
 migration/block-dirty-bitmap.c           |   4 +-
 migration/colo.c                         |   1 -
 migration/migration.c                    |  27 ++--
 monitor/hmp-cmds.c                       |  80 +++++------
 monitor/misc.c                           |  21 +--
 monitor/qmp-cmds.c                       |   6 +-
 nbd/server.c                             |   2 +-
 net/announce.c                           |   8 +-
 net/hub.c                                |   2 +-
 net/l2tpv3.c                             |   2 +-
 net/net.c                                |  25 ++--
 net/slirp.c                              |   4 +-
 net/socket.c                             |  18 +--
 net/tap.c                                |  51 ++++---
 qemu-img.c                               |  13 +-
 qemu-nbd.c                               |   2 -
 qga/commands-posix.c                     |  33 ++---
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
 98 files changed, 456 insertions(+), 674 deletions(-)

-- 
2.37.2


