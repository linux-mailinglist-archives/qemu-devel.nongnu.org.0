Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B476B3BECB6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:00:13 +0200 (CEST)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AuC-0004Uk-Pb
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1AsV-0002KB-RM
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1AsT-0000BG-Lv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NEXpdzGX+LWihJ6lYS9F2OXg4o5du97Dg44ut4yGlxQ=;
 b=QnPmkNSilqYLRLT4gYrS9VNj7jRrXaR/wHlzx8PLQTiLzyiL1S9YhS60708EX8kq8dTNKi
 1ZuIDREoeYzTyWLlK0+7fkb/mQsfQzeIFMu2f4WciKaHigO4UIjNMm9hZpRk+YayTDP9k9
 Ote+IQUXoe3MfXtuj9zp9uDnYK7X/+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-yZc9sBq6MIyce0VsLY2Tyg-1; Wed, 07 Jul 2021 12:58:22 -0400
X-MC-Unique: yZc9sBq6MIyce0VsLY2Tyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A5F362F8;
 Wed,  7 Jul 2021 16:58:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11DEA100EBAF;
 Wed,  7 Jul 2021 16:58:14 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Date: Wed,  7 Jul 2021 18:58:07 +0200
Message-Id: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a continuation on the work to reduce (and possibly get rid of) the usage of AioContext lock, by introducing smaller granularity locks to keep the thread safety.

This series aims to:
1) remove the aiocontext lock and substitute it with the already existing
   global job_mutex
2) fix what it looks like to be an oversight when moving the blockjob.c logic
   into the more generic job.c: job_mutex was introduced especially to
   protect job->busy flag, but it seems that it was not used in successive
   patches, because there are multiple code sections that directly
   access the field without any locking.
3) use job_mutex instead of the aiocontext_lock
4) extend the reach of the job_mutex to protect all shared fields
   that the job structure has.

The reason why we propose to use the existing job_mutex and not make one for
each job is to keep things as simple as possible for now, and because
the jobs are not in the execution critical path, so we can affort
some delays.
Having a lock per job would increase overall complexity and
increase the chances of deadlocks (one good example could be the job
transactions, where multiple jobs are grouped together).
Anyways, the per-job mutex can always be added in the future.

Patch 1-4 are in preparation for patch 5. They try to simplify and clarify
the job_mutex usage. Patch 5 tries to add proper syncronization to the job
structure, replacing the AioContext lock when necessary.
Patch 6 just removes unnecessary AioContext locks that are now unneeded.


RFC: I am not sure the way I layed out the locks is ideal.
But their usage should not make deadlocks. I also made sure
the series passess all qemu_iotests.

What is very clear from this patch is that it
is strictly related to the brdv_* and lower level calls, because
they also internally check or even use the aiocontext lock.
Therefore, in order to make it work, I temporarly added some
aiocontext_acquire/release pair around the function that
still assert for them or assume they are hold and temporarly
unlock (unlock() - lock()).

I also apologize for the amount of changes in patch 5, any suggestion on
how to improve the patch layout is also very much appreciated.

Emanuele Giuseppe Esposito (6):
  job: use getter/setters instead of accessing the Job fields directly
  job: _locked functions and public job_lock/unlock for next patch
  job: minor changes to simplify locking
  job.h: categorize job fields
  job: use global job_mutex to protect struct Job
  jobs: remove unnecessary AioContext aquire/release pairs

 include/block/blockjob_int.h   |   1 +
 include/qemu/job.h             | 159 ++++++++++--
 block.c                        |   2 +-
 block/backup.c                 |   4 +
 block/commit.c                 |   4 +-
 block/mirror.c                 |  30 ++-
 block/monitor/block-hmp-cmds.c |   6 -
 block/replication.c            |   3 +-
 blockdev.c                     | 235 ++++++------------
 blockjob.c                     | 140 +++++++----
 job-qmp.c                      |  65 +++--
 job.c                          | 432 ++++++++++++++++++++++++++-------
 qemu-img.c                     |  19 +-
 13 files changed, 724 insertions(+), 376 deletions(-)

-- 
2.31.1


