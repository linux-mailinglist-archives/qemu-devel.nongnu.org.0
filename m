Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81939191F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:43:23 +0200 (CEST)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lltof-0002O6-Pq
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lltnK-0001gf-Vm
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:41:59 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lltnF-00053H-HA
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kzSNlrPb+tqhxecPKcoNX6UI42fzblB+SKzuLG2TspY=; b=E5Z1Aa/43vQiCyL9lrta3LwhLm
 dIi1HnTHQclwyspsR0Ei3N34bh4KyYJOw4ezAJHqTOnsNxTqaAp9TakHQceNTobPKAl7EcNpWGzJY
 nAc+D6X8MB7V0/Hm/v+JO3XVjb5EGsQOmCLIHoos1rQED95Ul/X8yotFIFa0XZZwvWjfgQfZywPl2
 Ul5ygLmziuzw3e8GwUNf1FBUITish8LUfxYAt9xcuPFVdFjoUUmtZpfPVvLPgIpMmqhU0K7/nUfun
 C9BEOuBw8oaBZ0Pz5LLBLAdEN73sCop315rq72MkCqbLiRLD0Gt5xd3A6E3KoTQNsjSMo4SimSTCa
 ko/eNwKGerfAKVH3DI8GMCujE6ghrugswWiSjm0cMwc3XJ8O/ZrjbZG0FYVFZOXFgkP68Qd3RfqFx
 JStbSTzZ0E4O0uIfaakM4gdf1M0XYeWbky9PyzqWlwL/SmEhCjAmDhhSajqyZQMMS0FHkoF/xM5Ny
 U3/NBnuUHD/08iqnX1TlkZ/ffJ0+LDPDBcu1iZXjnApYmNsYzj2EkxjyqolOih3ltsuuNqLDrB3VD
 WlDES7kREdwlLnWcAIs4g+ybPcKzdFyKvPA0F7LQfBmaYBV6vGemBWTWdGZQeGhlYRUXjLihi6hPF
 Kd6YWLd9LIYVZOFrtqMaGU1yS66FKX4iaYTGrolT4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: 9pfs: scope of rename_lock?
Date: Wed, 26 May 2021 15:41:48 +0200
Message-ID: <2286290.ABruit1yvu@silver>
In-Reply-To: <3482348.c50Dd4UUo8@silver>
References: <3386244.1hTsTelUFx@silver> <20210521135947.6ea005e5@bahia.lan>
 <3482348.c50Dd4UUo8@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 25. Mai 2021 13:41:22 CEST Christian Schoenebeck wrote:
> I started to work on a patch set on this.
> 
> I try to get rid of that rename_lock entirely by letting the worker threads
> only access temporary copies e.g. of the fid path instead of allowing the
> worker threads to access main thread owned structures directly like it is
> the case ATM.
> 
> I also noticed that the rename_lock scheme is quite inconsistent right now
> anyway. E.g. some of the fs v9fs_co_*() functions accessing main thread
> owned structures don't take the lock at all. Some for good reasons, some
> not.
> 
> So this week I will give the described approach above a test spin and then
> we will see how this impacts performance in practice before actually
> posting any patch set here.

Ok, I made some test runs. Actually quite disappointing. It made literally no 
difference in performance whether or not that global lock is there, which 
surprises me, because I was expecting this to be a bottleneck for parallel 
background worker tasks and that removing that global lock would at least 
provide a few percent in performance gain.

I performed two tests:

1. Measuring the boot time of a guest OS ontop of 9pfs of an OS that uses a 
parallel init system. Zero difference here.

2. A simple shell script using 'find' to scan the entire filesystem on a one 
guest process and a shell script loop in another guest process doing 
constantly rename of an arbitrary directory in parallel for trying to hit that 
global 9p lock. In this test the parallel renaming slowed down the find 
process by about 20%, which is definitely too much, but removing the lock did 
not improve this either.

I had some doubts on my results and wondered if the actual amount of qemu 
worker threads used by 9p where simply too small for some reason, so I added a 
little debug hack to verify how many workers I was actually running for 9p:

diff --git a/hw/9pfs/coth.c b/hw/9pfs/coth.c
index 2802d41cce..a5340db28b 100644
--- a/hw/9pfs/coth.c
+++ b/hw/9pfs/coth.c
@@ -22,6 +22,28 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
+#include <stdatomic.h>
+
+atomic_int p9_workers;
+atomic_int p9_workers_max;
+
+void p9_worker_starts(void) {
+    int now = atomic_fetch_add_explicit(&p9_workers, 1, memory_order_seq_cst) 
+ 1;
+    int prev = p9_workers_max;
+    bool isNewMax = now > prev;
+    while (now > prev &&
+        !atomic_compare_exchange_weak(&p9_workers_max, &prev, now))
+    {
+    }
+    if (isNewMax) {
+        printf("9P: NEW MAX WORKER THREADS : %d <-------- !!!\n", now);
+        fflush(stdout);
+    }
+}
+
+void p9_worker_ends(void) {
+    atomic_fetch_add_explicit(&p9_workers, -1, memory_order_seq_cst);
+}
 
 /* Called from QEMU I/O thread.  */
 static void coroutine_enter_cb(void *opaque, int ret)
diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index c51289903d..e82f92af5e 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -51,12 +51,16 @@
          */                                                             \
         qemu_coroutine_yield();                                         \
         qemu_bh_delete(co_bh);                                          \
+        p9_worker_starts();                                             \
         code_block;                                                     \
+        p9_worker_ends();                                               \
         /* re-enter back to qemu thread */                              \
         qemu_coroutine_yield();                                         \
     } while (0)
 
 void co_run_in_worker_bh(void *);
+void p9_worker_starts(void);
+void p9_worker_ends(void);
 int coroutine_fn v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
 int coroutine_fn v9fs_co_readdir(V9fsPDU *, V9fsFidState *, struct dirent 
**);
 int coroutine_fn v9fs_co_readdir_many(V9fsPDU *, V9fsFidState *,


But I got about 8 - 12 maximum worker threads doing their job for 9pfs 
simultaniously. I mean if you look at this debug code I am actually counting 
the amount of worker *coroutines*, not really the amount of worker *threads*, 
but as all v9fs_co_*() functions are only dispatching exactly once back to 
main thread (i.e. once worker task completed or errored out), that should in 
fact always equal the number of parallel 9p worker threads.

I actually wonder where that's determined how many worker threads are 
allocated for the qemu thread pool, whether that's a hard coded amount 
somewhere or probably configurable from the CLI.

So for now I guess I postpone this global lock issue, unless somebody has some 
idea of what I still might be missing here. I still think the global lock 
should be removed on the long term, but considering that I had zero 
performance gain and my current patch set delta stats aren't necessarily 
small:

 fsdev/9p-marshal.c |  7 +++++++
 fsdev/9p-marshal.h |  1 +
 hw/9pfs/9p.c       | 32 +++++++-------------------------
 hw/9pfs/9p.h       | 27 +--------------------------
 hw/9pfs/codir.c    | 26 ++++++++++++++++----------
 hw/9pfs/cofile.c   | 53 +++++++++++++++++++++++++++++------------------------
 hw/9pfs/cofs.c     | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++---------------------------------------
 hw/9pfs/coth.c     | 22 ++++++++++++++++++++++
 hw/9pfs/coth.h     |  4 ++++
 hw/9pfs/coxattr.c  | 28 ++++++++++++++++------------
 10 files changed, 162 insertions(+), 136 deletions(-)

Hence I probably concentrate on other things for now. If somebody wants to 
have a glimpse on my patch set, I can post it at any time of course.

Best regards,
Christian Schoenebeck



