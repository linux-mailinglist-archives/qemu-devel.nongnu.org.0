Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CAB6FE52F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 22:36:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqXz-00059X-Pu; Wed, 10 May 2023 16:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqXx-000599-TD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqXw-0003JI-1Z
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683750982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OvcCae/Y6jXwfmYluHzgeaiEKBYZt2MG3anOdbKTeho=;
 b=DriHNJYrik6blihEbqf5IKYEzblK1C7uAao9+iD8fUeY/0GXP42EBTv7Y/NhONyxgYKR99
 bFP+Jc3bogcMQXTWqbVBCuM/rspYlZLiAo3MV9+eyVvoktW6ljRwqF1B/SRkvJDreymSrG
 jDddowXXqNoYM1LZkhEq2hHtyTlp2Eg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-okP30ejbNS2fmpU6B4JTCg-1; Wed, 10 May 2023 16:36:21 -0400
X-MC-Unique: okP30ejbNS2fmpU6B4JTCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC88A80B2BB;
 Wed, 10 May 2023 20:36:20 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 345231121314;
 Wed, 10 May 2023 20:36:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: [PATCH 0/8] block: Honour graph read lock even in the main thread
Date: Wed, 10 May 2023 22:35:53 +0200
Message-Id: <20230510203601.418015-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Fiona asked why it's correct that bdrv_graph_co_rd_lock/unlock() do
nothing if qemu_in_main_thread() returns true. As far as I can tell,
it's not correct. The coroutine can yield while it believes to have the
lock, and then the main loop can call some code that takes a write lock
without waiting for the coroutine to finish.

So this series - or more specifically the last patch - fixes this
problem by enabling the locking even in the main thread. The patches
before this are fixes for bugs that we hadn't discovered while they were
only triggered with iothreads, and which are necessary so that all test
cases still pass after the final patch.

Kevin Wolf (8):
  block: Call .bdrv_co_create(_opts) unlocked
  block/export: Fix null pointer dereference in error path
  qcow2: Unlock the graph in qcow2_do_open() where necessary
  qemu-img: Take graph lock more selectively
  test-bdrv-drain: Take graph lock more selectively
  test-bdrv-drain: Call bdrv_co_unref() in coroutine context
  blockjob: Adhere to rate limit even when reentered early
  graph-lock: Honour read locks even in the main thread

 include/block/block-global-state.h |  8 +++---
 include/block/block_int-common.h   |  4 +--
 include/block/blockjob_int.h       | 14 +++++++---
 block.c                            |  1 -
 block/commit.c                     |  7 ++---
 block/create.c                     |  1 -
 block/crypto.c                     | 25 +++++++++--------
 block/export/export.c              |  6 +++--
 block/graph-lock.c                 | 10 -------
 block/mirror.c                     | 23 +++++++---------
 block/parallels.c                  |  6 ++---
 block/qcow.c                       |  6 ++---
 block/qcow2.c                      | 43 +++++++++++++++++++++---------
 block/qed.c                        |  6 ++---
 block/raw-format.c                 |  2 +-
 block/stream.c                     |  7 ++---
 block/vdi.c                        | 11 ++++----
 block/vhdx.c                       |  8 +++---
 block/vmdk.c                       | 27 +++++++++----------
 block/vpc.c                        |  6 ++---
 blockjob.c                         | 22 +++++++++++++--
 qemu-img.c                         |  5 ++--
 tests/unit/test-bdrv-drain.c       |  6 ++---
 23 files changed, 138 insertions(+), 116 deletions(-)

-- 
2.40.1


