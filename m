Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9C625E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:29:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVwm-00083w-DM; Fri, 11 Nov 2022 10:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwh-000814-Mu
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwf-0000uZ-SK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668180472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=76QDYYCOLMMkXQ3nP6QfeuH5OEm44b4NHn6H2o7kgEY=;
 b=Ds2+aujoUzarxVbs6qGMGzUMBRAKK9da/MByR9DwJRkL8b4DbPMRM9KIijcAmNrr+i92JK
 5ppTCDWT7dE0POXhgukYvxKWSafeTgg7fN2MGSBcOKruuCbPXEV+yEVPnAw5iBG7L2IE3I
 jz81NGSrZJd0cHxVzezdt3yVOf2E8Bk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-vY08ZEDkM4GEOg8eyiGi_A-1; Fri, 11 Nov 2022 10:27:50 -0500
X-MC-Unique: vY08ZEDkM4GEOg8eyiGi_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A7FC1C06EC2;
 Fri, 11 Nov 2022 15:27:50 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2673C15BA8;
 Fri, 11 Nov 2022 15:27:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/11] Block layer patches
Date: Fri, 11 Nov 2022 16:27:33 +0100
Message-Id: <20221111152744.261358-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

The following changes since commit 2ccad61746ca7de5dd3e25146062264387e43bd4:

  Merge tag 'pull-tcg-20221109' of https://gitlab.com/rth7680/qemu into staging (2022-11-09 13:26:45 -0500)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to b04af371af685c12970ea93027dc6d8bf86265aa:

  tests/stream-under-throttle: New test (2022-11-11 13:02:43 +0100)

----------------------------------------------------------------
Block layer patches

- Fix deadlock in graph modification with iothreads
- mirror: Fix non-converging cases for active mirror
- qapi: Fix BlockdevOptionsNvmeIoUring @path description
- blkio: Set BlockDriver::has_variable_length to false

----------------------------------------------------------------
Alberto Faria (2):
      qapi/block-core: Fix BlockdevOptionsNvmeIoUring @path description
      block/blkio: Set BlockDriver::has_variable_length to false

Hanna Reitz (9):
      block/mirror: Do not wait for active writes
      block/mirror: Drop mirror_wait_for_any_operation()
      block/mirror: Fix NULL s->job in active writes
      iotests/151: Test that active mirror progresses
      iotests/151: Test active requests on mirror start
      block: Make bdrv_child_get_parent_aio_context I/O
      block-backend: Update ctx immediately after root
      block: Start/end drain on correct AioContext
      tests/stream-under-throttle: New test

 qapi/block-core.json                               |   2 +-
 include/block/block-global-state.h                 |   1 -
 include/block/block-io.h                           |   2 +
 include/block/block_int-common.h                   |   4 +-
 block.c                                            |   2 +-
 block/blkio.c                                      |   1 -
 block/block-backend.c                              |   9 +-
 block/io.c                                         |   6 +-
 block/mirror.c                                     |  78 ++++---
 blockjob.c                                         |   3 +-
 tests/qemu-iotests/151                             | 227 ++++++++++++++++++++-
 tests/qemu-iotests/151.out                         |   4 +-
 tests/qemu-iotests/tests/stream-under-throttle     | 121 +++++++++++
 tests/qemu-iotests/tests/stream-under-throttle.out |   5 +
 14 files changed, 424 insertions(+), 41 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/stream-under-throttle
 create mode 100644 tests/qemu-iotests/tests/stream-under-throttle.out


