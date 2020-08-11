Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B4241A10
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 13:02:38 +0200 (CEST)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5S3B-0003uK-MV
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 07:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1k5S1e-0002Qn-CE
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:01:02 -0400
Received: from mail.ispras.ru ([83.149.199.84]:42218)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1k5S1b-0003FC-CR
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:01:02 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id E89154089EF7;
 Tue, 11 Aug 2020 11:00:53 +0000 (UTC)
Subject: [PATCH v2 00/14] Reverse debugging
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Aug 2020 14:00:53 +0300
Message-ID: <159714365354.18946.2967871683340522027.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 07:00:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB remote protocol supports reverse debugging of the targets.
It includes 'reverse step' and 'reverse continue' operations.
The first one finds the previous step of the execution,
and the second one is intended to stop at the last breakpoint that
would happen when the program is executed normally.

Reverse debugging is possible in the replay mode, when at least
one snapshot was created at the record or replay phase.
QEMU can use these snapshots for travelling back in time with GDB.

Running the execution in replay mode allows using GDB reverse debugging
commands:
 - reverse-stepi (or rsi): Steps one instruction to the past.
   QEMU loads on of the prior snapshots and proceeds to the desired
   instruction forward. When that step is reaches, execution stops.
 - reverse-continue (or rc): Runs execution "backwards".
   QEMU tries to find breakpoint or watchpoint by loaded prior snapshot
   and replaying the execution. Then QEMU loads snapshots again and
   replays to the latest breakpoint. When there are no breakpoints in
   the examined section of the execution, QEMU finds one more snapshot
   and tries again. After the first snapshot is processed, execution
   stops at this snapshot.

The set of patches include the following modifications:
 - gdbstub update for reverse debugging support
 - functions that automatically perform reverse step and reverse
   continue operations
 - hmp/qmp commands for manipulating the replay process
 - improvement of the snapshotting for saving the execution step
   in the snapshot parameters
 - avocado-based acceptance tests for reverse debugging

Acceptance tests intended to use the version of avocado framework, that
will be released after 25.06.20, because it includes significant
fixes of the remote GDB protocol.

The patches are available in the repository:
https://github.com/ispras/qemu/tree/rr-200811

v2 changes:
 - rebased to the latest upstream version
 - fixed replaying of the POLL interrupts after the latest debug changes

---

Pavel Dovgaluk (13):
      replay: provide an accessor for rr filename
      qcow2: introduce icount field for snapshots
      migration: introduce icount field for snapshots
      iotests: update snapshot test for new output format
      qapi: introduce replay.json for record/replay-related stuff
      replay: introduce info hmp/qmp command
      replay: introduce breakpoint at the specified step
      replay: implement replay-seek command
      replay: flush rr queue before loading the vmstate
      gdbstub: add reverse step support in replay mode
      gdbstub: add reverse continue support in replay mode
      replay: describe reverse debugging in docs/replay.txt
      tests/acceptance: add reverse debugging test

Pavel Dovgalyuk (1):
      replay: don't record interrupt poll


 MAINTAINERS                           |    2 
 accel/tcg/cpu-exec.c                  |   11 +
 accel/tcg/translator.c                |    1 
 block/qapi.c                          |   18 +-
 block/qcow2-snapshot.c                |    9 +
 block/qcow2.h                         |    3 
 blockdev.c                            |   10 +
 docs/interop/qcow2.txt                |    5 +
 docs/replay.txt                       |   33 +++
 exec.c                                |    8 +
 gdbstub.c                             |   63 ++++++
 hmp-commands-info.hx                  |   11 +
 hmp-commands.hx                       |   50 +++++
 include/block/snapshot.h              |    1 
 include/monitor/hmp.h                 |    4 
 include/sysemu/replay.h               |   24 ++
 migration/savevm.c                    |   17 +-
 qapi/Makefile.objs                    |    4 
 qapi/block-core.json                  |   11 +
 qapi/misc.json                        |   18 --
 qapi/qapi-schema.json                 |    1 
 qapi/replay.json                      |  121 ++++++++++++
 replay/Makefile.objs                  |    1 
 replay/replay-debugging.c             |  325 +++++++++++++++++++++++++++++++++
 replay/replay-events.c                |    4 
 replay/replay-internal.h              |    6 -
 replay/replay.c                       |   22 ++
 softmmu/cpus.c                        |   19 ++
 stubs/replay.c                        |   15 ++
 tests/acceptance/reverse_debugging.py |  203 +++++++++++++++++++++
 tests/qemu-iotests/267.out            |   48 ++---
 31 files changed, 1002 insertions(+), 66 deletions(-)
 create mode 100644 qapi/replay.json
 create mode 100644 replay/replay-debugging.c
 create mode 100644 tests/acceptance/reverse_debugging.py

--
Pavel Dovgalyuk

