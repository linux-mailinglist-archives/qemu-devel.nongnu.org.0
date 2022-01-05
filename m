Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90245485503
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:49:04 +0100 (CET)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57b5-0006Vy-FQ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:49:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sN-0008AU-8E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:02:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sL-0006vq-3c
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eF4Rjhzk1+EiESVmQsqqU+v6ZDjEIDynvOS7J7aOi9I=;
 b=ercOGWCqS1w4Rg40KdOmH7qfafp5rArZns7L2ZQE5lm8HkWAgd4H1vqf/r8jHMsSh1Jr9b
 xl+BAP0rCbkane2gkv6sKfHuqdkDPE4bdaKhXLTW5dbwtY/HaISWKl6ivbUhMqz6f7pdH+
 gXX9uPMNRiQzFk4mZ+/DcOXbtuFjnNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-x8BoRE60O96g2HvbQ5f1Sw-1; Wed, 05 Jan 2022 09:02:45 -0500
X-MC-Unique: x8BoRE60O96g2HvbQ5f1Sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8593AA0C17;
 Wed,  5 Jan 2022 14:02:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 908A92B59F;
 Wed,  5 Jan 2022 14:02:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 00/16] job: replace AioContext lock with job_mutex
Date: Wed,  5 Jan 2022 09:01:52 -0500
Message-Id: <20220105140208.365608-1-eesposit@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
patch, 14. In this way we can freely create locking sections
without worrying about deadlocks with the aiocontext lock.

Patch 2 defines what fields in the job structure need protection,
and patches 3-4 categorize respectively locked and unlocked
functions in the job API.

Patch 5-9 are in preparation to the job locks, they try to reduce
the aiocontext critical sections and other minor fixes.

Patch 10-13 introduces the (nop) job lock into the job API and
its users, following the comments and categorizations done in
patch 2-3-4.

Patch 14 makes the prototypes in patch 1 use the job_mutex and
removes all aiocontext lock at the same time.

Tested this series by running unit tests, qemu-iotests and qtests
(x86_64).

This serie is based on my previous series "block layer: split
block APIs in global state and I/O".

Based-on: <20211124064418.3120601-1-eesposit@redhat.com>
---
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

Emanuele Giuseppe Esposito (16):
  job.c: make job_mutex and job_lock/unlock() public
  job.h: categorize fields in struct Job
  job.h: define locked functions
  job.h: define unlocked functions
  block/mirror.c: use of job helpers in drivers to avoid TOC/TOU
  job.c: make job_event_* functions static
  job.c: move inner aiocontext lock in callbacks
  aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
  jobs: remove aiocontext locks since the functions are under BQL
  jobs: protect jobs with job_lock/unlock
  jobs: document all static functions and add _locked() suffix
  jobs: use job locks and helpers also in the unit tests
  jobs: add job lock in find_* functions
  job.c: use job_get_aio_context()
  job.c: enable job lock/unlock and remove Aiocontext locks
  block_job_query: remove atomic read

 block.c                          |  18 +-
 block/commit.c                   |   4 +-
 block/mirror.c                   |  21 +-
 block/replication.c              |  10 +-
 blockdev.c                       | 112 ++----
 blockjob.c                       | 122 +++---
 include/block/aio-wait.h         |  15 +-
 include/qemu/job.h               | 317 +++++++++++----
 job-qmp.c                        |  74 ++--
 job.c                            | 656 +++++++++++++++++++------------
 monitor/qmp-cmds.c               |   6 +-
 qemu-img.c                       |  41 +-
 tests/unit/test-bdrv-drain.c     |  46 +--
 tests/unit/test-block-iothread.c |  14 +-
 tests/unit/test-blockjob-txn.c   |  24 +-
 tests/unit/test-blockjob.c       |  98 ++---
 16 files changed, 947 insertions(+), 631 deletions(-)

-- 
2.31.1


