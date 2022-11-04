Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69656193FE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtSX-0005sT-2p; Fri, 04 Nov 2022 05:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRn-0005Zk-Fb
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRj-0000Hp-TF
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JqblM9AVjisqfNOcNXk1wtsJQ8lIYFV/ZOxqb/qa4/k=;
 b=DZXEo9eHaa9ypz4GHbryZ0rEkYt5HVbs+n+y/cetADqgMslcZKfUSzKuc7yGJw8MalBm/0
 tbtu9l2/ed7yGnH5hqyhbrlHPO5p2GhNpuXxz5JARGpkJQpPeg2FLcim+VsY+zZAApZoZq
 wcSv4OYqOioDrUDGZWM3kl8/z+jAfck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-5andKCDoOImAWRJdx2bPUw-1; Fri, 04 Nov 2022 05:57:03 -0400
X-MC-Unique: 5andKCDoOImAWRJdx2bPUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87FAD811E7A;
 Fri,  4 Nov 2022 09:57:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28B4240C835A;
 Fri,  4 Nov 2022 09:57:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 0/9] Still more coroutine and various fixes in block layer
Date: Fri,  4 Nov 2022 05:56:51 -0400
Message-Id: <20221104095700.4117433-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
---
v2:
* clarified commit message in patches 2/3/6 on why we add coroutine_fn

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

 block.c                            | 111 +++++++++++++++++------------
 block/block-backend.c              |  21 ++++++
 block/block-copy.c                 |  15 ++--
 block/commit.c                     |   4 +-
 block/dirty-bitmap.c               |  66 ++++++++---------
 block/vmdk.c                       |  36 +++++-----
 include/block/block-global-state.h |   3 +-
 include/sysemu/block-backend-io.h  |   9 +++
 nbd/server.c                       |  43 +++++------
 qemu-img.c                         |   4 +-
 10 files changed, 182 insertions(+), 130 deletions(-)

-- 
2.31.1


