Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFED16FE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 19:42:46 +0200 (CEST)
Received: from localhost ([::1]:53208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIFz2-0007ju-Uz
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 13:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iI7Xq-0008Lc-CJ
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iI7Xp-0001xD-AH
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 04:42:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:45608)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iI7Xm-0001qv-Rd; Wed, 09 Oct 2019 04:42:03 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iI7Xj-0008Sl-1d; Wed, 09 Oct 2019 11:41:59 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 0/3] NBD reconnect
Date: Wed,  9 Oct 2019 11:41:55 +0300
Message-Id: <20191009084158.15614-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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

v10:

01: add Eric's r-b
02: drop dead assignment local_err = NULL
    s/nbd_reconnect_loop/nbd_co_reconnect_loop/
03: avoid race conditions + some improvements
  - introduce qemu_io_silent_check and use it to wait for NBD server
    start
  - use size variable instead of '5M' in all places
  - use smart waiting loop instead of sleep, to wait for job progress
  - do srv.wait() after srv.kill(), to be sure that server is stopped
  - drop throttling earlier
  - drop 'quick' tag in group file

Vladimir Sementsov-Ogievskiy (3):
  qemu-coroutine-sleep: introduce qemu_co_sleep_wake
  block/nbd: nbd reconnect
  iotests: test nbd reconnect

 include/qemu/coroutine.h      |  23 ++-
 block/nbd.c                   | 331 +++++++++++++++++++++++++++-------
 util/qemu-coroutine-sleep.c   |  51 ++++--
 tests/qemu-iotests/264        |  95 ++++++++++
 tests/qemu-iotests/264.out    |  13 ++
 tests/qemu-iotests/group      |   1 +
 tests/qemu-iotests/iotests.py |  11 ++
 7 files changed, 447 insertions(+), 78 deletions(-)
 create mode 100755 tests/qemu-iotests/264
 create mode 100644 tests/qemu-iotests/264.out

-- 
2.21.0


