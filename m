Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E74E27A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:00:14 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFP3-0007Mz-Dh
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:00:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58773)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEzm-0004Ud-S9
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEmn-00089R-7Y
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:20:42 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41206)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEmm-00085m-TQ
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:20:41 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1F11354006B;
 Fri, 21 Jun 2019 11:20:38 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:20:37 +0300
Message-ID: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 00/24] Fix record/replay and add
 reverse debugging
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com, quintela@redhat.com, ciro.santilli@gmail.com,
 jasowang@redhat.com, crosthwaite.peter@gmail.com, armbru@redhat.com,
 mreitz@redhat.com, alex.bennee@linaro.org, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, boost.lists@gmail.com,
 thomas.dullien@googlemail.com, dovgaluk@ispras.ru, artem.k.pisarenko@gmail.com,
 dgilbert@redhat.com, rth@twiddle.net
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
 - other record/replay fixes

The patches are available in the repository:
https://github.com/ispras/qemu/tree/rr-190419

v17 changes:
 - updated gdbstub patches according to the latest changes

v16 changes:
 - rebased to 4.0

v15 changes:
 - rebased to the new master
 - removed obsolete rtc patch
 - fixed misprint in the test

v14 changes:
 - rebased to the new master

v13 changes:
 - rebased to make QAPI stuff applicable
 - minor reverse step/reverse continue fix

v12 changes:
 - style fixes

v11 changes:
 - added can_do_io resetting before jumping to the next block in the chain
 - rebase to the latest master

v10 changes:
 - added patch for correct deadline calculation with external timers
 - updated icount-related documentation in json files
   (suggested by Markus Armbruster)
 - fixed replay shutdown
 - renamed some functions and variables to make them consistent with
   the documentation and displayed messages
 - minor changes

v9 changes:
 - moved rr qapi stuff to the separate file (suggested by Markus Armbruster)
 - minor coding style fixes

v8 changes:
 - rebased to the new master
 - added missing fix for prior rr patch
 - updated 'since' version number in json-related patches

v7 changes:
 - rebased to the new master with upstreamed patches from the series
 - several improvements in hmp/qmp commands handling (suggested by Markus Armbruster)
 - fixed record/replay with '-rtc base' option enabled
 - added document with virtual hardware requirements

v6 changes:
 - rebased to the new version of master
 - fixed build of linux-user configurations
 - added new clock for slirp and vnc timers

v5 changes:
 - multiple fixes of record/replay bugs appeared after QEMU core update
 - changed reverse debugging to 'since 3.1'

v4 changes:
 - changed 'since 2.13' to 'since 3.0' in json (as suggested by Eric Blake)

v3 changes:
 - Fixed PS/2 bug with save/load vm, which caused failures of the replay.
 - Rebased to the new code base.
 - Minor fixes.

v2 changes:
 - documented reverse debugging
 - fixed start vmstate loading in record mode
 - documented qcow2 changes (as suggested by Eric Blake)
 - made icount SnapshotInfo field optional (as suggested by Eric Blake)
 - renamed qmp commands (as suggested by Eric Blake)
 - minor changes

---

Pavel Dovgalyuk (23):
      block: implement bdrv_snapshot_goto for blkreplay
      replay: disable default snapshot for record/replay
      replay: update docs for record/replay with block devices
      replay: don't drain/flush bdrv queue while RR is working
      replay: finish record/replay before closing the disks
      qcow2: introduce icount field for snapshots
      migration: introduce icount field for snapshots
      replay: provide an accessor for rr filename
      qapi: introduce replay.json for record/replay-related stuff
      replay: introduce info hmp/qmp command
      replay: introduce breakpoint at the specified step
      replay: implement replay-seek command
      replay: refine replay-time module
      replay: flush rr queue before loading the vmstate
      gdbstub: add reverse step support in replay mode
      gdbstub: add reverse continue support in replay mode
      replay: describe reverse debugging in docs/replay.txt
      replay: add BH oneshot event for block layer
      replay: document development rules
      util/qemu-timer: refactor deadline calculation for external timers
      replay: fix replay shutdown
      replay: rename step-related variables and functions
      icount: clean up cpu_can_io before jumping to the next block

pbonzini@redhat.com (1):
      replay: add missing fix for internal function


 MAINTAINERS               |    1 
 accel/tcg/tcg-runtime.c   |    2 
 accel/tcg/translator.c    |    1 
 block/blkreplay.c         |    8 +
 block/block-backend.c     |    8 +
 block/io.c                |   32 ++++
 block/iscsi.c             |    5 -
 block/nfs.c               |    5 -
 block/null.c              |    4 -
 block/nvme.c              |    6 +
 block/qapi.c              |   18 ++
 block/qcow2-snapshot.c    |    9 +
 block/qcow2.h             |    2 
 block/rbd.c               |    5 -
 block/vxhs.c              |    5 -
 blockdev.c                |   10 +
 cpus.c                    |   30 +++-
 docs/devel/replay.txt     |   46 ++++++
 docs/interop/qcow2.txt    |    4 +
 docs/replay.txt           |   45 ++++++
 exec.c                    |    8 +
 gdbstub.c                 |   63 ++++++++-
 hmp-commands-info.hx      |   14 ++
 hmp-commands.hx           |   53 +++++++
 hmp.h                     |    4 +
 include/block/snapshot.h  |    1 
 include/qemu/timer.h      |    7 -
 include/sysemu/replay.h   |   30 ++++
 migration/savevm.c        |   11 ++
 qapi/Makefile.objs        |    2 
 qapi/block-core.json      |    8 +
 qapi/block.json           |    3 
 qapi/misc.json            |   18 --
 qapi/qapi-schema.json     |    1 
 qapi/replay.json          |  121 +++++++++++++++++
 qtest.c                   |    2 
 replay/Makefile.objs      |    3 
 replay/replay-debugging.c |  327 +++++++++++++++++++++++++++++++++++++++++++++
 replay/replay-events.c    |   18 ++
 replay/replay-internal.c  |   10 +
 replay/replay-internal.h  |   17 +-
 replay/replay-snapshot.c  |    6 -
 replay/replay-time.c      |   36 ++---
 replay/replay.c           |   56 ++++++--
 stubs/Makefile.objs       |    1 
 stubs/replay-user.c       |    9 +
 stubs/replay.c            |   10 +
 tests/ptimer-test-stubs.c |    4 -
 tests/ptimer-test.c       |    4 -
 util/qemu-timer.c         |   41 +++++-
 vl.c                      |   11 +-
 51 files changed, 1014 insertions(+), 131 deletions(-)
 create mode 100644 docs/devel/replay.txt
 create mode 100644 qapi/replay.json
 create mode 100644 replay/replay-debugging.c
 create mode 100644 stubs/replay-user.c

-- 
Pavel Dovgalyuk

