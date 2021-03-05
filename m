Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE732F07C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:59:27 +0100 (CET)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDnS-00018e-Gu
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkF-0006tR-RK
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk4-0007CR-Dp
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hC/+HHRYGP5IxMidvlfoAS6nAxMcrbVYtMZVTca/pJA=;
 b=RZZleREVydYMmMKO0svAoWVBorqLWfVvgG+Fop+y/al+dZmmafwoovmu5996lsQENPaoPz
 2LFGFX/RCtm8IlEMkPNtJz2XFqfee5DmL0RsvRItjT/3NL0NIZgU+tXQFIBIHVssg2G0eL
 2Vnpm8AexCvG9c+ePYFVj2Pm03eqxfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-TyN38Z21P-O1fhcSb_dtyg-1; Fri, 05 Mar 2021 11:55:53 -0500
X-MC-Unique: TyN38Z21P-O1fhcSb_dtyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B9018AB670;
 Fri,  5 Mar 2021 16:55:07 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2401F50332;
 Fri,  5 Mar 2021 16:55:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/31] Block layer patches
Date: Fri,  5 Mar 2021 17:54:23 +0100
Message-Id: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 67bedc3aed5c455b629c2cb5f523b536c46adff9:

  docs: qsd: Explain --export nbd,name=... default (2021-03-05 17:09:46 +0100)

----------------------------------------------------------------
Block layer patches:

- qemu-storage-daemon: add --pidfile option
- qemu-storage-daemon: CLI error messages include the option name now
- vhost-user-blk export: Misc fixes, added test cases
- docs: Improvements for qemu-storage-daemon documentation
- parallels: load bitmap extension
- backup-top: Don't crash on post-finalize accesses
- iotests improvements

----------------------------------------------------------------
Alberto Garcia (1):
      iotests: Drop deprecated 'props' from object-add

Coiby Xu (1):
      test: new qTest case to test the vhost-user-blk-server

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

Stefan Hajnoczi (14):
      qemu-storage-daemon: add --pidfile option
      docs: show how to spawn qemu-storage-daemon with fd passing
      docs: replace insecure /tmp examples in qsd docs
      vhost-user-blk: fix blkcfg->num_queues endianness
      libqtest: add qtest_socket_server()
      libqtest: add qtest_kill_qemu()
      libqtest: add qtest_remove_abrt_handler()
      tests/qtest: add multi-queue test case to vhost-user-blk-test
      block/export: fix blk_size double byteswap
      block/export: use VIRTIO_BLK_SECTOR_BITS
      block/export: fix vhost-user-blk export sector number calculation
      block/export: port virtio-blk discard/write zeroes input validation
      vhost-user-blk-test: test discard/write zeroes invalid inputs
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
 docs/tools/qemu-storage-daemon.rst                 |  68 +-
 block/parallels.h                                  |   7 +-
 include/block/dirty-bitmap.h                       |   2 +
 tests/qtest/libqos/libqtest.h                      |  37 +
 tests/qtest/libqos/vhost-user-blk.h                |  48 +
 block/backup-top.c                                 |  10 +
 block/backup.c                                     |   1 +
 block/dirty-bitmap.c                               |  13 +
 block/export/vhost-user-blk-server.c               | 150 +++-
 block/parallels-ext.c                              | 300 +++++++
 block/parallels.c                                  |  26 +-
 block/qcow2-bitmap.c                               |  16 +-
 blockjob.c                                         |  10 +-
 hw/block/vhost-user-blk.c                          |   7 +-
 storage-daemon/qemu-storage-daemon.c               |  56 +-
 tests/qtest/libqos/vhost-user-blk.c                | 130 +++
 tests/qtest/libqtest.c                             |  82 +-
 tests/qtest/vhost-user-blk-test.c                  | 983 +++++++++++++++++++++
 tests/qemu-iotests/iotests.py                      |  10 +
 MAINTAINERS                                        |   5 +
 block/meson.build                                  |   3 +-
 tests/qemu-iotests/087                             |   8 +-
 tests/qemu-iotests/184                             |  18 +-
 tests/qemu-iotests/218                             |   2 +-
 tests/qemu-iotests/235                             |   2 +-
 tests/qemu-iotests/245                             |   4 +-
 tests/qemu-iotests/258                             |   6 +-
 tests/qemu-iotests/258.out                         |   4 +-
 tests/qemu-iotests/283                             |  53 ++
 tests/qemu-iotests/283.out                         |  15 +
 tests/qemu-iotests/295                             |   2 +-
 tests/qemu-iotests/296                             |   2 +-
 tests/qemu-iotests/300                             |  10 +-
 .../sample_images/parallels-with-bitmap.bz2        | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh         |  51 ++
 tests/qemu-iotests/tests/parallels-read-bitmap     |  55 ++
 tests/qemu-iotests/tests/parallels-read-bitmap.out |   6 +
 tests/qtest/libqos/meson.build                     |   1 +
 tests/qtest/meson.build                            |   4 +
 40 files changed, 2098 insertions(+), 137 deletions(-)
 create mode 100644 tests/qtest/libqos/vhost-user-blk.h
 create mode 100644 block/parallels-ext.c
 create mode 100644 tests/qtest/libqos/vhost-user-blk.c
 create mode 100644 tests/qtest/vhost-user-blk-test.c
 create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
 create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
 create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
 create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out


