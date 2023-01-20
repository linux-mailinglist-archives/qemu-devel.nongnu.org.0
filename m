Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72FE675477
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqTp-0002QM-C6; Fri, 20 Jan 2023 07:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTl-0002QE-VM
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTg-0000GV-C0
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p9wZJWnYZRF20S4RHxuolX1jKANcs+4c3FOVWFGpeyY=;
 b=Ym5llzewT04WXTXRRfBJv51M6iAmjcfNjcqQ0QoZVshahBWsb0apHbMkSDhjdqYnHO/fL3
 aFmFYVGyfOeBktG/p79BzyEJQCwBdPWMBQNqfFketNE4IYam6xVpcvdkxTBF1kZk3v59eK
 PoGdPgg/6WbYAyUIgWMi+hkLczWhMz0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-hZmZey9FMEuz4_jNPu8F0g-1; Fri, 20 Jan 2023 07:26:38 -0500
X-MC-Unique: hZmZey9FMEuz4_jNPu8F0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E4C1C189A9;
 Fri, 20 Jan 2023 12:26:38 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4982F40C6EC4;
 Fri, 20 Jan 2023 12:26:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/38] Block layer patches
Date: Fri, 20 Jan 2023 13:25:55 +0100
Message-Id: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit 239b8b0699a222fd21da1c5fdeba0a2456085a47:

  Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-01-19 15:05:29 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 4711b0a8490827c332b3f9281f689ce9555b7fab:

  qemu-img: Change info key names for protocol nodes (2023-01-20 13:11:01 +0100)

----------------------------------------------------------------
Block layer patches

- qemu-img info: Show protocol-level information
- Move more functions to coroutines
- Make coroutine annotations ready for static analysis
- qemu-img: Fix exit code for errors closing the image
- qcow2 bitmaps: Fix theoretical corruption in error path
- pflash: Only load non-zero parts of backend image to save memory
- Code cleanup and test case improvements

----------------------------------------------------------------
Alberto Faria (2):
      coroutine: annotate coroutine_fn for libclang
      block: Add no_coroutine_fn and coroutine_mixed_fn marker

Emanuele Giuseppe Esposito (14):
      block-coroutine-wrapper: support void functions
      block: Convert bdrv_io_plug() to co_wrapper
      block: Convert bdrv_io_unplug() to co_wrapper
      block: Convert bdrv_is_inserted() to co_wrapper
      block: Rename refresh_total_sectors to bdrv_refresh_total_sectors
      block: Convert bdrv_refresh_total_sectors() to co_wrapper_mixed
      block-backend: use bdrv_getlength instead of blk_getlength
      block: use bdrv_co_refresh_total_sectors when possible
      block: Convert bdrv_get_allocated_file_size() to co_wrapper
      block: Convert bdrv_get_info() to co_wrapper_mixed
      block: Convert bdrv_eject() to co_wrapper
      block: Convert bdrv_lock_medium() to co_wrapper
      block: Convert bdrv_debug_event() to co_wrapper_mixed
      block: Rename bdrv_load/save_vmstate() to bdrv_co_load/save_vmstate()

Hanna Reitz (12):
      block: Improve empty format-specific info dump
      block/file: Add file-specific image info
      block/vmdk: Change extent info type
      block: Split BlockNodeInfo off of ImageInfo
      qemu-img: Use BlockNodeInfo
      block/qapi: Let bdrv_query_image_info() recurse
      block/qapi: Introduce BlockGraphInfo
      block/qapi: Add indentation to bdrv_node_info_dump()
      iotests: Filter child node information
      iotests/106, 214, 308: Read only one size line
      qemu-img: Let info print block graph
      qemu-img: Change info key names for protocol nodes

Kevin Wolf (4):
      qcow2: Fix theoretical corruption in store_bitmap() error path
      qemu-img commit: Report errors while closing the image
      qemu-img bitmap: Report errors while closing the image
      qemu-iotests: Test qemu-img bitmap/commit exit code on error

Paolo Bonzini (2):
      qemu-io: do not reinvent the blk_pwrite_zeroes wheel
      block: remove bdrv_coroutine_enter

