Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63313A7CF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:02:22 +0100 (CET)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irJxk-0000Iy-Og
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1irJv6-0007Dw-7n
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:59:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1irJv4-00061Z-26
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:59:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53036
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1irJv3-00061G-Ud
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578999573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pv9lctfIl0pIVVfsS8TF3LdroUDvpwnjtLpxyogKkLo=;
 b=L2qBf/WEU6Dq6CTt9Sr9RgIcH6CSAsYv03qVvw4yN1hO051BNNDqawfUwhd0Ys6TnbxR+4
 3OPKLQvzkOX5q0vsSvxtSjjLwAiLEqonjJ5Ct1BwLB7hiPX5i6GeGAilMErq99y2CMNGeM
 +bzRAaSS+4LBPoiAGYVPUnVPyu17Ank=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Tawc7fnaOr6uDb2qhhGUgA-1; Tue, 14 Jan 2020 05:59:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15D8800A02;
 Tue, 14 Jan 2020 10:59:30 +0000 (UTC)
Received: from localhost (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17D351081318;
 Tue, 14 Jan 2020 10:59:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/15] io_uring: add Linux io_uring AIO engine
Date: Tue, 14 Jan 2020 10:59:06 +0000
Message-Id: <20200114105921.131880-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Tawc7fnaOr6uDb2qhhGUgA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v13:
 * Drop unnecessary changes in Patch 8 [Stefano]

v12:
 * Reword BlockdevAioOptions QAPI schema commit description [Markus]
 * Increase QAPI "Since: 4.2" to "Since: 5.0"
 * Explain rationale for io_uring stubs in commit description [Kevin]
 * Tried to use file.aio=3Dio_uring instead of BDRV_O_IO_URING but it's rea=
lly
   hard to make qemu-iotests work.  Tests build blkdebug: and other graphs =
so
   the syntax for io_uring is dependent on the test case.  I scrapped this
   approach and went back to a global flag.

v11:
 * Drop fd registration because it breaks QEMU's file locking and will need=
 to
   be resolved in a separate patch series
 * Drop line-wrapping changes that accidentally broke several qemu-iotests

v10:
 * Dropped kernel submission queue polling, it requires root and has additi=
onal
   limitations.  It should be benchmarked and considered for inclusion late=
r,
   maybe even together with kernel side changes.
 * Add io_uring_register_files() return value to trace_luring_fd_register()
 * Fix indentation in luring_fd_unregister()
 * Set s->fd_reg.fd_array to NULL after g_free() to avoid dangling pointers
 * Simplify fd registration code
 * Add luring_fd_unregister() and call it from file-posix.c to prevent
   fd leaks
 * Add trace_luring_fd_unregister() trace event
 * Add missing space to qemu-img command-line documentation
 * Update MAINTAINERS file [Julia]
 * Rename MAX_EVENTS to MAX_ENTRIES [Julia]
 * Define ioq_submit() before callers so the prototype isn't necessary [Jul=
ia]
 * Declare variables at the beginning of the block in luring_init() [Julia]

This patch series is based on Aarushi Mehta's v9 patch series written for
Google Summer of Code 2019:

  https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg00179.html

It adds a new AIO engine that uses the new Linux io_uring API.  This is the
successor to Linux AIO with a number of improvements:
1. Both O_DIRECT and buffered I/O work
2. fdatasync(2) is supported (no need for a separate thread pool!)
3. True async behavior so the syscall doesn't block (Linux AIO got there to=
 some degree...)
4. Advanced performance optimizations are available (file registration, mem=
ory
   buffer registration, completion polling, submission polling).

Since Aarushi has been busy, I have taken up this patch series.  Booting a
guest works with -drive aio=3Dio_uring and -drive aio=3Dio_uring,cache=3Dno=
ne with a
raw file on XFS.

I currently recommend using -drive aio=3Dio_uring only with host block devi=
ces
(like NVMe devices).  As of Linux v5.4-rc1 I still hit kernel bugs when usi=
ng
image files on ext4 or XFS.

Aarushi Mehta (15):
  configure: permit use of io_uring
  qapi/block-core: add option for io_uring
  block/block: add BDRV flag for io_uring
  block/io_uring: implements interfaces for io_uring
  stubs: add stubs for io_uring interface
  util/async: add aio interfaces for io_uring
  blockdev: adds bdrv_parse_aio to use io_uring
  block/file-posix.c: extend to use io_uring
  block: add trace events for io_uring
  block/io_uring: adds userspace completion polling
  qemu-io: adds option to use aio engine
  qemu-img: adds option to use aio engine for benchmarking
  qemu-nbd: adds option for aio engines
  tests/qemu-iotests: enable testing with aio options
  tests/qemu-iotests: use AIOMODE with various tests

 MAINTAINERS                   |   9 +
 block.c                       |  22 ++
 block/Makefile.objs           |   3 +
 block/file-posix.c            |  85 +++++--
 block/io_uring.c              | 433 ++++++++++++++++++++++++++++++++++
 block/trace-events            |  12 +
 blockdev.c                    |  12 +-
 configure                     |  27 +++
 include/block/aio.h           |  16 +-
 include/block/block.h         |   2 +
 include/block/raw-aio.h       |  12 +
 qapi/block-core.json          |   4 +-
 qemu-img-cmds.hx              |   4 +-
 qemu-img.c                    |  11 +-
 qemu-img.texi                 |   5 +-
 qemu-io.c                     |  25 +-
 qemu-nbd.c                    |  12 +-
 qemu-nbd.texi                 |   4 +-
 stubs/Makefile.objs           |   1 +
 stubs/io_uring.c              |  32 +++
 tests/qemu-iotests/028        |   2 +-
 tests/qemu-iotests/058        |   2 +-
 tests/qemu-iotests/089        |   4 +-
 tests/qemu-iotests/091        |   4 +-
 tests/qemu-iotests/109        |   2 +-
 tests/qemu-iotests/147        |   5 +-
 tests/qemu-iotests/181        |   8 +-
 tests/qemu-iotests/183        |   4 +-
 tests/qemu-iotests/185        |  10 +-
 tests/qemu-iotests/200        |   2 +-
 tests/qemu-iotests/201        |   8 +-
 tests/qemu-iotests/check      |  15 +-
 tests/qemu-iotests/common.rc  |  14 ++
 tests/qemu-iotests/iotests.py |  12 +-
 util/async.c                  |  36 +++
 35 files changed, 787 insertions(+), 72 deletions(-)
 create mode 100644 block/io_uring.c
 create mode 100644 stubs/io_uring.c

--=20
2.24.1


