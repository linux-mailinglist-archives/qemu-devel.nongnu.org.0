Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B76367D30B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5zc-0005Yq-C1; Thu, 26 Jan 2023 12:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5za-0005Y8-4n
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:24:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zY-0005ZB-Az
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674753890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tn37tfIIvwZx1z4fPEiMO1TtcNejkt7e4PT41wY/LMo=;
 b=c5FL4In+1M5AsM+ILt5qadAojb1Nq0M8CHVnGkclhwiW42vBc0k7NOtdqMqDUlcTBKOFei
 EOL5MJ1geQZ3oOfhQOao2SEVpSlgRe4BqIqBbwhJvkO7iKJ+lhIRw4GZo4YkkmGK8MS/NO
 FBjVYHQoTFxksPmXqokXi89+i4EsevU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Kyi0l_yoMZmh0ooOO4HX1A-1; Thu, 26 Jan 2023 12:24:48 -0500
X-MC-Unique: Kyi0l_yoMZmh0ooOO4HX1A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C5ED183B3CF;
 Thu, 26 Jan 2023 17:24:48 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 953A1492C14;
 Thu, 26 Jan 2023 17:24:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 00/13] block: Fix bdrv_open*() calls from coroutine context
Date: Thu, 26 Jan 2023 18:24:19 +0100
Message-Id: <20230126172432.436111-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

bdrv_open*() must not be called from coroutine context, amongst others
because it modifies the block graph. However, some functions - in
particular all .bdrv_co_create* implementations of image formats - do
call it from coroutine context. This is already wrong today, but when we
add locking, it actually becomes visible.

This series adds no_co_wrapper functions, which are automatically
generated wrappers that run in coroutine context and use a BH to call
the wrapped function outside of coroutine context. It then uses these
wrappers to fix the problematic bdrv_open*() calls.

Kevin Wolf (13):
  block-coroutine-wrapper: Introduce no_co_wrapper
  block: Create no_co_wrappers for open functions
  luks: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  parallels: Fix .bdrv_co_create(_opts) to open images with
    no_co_wrapper
  qcow: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  qcow2: Fix open/create to open images with no_co_wrapper
  qed: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  vdi: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  vhdx: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  vmdk: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  vpc: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
  block: Fix bdrv_co_create_opts_simple() to open images with
    no_co_wrapper
  block: Assert non-coroutine context for bdrv_open_inherit()

 include/block/block-common.h                | 14 ++++
 include/block/block-global-state.h          | 35 ++++++---
 include/sysemu/block-backend-global-state.h | 21 +++++-
 block.c                                     | 17 ++---
 block/crypto.c                              | 10 +--
 block/parallels.c                           | 10 +--
 block/qcow.c                                | 10 +--
 block/qcow2.c                               | 43 +++++------
 block/qed.c                                 | 10 +--
 block/vdi.c                                 | 10 +--
 block/vhdx.c                                | 10 +--
 block/vmdk.c                                | 22 +++---
 block/vpc.c                                 | 10 +--
 scripts/block-coroutine-wrapper.py          | 83 ++++++++++++++++++---
 block/meson.build                           |  1 +
 15 files changed, 207 insertions(+), 99 deletions(-)

-- 
2.38.1


