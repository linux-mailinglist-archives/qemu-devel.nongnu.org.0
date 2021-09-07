Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F91040294F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:01:42 +0200 (CEST)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNajM-0005zc-Vr
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRE-0005cp-KS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRB-0006EM-HC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=py0d+7Waae0mOdkQAO/cc6QMsg9EIRTggutWZ2mgtSs=;
 b=NgTJAaY+Q2dxdtPz6aZajqCB7IxeHVZEsUiDYB49dbfv3ATM+FSahyzze/tgWmbvR1noPs
 SRZVRwBkrd8H+YThC4jA/hAZ5YoOqIxGRPDaP2nocwdbYNt3FOho6AptszJvctTv0Iq6hm
 uWOwDzSPFCV3IrbHOdL++RIfy+sAGdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-QBD0uLKiN0OK1AxAwNPdBQ-1; Tue, 07 Sep 2021 08:42:48 -0400
X-MC-Unique: QBD0uLKiN0OK1AxAwNPdBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA0FA100A241;
 Tue,  7 Sep 2021 12:42:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 294056788C;
 Tue,  7 Sep 2021 12:42:47 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 00/12] mirror: Handle errors after READY cancel
Date: Tue,  7 Sep 2021 14:42:33 +0200
Message-Id: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


Changes in v4:
- Patch 1: Swap the order of aio_context_acquire() and job_unref() to
  save ourselves from using a local variable here (i.e. do it the same
  way as job_txn_apply())

- Patch 5:
  - Do not add a @force parameter to job_cancel_sync_all(): All callers
    want to force-cancel all jobs when they use this function, because
    what else would you want to do when you want to “cancel all jobs”.
    So we don’t need a @force parameter here, and can unconditionally
    invoke job_cancel_sync() with force=true.

  - Let the replication block driver force-cancel its backup job
    (because it doesn’t make a difference, but it’s cleaner to
    force-cancel jobs that don’t support any other cancellation
    method).


git-backport-diff against v3:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/12:[0003] [FC] 'job: Context changes in job_completed_txn_abort()'
002/12:[----] [--] 'mirror: Keep s->synced on error'
003/12:[----] [--] 'mirror: Drop s->synced'
004/12:[----] [--] 'job: Force-cancel jobs in a failed transaction'
005/12:[0022] [FC] 'job: @force parameter for job_cancel_sync()'
006/12:[----] [--] 'jobs: Give Job.force_cancel more meaning'
007/12:[----] [--] 'job: Add job_cancel_requested()'
008/12:[----] [--] 'mirror: Use job_is_cancelled()'
009/12:[----] [--] 'mirror: Check job_is_cancelled() earlier'
010/12:[----] [--] 'mirror: Stop active mirroring after force-cancel'
011/12:[----] [--] 'mirror: Do not clear .cancelled'
012/12:[----] [--] 'iotests: Add mirror-ready-cancel-error test'


Hanna Reitz (12):
  job: Context changes in job_completed_txn_abort()
  mirror: Keep s->synced on error
  mirror: Drop s->synced
  job: Force-cancel jobs in a failed transaction
  job: @force parameter for job_cancel_sync()
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
 job.c                                         |  64 ++++++--
 tests/unit/test-blockjob.c                    |   2 +-
 tests/qemu-iotests/109.out                    |  60 +++-----
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 tests/qemu-iotests/tests/qsd-jobs.out         |   2 +-
 11 files changed, 286 insertions(+), 86 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.31.1


