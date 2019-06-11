Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E93D502
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 20:06:38 +0200 (CEST)
Received: from localhost ([::1]:33554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1halAL-0008Hb-Ac
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 14:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42280)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6K-00067n-LW
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6G-0005QM-J5
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:26 -0400
Received: from relay.sw.ru ([185.231.240.75]:34296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal6C-0005Iw-BX; Tue, 11 Jun 2019 14:02:20 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal64-0002AB-Jp; Tue, 11 Jun 2019 21:02:13 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 11 Jun 2019 21:02:04 +0300
Message-Id: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 0/7] Allow Valgrind checking all QEMU
 processes
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 mreitz@redhat.com, rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the current implementation of the QEMU bash iotests, only qemu-io
processes may be run under the Valgrind, which is a useful tool for
finding memory usage issues. Let's allow the common.rc bash script
runing all the QEMU processes, such as qemu-kvm, qemu-img, qemu-ndb
and qemu-vxhs, under the Valgrind tool.

v2:
  01: The patch 2/7 of v1 was merged into the patch 1/7, suggested by Daniel.
  02: Another patch 7/7 was added to introduce the Valgrind error suppression
      file into the QEMU project.

Andrey Shinkevich (7):
  iotests: allow Valgrind checking all QEMU processes
  iotests: exclude killed processes from running under Valgrind
  iotests: Valgrind fails to work with nonexistent directory
  iotests: extended timeout under Valgrind
  iotests: extend sleeping time under Valgrind
  iotests: amend QEMU NBD process synchronization
  iotests: new file to suppress Valgrind errors

 tests/qemu-iotests/028           |  6 +++-
 tests/qemu-iotests/039           |  5 +++
 tests/qemu-iotests/039.out       | 30 +++---------------
 tests/qemu-iotests/051           |  1 +
 tests/qemu-iotests/061           |  2 ++
 tests/qemu-iotests/061.out       | 12 ++-----
 tests/qemu-iotests/137           |  1 +
 tests/qemu-iotests/137.out       |  6 +---
 tests/qemu-iotests/183           |  9 +++++-
 tests/qemu-iotests/192           |  6 +++-
 tests/qemu-iotests/247           |  6 +++-
 tests/qemu-iotests/common.nbd    |  6 ++++
 tests/qemu-iotests/common.rc     | 68 ++++++++++++++++++++++++++++++----------
 tests/qemu-iotests/valgrind.supp | 31 ++++++++++++++++++
 14 files changed, 128 insertions(+), 61 deletions(-)
 create mode 100644 tests/qemu-iotests/valgrind.supp

-- 
1.8.3.1


