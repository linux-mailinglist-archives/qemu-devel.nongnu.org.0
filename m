Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100D3589E8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:40:26 +0200 (CEST)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXhh-0008QV-0S
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUXX0-0006Eu-1B
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUXOp-00025M-Hj
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617898853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kdyR+If2svTORwCfTkswgAwShaWYFfPL7DMHbl4nCHc=;
 b=eYjIHhoVzxiu60C7UOsgNbxDo4D+hjY6HUDGP9nujjcy+xJqqBL5RDNP0GhG8P3M82LwUR
 vxti56mByisBsr4I3eIUhhjTPxlAAO1Ojxgi5jTcqSwmpsgBbZj1eY9lh61vRgY5ekdXHk
 3SGmPFKWRznTZFKB7vxyE+/dw03WHG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-ma4QFz_HMtSp95ojC3znLg-1; Thu, 08 Apr 2021 12:20:52 -0400
X-MC-Unique: ma4QFz_HMtSp95ojC3znLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC291883520;
 Thu,  8 Apr 2021 16:20:50 +0000 (UTC)
Received: from localhost (ovpn-114-123.ams2.redhat.com [10.36.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 633B35B6A7;
 Thu,  8 Apr 2021 16:20:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.0? 0/3] job: Add job_wait_unpaused() for
 block-job-complete
Date: Thu,  8 Apr 2021 18:20:36 +0200
Message-Id: <20210408162039.242670-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

See patch 1 for a detailed explanation of the problem.

The gist is: Draining a READY job makes it transition to STANDBY, and
jobs on STANDBY cannot be completed.  Ending the drained section will
schedule the job (so it is then resumed), but not wait until it is
actually running again.

Therefore, it can happen that issuing block-job-complete fails when you
issue it right after some draining operation.

I tried to come up with an iotest reproducer, but in the end I only got
something that reproduced the issue like 2/10 times, and it required
heavy I/O, so it is nothing I would like to have as part of the iotests.
Instead, I opted for a unit test, which allows me to cheat a bit
(specifically, locking the job IO thread before ending the drained
section).


Max Reitz (3):
  job: Add job_wait_unpaused() for block-job-complete
  test-blockjob: Test job_wait_unpaused()
  iotests/041: block-job-complete on user-paused job

 include/qemu/job.h         |  15 ++++
 blockdev.c                 |   3 +
 job.c                      |  42 +++++++++++
 tests/unit/test-blockjob.c | 140 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/041     |  13 +++-
 5 files changed, 212 insertions(+), 1 deletion(-)

-- 
2.29.2