Philippe Mathieu-Daudé (1):
      block/nbd: Add missing <qemu/bswap.h> include

Thomas Huth (2):
      tests/qemu-iotests/312: Mark "quorum" as required driver
      tests/qemu-iotests/262: Check for availability of "blkverify" first

Xiang Zheng (1):
      pflash: Only read non-zero parts of backend image

 qapi/block-core.json                               | 123 +++++++-
 include/block/block-common.h                       |  11 +-
 include/block/block-io.h                           |  41 ++-
 include/block/block_int-common.h                   |  26 +-
 include/block/block_int-io.h                       |   5 +-
 include/block/nbd.h                                |   1 +
 include/block/qapi.h                               |  14 +-
 include/qemu/coroutine.h                           |  43 +++
 include/sysemu/block-backend-io.h                  |  31 +-
 block.c                                            |  88 +++---
 block/blkdebug.c                                   |  11 +-
 block/blkio.c                                      |  15 +-
 block/blklogwrites.c                               |   6 +-
 block/blkreplay.c                                  |   6 +-
 block/blkverify.c                                  |   6 +-
 block/block-backend.c                              |  38 +--
 block/commit.c                                     |   4 +-
 block/copy-on-read.c                               |  18 +-
 block/crypto.c                                     |  14 +-
 block/curl.c                                       |  10 +-
 block/file-posix.c                                 | 137 +++++----
 block/file-win32.c                                 |  18 +-
 block/filter-compress.c                            |  20 +-
 block/gluster.c                                    |  23 +-
 block/io.c                                         |  76 ++---
 block/iscsi.c                                      |  17 +-
 block/mirror.c                                     |   6 +-
 block/monitor/block-hmp-cmds.c                     |   2 +-
 block/nbd.c                                        |   8 +-
 block/nfs.c                                        |   4 +-
 block/null.c                                       |  13 +-
 block/nvme.c                                       |  14 +-
 block/preallocate.c                                |  16 +-
 block/qapi.c                                       | 317 ++++++++++++++++-----
 block/qcow.c                                       |   5 +-
 block/qcow2-bitmap.c                               |   5 +-
 block/qcow2-refcount.c                             |   2 +-
 block/qcow2.c                                      |  17 +-
 block/qed.c                                        |  11 +-
 block/quorum.c                                     |   8 +-
 block/raw-format.c                                 |  25 +-
 block/rbd.c                                        |   9 +-
 block/replication.c                                |   6 +-
 block/ssh.c                                        |   4 +-
 block/throttle.c                                   |   6 +-
 block/vdi.c                                        |   7 +-
 block/vhdx.c                                       |   5 +-
 block/vmdk.c                                       |  22 +-
 block/vpc.c                                        |   5 +-
 blockdev.c                                         |   8 +-
 hw/block/block.c                                   |  36 ++-
 hw/scsi/scsi-disk.c                                |   5 +
 qemu-img.c                                         | 100 +++++--
 qemu-io-cmds.c                                     |  62 +---
 tests/unit/test-block-iothread.c                   |   3 +
 scripts/block-coroutine-wrapper.py                 |  20 +-
 tests/qemu-iotests/iotests.py                      |  18 +-
 block/meson.build                                  |   1 +
 tests/qemu-iotests/065                             |   2 +-
 tests/qemu-iotests/106                             |   4 +-
 tests/qemu-iotests/214                             |   6 +-
 tests/qemu-iotests/262                             |   3 +-
 tests/qemu-iotests/302.out                         |   5 +
 tests/qemu-iotests/308                             |   4 +-
 tests/qemu-iotests/312                             |   1 +
 tests/qemu-iotests/common.filter                   |  22 +-
 tests/qemu-iotests/common.rc                       |  22 +-
 tests/qemu-iotests/tests/qemu-img-close-errors     |  95 ++++++
 tests/qemu-iotests/tests/qemu-img-close-errors.out |  23 ++
 69 files changed, 1207 insertions(+), 552 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-close-errors
 create mode 100644 tests/qemu-iotests/tests/qemu-img-close-errors.out


