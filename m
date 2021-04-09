Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD2359FDA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:32:46 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrFc-0004uP-SR
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrCz-00031x-5E
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrCt-0006HM-9Q
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617974993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AI2ByTm9z5JGA27XEH6Yqj9nNVnbDStfoD+1/l/YK6c=;
 b=OpZnNhsLjGztGH+HeqdH2aZHM/1o7hXSOYXXc45F0Yqp8GId6oDg7664ykM41hvnTLBYW6
 HyQcUYUseOmkhTEZAgplJ20BNtf/z9ptmxM+grai1dt6Vx/0FbaehJkbegFp9u724VtzrQ
 Fdr/4OPFrd7Lacx1xc3mBom6UsgA9DM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-BsvO41sxMjWTEDlkIuT9TQ-1; Fri, 09 Apr 2021 09:29:51 -0400
X-MC-Unique: BsvO41sxMjWTEDlkIuT9TQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEE9C1926DA6;
 Fri,  9 Apr 2021 13:29:50 +0000 (UTC)
Received: from localhost (ovpn-114-67.ams2.redhat.com [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E8D710023BE;
 Fri,  9 Apr 2021 13:29:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/3] job: Add job_wait_unpaused() for block-job-complete
Date: Fri,  9 Apr 2021 15:29:44 +0200
Message-Id: <20210409132948.195511-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

v1:
https://lists.nongnu.org/archive/html/qemu-block/2021-04/msg00215.html

Alternative:
https://lists.nongnu.org/archive/html/qemu-block/2021-04/msg00261.html


Compared to v1, I’ve added an aio_wait_kick() to job_pause_point() (as
suggested by Kevin) and adjusted the error message on job->user_paused
(as suggested by John).  I’ve kept the job->pause_count > 0 block
because of the concern of nested event loops Kevin raised, and I’ve
expanded its comment to explain the problem (I hope).

Note also the new note in patch 1’s commit message, which explains how
we’d ideally want block-job-complete to be a coroutine QMP handler so we
could yield instead of polling.


Furthermore, I’ve added the flaky test that I’ve also appended to the
alternative series.  Sometimes it fails 50/100 times for me, sometimes
more like 20/100.  (On master.)  Maybe it won’t reproduce the problem
for you at all.


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/4:[0015] [FC] 'job: Add job_wait_unpaused() for block-job-complete'
002/4:[----] [--] 'test-blockjob: Test job_wait_unpaused()'
003/4:[----] [--] 'iotests/041: block-job-complete on user-paused job'
004/4:[down] 'iotests: Test completion immediately after drain'



Max Reitz (4):
  job: Add job_wait_unpaused() for block-job-complete
  test-blockjob: Test job_wait_unpaused()
  iotests/041: block-job-complete on user-paused job
  iotests: Test completion immediately after drain

 include/qemu/job.h                            |  15 ++
 blockdev.c                                    |   3 +
 job.c                                         |  53 +++++++
 tests/unit/test-blockjob.c                    | 140 ++++++++++++++++++
 tests/qemu-iotests/041                        |  13 +-
 .../tests/mirror-complete-after-drain         |  89 +++++++++++
 .../tests/mirror-complete-after-drain.out     |  14 ++
 7 files changed, 326 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-complete-after-drain
 create mode 100644 tests/qemu-iotests/tests/mirror-complete-after-drain.out

-- 
2.29.2


