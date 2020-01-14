Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BAD139E62
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 01:39:24 +0100 (CET)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irAEt-0006Z9-AT
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 19:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <df079e5262318e1a96b8e57b599655fa4bcb1c11@lizzy.crudebyte.com>)
 id 1irADS-0005n6-Bj
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:37:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <df079e5262318e1a96b8e57b599655fa4bcb1c11@lizzy.crudebyte.com>)
 id 1irADR-0002hN-0n
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:37:54 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:60229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <df079e5262318e1a96b8e57b599655fa4bcb1c11@lizzy.crudebyte.com>)
 id 1irADQ-00027d-Py
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=bheWyEwG6Ump4Gvq4e39z2Jp7rLOXGOYm+28PsL3IXk=; b=GDlib
 ERt/jldARcl/oZ6y+78etZJcTkjd4gBBfNjAITKxuTouN3BBprchG12zH1J72rKo9OeVl1pMYHiRl
 U984H2h+i6+N4ICFuT/r7XcwW18Cm0xuyc2Jq1ybokrn0DEI2dmgyLZ0SYA6PLXS5O4A5Zwox/Kla
 PaoJguXe7kc55vu4DTX+RucmiJrHX4Y+VXg7GdZBF6jLqyiAXT0xc6LVjfjRoAcAMlYRhhkotuUSC
 kaVqR0kXu1vDAG4dsEIYm0qrqGNIXcNXZiqntFIRnmMIyYkp1f2TyFWQJjYSfQS7DzS2jwk7OcxCK
 +KPef8N0w6FDkuA/mPiWtnWPhsgWA==;
Message-Id: <df079e5262318e1a96b8e57b599655fa4bcb1c11.1578957500.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1578957500.git.qemu_oss@crudebyte.com>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 14 Jan 2020 00:16:08 +0100
Subject: [PATCH v3 08/11] 9pfs: readdir benchmark
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
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

This patch is not intended to be merged. It just provides a
temporary benchmark foundation for coneniently A/B comparison
of the subsequent 9p readdir optimization patches:

* hw/9pfs/9p-synth: increase amount of simulated files for
  readdir test to 2000 files.

* tests/virtio-9p: measure wall time that elapsed between
  sending T_readdir request and arrival of R_readdir response
  and print out that measured duration, as well as amount of
  directory entries received, and the amount of bytes of the
  response message.

* tests/virtio-9p: increased msize to 256kiB to allow
  retrieving all 2000 files (simulated by 9pfs synth driver)
  with only one T_readdir request.

Running this benchmark is fairly quick & simple and does not
require any guest OS installation or other prerequisites:

cd build
make && make tests/qos-test
export QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64
tests/qos-test -p $(tests/qos-test -l | grep readdir/basic)

Since this benchmark uses the 9pfs synth driver, the host
machine's I/O hardware (SSDs/HDDs) is not relevant for the
benchmark result, because the synth backend's readdir
implementation returns immediately (without any blocking I/O
that would incur with a real-life fs driver) and just returns
already prepared, simulated directory entries directly from RAM.
So this benchmark focuses on the efficiency of the 9pfs
controller code (or top half) for readdir request handling.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.h     |  2 +-
 tests/virtio-9p-test.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.h b/hw/9pfs/9p-synth.h
index 036d7e4a5b..7d6cedcdac 100644
--- a/hw/9pfs/9p-synth.h
+++ b/hw/9pfs/9p-synth.h
@@ -58,7 +58,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
 /* for READDIR test */
 #define QTEST_V9FS_SYNTH_READDIR_DIR "ReadDirDir"
 #define QTEST_V9FS_SYNTH_READDIR_FILE "ReadDirFile%d"
-#define QTEST_V9FS_SYNTH_READDIR_NFILES 100
+#define QTEST_V9FS_SYNTH_READDIR_NFILES 2000
 
 /* Any write to the "FLUSH" file is handled one byte at a time by the
  * backend. If the byte is zero, the backend returns success (ie, 1),
diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index f5a8a192b5..1c901c889f 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -15,6 +15,18 @@
 #include "libqos/virtio-9p.h"
 #include "libqos/qgraph.h"
 
+/*
+ * to benchmark the real time (not CPU time) that elapsed between start of
+ * a request and arrival of its response
+ */
+static double wall_time(void)
+{
+    struct timeval t;
+    struct timezone tz;
+    gettimeofday(&t, &tz);
+    return t.tv_sec + t.tv_usec * 0.000001;
+}
+
 #define QVIRTIO_9P_TIMEOUT_US (10 * 1000 * 1000)
 static QGuestAllocator *alloc;
 
@@ -36,7 +48,7 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(tag);
 }
 
-#define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
+#define P9_MAX_SIZE (256 * 1024) /* Max size of a T-message or R-message */
 
 typedef struct {
     QTestState *qts;
@@ -600,9 +612,32 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, &qid, NULL);
 
+    const double start = wall_time();
+
     req = v9fs_treaddir(v9p, 1, 0, P9_MAX_SIZE - P9_IOHDRSZ, 0);
+    const double treaddir = wall_time();
     v9fs_req_wait_for_reply(req, NULL);
+    const double waitforreply = wall_time();
     v9fs_rreaddir(req, &count, &nentries, &entries);
+    const double end = wall_time();
+
+    printf("\nTime client spent on sending T_readdir: %fs\n\n",
+           treaddir - start);
+
+    printf("Time client spent for waiting for reply from server: %fs "
+           "[MOST IMPORTANT]\n", waitforreply - start);
+    printf("(This is the most important value, because it reflects the time\n"
+           "the 9p server required to process and return the result of the\n"
+           "T_readdir request.)\n\n");
+
+    printf("Total client time: %fs\n", end - start);
+    printf("(NOTE: this time is not relevant; this huge time comes from\n"
+           "inefficient qtest_memread() calls. So you can discard this\n"
+           "value as a problem of this test client implementation while\n"
+           "processing the received server T_readdir reply.)\n\n");
+
+    printf("Details of response message data: R_readddir nentries=%d "
+           "rbytes=%d\n", nentries, count);
 
     /*
      * Assuming msize (P9_MAX_SIZE) is large enough so we can retrieve all
-- 
2.20.1


