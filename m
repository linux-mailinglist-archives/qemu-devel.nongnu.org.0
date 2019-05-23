Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248B281C8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpzQ-0004T3-K7
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:50:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hTpwS-00038a-KH
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hTpwR-0007uY-Od
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:47:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:34908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hTpwR-0007tN-Hk; Thu, 23 May 2019 11:47:39 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hTpwL-0002xl-Ft; Thu, 23 May 2019 18:47:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 23 May 2019 18:47:30 +0300
Message-Id: <20190523154733.54944-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/3] qcow2-bitmaps: rewrite reopening logic
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
	mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Bitmaps reopening is buggy, we may easily produce broken incremental
backup if we do temporary snaphost. Let's fix it! The main patch is 03
and it has full description of the problem and solution.

Vladimir Sementsov-Ogievskiy (3):
  iotests: add test 255 to check bitmap life after snapshot + commit
  block/qcow2-bitmap: get rid of bdrv_has_changed_persistent_bitmaps
  block/qcow2-bitmap: rewrite bitmap reopening logic

 block/qcow2.h                |   5 +-
 include/block/block_int.h    |   2 +-
 include/block/dirty-bitmap.h |   1 -
 block.c                      |  29 ++---
 block/dirty-bitmap.c         |  12 --
 block/qcow2-bitmap.c         | 220 ++++++++++++++++++++++++-----------
 block/qcow2.c                |   2 +-
 python/qemu/__init__.py      |   4 +-
 tests/qemu-iotests/255       |  83 +++++++++++++
 tests/qemu-iotests/255.out   |  52 +++++++++
 tests/qemu-iotests/group     |   1 +
 11 files changed, 308 insertions(+), 103 deletions(-)
 create mode 100755 tests/qemu-iotests/255
 create mode 100644 tests/qemu-iotests/255.out

-- 
2.18.0


