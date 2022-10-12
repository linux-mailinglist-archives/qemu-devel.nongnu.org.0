Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E445FC784
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:38:01 +0200 (CEST)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicru-00022v-8V
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnX-00050c-4u
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnV-0006jI-Ch
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDiTB+91/wBa9K9v+GrB8DRyO4sE3rlzPY3SetpZVqw=;
 b=N1r/5x4y533vfMCoFhnnmDQAIRnkcT3W6CY/2IL9AuPV6Djd+rkJbPrbfMmYvQX3Hh/O0c
 whmQwxm52xhehInenw2Ob80usZRORJyy3fbhxF0xbnK6qdLCGmesX/UJjw1Opwz25BMx8n
 /afPrEkjb5CkYJEpeh09WQf4Gjy3TY4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-QgU7IbaiOty5WNPP7LFHrA-1; Wed, 12 Oct 2022 10:33:20 -0400
X-MC-Unique: QgU7IbaiOty5WNPP7LFHrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C67013C3C966
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 14:33:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BCC52144B20;
 Wed, 12 Oct 2022 14:33:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 00/16] qtest patches (and one unit test and one avocado fix)
Date: Wed, 12 Oct 2022 16:33:00 +0200
Message-Id: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Stefan!

The following changes since commit 1dcdc92c72af5311666df64f5f04d6600af262ed:

  Merge tag 'pull-hex-20221003' of https://github.com/quic/qemu into staging (2022-10-05 10:17:32 -0400)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-10-12

for you to fetch changes up to 04c92d2654b130fd29597a57ae2d71e70895bf2b:

  tests/unit/test-image-locking: Fix handling of temporary files (2022-10-12 12:48:53 +0200)

----------------------------------------------------------------
* Rework of qtests to support hot plugging tests on q35
* New VNC qtest
* Fixes related to temporary file handling in the tests
* Use signal() instead of sigaction() since the latter does not work on Windows
* Some other small clean-ups

----------------------------------------------------------------
Bin Meng (2):
      tests/qtest: migration-test: Avoid using hardcoded /tmp
      tests/qtest: libqtest: Install signal handler via signal()

Juan Quintela (1):
      qtest: "-display none" is set in qtest_init()

Marc-André Lureau (1):
      qtest: start a VNC test

Michael Labiuk (9):
      tests/x86: add helper qtest_qmp_device_del_send()
      tests/x86: Add subtest with 'q35' machine type to device-plug-test
      tests/x86: Refactor hot unplug hd-geo-test
      tests/x86: Add 'q35' machine type to override-tests in hd-geo-test
      tests/x86: Add 'q35' machine type to hotplug hd-geo-test
      tests/x86: Fix comment typo in drive_del-test
      tests/x86: replace snprint() by g_strdup_printf() in drive_del-test
      tests/x86: Add 'q35' machine type to drive_del-test
      tests/x86: Add 'q35' machine type to ivshmem-test

Peter Maydell (1):
      tests/avocado: Add missing require_netdev('user') checks

Thomas Huth (1):
      tests/unit/test-image-locking: Fix handling of temporary files

dinglimin (1):
      tests/migration: remove the unused local variable

 tests/qtest/libqtest.h              |  10 ++
 tests/qtest/bios-tables-test.c      |   2 +-
 tests/qtest/device-plug-test.c      |  56 ++++++--
 tests/qtest/drive_del-test.c        | 125 +++++++++++++++--
 tests/qtest/fuzz-lsi53c895a-test.c  |   2 +-
 tests/qtest/fuzz-megasas-test.c     |   2 +-
 tests/qtest/fuzz-sb16-test.c        |   6 +-
 tests/qtest/fuzz-sdcard-test.c      |   6 +-
 tests/qtest/fuzz-virtio-scsi-test.c |   2 +-
 tests/qtest/fuzz-xlnx-dp-test.c     |   2 +-
 tests/qtest/hd-geo-test.c           | 273 +++++++++++++++++++++++++++---------
 tests/qtest/ivshmem-test.c          |  18 +++
 tests/qtest/libqos/pci-pc.c         |   8 +-
 tests/qtest/libqtest.c              |  30 ++--
 tests/qtest/migration-test.c        |  10 +-
 tests/qtest/vnc-display-test.c      | 103 ++++++++++++++
 tests/unit/test-image-locking.c     |   6 +-
 tests/avocado/boot_linux_console.py |   4 +
 tests/avocado/machine_aspeed.py     |   3 +
 tests/avocado/ppc_bamboo.py         |   1 +
 tests/migration/guestperf/engine.py |   1 -
 tests/qtest/meson.build             |   8 +-
 22 files changed, 544 insertions(+), 134 deletions(-)
 create mode 100644 tests/qtest/vnc-display-test.c


