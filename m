Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886E3D2354
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:29:50 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xpk-00028I-Ul
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmh-0007yl-82
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmb-0007MT-Es
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6WExQ0SNdzmbpZ5aPj7TcNlAMnrujjHZVZ+XVkRdVdA=;
 b=iT56MBGNZ/Qp+Z7qvBwBAXKLz1VH+816qhT4LAwjAPajB3tpyg7UijFbrcs5n9i/TNYNo5
 tyPSAlHr8hbJ/pJqtNNmAKCy/x5KCZJt73TI/YXsBkDEs8JylkAA8+yfqloaxOnHbv8NiQ
 trH8CVFF3y6gxLJdD8x+gokDWC4Ss84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-IzEFWbOyPtaqtACYPy6AJg-1; Thu, 22 Jul 2021 08:26:30 -0400
X-MC-Unique: IzEFWbOyPtaqtACYPy6AJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7517B190B2BB;
 Thu, 22 Jul 2021 12:26:29 +0000 (UTC)
Received: from localhost (ovpn-112-220.ams2.redhat.com [10.36.112.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C255D9DD;
 Thu, 22 Jul 2021 12:26:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? 0/6] mirror: Handle errors after READY cancel
Date: Thu, 22 Jul 2021 14:26:21 +0200
Message-Id: <20210722122627.29605-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a rather complex series with changes that aren’t exactly local
to the mirror job, so maybe it’s too complex for 6.1.

However, it is a bug fix, and not an insignificant one, though probably
not a regression of any kind.

Bug report:
https://gitlab.com/qemu-project/qemu/-/issues/462

(I didn’t put any “Fixes:” or “Resolves:” into the commit messages,
because there is no single patch here that fixes the bug.)

The root of the problem is that if you cancel a mirror job during its
READY phase, any kind of I/O error (with the error action 'stop') is
likely to not be handled gracefully, which means that perhaps the job
will just loop forever without pausing, doing nothing but emitting
errors.  There is no way to stop the job, or cancel it with force=true,
and so you also cannot quit qemu normally, because, well, cancelling the
job doesn’t do anything.  So you have to kill qemu to stop the mess.

If you’re lucky, the error is transient.  Then qemu will just kill
itself with a failed assertion, because it’ll try a READY -> READY
transition, which isn’t allowed.

There are a couple of problems contributing to it all:

(1) The READY -> READY transition comes from the fact that we will enter
    the READY state whenever source and target are synced, and whenever
    s->synced is false.  I/O errors reset s->synced.  I believe they
    shouldn’t.
    (Patch 1)

(2) Quitting qemu doesn’t force-cancel jobs.  I don’t understand why.
    If for all jobs but mirror we want them to be cancelled and not
    properly completed, why do we want mirror to get a consistent
    result?  (Which is what cancel with force=false gives you.)
    I believe we actually don’t care, and so on many occasions where we
    invoke job_cancel_sync() and job_cancel_sync_all(), we want to
    force-cancel the job(s) in question.
    (Patch 2)

(3) Cancelling mirror post-READY with force=false is actually not really
    cancelling the job.  It’s a different completion mode.  The job
    should run like any normal job, it shouldn’t be special-cased.
    However, we have a couple of places that special-case cancelled job
    because they believe that such jobs are on their way to definite
    termination.  For example, we don’t allow pausing cancelled jobs.
    We definitely do want to allow pausing a mirror post-READY job that
    is being non-force-cancelled.  The job may still take an arbitrary
    amount of time, so it absolutely should be pausable.
    (Patches 3, 4)

(4) Mirror only checks whether it’s been force-cancelled at the bottom
    of its main loop, after several `continue`s.  Therefore, if flushing
    fails (and it then `continue`s), that check will be skipped.  If
    flushing fails continuously, the job cannot be force-cancelled.
    (Patch 5)


Max Reitz (6):
  mirror: Keep s->synced on error
  job: @force parameter for job_cancel_sync{,_all}()
  jobs: Give Job.force_cancel more meaning
  job: Add job_cancel_requested()
  mirror: Check job_is_cancelled() earlier
  iotests: Add mirror-ready-cancel-error test

 include/qemu/job.h                            |  29 +++-
 block/backup.c                                |   3 +-
 block/mirror.c                                |  35 +++--
 block/replication.c                           |   4 +-
 blockdev.c                                    |   4 +-
 job.c                                         |  46 ++++--
 qemu-nbd.c                                    |   2 +-
 softmmu/runstate.c                            |   2 +-
 storage-daemon/qemu-storage-daemon.c          |   2 +-
 tests/unit/test-block-iothread.c              |   2 +-
 tests/unit/test-blockjob.c                    |   2 +-
 tests/qemu-iotests/109.out                    |  60 +++-----
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 tests/qemu-iotests/tests/qsd-jobs.out         |   2 +-
 15 files changed, 262 insertions(+), 79 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.31.1


