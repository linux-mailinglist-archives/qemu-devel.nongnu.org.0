Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785744451A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:40:51 +0100 (CET)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miaAq-0004Wz-Ex
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9H-0003a1-2A
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9E-0006sQ-0w
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636022345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3XjlL68De4+CHRWFi47U56CONI2/0HQ9SkbY2zLPOjw=;
 b=MTaOhEsHqojs6OZYFC6W5IHyC5MQzvBv0pb+RlXQl2i8ydJbNmMjf66LwReCFX0owyFfzW
 0BC2YFVn5EJn3UG3+ZvHUczpijIghMfTNoMFn9oz3ocrdkSofb181/55x7f8w2aaeXXexh
 NHeQOVxr47qtXm4oBLEVOF9FwFsw+C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-x10uRiSpM5C0bLWITCAJLg-1; Thu, 04 Nov 2021 06:39:03 -0400
X-MC-Unique: x10uRiSpM5C0bLWITCAJLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A041CDF8A3;
 Thu,  4 Nov 2021 10:39:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C02621007625;
 Thu,  4 Nov 2021 10:38:51 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/7] block: Attempt on fixing 030-reported errors
Date: Thu,  4 Nov 2021 11:38:42 +0100
Message-Id: <20211104103849.46855-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I’ve tried to investigate what causes the iotest 030 to fail.  Here’s
what I found:

(1) stream_prepare() gets the base node by looking up the node below
    above_base.  It then invokes bdrv_cor_filter_drop(), before we
    actually use the base node.
    bdrv_cor_filter_drop() modifies the block graph, which means
    draining, which means other parties might modify the graph, too.
    Therefore, afterwards, the node below above_base might be completely
    different, and the base node we got before might already be gone.

(2) bdrv_replace_child_noperm() can set BdrvChild.bs to NULL.  That’s
    problematic, because most of our code cannot deal with BdrvChild
    objects whose .bs pointer is NULL.  We assume that such objects are
    immediately removed from the BDS.children list, and that they won’t
    appear under bs->backing or bs->file (i.e. that those pointers are
    immediately NULLed when bs->{backing,file}->bs is NULLed).
    After setting BdrvChild.bs to NULL, bdrv_replace_child_noperm() may
    invoke bdrv_parent_drained_end_single() on the BdrvChild.
    Therefore, other code is run at that point, and it might not be
    ready to encounter something like
    `bs->backing != NULL && bs->backing->bs == NULL`.

(3) 030 in one case launches four stream jobs concurrently, all with
    speed=1024.  It then unthrottles them one after each other, but the
    problem is that if one job finishes, the jobs above it will be
    advanced by a step (which is actually 512k); so since we unthrottle
    bottom to top, it’s possible that all jobs below the top job are
    finished before we get to unthrottle the top job.  This will advance
    the top job so far (3 * 512k + 512k = 2M) that it actually finishes
    despite still being throttled.  Attempting to unthrottle it then
    throws an error.


Here’s how I think we can solve these problems:

(1) Invoke bdrv_cor_filter_drop() first, then get the base node
    afterwards, when the graph will no longer change.
    Implemented in patch 1.

(2A) bdrv_replace_child_noperm() should immediately set bs->file or
     bs->backing to NULL when it sets bs->{file,backing}->bs to NULL.
     It should also immediately remove any BdrvChild with .bs == NULL
     from the parent’s BDS.children list.
     Implemented in patches 2 through 6.

(2B) Alternatively, we could always keep the whole subgraph drained
     while we manipulate it.  Then, the bdrv_parent_drained_end_single()
     in bdrv_replace_child_noperm() wouldn’t do anything.
     To fix 030, we would need to add a drained section to
     stream_prepare(): Namely we’d need to drain the subgraph below the
     COR filter node.
     This would be a much simpler solution, but I don’t feel like it’s
     the right one.

(3) Just unthrottle the jobs from bottom to top instead of top to
    bottom.


As you can see, I’m not sure which of 2A or 2B is the right solution.  I
decided to investigate both: 2A was much more complicated, but seemed
like the right thing to do; 2B is much simpler, but doesn’t feel as
right.  Therefore, I decided to go with 2A in this first version of this
series.


Hanna Reitz (7):
  stream: Traverse graph after modification
  block: Manipulate children list in .attach/.detach
  block: Unite remove_empty_child and child_free
  block: Drop detached child from ignore list
  block: Pass BdrvChild ** to replace_child_noperm
  block: Let replace_child_noperm free children
  iotests/030: Unthrottle parallel jobs in reverse

 block.c                | 178 +++++++++++++++++++++++++++++------------
 block/stream.c         |   7 +-
 tests/qemu-iotests/030 |  11 ++-
 3 files changed, 144 insertions(+), 52 deletions(-)

-- 
2.33.1


