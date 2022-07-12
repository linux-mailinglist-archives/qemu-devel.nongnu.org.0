Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611CD572873
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:21:42 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNK9-0006N1-Gn
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHv-0001kQ-QC
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHs-0002Gw-DQ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657660759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u90XkMy2654KbDA+73whdaGWie7tU/llxaTs/An0mnM=;
 b=XI/bEgOxZeDqs31kHoAos6vjoM05WJDusln2TH9UEJVjoenMW+JXnC1K1lXjp3iVVGrsot
 7YWmp8oLlj6+KaqvcVXDC3mr3IWK/mnp4GjBuAh3ymfXZStMpx2XMgLfw5MId8hXyOccQt
 TEnSjCWnNtqn2C/kF5TqL/cqfcdrYxY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-z7b5_lmLNXuaPXona108UA-1; Tue, 12 Jul 2022 17:19:16 -0400
X-MC-Unique: z7b5_lmLNXuaPXona108UA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BF6485A581;
 Tue, 12 Jul 2022 21:19:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9951C2166B26;
 Tue, 12 Jul 2022 21:19:14 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 0/8] Refactor bdrv_try_set_aio_context using transactions
Date: Tue, 12 Jul 2022 17:19:03 -0400
Message-Id: <20220712211911.1302836-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Emanuele Giuseppe Esposito (8):
  block.c: assert bs->aio_context is written under BQL and drains
  transactions: add tran_add_back
  RFC: block: use transactions as a replacement of
    ->{can_}set_aio_context()
  blockjob: implement .change_aio_ctx in child_job
  block: implement .change_aio_ctx in child_of_bds
  block-backend: implement .change_aio_ctx in child_root
  block: use the new _change_ API instead of _can_set_ and _set_
  block: remove all unused ->can_set_aio_ctx and ->set_aio_ctx callbacks

 block.c                            | 288 +++++++++++++++--------------
 block/block-backend.c              |  65 +++++--
 blockjob.c                         |  50 +++--
 include/block/block-global-state.h |  16 +-
 include/block/block_int-common.h   |   5 +-
 include/qemu/transactions.h        |   9 +
 util/transactions.c                |  29 ++-
 7 files changed, 266 insertions(+), 196 deletions(-)

-- 
2.31.1


