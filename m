Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DAF3D5C14
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:48:23 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81u2-00041b-A5
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m81s7-0001Pg-LB
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m81s4-0007OJ-2I
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627310778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6OKv1MBwnny/pDDpbHx0QEOpsCpnjlp6oQJL5udFc64=;
 b=iUEEtU1JXXT6ZHx6tVk7lHvGIFV8glYVN1228O8c60e1UfNRH1H5lrwNsQTF0s6Vqcgs12
 snqwBRZ2VcJOp+MOCO1l8QejGgFriKXw27tuKVyS2dRhvWWof5WHKw8MTarIRyR2Ea3+KW
 oYoZr/6tEeYyinufS8xl0Lg3eWjgVy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-GM8aNmNjOZKks9rMJHFjBA-1; Mon, 26 Jul 2021 10:46:16 -0400
X-MC-Unique: GM8aNmNjOZKks9rMJHFjBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1134F1008064;
 Mon, 26 Jul 2021 14:46:15 +0000 (UTC)
Received: from localhost (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD6AB19811;
 Mon, 26 Jul 2021 14:46:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel
Date: Mon, 26 Jul 2021 16:46:06 +0200
Message-Id: <20210726144613.954844-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00705.html

Changes in v2:
- Added patch 2 (as suggested by Vladimir)
- Patch 4 (ex. 3): Rebase conflicts because of patch 2
- Patch 5 (ex. 4):
  - Rebase conflicts because of patch 2
  - Do not use job_cancel_requested() to determine how a soft-cancelled
    job should be completed: A soft-cancelled job should end with
    COMPLETED, not CANCELLED, and so job_is_cancelled() is the
    appropriate condition there.


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/7:[----] [--] 'mirror: Keep s->synced on error'
002/7:[down] 'mirror: Drop s->synced'
003/7:[----] [--] 'job: @force parameter for job_cancel_sync{,_all}()'
004/7:[0006] [FC] 'jobs: Give Job.force_cancel more meaning'
005/7:[0011] [FC] 'job: Add job_cancel_requested()'
006/7:[----] [-C] 'mirror: Check job_is_cancelled() earlier'
007/7:[----] [--] 'iotests: Add mirror-ready-cancel-error test'


Max Reitz (7):
  mirror: Keep s->synced on error
  mirror: Drop s->synced
  job: @force parameter for job_cancel_sync{,_all}()
  jobs: Give Job.force_cancel more meaning
  job: Add job_cancel_requested()
  mirror: Check job_is_cancelled() earlier
  iotests: Add mirror-ready-cancel-error test

 include/qemu/job.h                            |  29 +++-
 block/backup.c                                |   3 +-
 block/mirror.c                                |  47 +++---
 block/replication.c                           |   4 +-
 blockdev.c                                    |   4 +-
 job.c                                         |  40 ++++-
 qemu-nbd.c                                    |   2 +-
 softmmu/runstate.c                            |   2 +-
 storage-daemon/qemu-storage-daemon.c          |   2 +-
 tests/unit/test-block-iothread.c              |   2 +-
 tests/unit/test-blockjob.c                    |   2 +-
 tests/qemu-iotests/109.out                    |  60 +++-----
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 tests/qemu-iotests/tests/qsd-jobs.out         |   2 +-
 15 files changed, 264 insertions(+), 83 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.31.1


