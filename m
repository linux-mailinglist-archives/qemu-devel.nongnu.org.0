Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD2424142
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:26:07 +0200 (CEST)
Received: from localhost ([::1]:36510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8o2-0001uk-Sn
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8i0-0001Gk-Gr
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8hw-0007CG-OE
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vjGlPDegSxQ62l9QZ0z+J6tB9XBVMV7o7RcxQ9GgmSs=;
 b=dhe1sMZwEFE43rIHcNXIW7eDC57OiF4YALfOMVZIHyAdIdHLiOIEW3rgP7Lpj8GDvDmhm/
 o0e/tMKtMjxHm+DYUzHYjipL0sOj1zNjz6pIMvDrQiOJHmJK1lErRUDPQc/wed0sh7ngin
 2DJZvxihzfnFzZRHFoHtrWN1M07izDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-u0hJHb5QOsOzgglxyU-cUw-1; Wed, 06 Oct 2021 11:19:44 -0400
X-MC-Unique: u0hJHb5QOsOzgglxyU-cUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EE8619251A0;
 Wed,  6 Oct 2021 15:19:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4EA5F4F4;
 Wed,  6 Oct 2021 15:19:42 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 00/13] mirror: Handle errors after READY cancel
Date: Wed,  6 Oct 2021 17:19:27 +0200
Message-Id: <20211006151940.214590-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00705.html

v2 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00747.html

v3 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-08/msg00127.html

v4 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-09/msg00314.html


Changes in v5:
- Added patch 7: When it was soft-cancelled, the mirror job clears
  .cancelled before leaving its main loop.  The clear intention is to
  have the job be treated as having completed successfully (and this is
  also supported by the QMP documentation of block-job-cancel).  It is
  however possible to cancel the job after it has left its main loop,
  before it can be unwound, and then the job would again be treated as
  cancelled.  We don’t want that, so make a soft job-cancel a no-op when
  .deferred_to_main_loop is true.
  (This fixes the test-replication failure.)

- Patch 8: Add a comment in job_cancel() that job_cancel_requested() and
  job_is_cancelled() are equivalent here, but why we want to inquire
  job_is_cancelled() instead of job_cancel_requested().


git-backport-diff against v4:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/13:[----] [--] 'job: Context changes in job_completed_txn_abort()'
002/13:[----] [--] 'mirror: Keep s->synced on error'
003/13:[----] [--] 'mirror: Drop s->synced'
004/13:[----] [--] 'job: Force-cancel jobs in a failed transaction'
005/13:[----] [--] 'job: @force parameter for job_cancel_sync()'
006/13:[----] [--] 'jobs: Give Job.force_cancel more meaning'
007/13:[down] 'job: Do not soft-cancel after a job is done'
008/13:[0005] [FC] 'job: Add job_cancel_requested()'
009/13:[----] [--] 'mirror: Use job_is_cancelled()'
010/13:[----] [--] 'mirror: Check job_is_cancelled() earlier'
011/13:[----] [--] 'mirror: Stop active mirroring after force-cancel'
012/13:[----] [--] 'mirror: Do not clear .cancelled'
013/13:[----] [--] 'iotests: Add mirror-ready-cancel-error test'


Hanna Reitz (13):
  job: Context changes in job_completed_txn_abort()
  mirror: Keep s->synced on error
  mirror: Drop s->synced
  job: Force-cancel jobs in a failed transaction
  job: @force parameter for job_cancel_sync()
  jobs: Give Job.force_cancel more meaning
  job: Do not soft-cancel after a job is done
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
 job.c                                         |  94 ++++++++++--
 tests/unit/test-blockjob.c                    |   2 +-
 tests/qemu-iotests/109.out                    |  60 +++-----
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 tests/qemu-iotests/tests/qsd-jobs.out         |   2 +-
 11 files changed, 312 insertions(+), 90 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.31.1


