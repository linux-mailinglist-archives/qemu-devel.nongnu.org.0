Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D86EE6EB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:37:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMWT-0006WO-QK; Tue, 25 Apr 2023 13:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWN-0006G3-P8
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWM-0004Ax-59
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gnFAu3QpdmP7kMMVpTMaLFcG8K0Zb9d2ikWtkrPVhEY=;
 b=NJkgckACrNsVzJPsONvSvmuKqzS1hRfhPwpP+7LWOCLdW2aXf4Z8RY26v3IjZBBPbcuuMk
 3MzF/5r4cpohTL1FX/fx/taTe1nRbKYxAHmmIcmiU5JDf71JTYcDrujogYB0hJZZDO0ov8
 A1MuPaxseSLo78GmACpEoJFEwsIvfGE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-qpUJ7fbwOk2rs8StbvCERQ-1; Tue, 25 Apr 2023 13:32:03 -0400
X-MC-Unique: qpUJ7fbwOk2rs8StbvCERQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 840FEA0F381;
 Tue, 25 Apr 2023 17:32:03 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8482C492B03;
 Tue, 25 Apr 2023 17:32:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 00/20] Graph locking, part 3 (more block drivers)
Date: Tue, 25 Apr 2023 19:31:38 +0200
Message-Id: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The first few patches in this series fix coroutine correctness problems
that have existed for a while, but only actually start to make things
fail in practice with stricter checks that we're going to introduce with
the graph locking work.

The rest of the series makes sure that the graph lock is held in more
block driver functions that access the children or parents list of a
block node. This is incremental work and more patches are yet to come.

Emanuele Giuseppe Esposito (5):
  nbd: Mark nbd_co_do_establish_connection() and callers GRAPH_RDLOCK
  block: Mark bdrv_co_get_allocated_file_size() and callers GRAPH_RDLOCK
  block: Mark bdrv_co_get_info() and callers GRAPH_RDLOCK
  block: Mark bdrv_co_debug_event() GRAPH_RDLOCK
  block: Mark BlockDriver callbacks for amend job GRAPH_RDLOCK

Kevin Wolf (15):
  qcow2: Don't call bdrv_getlength() in coroutine_fns
  block: Consistently call bdrv_activate() outside coroutine
  block: bdrv/blk_co_unref() for calls in coroutine context
  block: Don't call no_coroutine_fns in qmp_block_resize()
  test-bdrv-drain: Don't modify the graph in coroutines
  graph-lock: Add GRAPH_UNLOCKED(_PTR)
  graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader lock
  block: .bdrv_open is non-coroutine and unlocked
  nbd: Remove nbd_co_flush() wrapper function
  vhdx: Take graph lock for accessing a node's parent list
  mirror: Take graph lock for accessing a node's parent list
  block: Mark bdrv_query_bds_stats() and callers GRAPH_RDLOCK
  block: Mark bdrv_query_block_graph_info() and callers GRAPH_RDLOCK
  block: Mark bdrv_recurse_can_replace() and callers GRAPH_RDLOCK
  block: Mark bdrv_refresh_limits() and callers GRAPH_RDLOCK

 block/coroutines.h                          |   5 +-
 block/qcow2.h                               |   4 +-
 include/block/block-global-state.h          |  19 +++-
 include/block/block-io.h                    |  23 ++--
 include/block/block_int-common.h            |  37 +++----
 include/block/block_int-global-state.h      |   4 +-
 include/block/graph-lock.h                  |   6 +-
 include/block/qapi.h                        |   7 +-
 include/sysemu/block-backend-global-state.h |   5 +-
 block.c                                     |  25 ++++-
 block/amend.c                               |   8 +-
 block/blkverify.c                           |   5 +-
 block/block-backend.c                       |  10 +-
 block/crypto.c                              |   8 +-
 block/io.c                                  |  12 +--
 block/mirror.c                              |  14 ++-
 block/nbd.c                                 |  50 +++++----
 block/parallels.c                           |   6 +-
 block/qapi.c                                |   6 +-
 block/qcow.c                                |   6 +-
 block/qcow2-refcount.c                      |   2 +-
 block/qcow2.c                               |  48 ++++-----
 block/qed.c                                 |  24 ++---
 block/quorum.c                              |   4 +-
 block/raw-format.c                          |   2 +-
 block/vdi.c                                 |   6 +-
 block/vhdx.c                                |  15 +--
 block/vmdk.c                                |  20 ++--
 block/vpc.c                                 |   6 +-
 blockdev.c                                  |   7 +-
 qemu-img.c                                  |   2 +
 tests/unit/test-bdrv-drain.c                | 112 +++++++++++++-------
 32 files changed, 304 insertions(+), 204 deletions(-)

-- 
2.40.0


