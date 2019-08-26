Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484AF9D371
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 17:54:47 +0200 (CEST)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2HKQ-000361-Bs
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i2HGN-00073B-Fn
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i2HGL-0004Sc-Q3
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:50:34 -0400
Received: from relay.sw.ru ([185.231.240.75]:44124)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i2HGL-0004Rd-J2; Mon, 26 Aug 2019 11:50:33 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i2HGI-0006N5-FF; Mon, 26 Aug 2019 18:50:30 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon, 26 Aug 2019 18:50:22 +0300
Message-Id: <1566834628-485525-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6 0/6] Allow Valgrind checking all QEMU
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the current implementation of the QEMU bash iotests, only qemu-io
processes may be run under the Valgrind, which is a useful tool for
finding memory usage issues. Let's allow the common.rc bash script
runing all the QEMU processes, such as qemu-kvm, qemu-img, qemu-ndb
and qemu-vxhs, under the Valgrind tool.

v6:
  01: The possibility was added for a user to exclude particular processes
      from running under the Valgrind to speed up the test run (suggested
      by John).
  02: The shim function _NO_VALGRIND() was introduced as a workaround for
      the Valgrind bug that hangs QEMU killed process (suggested by John).
  03: The comments were amended in the commit messages and common.rc file.

  Discussed in the email threads with the message IDs:
  <1563553816-148827-1-git-send-email-andrey.shinkevich@virtuozzo.com>
  <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>

Andrey Shinkevich (6):
  iotests: allow Valgrind checking all QEMU processes
  iotests: exclude killed processes from running under Valgrind
  iotests: Add casenotrun report to bash tests
  iotests: Valgrind fails with nonexistent directory
  iotests: extended timeout under Valgrind
  iotests: extend sleeping time under Valgrind

 tests/qemu-iotests/028       |   6 ++-
 tests/qemu-iotests/039       |   5 ++
 tests/qemu-iotests/039.out   |  30 ++---------
 tests/qemu-iotests/051       |   4 ++
 tests/qemu-iotests/061       |   2 +
 tests/qemu-iotests/061.out   |  12 +----
 tests/qemu-iotests/137       |   1 +
 tests/qemu-iotests/137.out   |   6 +--
 tests/qemu-iotests/183       |   9 +++-
 tests/qemu-iotests/192       |   6 ++-
 tests/qemu-iotests/247       |   6 ++-
 tests/qemu-iotests/common.rc | 124 ++++++++++++++++++++++++++++++++++++-------
 12 files changed, 149 insertions(+), 62 deletions(-)

-- 
1.8.3.1


