Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2516DDED4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:04:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWU-0003Pq-VN; Tue, 11 Apr 2023 11:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWA-00037v-9O
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFVt-00025y-L3
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UwUUNE1K0QDKWmfPbUrzHNLjkKBSH4tCGMDHeCw08Os=;
 b=GTmUEw3BjgZjWx1P7I9LWMqyvw3Hp+9lATyV3KKz3WBMNrATGyW3LpBNBOMvb8Y7uS4zCU
 ekpSKcLq+fvkfy3dTNqFlQL+cAJ6DGLWWMi2fRr1Kk+327LxPlTo36m8Sb1bSlTlD56hG/
 pvRWwy+UF3hOumkrQWe7xCV1pkUZ7zE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-EG68D4fSPTOmHaeq9PfRfQ-1; Tue, 11 Apr 2023 11:02:04 -0400
X-MC-Unique: EG68D4fSPTOmHaeq9PfRfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 034EE85C1B8;
 Tue, 11 Apr 2023 15:02:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC2640BC799;
 Tue, 11 Apr 2023 15:02:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/10] Block layer fixes for 8.0-rc4
Date: Tue, 11 Apr 2023 17:01:37 +0200
Message-Id: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

At the first sight, this one probably looks huge for -rc4. But it's
mainly because Paolo split his fix into many very small patches. As you
can see in the diffstat below, it's not all that bad (and half of the
insertions there are for a new test case for the VHDX corruption bug).

The following changes since commit dda860b9c031d6a2768f75e5e622545d41d4b688:

  Merge tag 'pull-tcg-20230410' of https://gitlab.com/rth7680/qemu into staging (2023-04-10 19:46:09 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 81f730d4d0e8af9c0211c3fedf406df0046341a9:

  block, block-backend: write some hot coroutine wrappers by hand (2023-04-11 16:46:49 +0200)

----------------------------------------------------------------
Block layer patches

- Fix VHDX image corruption bug
- Fix for performance regression: Remove bdrv_co_get_geometry coroutines
  from I/O hot path

----------------------------------------------------------------
Kevin Wolf (1):
      iotests: Regression test for vhdx log corruption

Lukas Tschoke (1):
      block/vhdx: fix dynamic VHDX BAT corruption

Paolo Bonzini (8):
      block: move has_variable_length to BlockLimits
      block: remove has_variable_length from filters
      block: refresh bs->total_sectors on reopen
      block: remove has_variable_length from BlockDriver
      migration/block: replace uses of blk_nb_sectors that do not check result
      block-backend: inline bdrv_co_get_geometry
      block-backend: ignore inserted state in blk_co_nb_sectors
      block, block-backend: write some hot coroutine wrappers by hand

 include/block/block-io.h                         |  5 +-
 include/block/block_int-common.h                 | 10 +++-
 include/sysemu/block-backend-io.h                |  5 +-
 block.c                                          | 35 ++++++++-----
 block/block-backend.c                            | 42 ++++++++++++----
 block/copy-on-read.c                             |  1 -
 block/file-posix.c                               | 12 +++--
 block/file-win32.c                               |  2 +-
 block/filter-compress.c                          |  1 -
 block/io.c                                       |  4 ++
 block/preallocate.c                              |  1 -
 block/raw-format.c                               |  3 +-
 block/replication.c                              |  1 -
 block/vhdx-log.c                                 |  2 +-
 migration/block.c                                |  5 +-
 tests/qemu-iotests/tests/regression-vhdx-log     | 62 ++++++++++++++++++++++++
 tests/qemu-iotests/tests/regression-vhdx-log.out | 14 ++++++
 17 files changed, 162 insertions(+), 43 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/regression-vhdx-log
 create mode 100644 tests/qemu-iotests/tests/regression-vhdx-log.out


