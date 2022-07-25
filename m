Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D257FEF6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:25:36 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFx9T-000882-71
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5W-0002XL-Q0
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5T-00061P-LZ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IIHafwP56FxGuxQQljTgUxqnu5zBXa7wmJIETk6M1EQ=;
 b=BwgT27+GM/flfTkMmiHUyOBWioFOGRVaBsAXiXZn5G4RRRfthOo0B+366/WgEajkjrP31Y
 IajZpczt7CkUp4z55ppxr5MJeYlIughkYp9tefWkqOUreY9rlasIrZvtVDBgGC+GoURBBc
 Rvi7NzCHGFf4AXIceerOe5k+5jnD7Bc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-ZK7I7ECNP6uVmMke-cg6og-1; Mon, 25 Jul 2022 08:21:24 -0400
X-MC-Unique: ZK7I7ECNP6uVmMke-cg6og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C563A83DDE7;
 Mon, 25 Jul 2022 12:21:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70F3694580;
 Mon, 25 Jul 2022 12:21:22 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using transactions
Date: Mon, 25 Jul 2022 08:21:09 -0400
Message-Id: <20220725122120.309236-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aim of this series is to reorganize bdrv_try_set_aio_context
and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
favour of a new one, ->change_aio_ctx.

More informations in patch 3 (which is also RFC, due to the doubts
I have with AioContext locks).

Patch 1 just add assertions in the code, 2 extends the transactions API to be able to add also transactions in the tail
of the list.
Patch 3 is the core of this series, and introduces the new callback.
It is marked as RFC and the reason is explained in the commit message.
Patches 4-5-6 implement ->change_aio_ctx in the various block, blockjob
and block-backend BDSes.
Patch 7 substitutes ->change_aio_ctx with the old callbacks, and
patch 8 takes care of deleting the old callbacks and unused code.

This series is based on "job: replace AioContext lock with job_mutex",
but just because it uses job_set_aio_context() introduced there.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Based-on: <20220706201533.289775-1-eesposit@redhat.com>
---
v2:
* remove transaction patch, and drain transactions
* re-add old AioContext lock/unlock, since it makes sense to have it
* typos in commit message
* various cleanups in block-backend callbacks
* use hash map instead of glist when marking visited nodes
* 2 more additional patches, getting rid of
  bdrv_try_set_aio_context and bdrv_child_try_change_aio_context

Emanuele Giuseppe Esposito (11):
  block.c: assert bs->aio_context is written under BQL and drains
  block: use transactions as a replacement of ->{can_}set_aio_context()
  bdrv_change_aio_context: use hash table instead of list of visited
    nodes
  bdrv_child_try_change_aio_context: add transaction parameter
  blockjob: implement .change_aio_ctx in child_job
  block: implement .change_aio_ctx in child_of_bds
  block-backend: implement .change_aio_ctx in child_root
  block: use the new _change_ API instead of _can_set_ and _set_
  block: remove all unused ->can_set_aio_ctx and ->set_aio_ctx callbacks
  block: rename bdrv_child_try_change_aio_context in
    bdrv_try_change_aio_context
  block: remove bdrv_try_set_aio_context and replace it with
    bdrv_try_change_aio_context

 block.c                            | 360 ++++++++++++++++-------------
 block/block-backend.c              |  74 +++---
 block/export/export.c              |   2 +-
 blockdev.c                         |  22 +-
 blockjob.c                         |  50 ++--
 docs/devel/multiple-iothreads.txt  |   4 +-
 include/block/block-global-state.h |  18 +-
 include/block/block_int-common.h   |   6 +-
 job.c                              |   2 +-
 tests/unit/test-bdrv-drain.c       |   6 +-
 tests/unit/test-block-iothread.c   |  10 +-
 11 files changed, 310 insertions(+), 244 deletions(-)

-- 
2.31.1


