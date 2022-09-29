Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C15F00D3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:42:16 +0200 (CEST)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2ER-0007Sj-Di
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28o-00065e-3G
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:26 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28j-0001xb-Lo
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:25 -0400
Received: from [192.168.16.158] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oe25e-0071e8-Bt;
 Fri, 30 Sep 2022 00:35:35 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v5 0/9] Add 'q35' machine type to hotplug tests
Date: Fri, 30 Sep 2022 01:35:38 +0300
Message-Id: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=michael.labiuk@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to:  Michael Labiuk <michael.labiuk@virtuozzo.com>
From:  Michael Labiuk via <qemu-devel@nongnu.org>

Add pci bridge setting to run hotplug tests on q35 machine type.
Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b

v5 -> v4:

* Unify device removing in tests.
* Using qtest_has_machine("q35") as condition.
* fixed typos.
* Replaced snprintf.

v4 -> v3:

* Moving helper function process_device_remove() to separate commit.
* Refactoring hd-geo-test to avoid code duplication.

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

 tests/qtest/device-plug-test.c |  56 ++++--
 tests/qtest/drive_del-test.c   | 125 +++++++++++--
 tests/qtest/hd-geo-test.c      | 319 ++++++++++++++++++++++++---------
 tests/qtest/ivshmem-test.c     |  18 ++
 tests/qtest/libqos/pci-pc.c    |   8 +-
 tests/qtest/libqtest.c         |  16 +-
 tests/qtest/libqtest.h         |  10 ++
 7 files changed, 425 insertions(+), 127 deletions(-)

-- 
2.34.1


