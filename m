Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDDA1505A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 17:36:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNffZ-0007vZ-7K
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 11:36:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hNfdW-0006wC-RM
	for qemu-devel@nongnu.org; Mon, 06 May 2019 11:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hNfdV-0005wt-OJ
	for qemu-devel@nongnu.org; Mon, 06 May 2019 11:34:38 -0400
Received: from relay.sw.ru ([185.231.240.75]:48330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hNfdV-0005vi-Gs; Mon, 06 May 2019 11:34:37 -0400
Received: from [10.28.8.145] (helo=kvm.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hNfdO-0004Z1-56; Mon, 06 May 2019 18:34:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon,  6 May 2019 18:34:26 +0300
Message-Id: <20190506153429.52737-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6 0/3] block/stream: get rid of the base
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	berto@igalia.com, wencongyang2@huawei.com,
	xiechanglong.d@gmail.com, mreitz@redhat.com, stefanha@redhat.com,
	den@openvz.org, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces a bottom intermediate node that eliminates the
dependency on the base that may change while stream job is running.
It happens when stream/commit parallel jobs are running on the same
backing chain. The base node of the stream job may be a top node of
the parallel commit job and can change before the stream job is
completed. We avoid that dependency by introducing the bottom node.

v6: [resend by Vladimir]
  01: improve comment in block/io.c, suggested by Alberto

v5: [resend by Vladimir]
  01: use comment wording in block/io.c suggested by Alberto
  Now the whole series are reviewed-by Alberto and me.

v4:
trace_stream_start reverted to the base.
bdrv_is_allocated_above_inclusive() deleted and the new parameter
'bool include_base' was added to the bdrv_is_allocated_above().

Andrey Shinkevich (2):
  block: include base when checking image chain for block allocation
  block/stream: introduce a bottom node

Vladimir Sementsov-Ogievskiy (1):
  block/stream: refactor stream_run: drop goto

 include/block/block.h  |  3 +-
 block/commit.c         |  2 +-
 block/io.c             | 20 ++++++++++----
 block/mirror.c         |  2 +-
 block/replication.c    |  2 +-
 block/stream.c         | 62 ++++++++++++++++++++----------------------
 tests/qemu-iotests/245 |  4 +--
 7 files changed, 50 insertions(+), 45 deletions(-)

-- 
2.18.0


