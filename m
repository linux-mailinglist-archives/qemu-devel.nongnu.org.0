Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4F3E2782
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:40:37 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwLE-0000ZD-EC
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJq-0006Gf-4S
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJm-0003al-T2
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7vFG7EuBVF6w94MCsEEeHH/iTv+1WPanOzs5akhale4=;
 b=MutzUnhg5X76AB94nQNVI5Nq+WrCdmyKMMyBbAd58QbwbneGta5UWGBXTl9ueS8RwL08nY
 KlbrPrm6kNQpmwymd4ZHuIxIGLZ7a+dsXhQcqL2NvCou6RKZ5n4Y+YtmMpmUqbWXX7lFeu
 cRE4sNfwRSR3i4aTGabIxiO4M8/HYa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-NU6zMzDJP8icX-XoDMdTVQ-1; Fri, 06 Aug 2021 05:39:03 -0400
X-MC-Unique: NU6zMzDJP8icX-XoDMdTVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8A6801AE7;
 Fri,  6 Aug 2021 09:39:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079525C1B4;
 Fri,  6 Aug 2021 09:39:00 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 00/12] mirror: Handle errors after READY cancel
Date: Fri,  6 Aug 2021 11:38:47 +0200
Message-Id: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00705.html

v2 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00747.html

Changes in v3:
- Patch 1: After adding patch 11, I got a failed assertion in
  tests/unit/test-block-iothread (failing qemu_mutex_unlock_impl()).
  That is because before patch 11, for zero-length source devices,
  mirror clears .cancelled unconditionally before exiting.  So even
  force-cancelled jobs are considered to be completed normally, which
  doesn’t seem quite right.
  Anyway, test-block-iothread does some iothread switching, and
  cancelling jobs is not really prepared for that.  This patch fixes
  that (I hope...).

- Patch 4: Split off from patch 5

- Patch 7:
  - Added a long section in the commit message detailing every choice
    for every job_is_cancelled() invocation
  - Use job_cancel_requested() in the assertion in
    job_completed_txn_abort(), because it is not quite clear whether
    soft-cancelled mirror jobs can end up in this path (it seems like a
    bug if that happens, but I think that’s something to fix in some
    other series)

- Patch 8: Added: This is kind of preparation for patch 9, but also just
  a bug fix in itself, I believe

- Patch 9: Moved the job_is_cancelled() check after the last yield point
  before the mirror_iteration() call

- Patch 10: Added: If force-cancelled jobs should not generate new I/O
  requests at all (except for forwarding something to the source
  device), then we need to stop doing active mirroring once the mirror
  job is force-cancelled

- Patch 11: Added: Clearing .cancelled seemed like a hack, so getting
  rid of it seems like a good thing to do
  (And only with this patch, I can assert that .force_cancel can only be
  true when .cancelled is true also; if we tried it before this patch,
  tests/unit/test-block-iothread would fail.)


The discussion around v2 has shown that there are probably more bugs in
the job code, but I think this series is becoming long enough that we
should tackle those in a different series.


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/12:[down] 'job: Context changes in job_completed_txn_abort()'
002/12:[----] [--] 'mirror: Keep s->synced on error'
003/12:[----] [--] 'mirror: Drop s->synced'
004/12:[down] 'job: Force-cancel jobs in a failed transaction'
005/12:[0007] [FC] 'job: @force parameter for job_cancel_sync{,_all}()'
006/12:[----] [--] 'jobs: Give Job.force_cancel more meaning'
007/12:[0002] [FC] 'job: Add job_cancel_requested()'
008/12:[down] 'mirror: Use job_is_cancelled()'
009/12:[0007] [FC] 'mirror: Check job_is_cancelled() earlier'
010/12:[down] 'mirror: Stop active mirroring after force-cancel'
011/12:[down] 'mirror: Do not clear .cancelled'
012/12:[----] [--] 'iotests: Add mirror-ready-cancel-error test'


Max Reitz (12):
  job: Context changes in job_completed_txn_abort()
  mirror: Keep s->synced on error
  mirror: Drop s->synced
  job: Force-cancel jobs in a failed transaction
  job: @force parameter for job_cancel_sync{,_all}()
  jobs: Give Job.force_cancel more meaning
  job: Add job_cancel_requested()
  mirror: Use job_is_cancelled()
  mirror: Check job_is_cancelled() earlier
  mirror: Stop active mirroring after force-cancel
  mirror: Do not clear .cancelled
  iotests: Add mirror-ready-cancel-error test

 include/qemu/job.h                            |  29 +++-
 block/backup.c                                |   3 +-
 block/mirror.c                                |  56 ++++---
 block/replication.c                           |   4 +-
 blockdev.c                                    |   4 +-
 job.c                                         |  67 ++++++--
 qemu-nbd.c                                    |   2 +-
 softmmu/runstate.c                            |   2 +-
 storage-daemon/qemu-storage-daemon.c          |   2 +-
 tests/unit/test-block-iothread.c              |   2 +-
 tests/unit/test-blockjob.c                    |   2 +-
 tests/qemu-iotests/109.out                    |  60 +++-----
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 tests/qemu-iotests/tests/qsd-jobs.out         |   2 +-
 15 files changed, 292 insertions(+), 91 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.31.1


