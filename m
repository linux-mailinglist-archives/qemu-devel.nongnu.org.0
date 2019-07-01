Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782722E1A2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0sj-0008SA-L9
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n8-0004V4-Va
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n7-00053S-SA
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:43124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n7-00051t-JQ; Wed, 29 May 2019 11:47:01 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n1-0004iP-HD; Wed, 29 May 2019 18:46:55 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 29 May 2019 18:46:47 +0300
Message-Id: <20190529154654.95870-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 0/7] backup-top filter driver for backup
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
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

These series introduce backup-top driver. It's a filter-node, which
do copy-before-write operation. Mirror uses filter-node for handling
guest writes, let's move to filter-node (from write-notifiers) for
backup too

v8:
01-03: new
05: add Max's r-b
others changed, change description in each patch mail in Notes section.

v6-v7 was preparing refactoring, which now is in Max's pull request, and
these series based on it:
Based-on: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg06526.html

Vladimir Sementsov-Ogievskiy (7):
  block: teach bdrv_debug_breakpoint skip filters with backing
  block: swap operation order in bdrv_append
  block: allow not one child for implicit node
  block: introduce backup-top filter driver
  block/io: refactor wait_serialising_requests
  block: add lock/unlock range functions
  block/backup: use backup-top instead of write notifiers

 block/backup-top.h         |  64 ++++++++
 include/block/block_int.h  |   4 +
 block.c                    |  60 +++++--
 block/backup-top.c         | 322 +++++++++++++++++++++++++++++++++++++
 block/backup.c             | 171 ++++++++------------
 block/io.c                 |  68 ++++++--
 block/Makefile.objs        |   2 +
 tests/qemu-iotests/056     |   2 +-
 tests/qemu-iotests/085.out |   2 +-
 tests/qemu-iotests/129     |   1 -
 tests/qemu-iotests/141.out |   2 +-
 11 files changed, 567 insertions(+), 131 deletions(-)
 create mode 100644 block/backup-top.h
 create mode 100644 block/backup-top.c

-- 
2.18.0


