Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06B62BDDC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRN-0000cb-E4; Wed, 16 Nov 2022 07:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRI-0000bn-IS
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRG-0000tb-H6
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rmjSzupkE7i6rvBsi6DjrLbE1CihybD2ADTEocZK2vc=;
 b=DJswy+A40biFxpTzsqXOqydx2So14yUEQZE23sz+u8UN9SQEpMoxo30NiF8Z8kZxsVWZzK
 9REkfjQTiJgeDA2zVLZ2mjnxiMitY6g2BMBt73JhOyu8V5lUZ1Hg2jxvLlOrP4c5D0lQ2S
 jc7RMQ2Q0fEkA2jOXFwp+Ymglu3hrBM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-iI875a58OqCis5TQPdYCNQ-1; Wed, 16 Nov 2022 07:22:44 -0500
X-MC-Unique: iI875a58OqCis5TQPdYCNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E039B3C10224;
 Wed, 16 Nov 2022 12:22:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 815DC39D6A;
 Wed, 16 Nov 2022 12:22:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 00/11] Still more coroutine and various fixes in block layer
Date: Wed, 16 Nov 2022 07:22:30 -0500
Message-Id: <20221116122241.2856527-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

This is a dump of all minor coroutine-related fixes found while looking
around and testing various things in the QEMU block layer.

Patches aim to:
- add missing coroutine_fn annotation to the functions
- simplify to avoid the typical "if in coroutine: fn()
  // else create_coroutine(fn)" already present in generated_co_wraper
  functions.
- make sure that if a BlockDriver callback is defined as coroutine_fn, then
  it is always running in a coroutine.

This serie is based on Kevin Wolf's series "block: Simplify drain".

Based-on: <20221108123738.530873-1-kwolf@redhat.com>

Emanuele
---
v4:
* use v2 commit messages
* introduce generated_co_wrapper_simple to simplify patches

v3:
* Remove patch 1, base on kevin "drain semplification serie"

v2:
* clarified commit message in patches 2/3/6 on why we add coroutine_fn

Emanuele Giuseppe Esposito (11):
  block-copy: add missing coroutine_fn annotations
  nbd/server.c: add missing coroutine_fn annotations
  block-backend: replace bdrv_*_above with blk_*_above
  block-coroutine-wrapper.py: introduce generated_co_wrapper_simple
  block-coroutine-wrapper.py: default to main loop aiocontext if
    function does not have a BlockDriverState parameter
  block-coroutine-wrapper.py: support also basic return types
  block/vmdk: add missing coroutine_fn annotations
  block: distinguish between bdrv_create running in coroutine and not
  block: bdrv_create_file is a coroutine_fn
  block: convert bdrv_create to generated_co_wrapper_simple
  block/dirty-bitmap: convert coroutine-only functions to
    generated_co_wrapper_simple

 block.c                            |  68 +++++--------------
 block/block-backend.c              |  21 ++++++
 block/block-copy.c                 |  15 +++--
 block/block-gen.h                  |   5 +-
 block/commit.c                     |   4 +-
 block/dirty-bitmap.c               |  88 +------------------------
 block/meson.build                  |   1 +
 block/vmdk.c                       |  36 +++++-----
 include/block/block-common.h       |   6 +-
 include/block/block-global-state.h |  13 +++-
 include/block/block-io.h           |   9 ++-
 include/block/dirty-bitmap.h       |  10 ++-
 include/sysemu/block-backend-io.h  |   9 +++
 nbd/server.c                       |  43 ++++++------
 qemu-img.c                         |   4 +-
 scripts/block-coroutine-wrapper.py | 102 +++++++++++++++++++++--------
 16 files changed, 209 insertions(+), 225 deletions(-)

-- 
2.31.1


