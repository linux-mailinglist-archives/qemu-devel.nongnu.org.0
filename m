Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4776F3314E4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:31:08 +0100 (CET)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJil-0002lS-8F
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJHV-0001hd-W9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:02:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJHP-0002Nq-Rh
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=salCxA5Jp2Nwsw9YXudIEskiCBUnO4f7kTijRDE2ONA=;
 b=bWCvRAMjSCXaf8HZz4g9LqcdqG8lMTrXCqL1ZNFsvAItuOk9kZwXUIg3LjW8PbTMkxOnYi
 D+mv5LQlcnxH91Knwt2H6ZCRJy7L7wYluH6jUCscHdKaR725Y60S0bh+kD5Ohs6EsUcfpl
 53ILizelkqQ91vm1CNUU1OdCA04ekWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-9HuS5WiGO4KSbnmXlvEC6g-1; Mon, 08 Mar 2021 12:02:45 -0500
X-MC-Unique: 9HuS5WiGO4KSbnmXlvEC6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC29801FAF;
 Mon,  8 Mar 2021 17:02:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 506861A884;
 Mon,  8 Mar 2021 17:02:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 00/30] Block layer patches
Date: Mon,  8 Mar 2021 18:02:33 +0100
Message-Id: <20210308170233.387812-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 138d2931979cb7ee4a54a434a54088231f6980ff:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210308' into staging (2021-03-08 11:57:36 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to ef2e38a1a1d2915b148c4a49f61626e62c46fbb6:

  blockdev: Clarify error messages pertaining to 'node-name' (2021-03-08 14:56:55 +0100)

----------------------------------------------------------------
Block layer patches:

- qemu-storage-daemon: add --pidfile option
- qemu-storage-daemon: CLI error messages include the option name now
- vhost-user-blk export: Misc fixes
- docs: Improvements for qemu-storage-daemon documentation
- parallels: load bitmap extension
- backup-top: Don't crash on post-finalize accesses
- Improve error messages related to node-name options
- iotests improvements

----------------------------------------------------------------
Alberto Garcia (1):
      iotests: Drop deprecated 'props' from object-add

Connor Kuehl (2):
      block: Clarify error messages pertaining to 'node-name'
      blockdev: Clarify error messages pertaining to 'node-name'

Eric Blake (1):
      iotests: Fix up python style in 300

Kevin Wolf (1):
      docs: qsd: Explain --export nbd,name=... default

Max Reitz (3):
      backup: Remove nodes from job in .clean()
      backup-top: Refuse I/O in inactive state
      iotests/283: Check that finalize drops backup-top

Paolo Bonzini (2):
      storage-daemon: report unexpected arguments on the fly
      storage-daemon: include current command line option in the errors

Stefan Hajnoczi (12):
      qemu-storage-daemon: add --pidfile option
      docs: show how to spawn qemu-storage-daemon with fd passing
      docs: replace insecure /tmp examples in qsd docs
      vhost-user-blk: fix blkcfg->num_queues endianness
      libqtest: add qtest_socket_server()
      libqtest: add qtest_kill_qemu()
      libqtest: add qtest_remove_abrt_handler()
      block/export: fix blk_size double byteswap
      block/export: use VIRTIO_BLK_SECTOR_BITS
      block/export: fix vhost-user-blk export sector number calculation
      block/export: port virtio-blk discard/write zeroes input validation
      block/export: port virtio-blk read/write range check

Stefano Garzarella (1):
      blockjob: report a better error message

Vladimir Sementsov-Ogievskiy (7):
      qcow2-bitmap: make bytes_covered_by_bitmap_cluster() public
      parallels.txt: fix bitmap L1 table description
      block/parallels: BDRVParallelsState: add cluster_size field
      parallels: support bitmap extension for read-only mode
      iotests.py: add unarchive_sample_image() helper
      iotests: add parallels-read-bitmap test
      MAINTAINERS: update parallels block driver

 docs/interop/parallels.txt                         |  28 +-
 docs/tools/qemu-storage-daemon.rst                 |  68 ++++-
 block/parallels.h                                  |   7 +-
 include/block/dirty-bitmap.h                       |   2 +
 tests/qtest/libqos/libqtest.h                      |  37 +++
 block.c                                            |   8 +-
 block/backup-top.c                                 |  10 +
 block/backup.c                                     |   1 +
 block/dirty-bitmap.c                               |  13 +
 block/export/vhost-user-blk-server.c               | 150 +++++++++--
 block/parallels-ext.c                              | 300 +++++++++++++++++++++
 block/parallels.c                                  |  26 +-
 block/qcow2-bitmap.c                               |  16 +-
 blockdev.c                                         |  13 +-
 blockjob.c                                         |  10 +-
 hw/block/vhost-user-blk.c                          |   7 +-
 storage-daemon/qemu-storage-daemon.c               |  56 +++-
 tests/qtest/libqtest.c                             |  82 ++++--
 tests/qemu-iotests/iotests.py                      |  10 +
 MAINTAINERS                                        |   3 +
 block/meson.build                                  |   3 +-
 tests/qemu-iotests/030                             |   4 +-
 tests/qemu-iotests/040                             |   4 +-
 tests/qemu-iotests/051.pc.out                      |   6 +-
 tests/qemu-iotests/081.out                         |   2 +-
 tests/qemu-iotests/085.out                         |   6 +-
 tests/qemu-iotests/087                             |   8 +-
 tests/qemu-iotests/087.out                         |   2 +-
 tests/qemu-iotests/184                             |  18 +-
 tests/qemu-iotests/206.out                         |   2 +-
 tests/qemu-iotests/210.out                         |   2 +-
 tests/qemu-iotests/211.out                         |   2 +-
 tests/qemu-iotests/212.out                         |   2 +-
 tests/qemu-iotests/213.out                         |   2 +-
 tests/qemu-iotests/218                             |   2 +-
 tests/qemu-iotests/223.out                         |   4 +-
 tests/qemu-iotests/235                             |   2 +-
 tests/qemu-iotests/237.out                         |   2 +-
 tests/qemu-iotests/245                             |  14 +-
 tests/qemu-iotests/249.out                         |   2 +-
 tests/qemu-iotests/258                             |   6 +-
 tests/qemu-iotests/258.out                         |   4 +-
 tests/qemu-iotests/283                             |  53 ++++
 tests/qemu-iotests/283.out                         |  15 ++
 tests/qemu-iotests/295                             |   2 +-
 tests/qemu-iotests/296                             |   2 +-
 tests/qemu-iotests/300                             |  14 +-
 .../sample_images/parallels-with-bitmap.bz2        | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh         |  51 ++++
 tests/qemu-iotests/tests/parallels-read-bitmap     |  55 ++++
 tests/qemu-iotests/tests/parallels-read-bitmap.out |   6 +
 51 files changed, 969 insertions(+), 175 deletions(-)
 create mode 100644 block/parallels-ext.c
 create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
 create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
 create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
 create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out


