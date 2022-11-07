Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58B61F756
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 16:15:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3ob-0001qg-IB; Mon, 07 Nov 2022 10:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os3oZ-0001pd-4e
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os3oW-0006V5-3W
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667834006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=386KRe582invMrg1CFWPn+IzjN5j2vIQJrD792OEshM=;
 b=Fv4HqIdrohskZQbeJpY5K//x6O6OG20RfuDK06lNH1tKkCNHQqZu5YfhJw0oEEFXrcA8a3
 zH9jbreJpmQFoQ9lfSku0+Wz9oBK/ZYnmd/vsGkAJpGH30SRt7RSWsynn4tZ0n6tHQ50vv
 csLUZXitNlm/7UavH4Ln5lm+WNh3IGU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-b3XN0VqNO46s-uW2rjrCYg-1; Mon, 07 Nov 2022 10:13:23 -0500
X-MC-Unique: b3XN0VqNO46s-uW2rjrCYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F9E3185A7A9;
 Mon,  7 Nov 2022 15:13:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AD142028DC1;
 Mon,  7 Nov 2022 15:13:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 0/3] block: Start/end drain on correct AioContext
Date: Mon,  7 Nov 2022 16:13:18 +0100
Message-Id: <20221107151321.211175-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00389.html

bdrv_replace_child_noperm() drains the child via
bdrv_parent_drained_{begin,end}_single().  When it removes a child, the
bdrv_parent_drained_end_single() at its end will be called on an empty
child, making the BDRV_POLL_WHILE() in it poll the main AioContext
(because c->bs is NULL).

That’s wrong, though, because it’s supposed to operate on the parent.
bdrv_parent_drained_end_single_no_poll() will have scheduled any BHs in
the parents’ AioContext, which may be anything, not necessarily the main
context.  Therefore, we must poll the parent’s context.

Patch 3 does this for both bdrv_parent_drained_{begin,end}_single().
Patch 1 ensures that we can legally call
bdrv_child_get_parent_aio_context() from those I/O context functions,
and patch 2 fixes blk_do_set_aio_context() to not cause an assertion
failure if it beginning a drain can end up in blk_get_aio_context()
before blk->ctx has been updated.


v2:
- Patch 1:
  - Move bdrv_child_get_parent_aio_context() from block-global-state.h
    to block-io.h
  - Move BdrvChildClass.get_parent_aio_context into the I/O code section
  - Mark blk_root_get_parent_aio_context() as I/O code
  - Mark child_job_get_parent_aio_context(), and lock the job mutex,
    which we now need to do (as of 3ed4f708fe1)
- Patch 2:
  - Added comment similar to Kevin’s suggestion
    (Still decided to take Kevin’s R-b, even though I didn’t use the
    literal suggestion, but made it a bit more verbose)


Hanna Reitz (3):
  block: Make bdrv_child_get_parent_aio_context I/O
  block-backend: Update ctx immediately after root
  block: Start/end drain on correct AioContext

 include/block/block-global-state.h | 1 -
 include/block/block-io.h           | 2 ++
 include/block/block_int-common.h   | 4 ++--
 block.c                            | 2 +-
 block/block-backend.c              | 9 ++++++++-
 block/io.c                         | 6 ++++--
 blockjob.c                         | 3 ++-
 7 files changed, 19 insertions(+), 8 deletions(-)

-- 
2.36.1


