Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D6492B74
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:43:13 +0100 (CET)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rZg-00031x-8r
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUG-0005Fe-IF
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUA-0005yJ-Ri
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8k1+QQMWtGW1MmRG7uApnZdNF3gEHl+bQsBMZpjrxzM=;
 b=Nrv3vWgyltImBp7H7aSixX6bQ3F5zQYGPidI96t+65Rxv7sNK4URmvxymDs10VPuw5npOq
 iylOpZcSEtrcnwMvbzAsJhizUy5os4VqMrQJSBF7PiX38m3YV+DPFfpI+bVhIQ1n0AHIgM
 ZlJ8QL/jGXKv4MBB2eE3RguqdtVgMWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-G_KFV6s8Ng6NkVqS-BMjPQ-1; Tue, 18 Jan 2022 11:37:26 -0500
X-MC-Unique: G_KFV6s8Ng6NkVqS-BMjPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74789F72A3;
 Tue, 18 Jan 2022 16:28:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91D1E348F8;
 Tue, 18 Jan 2022 16:27:40 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 00/12] Removal of Aiocontext lock through drains: protect
 bdrv_replace_child_noperm.
Date: Tue, 18 Jan 2022 11:27:26 -0500
Message-Id: <20220118162738.1366281-1-eesposit@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie aims to ensure necessary protection to the BlockDriverState
.children and .parents lists, modified in block.c:bdrv_replace_child_noperm().
Thanks to the assertion qemu_in_main_thread() introduced in "block layer:
split block APIs in global state and I/O", we can verify that these lists are
always modified under BQL, but are also read by I/O functions.
This means that alone the BQL is not enough, but that we need to add also
drains, to make sure that there is no I/O running in parallel.

Once we know that these fields are thread safe, we can continue doing until
the various Aiocontext lock that are taken and released to protect them can
be removed.
Currently the AioContext is used pretty much throughout the whole block layer,
and it is a little bit confusing to understand what it exactly protects, and I
am starting to think that in some places it is being taken just because of the
block API assumptions.
For example, some functions like AIO_WAIT_WHILE() release the lock with the
assumption that it is always held, so all callers must take it just to allow
the function to release it.

We can assert that some function is under drains and BQL by using
assert_bdrv_graph_writable(), introduced in the block API splitup
(patch 9 in v5), even though it is currently not checking for drains but only
for main loop. That series added the necessary asserts for .parents and
.children, but as explained we could not enable them, because drains
were missing.
This serie adds the necessary drains and patch 11 fully enables the assertion.

The main function that modifies the ->children and ->parent lists is bdrv_replace_child_noperm. So we need to protect that, and make sure it is
always under drain.

It is necessary to use subtree drains in this case, because it takes care of
draining the whole graph of the node, while bdrv_drained_* does not cover the
child of the given node. And bdrv_replace_child_noperm modifies also that.

Major improvements that this serie brings:
* BDRV_POLL_WHILE_UNLOCKED and bdrv_subtree_drained_begin/end_unlocked.
  This is helpful because current drains always assume that the AioContext
  lock is taken, and thus release it. We don't want to use Aiocontext at all.
* Fix/improve tests. Some tests perform what are now defined as illegal
  operations (I/O modifying a graph) or fail due to the increase of drains
  due to these patches. This brings possible bugs to the light, as shown in
  patches 2,3,4,5,6,8,9. Most of the patches try to fix all bugs that come
  out from adding such drains.
* Protect BlockDriverState's .children and .parents lists, making them thread
  safe.
* Finally fully enable assert_bdrv_graph_writable(), checking also for the
  drains, in patch 11.

This series is based on "job: replace AioContext lock with job_mutex" that in
turns is based on the block API split ("block layer: split block APIs in
global state and I/O").

Based-on: <20220105140208.365608-1-eesposit@redhat.com>

Emanuele Giuseppe Esposito (12):
  introduce BDRV_POLL_WHILE_UNLOCKED
  block/io.c: make bdrv_do_drained_begin_quiesce static and introduce
    bdrv_drained_begin_no_poll
  block.c: bdrv_replace_child_noperm: first remove the child, and then
    call ->detach()
  block.c: bdrv_replace_child_noperm: first call ->attach(), and then
    add child
  test-bdrv-drain.c: adapt test to the coming subtree drains
  test-bdrv-drain.c: remove test_detach_by_parent_cb()
  block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
  reopen: add a transaction to drain_end nodes picked in
    bdrv_reopen_parse_file_or_backing
  jobs: ensure sleep in job_sleep_ns is fully performed
  block.c: add subtree_drains where needed
  block/io.c: fully enable assert_bdrv_graph_writable
  block.c: additional assert qemu in main tread

 block.c                            | 95 ++++++++++++++++++++++++------
 block/block-backend.c              |  3 +
 block/io.c                         | 62 +++++++++++++------
 include/block/block-global-state.h |  5 ++
 include/block/block-io.h           | 10 +++-
 job.c                              | 28 +++++----
 tests/qemu-iotests/030             |  2 +-
 tests/qemu-iotests/151             |  4 +-
 tests/unit/test-bdrv-drain.c       | 53 ++++++-----------
 tests/unit/test-blockjob.c         |  2 +-
 10 files changed, 174 insertions(+), 90 deletions(-)

-- 
2.31.1


