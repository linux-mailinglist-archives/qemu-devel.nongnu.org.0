Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0144007E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:42:50 +0200 (CEST)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUxs-0001BI-70
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUuo-0006YO-VL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUuk-0002uH-NN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Eme+AwStv+Dy/c3rmLOM3lnWdhseDEC2UyFv2XMOmMA=;
 b=fh0U2GuAPtceoq05XWH65O14kVai7wwk2ucJXad3NxQw6jHMo0sceBHaER3WeJKT1STAQ4
 M5mRpGZC2uS54tVuANGQ6fY5ITwmFEGWOWE3n75yzUvcpmc5lCt43Eett5PKeDKFS+fC9j
 NXk0H+8iRZmiIslu0l5NQhO3vnAw9F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-GQrWD2p6NqSMeMOGpB_Ttg-1; Fri, 29 Oct 2021 12:39:29 -0400
X-MC-Unique: GQrWD2p6NqSMeMOGpB_Ttg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 301101006AA2;
 Fri, 29 Oct 2021 16:39:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A495A2B060;
 Fri, 29 Oct 2021 16:39:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 00/15] job: replace AioContext lock with job_mutex
Date: Fri, 29 Oct 2021 12:38:59 -0400
Message-Id: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this series, we want to remove the AioContext lock and instead
use the already existent job_mutex to protect the job structures
and list. This is part of the work to get rid of AioContext lock
usage in favour of smaller granularity locks.

In patches 1-3-5-6-7, we split the job API in two headers:
job-driver.h and job-monitor.h.
As explained in job.c, job-monitor are the functions mainly used
by the monitor, and require consistency between the search of
a specific job (job_get) and the actual operation/action on it
(e.g. job_user_cancel). Therefore job-monitor API assume that
the job mutex lock is always held by the caller.

job-driver, on the other side, is the collection of functions
that are used by the job drivers or core block layer. These
functions are not aware of the job mutex, and delegate the
locking to the callee instead.

We also have job-common.h contains the job struct definition
and common functions that are not part of monitor or driver APIs.
job.h is left for legacy and to avoid changing all files that
include it.

After we split the job API, we have a couple of patches that try
to prepare and simplify the aiocontext lock replacement with
job lock, namely patch 10 introduces AIO_WAIT_WHILE_UNLOCKED
(same as the original AIO_WAIT_WHILE but does not release and
re-acquires the aiocontext lock if provided).

Patch 12 uses job_lock/unlock to protect the job fields and
shared structures. Note that this patch just adds the job locks,
and in order to simplify the rewiew, does remove any aiocontext lock, creating deadlocks. Patch 13 takes care of the unit tests.
The reason why it does not handle possible deadlocks is because
doing so would just add additional job_lock/unlock that would
still be deleted in next patches together with the aiocontext lock.

RFC: not sure if the current patch organization is correct.
Bisecting in patches in between this serie would cause tests
to deadlock.

Example: currently patch 12 has this code
static void job_exit(void *opaque)
{
    Job *job = (Job *)opaque;
+   job_lock();
    job_ref(); // assumes the lock held
    aio_context_acquire();

and then on patch 15:
static void job_exit(void *opaque)
{
    Job *job = (Job *)opaque;
    job_lock();
-   job_ref(); // assumes the lock held
-   aio_context_acquire();

This is not ideal in patch 12, because taking the aiocontext
lock after the job lock is already held can cause deadlocks
(in the worst case we might want the opposite order),
but in order to keep every patch clean we would need to
do 2 patches:

static void job_exit(void *opaque)
{
    Job *job = (Job *)opaque;
+   job_lock();
    job_ref(); // assumes the lock held
+   job_unlock();
    aio_context_acquire();
+   job_lock();

and once the aiocontext is removed:

static void job_exit(void *opaque)
{
    Job *job = (Job *)opaque;
    job_lock();
-   job_ref(); // assumes the lock held
-   job_unlock();
-   aio_context_acquire();
-   job_lock();

which seems unnecessary.

Patch 14 instead starts replacing some aiocontext with job_locks,
and patch 15 takes care of completely eradicating them from the
job API (with the exception of driver->free()). Again the two
patches are kept separated to simplify the life of the reviewer.

Tested this series by running unit tests, qemu-iotests and qtests
(x86_64).

This serie is based on my previous series "block layer: split
block APIs in global state and I/O".

Based-on: <20211025101735.2060852-1-eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Emanuele Giuseppe Esposito (15):
  jobs: add job-common.h
  job.c: make job_lock/unlock public
  job-common.h: categorize fields in struct Job
  jobs: add job-monitor.h
  job-monitor.h: define the job monitor API
  jobs: add job-driver.h
  job-driver.h: add helper functions
  job.c: minor adjustments in preparation to job-driver
  job.c: move inner aiocontext lock in callbacks
  aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
  jobs: remove aiocontext locks since the functions are under BQL
  jobs: protect jobs with job_lock/unlock
  jobs: use job locks and helpers also in the unit tests
  jobs: add missing job locks to replace aiocontext lock
  jobs: remove all unnecessary AioContext locks

 include/block/aio-wait.h         |  15 +-
 include/qemu/job-common.h        | 336 ++++++++++++++++++
 include/qemu/job-driver.h        | 173 ++++++++++
 include/qemu/job-monitor.h       | 275 +++++++++++++++
 include/qemu/job.h               | 569 +------------------------------
 block.c                          |   6 +
 block/mirror.c                   |   8 +-
 block/replication.c              |   6 +
 blockdev.c                       |  88 ++---
 blockjob.c                       |  62 ++--
 job-qmp.c                        |  54 ++-
 job.c                            | 413 ++++++++++++++++------
 monitor/qmp-cmds.c               |   2 +
 qemu-img.c                       |   8 +-
 tests/unit/test-bdrv-drain.c     |  44 +--
 tests/unit/test-block-iothread.c |   6 +-
 tests/unit/test-blockjob-txn.c   |  10 +
 tests/unit/test-blockjob.c       |  68 ++--
 18 files changed, 1303 insertions(+), 840 deletions(-)
 create mode 100644 include/qemu/job-common.h
 create mode 100644 include/qemu/job-driver.h
 create mode 100644 include/qemu/job-monitor.h

-- 
2.27.0


