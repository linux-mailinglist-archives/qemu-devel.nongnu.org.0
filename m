Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E3249F8C9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:54:27 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPpi-0007vm-Md
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPm5-0004W9-El
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPm3-0003Nh-JX
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VMacUIbc2qWFgsmcFO2XmgmR2cp7uukQ75K5j562oEc=;
 b=jGz1dGXA6SHCav9MefWoZGeP1E7F0kU3m5ltKU+qajTRrikJN/3qsb98+BCCovskiZhJEC
 wg+anuL2VrN6isSRsT3z8lhf0cYHupazhDafUGfXscM5I+Q5A99S6fLbGM27Mv0Zu6n6Ok
 l0zjC3P0Kqdv+6Z8U62BXNHfD6Q97YQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-DlI1UjnhNhCFmoBqs4G54A-1; Fri, 28 Jan 2022 06:50:37 -0500
X-MC-Unique: DlI1UjnhNhCFmoBqs4G54A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3DCC1083F67;
 Fri, 28 Jan 2022 11:50:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 704D61F478;
 Fri, 28 Jan 2022 11:50:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 00/19] job: replace AioContext lock with job_mutex
Date: Fri, 28 Jan 2022 06:50:12 -0500
Message-Id: <20220128115031.4061565-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

In order to simplify reviewer's job, job lock/unlock functions and
macros are added as empty prototypes (nop) in patch 1.
They are converted to use the actual job mutex only in the last
patch. In this way we can freely create locking sections
without worrying about deadlocks with the aiocontext lock.

Patch 2 defines what fields in the job structure need protection.
Patches 3-6 are in preparation to the job locks, moving functions
from global to static and introducing helpers.

Patch 7-9 introduce the (nop) job lock into the job API and
its users, and patches 10-13 categorize respectively locked and unlocked functions in the job API.

Patches 14-17 take care of protecting job->aio_context, and
finally patch 18 makes the prototypes in patch 1 use the
job_mutex and removes all aiocontext lock at the same time.

Tested this series by running unit tests, qemu-iotests and qtests
(x86_64).

This serie is based on my previous series "block layer: split
block APIs in global state and I/O" and also depends on the new
converted tests 141 and 185.

Based-on: <20220121170544.2049944-1-eesposit@redhat.com>
---
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

Emanuele Giuseppe Esposito (18):
  job.c: make job_mutex and job_lock/unlock() public
  job.h: categorize fields in struct Job
  job.c: make job_event_* functions static
  job.c: move inner aiocontext lock in callbacks
  aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
  jobs: remove aiocontext locks since the functions are under BQL
  jobs: protect jobs with job_lock/unlock
  jobs: add job lock in find_* functions
  jobs: use job locks also in the unit tests
  job.h: define locked functions
  jobs: document all static functions and add _locked() suffix
  job.h: define unlocked functions
  block/mirror.c: use of job helpers in drivers to avoid TOC/TOU
  blockjob: block_job_get_aio_context is a GS function
  commit and mirror: create new nodes using bdrv_get_aio_context, and
    not the job aiocontext
  jobs: protect job.aio_context with BQL and job_mutex
  job.c: enable job lock/unlock and remove Aiocontext locks
  block_job_query: remove atomic read

Paolo Bonzini (1):
  job: detect change of aiocontext within job coroutine

 block.c                          |  19 +-
 block/backup.c                   |   4 +-
 block/commit.c                   |   4 +-
 block/mirror.c                   |  21 +-
 block/replication.c              |  10 +-
 blockdev.c                       | 124 +++---
 blockjob.c                       | 133 ++++---
 include/block/aio-wait.h         |  15 +-
 include/block/blockjob.h         |  44 +-
 include/qemu/job.h               | 305 ++++++++++----
 job-qmp.c                        |  74 ++--
 job.c                            | 661 +++++++++++++++++++------------
 monitor/qmp-cmds.c               |   7 +-
 qemu-img.c                       |  41 +-
 tests/unit/test-bdrv-drain.c     |  80 ++--
 tests/unit/test-block-iothread.c |   8 +-
 tests/unit/test-blockjob-txn.c   |  32 +-
 tests/unit/test-blockjob.c       | 113 ++++--
 18 files changed, 1027 insertions(+), 668 deletions(-)

-- 
2.31.1


