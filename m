Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2106210F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNrf-0007gR-Cp; Tue, 08 Nov 2022 07:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrZ-0007fY-SV
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrY-0000Ck-0O
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0oJ/G9IamYspdIXfMS8pvPb2NoLGEwS8d9xi2dJCff0=;
 b=QZW9yePq6BqVkl+VyUIZT5uysKI/NCYXVJtXxKQFEF6IPvTZgixs4NwclJ1lhBzpZEb8sG
 FxjbWDolqOPFR+unnmu8r1Xc91Upov82XG1IyLLPNCfdzW6i4WGHenLKbSRYrb9tTx1/nv
 2iFps0gbbX2GJgkTPublf2VUTAob0bc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-aQCzYB8pMJ2hT2oOh6zc4Q-1; Tue, 08 Nov 2022 07:37:53 -0500
X-MC-Unique: aQCzYB8pMJ2hT2oOh6zc4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E432D3C0CD50;
 Tue,  8 Nov 2022 12:37:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C39899E70;
 Tue,  8 Nov 2022 12:37:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 00/13] block: Simplify drain
Date: Tue,  8 Nov 2022 13:37:25 +0100
Message-Id: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I'm aware that exactly nobody has been looking forward to a series with
this title, but it has to be. The way drain works means that we need to
poll in bdrv_replace_child_noperm() and that makes things rather messy
with Emanuele's multiqueue work because you must not poll while you hold
the graph lock.

The other reason why it has to be is that drain is way too complex and
there are too many different cases. Some simplification like this will
hopefully make it considerably more maintainable. The diffstat probably
tells something, too.

There are roughly speaking three parts in this series:

1. Make BlockDriver.bdrv_drained_begin/end() non-coroutine_fn again,
   which allows us to not poll on bdrv_drained_end() any more.

2. Remove subtree drains. They are a considerable complication in the
   whole drain machinery (in particular, they require polling in the
   BdrvChildClass.attach/detach() callbacks that are called during
   bdrv_replace_child_noperm()) and none of their users actually has a
   good reason to use them.

3. Finally get rid of polling in bdrv_replace_child_noperm() by
   requiring that the child is already drained by the caller and calling
   callbacks only once and not again for every nested drain section.

If necessary, a prefix of this series can be merged that covers only the
first or the first two parts and it would still make sense.

Kevin Wolf (13):
  qed: Don't yield in bdrv_qed_co_drain_begin()
  test-bdrv-drain: Don't yield in .bdrv_co_drained_begin/end()
  block: Revert .bdrv_drained_begin/end to non-coroutine_fn
  block: Remove drained_end_counter
  block: Inline bdrv_drain_invoke()
  block: Drain invidual nodes during reopen
  block: Don't use subtree drains in bdrv_drop_intermediate()
  stream: Replace subtree drain with a single node drain
  block: Remove subtree drains
  block: Call drain callbacks only once
  block: Remove ignore_bds_parents parameter from drain functions
  block: Don't poll in bdrv_replace_child_noperm()
  block: Remove poll parameter from bdrv_parent_drained_begin_single()

 include/block/block-global-state.h |   3 +
 include/block/block-io.h           |  52 +---
 include/block/block_int-common.h   |  17 +-
 include/block/block_int-io.h       |  12 -
 block.c                            | 132 ++++++-----
 block/block-backend.c              |   4 +-
 block/io.c                         | 281 ++++------------------
 block/qed.c                        |  24 +-
 block/replication.c                |   6 -
 block/stream.c                     |  20 +-
 block/throttle.c                   |   6 +-
 blockdev.c                         |  13 -
 blockjob.c                         |   2 +-
 tests/unit/test-bdrv-drain.c       | 369 +++++++----------------------
 14 files changed, 270 insertions(+), 671 deletions(-)

-- 
2.38.1


