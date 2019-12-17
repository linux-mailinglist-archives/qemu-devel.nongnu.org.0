Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B455123BB6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 01:40:13 +0100 (CET)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihNNs-0007Sg-1a
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 19:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <635bff3afd59345eba95cd27a0e03968179764ac@lizzy.crudebyte.com>)
 id 1ihNKL-0003r6-C9
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:36:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <635bff3afd59345eba95cd27a0e03968179764ac@lizzy.crudebyte.com>)
 id 1ihNKK-0005IO-9O
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:36:33 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:46013)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <635bff3afd59345eba95cd27a0e03968179764ac@lizzy.crudebyte.com>)
 id 1ihNKK-00048f-2q
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Subject:Date:Cc:To:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=cJlfQbe7xfGurhgRrxYQj+1JsYaE4tQ3mtI3xEdhVUQ=; b=hQwDv
 Z5nDKRKYFUy9KuIbqenLs2q2LgFy37LlidhIPiKPE+A3sl0aNgDu79X9Tcc45WSWkFipp1af1D8N0
 lP2vqEeOmcHBwiVbj1+2PRM7F/WBYo2anF7rvhYJ9d8dQzJvHbZz4pMXNdF+7/JmLAbH7AM3GslR+
 6XA2h8YOj9ZN+idBPMiwGdK9VlAeAzd7FRBk5kypLWaNr3J8qwXoaAN/qaYNqpVYzVXJWbRFAGcbl
 1IDItzjMEchz5rMP5bDRmM8fQpiOKUgmABGnbBV5NRlbiCCEEhKCWO+zaErL5A1rQFqkXvQ2osmOc
 1+7bc+zW/mcCP8slTZ3LAkCYADiQQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Wed, 18 Dec 2019 00:11:10 +0100
Subject: [PATCH 0/9] 9pfs: readdir optimization
Message-Id: <E1ihMuX-00076B-Qf@lizzy.crudebyte.com>
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

Christian Schoenebeck (9):
  tests/virtio-9p: v9fs_string_read() didn't terminate string
  9pfs: validate count sent by client with T_readdir
  hw/9pfs/9p-synth: added directory for readdir test
  tests/virtio-9p: added READDIR test
  tests/virtio-9p: check file names of READDIR response
  9pfs: READDIR benchmark
  hw/9pfs/9p-synth: avoid n-square issue in synth_readdir()
  9pfs: T_readdir latency optimization
  hw/9pfs/9p.c: benchmark time on T_readdir request

 hw/9pfs/9p-synth.c     |  46 ++++++++++-
 hw/9pfs/9p-synth.h     |   5 ++
 hw/9pfs/9p.c           | 150 ++++++++++++++++++---------------
 hw/9pfs/9p.h           |  23 ++++++
 hw/9pfs/codir.c        | 183 ++++++++++++++++++++++++++++++++++++++---
 hw/9pfs/coth.h         |   3 +
 tests/virtio-9p-test.c | 182 +++++++++++++++++++++++++++++++++++++++-
 7 files changed, 509 insertions(+), 83 deletions(-)

-- 
2.20.1


