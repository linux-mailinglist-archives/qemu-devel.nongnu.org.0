Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4C638B65
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYry-0006cS-3R; Fri, 25 Nov 2022 08:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrd-0006S0-OR
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oyYrX-0005Ce-Lu
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669383326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aj/WsYu5q6yuwSvYVpy5NaEMdWEp83CUrnBabSw2eSc=;
 b=VA3aJ6tnYZKSbV5KFQS08dhM64Wsk5CFUj9wnu6chg/+oVnVt4srwdiOI7JXFtW/xDRLo8
 LcUa1zztkeYt5hERjEmHlWmJb1xkbtbHCe/z3cizHZGhifiTIgc23hVym2kXh25AFCpCoy
 MNbZ5SFXf9+vcmVyBFcvkLLdVB0Nb4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-UKSU1_88OYizCXN0E3ekDQ-1; Fri, 25 Nov 2022 08:35:23 -0500
X-MC-Unique: UKSU1_88OYizCXN0E3ekDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73B688027F5;
 Fri, 25 Nov 2022 13:35:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5F02166B46;
 Fri, 25 Nov 2022 13:35:20 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v6 00/14] Still more coroutine and various fixes in block layer
Date: Fri, 25 Nov 2022 08:35:04 -0500
Message-Id: <20221125133518.418328-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
v6:
* use different naming for block-coroutine-wrapper annotations
* fix minor typos and patch odering

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
* introduce coroutine_wrapper to simplify patches

v3:
* Remove patch 1, base on kevin "drain semplification serie"

v2:
* clarified commit message in patches 2/3/6 on why we add coroutine_fn

Emanuele Giuseppe Esposito (14):
  block-io: introduce coroutine_fn duplicates for
    bdrv_common_block_status_above callers
  block-copy: add missing coroutine_fn annotations
  nbd/server.c: add missing coroutine_fn annotations
  block-backend: replace bdrv_*_above with blk_*_above
  block/vmdk: add missing coroutine_fn annotations
  block: avoid duplicating filename string in bdrv_create
  block: distinguish between bdrv_create running in coroutine and not
  block: bdrv_create_file is a coroutine_fn
  block: rename generated_co_wrapper in co_wrapper_mixed
  block-coroutine-wrapper.py: introduce co_wrapper
  block-coroutine-wrapper.py: default to main loop aiocontext if
    function does not have a BlockDriverState parameter
  block-coroutine-wrapper.py: support also basic return types
  block: convert bdrv_create to co_wrapper
  block/dirty-bitmap: convert coroutine-only functions to co_wrapper

 block.c                                |  65 +++----------
 block/block-backend.c                  |  21 +++++
 block/block-copy.c                     |  21 +++--
 block/block-gen.h                      |  11 +--
 block/commit.c                         |   4 +-
 block/coroutines.h                     |   4 +-
 block/crypto.c                         |   2 +-
 block/dirty-bitmap.c                   |  88 +-----------------
 block/io.c                             |  58 +++++++++++-
 block/meson.build                      |   1 +
 block/parallels.c                      |   2 +-
 block/qcow.c                           |   2 +-
 block/qcow2.c                          |   4 +-
 block/qed.c                            |   2 +-
 block/raw-format.c                     |   2 +-
 block/vdi.c                            |   2 +-
 block/vhdx.c                           |   2 +-
 block/vmdk.c                           |  38 ++++----
 block/vpc.c                            |   2 +-
 docs/devel/block-coroutine-wrapper.rst |   6 +-
 include/block/block-common.h           |  20 ++--
 include/block/block-copy.h             |   5 +-
 include/block/block-global-state.h     |  11 ++-
 include/block/block-io.h               |  69 +++++++++-----
 include/block/dirty-bitmap.h           |  10 +-
 include/sysemu/block-backend-io.h      |  77 +++++++++-------
 nbd/server.c                           |  47 +++++-----
 scripts/block-coroutine-wrapper.py     | 122 +++++++++++++++++--------
 28 files changed, 376 insertions(+), 322 deletions(-)

-- 
2.31.1


