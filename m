Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74188617E41
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaUV-0001Vc-Tn; Thu, 03 Nov 2022 09:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaUE-0001NM-Tc
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaU0-0002A4-IR
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667482930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AS05YqWrjZaKDkvXJScZZt77VWD6WNm7EubgDYKOgfA=;
 b=hUhkDs7XKYIfeFnrnVETcQY2pY78kkTr6PxsirYVzbYqyxGj6iATOqTbDN07sq4EzLZkMk
 WZSoTH4VvEwjnhVgH801uPkezGp4J9cxfh+q0IEkZs/wl+wzTRypZme4p6+Z/cfstiohNH
 25p6vWUwwJsc4aYInYEAExN6sFFKBhY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-DVSC_iB5PpuKGNtAy4TvjA-1; Thu, 03 Nov 2022 09:42:09 -0400
X-MC-Unique: DVSC_iB5PpuKGNtAy4TvjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70CE811E81;
 Thu,  3 Nov 2022 13:42:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 567A640C6EC3;
 Thu,  3 Nov 2022 13:42:08 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/9] Still more coroutine and various fixes in block layer
Date: Thu,  3 Nov 2022 09:41:57 -0400
Message-Id: <20221103134206.4041928-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a dump of all minor coroutine-related fixes found while looking
around and testing various things in the QEMU block layer.

Patches aim to:
- add missing coroutine_fn annotation to the functions
- simplify to avoid the typical "if in coroutine: fn()
  // else create_coroutine(fn)" already present in generated_co_wraper
  functions.
- make sure that if a BlockDriver callback is defined as coroutine_fn, then
  it is always running in a coroutine.

Emanuele

Emanuele Giuseppe Esposito (9):
  block: call bdrv_co_drain_begin in a coroutine
  block-copy: add missing coroutine_fn annotations
  nbd/server.c: add missing coroutine_fn annotations
  block-backend: replace bdrv_*_above with blk_*_above
  block: distinguish between bdrv_create running in coroutine and not
  block/vmdk: add missing coroutine_fn annotations
  block: bdrv_create_file is a coroutine_fn
  block: bdrv_create is never called in non-coroutine context
  block/dirty-bitmap: remove unnecessary qemu_in_coroutine() case

 block.c                            | 107 +++++++++++++++++------------
 block/block-backend.c              |  21 ++++++
 block/block-copy.c                 |  15 ++--
 block/commit.c                     |   4 +-
 block/dirty-bitmap.c               |  66 ++++++++----------
 block/vmdk.c                       |  36 +++++-----
 include/block/block-global-state.h |   3 +-
 include/sysemu/block-backend-io.h  |   9 +++
 nbd/server.c                       |  43 ++++++------
 qemu-img.c                         |   4 +-
 10 files changed, 178 insertions(+), 130 deletions(-)

-- 
2.31.1


