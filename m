Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD315635C0D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:45:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9G-0002bs-R1; Wed, 23 Nov 2022 06:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9E-0002aR-Pz
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9C-0005zv-Ne
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=98ElRFZAkQcrHFduj4EMgnofXQRCKVE2X50AAe45Iv4=;
 b=ia6gUWw5C/FW6fSZ5MRMSwoyowIPEFmVu8vJ5OEdOCvlNe6VgMfABmagnEfucnxQaGKeG/
 Y4qS1kG2Yhk0cuBwzNTA2uhRG63KI0AXDoh374r/lInqVBoWwby0nc3ozar4w/iRS0v+21
 VAmVrwny4OMJsIMS56c4hTtL+iSOxhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-G3l2CZoEMh-T5LGfeopaFg-1; Wed, 23 Nov 2022 06:42:30 -0500
X-MC-Unique: G3l2CZoEMh-T5LGfeopaFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03C90185A78B;
 Wed, 23 Nov 2022 11:42:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B75AC1912A;
 Wed, 23 Nov 2022 11:42:29 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 00/15] Still more coroutine and various fixes in block layer
Date: Wed, 23 Nov 2022 06:42:12 -0500
Message-Id: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
v5:
* add missing reviewed-by from Paolo
* minor indentation fixes
* use when possible _co_, but do not create new g_c_w. It will be done in
  future series
* introduce QEMU_IN_COROUTINE
* reorder patches
* rebase on kevin block branch + v2 from "block: Simplify drain"

v4:
* use v2 commit messages
* introduce generated_co_wrapper_simple to simplify patches

v3:
* Remove patch 1, base on kevin "drain semplification serie"

v2:
* clarified commit message in patches 2/3/6 on why we add coroutine_fn

Emanuele Giuseppe Esposito (15):
  block-io: introduce coroutine_fn duplicates for
    bdrv_common_block_status_above callers
  block-copy: add missing coroutine_fn annotations
  nbd/server.c: add missing coroutine_fn annotations
  block-backend: replace bdrv_*_above with blk_*_above
  block/vmdk: add missing coroutine_fn annotations
  block: avoid duplicating filename string in bdrv_create
  block: introduce QEMU_IN_COROUTINE macro
  block: distinguish between bdrv_create running in coroutine and not
  block: bdrv_create_file is a coroutine_fn
  block-coroutine-wrapper.py: introduce generated_co_wrapper_simple
  block-coroutine-wrapper.py: default to main loop aiocontext if
    function does not have a BlockDriverState parameter
  block-coroutine-wrapper.py: default to main loop aiocontext if
    function does not have a BlockDriverState parameter
  block-coroutine-wrapper.py: support also basic return types
  block: convert bdrv_create to generated_co_wrapper_simple
  block/dirty-bitmap: convert coroutine-only functions to
    generated_co_wrapper_simple

 block.c                            |  66 ++++------------
 block/block-backend.c              |  21 +++++
 block/block-copy.c                 |  21 ++---
 block/block-gen.h                  |  11 +--
 block/commit.c                     |   4 +-
 block/crypto.c                     |   2 +-
 block/dirty-bitmap.c               |  88 +--------------------
 block/io.c                         |  64 +++++++++++++++-
 block/meson.build                  |   1 +
 block/parallels.c                  |   2 +-
 block/qcow.c                       |   2 +-
 block/qcow2.c                      |   4 +-
 block/qed.c                        |   2 +-
 block/raw-format.c                 |   2 +-
 block/vdi.c                        |   2 +-
 block/vhdx.c                       |   2 +-
 block/vmdk.c                       |  38 +++++-----
 block/vpc.c                        |   2 +-
 include/block/block-common.h       |  17 ++++-
 include/block/block-copy.h         |   5 +-
 include/block/block-global-state.h |  13 +++-
 include/block/block-io.h           |  24 +++++-
 include/block/dirty-bitmap.h       |  10 ++-
 include/sysemu/block-backend-io.h  |   9 +++
 nbd/server.c                       |  47 ++++++------
 scripts/block-coroutine-wrapper.py | 118 ++++++++++++++++++++---------
 26 files changed, 322 insertions(+), 255 deletions(-)

-- 
2.31.1


