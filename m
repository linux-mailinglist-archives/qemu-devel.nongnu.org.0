Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEC7124ADD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 16:11:56 +0100 (CET)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihazT-00070J-E8
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 10:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <e5a2d769867134908e0e5530e1743ed9366cf762@lizzy.crudebyte.com>)
 id 1ihayF-0005zw-Aj
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:10:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <e5a2d769867134908e0e5530e1743ed9366cf762@lizzy.crudebyte.com>)
 id 1ihayC-0007jD-K4
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:10:38 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:41569)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <e5a2d769867134908e0e5530e1743ed9366cf762@lizzy.crudebyte.com>)
 id 1ihayC-0001jF-AC
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Subject:Date:Cc:To:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=xB5nDUai3x8uOUkmS81PvHKbTLLxkdWC5+Wpk/EGVoE=; b=ew1ny
 q9nI7IxnXpz6OCDbOadD9BClX6/fxGXhjrN4kMu+yKF4X10Vy3sKqxDKWNbTRlsvK3IjHjM4aXHWu
 9xUsaBIeo8aRvwBfD5wdsGTJLaXptsP+OlXeuGCm0cvC85XBJAuLWLeTG5+JQC92iuYb0ukTCLfcM
 E72nLKf6vw+10PjFb9VB5Br2Rge/suJD/yLmSD5fjZj00E/se9cQBVTxXRCPPsdWDf248EkGmdcNp
 wNfyfJiaU3ukknOdA82xIfg9qSbDqH+5VJaVYMZWEa7MV2kFb6/dpKVRa4ndrhv5/8lsSR4Q08fuH
 JiUjAsL2unbWmJYwcZKKi94YKq1YA==;
Message-Id: <cover.1576678644.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Wed, 18 Dec 2019 15:17:24 +0100
Subject: [PATCH v2 0/9] 9pfs: readdir optimization
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As previously mentioned, I was investigating performance issues with 9pfs.
Raw file read/write of 9pfs is actually quite good, provided that client
picked a reasonable high msize (maximum message size). I would recommend
to log a warning on 9p server side if a client attached with a small msize
that would cause performance issues for that reason.

However there other aspects where 9pfs currently performs suboptimally,
especially readdir handling of 9pfs is extremely slow, a simple readdir
request of a guest typically blocks for several hundred milliseconds or
even several seconds, no matter how powerful the underlying hardware is.
The reason for this performance issue: latency.
Currently 9pfs is heavily dispatching a T_readdir request numerous times
between main I/O thread and a background I/O thread back and forth; in fact
it is actually hopping between threads even multiple times for every single
directory entry during T_readdir request handling which leads in total to
huge latencies for a single T_readdir request.

This patch series aims to address this severe performance issue of 9pfs
T_readdir request handling. The actual performance fix is patch 8. I also
provided a convenient benchmark for comparing the performance improvements
by using the 9pfs "synth" driver (see patch 6 for instructions how to run
the benchmark), so no guest OS installation is required to peform this
benchmark A/B comparison. With patch 8 I achieved a performance improvement
of factor 40 on my test machine.

** NOTE: ** These patches are not heavily tested yet, nor thouroughly
reviewed for potential security issues yet. I decided to post them already
though, because I won't have the time in the next few weeks for polishing
them. The benchmark results should demonstrate though that it is worth the
hassle. So any testing/reviews/fixes appreciated!

v1->v2:

  * Fixed missing email threading of this patch set.

  * Fixed code style issues.

  * No need to check for NULL when calling g_free() [patch 4] and
    [patch 8].

  * No need to initialize static variable with NULL [patch 7].

  * Adjustments to commit log messages.

Christian Schoenebeck (9):
  tests/virtio-9p: add terminating null in v9fs_string_read()
  9pfs: validate count sent by client with T_readdir
  hw/9pfs/9p-synth: added directory for readdir test
  tests/virtio-9p: added readdir test
  tests/virtio-9p: check file names of R_readdir response
  9pfs: readdir benchmark
  hw/9pfs/9p-synth: avoid n-square issue in synth_readdir()
  9pfs: T_readdir latency optimization
  hw/9pfs/9p.c: benchmark time on T_readdir request

 hw/9pfs/9p-synth.c     |  48 ++++++++++-
 hw/9pfs/9p-synth.h     |   5 ++
 hw/9pfs/9p.c           | 151 ++++++++++++++++++---------------
 hw/9pfs/9p.h           |  23 +++++
 hw/9pfs/codir.c        | 183 +++++++++++++++++++++++++++++++++++++---
 hw/9pfs/coth.h         |   3 +
 tests/virtio-9p-test.c | 186 ++++++++++++++++++++++++++++++++++++++++-
 7 files changed, 516 insertions(+), 83 deletions(-)

-- 
2.20.1


