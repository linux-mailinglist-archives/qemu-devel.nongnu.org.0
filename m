Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA73B86E7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:13:42 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycqL-0005Fm-8p
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfK-0002Mu-Rn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfH-0006sa-4d
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BVULIhW6+FG+rNm6Acl7w0S5KNlk/rMMJWIf4mI3z0w=;
 b=O78Gjg5EgbvrxGCa99uEc8SxjOGyO8NphAsMyReaoNvI4Du042z/qIZRX9CuqZxkB85jzF
 mOvuMsXNQHV5pUBe8aJbkw+9+ELjhpQ0WcJVV6OEYIabfIUFUk04wW/USF2DKGs5F0zcAN
 hqpKfew6YPwaonDEYJTdIT3Dyf3mgT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-fFh354s_N3y1_wOmKCjttQ-1; Wed, 30 Jun 2021 12:02:12 -0400
X-MC-Unique: fFh354s_N3y1_wOmKCjttQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DD81835AC8;
 Wed, 30 Jun 2021 16:02:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB03604CD;
 Wed, 30 Jun 2021 16:02:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/24] Block layer patches
Date: Wed, 30 Jun 2021 18:01:42 +0200
Message-Id: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6e7:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628' into staging (2021-06-29 10:02:42 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to a527e312b59ac382cb84af4b91f517a846f50705:

  vhost-user-blk: Implement reconnection during realize (2021-06-30 13:21:22 +0200)

----------------------------------------------------------------
Block layer patches

- Supporting changing 'file' in x-blockdev-reopen
- ssh: add support for sha256 host key fingerprints
- vhost-user-blk: Implement reconnection during realize
- introduce QEMU_AUTO_VFREE
- Don't require password of encrypted backing file for image creation
- Code cleanups

----------------------------------------------------------------
Alberto Garcia (2):
      block: Allow changing bs->file on reopen
      iotests: Test replacing files with x-blockdev-reopen

Daniel P. Berrangé (1):
      block/ssh: add support for sha256 host key fingerprints

Eric Blake (1):
      block: Move read-only check during truncation earlier

Kevin Wolf (7):
      vhost: Add Error parameter to vhost_dev_init()
      vhost: Distinguish errors in vhost_backend_init()
      vhost: Return 0/-errno in vhost_dev_init()
      vhost-user-blk: Add Error parameter to vhost_user_blk_start()
      vhost: Distinguish errors in vhost_dev_get_config()
      vhost-user-blk: Factor out vhost_user_blk_realize_connect()
      vhost-user-blk: Implement reconnection during realize

Max Reitz (1):
      block: BDRV_O_NO_IO for backing file on creation

Miroslav Rezanina (1):
      Prevent compiler warning on block.c

Vladimir Sementsov-Ogievskiy (11):
      block: rename bdrv_replace_child to bdrv_replace_child_tran
      block: comment graph-modifying function not updating permissions
      block: introduce bdrv_remove_file_or_backing_child()
      block: introduce bdrv_set_file_or_backing_noperm()
      block: bdrv_reopen_parse_backing(): don't check aio context
      block: bdrv_reopen_parse_backing(): don't check frozen child
      block: bdrv_reopen_parse_backing(): simplify handling implicit filters
      block: move supports_backing check to bdrv_set_file_or_backing_noperm()
      block: BDRVReopenState: drop replace_backing_bs field
      introduce QEMU_AUTO_VFREE
      block/commit: use QEMU_AUTO_VFREE

 qapi/block-core.json              |   3 +-
 include/block/block.h             |   2 +-
 include/hw/virtio/vhost-backend.h |   5 +-
 include/hw/virtio/vhost.h         |   6 +-
 include/qemu/osdep.h              |  15 ++
 backends/cryptodev-vhost.c        |   5 +-
 backends/vhost-user.c             |   4 +-
 block.c                           | 314 +++++++++++++++++++++-----------------
 block/commit.c                    |  25 ++-
 block/io.c                        |  10 +-
 block/ssh.c                       |   3 +
 hw/block/vhost-user-blk.c         | 102 ++++++++-----
 hw/display/vhost-user-gpu.c       |   6 +-
 hw/input/vhost-user-input.c       |   6 +-
 hw/net/vhost_net.c                |   8 +-
 hw/scsi/vhost-scsi.c              |   4 +-
 hw/scsi/vhost-user-scsi.c         |   4 +-
 hw/virtio/vhost-backend.c         |   6 +-
 hw/virtio/vhost-user-fs.c         |   3 +-
 hw/virtio/vhost-user-vsock.c      |  12 +-
 hw/virtio/vhost-user.c            |  71 +++++----
 hw/virtio/vhost-vdpa.c            |   8 +-
 hw/virtio/vhost-vsock.c           |   3 +-
 hw/virtio/vhost.c                 |  41 +++--
 tests/unit/test-bdrv-drain.c      |   1 +
 tests/unit/test-bdrv-graph-mod.c  |   1 +
 tests/qemu-iotests/189            |   2 +-
 tests/qemu-iotests/198            |   2 +-
 tests/qemu-iotests/207            |  54 +++++++
 tests/qemu-iotests/207.out        |  25 +++
 tests/qemu-iotests/245            | 140 +++++++++++++++--
 tests/qemu-iotests/245.out        |  11 +-
 32 files changed, 599 insertions(+), 303 deletions(-)


