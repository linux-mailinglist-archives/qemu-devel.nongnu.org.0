Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E447B980B5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 18:53:26 +0200 (CEST)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0TrR-0000OV-Uq
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 12:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i0TqT-0007kn-4x
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i0TqS-0004Nu-1W
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:52:25 -0400
Received: from relay.sw.ru ([185.231.240.75]:53178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i0TqP-0004AK-50; Wed, 21 Aug 2019 12:52:21 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i0TqK-0003Ry-Go; Wed, 21 Aug 2019 19:52:16 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Wed, 21 Aug 2019 19:52:12 +0300
Message-Id: <20190821165215.61406-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 0/3] NBD reconnect
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 sheepdog@lists.wpkg.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, namei.unix@gmail.com
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

v8:
preparations are already merged [thx to Eric], old 07 with SI_* constants
dropped [Peter]
02: - use NANOSECONDS_PER_SECOND
03: - move to tests/qemu-iotests/264
    - limit job speed, otherwise it fails on ramfs as backup finishes too early

v7:
almost all: rebased on merged nbd.c and nbd-client.c (including patch subject)
01-04: add Eric's r-b
04: wording
05: new
06: rewrite to remove timer earlier
07: new
08:
 - rebase on 05 and 07
 - drop "All rights reserved"
 - handle drain
 - improve handling aio context attach
09: move 249 -> 257

Vladimir Sementsov-Ogievskiy (3):
  qemu-coroutine-sleep: introduce qemu_co_sleep_wake
  block/nbd: nbd reconnect
  iotests: test nbd reconnect

 include/qemu/coroutine.h      |  17 +-
 block/nbd.c                   | 335 +++++++++++++++++++++++++++-------
 block/null.c                  |   2 +-
 block/sheepdog.c              |   2 +-
 tests/test-bdrv-drain.c       |   6 +-
 tests/test-block-iothread.c   |   2 +-
 util/qemu-coroutine-sleep.c   |  47 +++--
 tests/qemu-iotests/264        |  65 +++++++
 tests/qemu-iotests/264.out    |  12 ++
 tests/qemu-iotests/group      |   1 +
 tests/qemu-iotests/iotests.py |   4 +
 11 files changed, 408 insertions(+), 85 deletions(-)
 create mode 100755 tests/qemu-iotests/264
 create mode 100644 tests/qemu-iotests/264.out

-- 
2.18.0


