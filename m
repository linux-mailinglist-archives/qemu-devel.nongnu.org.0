Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5153E167
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:43:15 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7OM-0008DD-1k
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79h-0005HV-1j; Mon, 06 Jun 2022 03:28:05 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:33544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79Z-0002X6-H4; Mon, 06 Jun 2022 03:28:03 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 4D7392E0C74;
 Mon,  6 Jun 2022 10:27:47 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 jzpBFveUvj-RkJCTHKb; Mon, 06 Jun 2022 10:27:47 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500467; bh=Mbx8kr04ZJ7K/mYmv5NdbMWkekFEtr7Wbtkj6JHzXYw=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=oFCLz+qrivi9pvtd8HzhJUy0GA4Pv22+qGDH0fXV1v4LsaGCnHPuVRQapwYLnFnUE
 29dXIrWtzIdr/R13klmJM6SWXn+RXPzFgFwhQu2uMW+TwSS23t5TpBYC1xG8ZcZMew
 OdbJRLdjQb9Ga9n2NTQyWluHSx763so2YSSJoff8=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RkM4shEp; Mon, 06 Jun 2022 10:27:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com
Subject: [PATCH v2 00/11] iotests: use vm.cmd()
Date: Mon,  6 Jun 2022 10:27:20 +0300
Message-Id: <20220606072731.878226-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Let's get rid of pattern

    result = self.vm.qmp(...)
    self.assert_qmp(result, 'return', {})

And switch to just

    self.vm.cmd(...)

Supersedes: <20220408170214.45585-1-vsementsov@openvz.org>
   ([RFC 0/2] introduce QEMUMachind.cmd())

Vladimir Sementsov-Ogievskiy (11):
  python: rename QEMUMonitorProtocol.cmd() to cmd_raw()
  python/qemu: rename command() to cmd()
  python/machine.py: upgrade vm.cmd() method
  iotests: QemuStorageDaemon: add cmd() method like in QEMUMachine.
  iotests: add some missed checks of qmp result
  iotests: refactor some common qmp result checks into generic pattern
  iotests: drop some occasional semicolons
  iotests: drop some extra ** in qmp() call
  iotests.py: pause_job(): drop return value
  tests/vm/basevm.py: use cmd() instead of qmp()
  python: use vm.cmd() instead of vm.qmp() where appropriate

 docs/devel/testing.rst                        |  10 +-
 python/qemu/machine/machine.py                |  20 +-
 python/qemu/qmp/legacy.py                     |  10 +-
 python/qemu/qmp/qmp_shell.py                  |  13 +-
 python/qemu/utils/qemu_ga_client.py           |   2 +-
 python/qemu/utils/qom.py                      |   8 +-
 python/qemu/utils/qom_common.py               |   2 +-
 python/qemu/utils/qom_fuse.py                 |   6 +-
 scripts/cpu-x86-uarch-abi.py                  |   8 +-
 scripts/device-crash-test                     |   8 +-
 scripts/render_block_graph.py                 |   8 +-
 tests/avocado/avocado_qemu/__init__.py        |   4 +-
 tests/avocado/cpu_queries.py                  |   4 +-
 tests/avocado/hotplug_cpu.py                  |  10 +-
 tests/avocado/info_usernet.py                 |   4 +-
 tests/avocado/machine_arm_integratorcp.py     |   6 +-
 tests/avocado/machine_m68k_nextcube.py        |   4 +-
 tests/avocado/machine_mips_malta.py           |   6 +-
 tests/avocado/machine_s390_ccw_virtio.py      |  28 +-
 tests/avocado/migration.py                    |  10 +-
 tests/avocado/pc_cpu_hotplug_props.py         |   2 +-
 tests/avocado/version.py                      |   4 +-
 tests/avocado/virtio_check_params.py          |   6 +-
 tests/avocado/virtio_version.py               |   4 +-
 tests/avocado/vnc.py                          |  16 +-
 tests/avocado/x86_cpu_model_versions.py       |  10 +-
 tests/migration/guestperf/engine.py           | 150 +++---
 tests/qemu-iotests/030                        | 168 +++---
 tests/qemu-iotests/040                        | 171 +++----
 tests/qemu-iotests/041                        | 482 ++++++++----------
 tests/qemu-iotests/045                        |  15 +-
 tests/qemu-iotests/055                        |  62 +--
 tests/qemu-iotests/056                        |  77 ++-
 tests/qemu-iotests/093                        |  42 +-
 tests/qemu-iotests/118                        | 225 ++++----
 tests/qemu-iotests/124                        | 102 ++--
 tests/qemu-iotests/129                        |  14 +-
 tests/qemu-iotests/132                        |   5 +-
 tests/qemu-iotests/139                        |  45 +-
 tests/qemu-iotests/147                        |  30 +-
 tests/qemu-iotests/151                        |  56 +-
 tests/qemu-iotests/152                        |   8 +-
 tests/qemu-iotests/155                        |  55 +-
 tests/qemu-iotests/165                        |   8 +-
 tests/qemu-iotests/196                        |   3 +-
 tests/qemu-iotests/205                        |   6 +-
 tests/qemu-iotests/218                        | 105 ++--
 tests/qemu-iotests/245                        | 245 ++++-----
 tests/qemu-iotests/256                        |  34 +-
 tests/qemu-iotests/257                        |  36 +-
 tests/qemu-iotests/264                        |  31 +-
 tests/qemu-iotests/281                        |  21 +-
 tests/qemu-iotests/295                        |  16 +-
 tests/qemu-iotests/296                        |  21 +-
 tests/qemu-iotests/298                        |  13 +-
 tests/qemu-iotests/300                        |  54 +-
 tests/qemu-iotests/iotests.py                 |  18 +-
 .../tests/export-incoming-iothread            |   6 +-
 .../qemu-iotests/tests/graph-changes-while-io |   6 +-
 tests/qemu-iotests/tests/image-fleecing       |   3 +-
 .../tests/migrate-bitmaps-postcopy-test       |  31 +-
 tests/qemu-iotests/tests/migrate-bitmaps-test |  45 +-
 .../qemu-iotests/tests/migrate-during-backup  |  41 +-
 .../qemu-iotests/tests/migration-permissions  |   9 +-
 .../tests/mirror-ready-cancel-error           |  74 ++-
 tests/qemu-iotests/tests/mirror-top-perms     |  16 +-
 tests/qemu-iotests/tests/nbd-multiconn        |  12 +-
 tests/qemu-iotests/tests/reopen-file          |   3 +-
 .../qemu-iotests/tests/stream-error-on-reset  |   6 +-
 tests/vm/basevm.py                            |   4 +-
 70 files changed, 1174 insertions(+), 1613 deletions(-)

-- 
2.25.1


