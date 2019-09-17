Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91597B53CB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 19:16:12 +0200 (CEST)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAH5H-0008Px-46
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 13:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iAH2g-0006lP-Eq
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 13:13:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iAH2f-000339-DQ
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 13:13:30 -0400
Received: from relay.sw.ru ([185.231.240.75]:55302)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iAH2c-000304-Mm; Tue, 17 Sep 2019 13:13:26 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iAH2Z-0003rq-JQ; Tue, 17 Sep 2019 20:13:23 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 17 Sep 2019 20:13:19 +0300
Message-Id: <20190917171322.4127-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v9 0/3] NBD reconnect
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!
Here is NBD reconnect. Previously, if connection failed all current
and future requests will fail. After the series, nbd-client driver
will try to reconnect unlimited times. During first @reconnect-delay
seconds of reconnecting all requests will wait for the connection,
and if it is established requests will be resent. After
@reconnect-delay period all requests will be failed (until successful
reconnect).

v9:

01: - fix grammar [Eric] [1]
    - add "static" to qemu_co_sleep_ns__scheduled variable definition [Eric] [2]
    - add public typedef for internal QemuCoSleepState and use it [Kevin]
        [this leads to returning of co_sleep_cb, as we need wrapper with
         void * argument o pass to aio_timer_new][3]
    - rename function and add helper with old name and old semantics [Kevin]
    - keep Kevin's r-b, hope [1], [2] and [3] are not too much.
02: rebase on 01 changes
    some tiny improvements from Eric's review

Vladimir Sementsov-Ogievskiy (3):
  qemu-coroutine-sleep: introduce qemu_co_sleep_wake
  block/nbd: nbd reconnect
  iotests: test nbd reconnect

 include/qemu/coroutine.h      |  23 ++-
 block/nbd.c                   | 332 +++++++++++++++++++++++++++-------
 util/qemu-coroutine-sleep.c   |  51 ++++--
 tests/qemu-iotests/264        |  65 +++++++
 tests/qemu-iotests/264.out    |  12 ++
 tests/qemu-iotests/group      |   1 +
 tests/qemu-iotests/iotests.py |   4 +
 7 files changed, 410 insertions(+), 78 deletions(-)
 create mode 100755 tests/qemu-iotests/264
 create mode 100644 tests/qemu-iotests/264.out

-- 
2.21.0


