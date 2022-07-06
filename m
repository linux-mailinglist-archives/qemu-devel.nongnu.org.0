Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FD569420
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:17:34 +0200 (CEST)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9COr-0001uD-Hy
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BR9-0005Cb-Oe
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BR5-0007Dm-Gi
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657138546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dQsgku1nOoU87U+bkUfjVBYxF254oLbui14z7Khc8v0=;
 b=jHIrl1tXsa64brx+GtUk7nVWCjd8Mv9QR6CN2UGxwYsrUf0haLY59CoA2jlzIybK02TYZT
 eMeMGwJR5RAW6ulaPOOttKSVefEbSqrI3GiXgKqeFN+IS7ROHGbcwMhMtnMX/bGfaiQatK
 XInDKZLFeot9a6Qa8kxHtqcN8riYLvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-xvsOXVxJPpO653yovae5Ng-1; Wed, 06 Jul 2022 16:15:42 -0400
X-MC-Unique: xvsOXVxJPpO653yovae5Ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDB62181E066;
 Wed,  6 Jul 2022 20:15:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22C6E1121315;
 Wed,  6 Jul 2022 20:15:39 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v9 00/21] job: replace AioContext lock with job_mutex
Date: Wed,  6 Jul 2022 16:15:12 -0400
Message-Id: <20220706201533.289775-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In this series, we want to remove the AioContext lock and instead
use the already existent job_mutex to protect the job structures
and list. This is part of the work to get rid of AioContext lock
usage in favour of smaller granularity locks.

In order to simplify reviewer's job, job lock/unlock functions and
macros are added as empty prototypes (nop) in patch 1.
They are converted to use the actual job mutex only in the last
patch. In this way we can freely create locking sections
without worrying about deadlocks with the aiocontext lock.

Patch 2 defines what fields in the job structure need protection.
Patches 3-6 are in preparation to the job locks, moving functions
from global to static and introducing helpers.

Patch 7-9 introduce the (nop) job lock into the job API and
its users, and patches 10-13 categorize respectively locked and
unlocked functions in the job API.

Patches 14-17 take care of protecting job->aio_context, and
finally patch 18 makes the prototypes in patch 1 use the
job_mutex and removes all aiocontext lock at the same time.

Tested this series by running unit tests, qemu-iotests and qtests
(x86_64).

---
v9:
* merge patch 6 and 7 to 5.
* additional "taken with job lock/unlock" added and propagated in callers
* protect iostatus field of BlockJobs
* move all blockjob patches torward the end of the serie

v8:
* reorganize patch ordering according with Vladimir proposal
* minor nitpicks

v7:
* s/temporary/temporarly
* double identical locking comment to the same function
* patch 2: add "Protected by AioContext lock" to better categorize fields in
  job.h
* use same comment style in all function headers ("Just like {funct}, but
  called between job_lock and job_unlock")

v6:
* patch 4 and 6 squashed with patch 19 (enable job lock and
  reduce/remove AioContext lock)
* patch 19: job_unref_locked read the aiocontext inside the
  job lock.

v5:
* just restructured patches a little bit better, as there were
  functions used before they were defined.
* rebased on kwolf/block branch and API split serie

v4:
* move "protected by job_mutex" from patch 2 to 15, where the job_mutex is
  actually added.
* s/aio_co_enter/aio_co_schedule in job.c, and adjust tests accordingly.
* remove job_get_aio_context, add job_set_aio_context. Use "fake rwlock"
  to protect job->aiocontext.
* get rid of useless getters method, namely:
  job_get_status
  job_get_pause_count
  job_get_paused
  job_get_busy
  They are all used only by tests, and such getter is pretty useless.
  Replace with job_lock(); assert(); job_unlock();
* use job lock macros instead of job lock/unlock in unit tests.
* convert also blockjob functions to have _locked
* put the job_lock/unlock patches before the _locked ones
* replace aio_co_enter in job.c and detect change of context

v3:
* add "_locked" suffix to the functions called under job_mutex lock
* rename _job_lock in real_job_lock
* job_mutex is now public, and drivers like monitor use it directly
* introduce and protect job_get_aio_context
* remove mirror-specific APIs and just use WITH_JOB_GUARD
* more extensive use of WITH_JOB_GUARD and JOB_LOCK_GUARD

RFC v2:
* use JOB_LOCK_GUARD and WITH_JOB_LOCK_GUARD
* mu(u)ltiple typos in commit messages
* job API split patches are sent separately in another series
* use of empty job_{lock/unlock} and JOB_LOCK_GUARD/WITH_JOB_LOCK_GUARD
  to avoid deadlocks and simplify the reviewer job
* move patch 11 (block_job_query: remove atomic read) as last

Emanuele Giuseppe Esposito (20):
  job.c: make job_mutex and job_lock/unlock() public
  job.h: categorize fields in struct Job
  job.c: API functions not used outside should be static
  aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
  job.c: add job_lock/unlock while keeping job.h intact
  job: move and update comments from blockjob.c
  blockjob: introduce block_job  _locked() APIs
  jobs: add job lock in find_* functions
  jobs: use job locks also in the unit tests
  block/mirror.c: use of job helpers in drivers to avoid TOC/TOU
  jobs: group together API calls under the same job lock
  commit and mirror: create new nodes using bdrv_get_aio_context, and
    not the job aiocontext
  jobs: protect job.aio_context with BQL and job_mutex
  job.c: enable job lock/unlock and remove Aiocontext locks
  block_job_query: remove atomic read
  blockjob.h: categorize fields in struct BlockJob
  blockjob: rename notifier callbacks as _locked
  blockjob: protect iostatus field in BlockJob struct
  blockjob: remove unused functions
  job: remove unused functions

Paolo Bonzini (1):
  job: detect change of aiocontext within job coroutine

 block.c                          |  20 +-
 block/commit.c                   |   4 +-
 block/mirror.c                   |  21 +-
 block/replication.c              |   6 +-
 blockdev.c                       | 129 +++---
 blockjob.c                       | 131 ++++---
 include/block/aio-wait.h         |  17 +-
 include/block/blockjob.h         |  45 ++-
 include/qemu/job.h               | 264 +++++++++----
 job-qmp.c                        |  87 ++---
 job.c                            | 646 +++++++++++++++++++------------
 monitor/qmp-cmds.c               |   7 +-
 qemu-img.c                       |  41 +-
 tests/unit/test-bdrv-drain.c     |  80 ++--
 tests/unit/test-block-iothread.c |   8 +-
 tests/unit/test-blockjob-txn.c   |  24 +-
 tests/unit/test-blockjob.c       | 107 +++--
 17 files changed, 1009 insertions(+), 628 deletions(-)

-- 
2.31.1


