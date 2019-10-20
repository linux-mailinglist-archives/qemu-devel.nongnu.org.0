Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C035DDE07B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 22:39:16 +0200 (CEST)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMHyt-00079I-8P
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 16:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iMHx7-0005vP-6Q
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 16:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iMHx5-0006Xm-KN
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 16:37:24 -0400
Received: from relay.sw.ru ([185.231.240.75]:58840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iMHx5-0006Wx-CU; Sun, 20 Oct 2019 16:37:23 -0400
Received: from [172.16.25.136] (helo=dhcp-172-16-25-136.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iMHx0-00089m-PP; Sun, 20 Oct 2019 23:37:19 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v5 0/4] qcow2: advanced compression options
Date: Sun, 20 Oct 2019 23:37:04 +0300
Message-Id: <1571603828-185910-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New enhancements for writing compressed data to QCOW2 image.

v5: The new iotests cases were amended and 'qiov_offset' parameter
    value in the function bdrv_driver_pwritev_compressed() invoked
    from the bdrv_co_do_copy_on_readv() fixed to 0.
    Discussed on the email thread with ID:
    <1571243333-882302-1-git-send-email-andrey.shinkevich@virtuozzo.com>

v4:
    The 'compression' support at the block generic layer has been
    accumulated in the separate patch 1/4. A little code refactoring
    was made.
v3:
    Instead of introducing multiple key options for many drivers, the
    'compression' option has been introduced at the block generic layer
    as suggested by Roman Kagan. Discussed on the email thread with ID
    <1570026166-748566-1-git-send-email-andrey.shinkevich@virtuozzo.com>

Andrey Shinkevich (4):
  block: support compressed write at generic layer
  qcow2: Allow writing compressed data of multiple clusters
  tests/qemu-iotests: add case to write compressed data of multiple
    clusters
  tests/qemu-iotests: add case for block-stream compress

 block.c                    |  20 ++++++++-
 block/io.c                 |  13 ++++--
 block/qcow2.c              | 106 +++++++++++++++++++++++++++++++++------------
 blockdev.c                 |   9 +++-
 include/block/block.h      |   1 +
 include/block/block_int.h  |   2 +
 qapi/block-core.json       |   5 ++-
 qemu-options.hx            |   6 ++-
 tests/qemu-iotests/030     |  34 ++++++++++++++-
 tests/qemu-iotests/030.out |   4 +-
 tests/qemu-iotests/214     |  45 +++++++++++++++++++
 tests/qemu-iotests/214.out |  14 ++++++
 12 files changed, 220 insertions(+), 39 deletions(-)

-- 
1.8.3.1


