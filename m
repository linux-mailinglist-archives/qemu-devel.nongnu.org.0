Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F1CBFE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 17:59:02 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGPyv-0000kp-4p
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 11:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iGPnj-000380-8b
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 11:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iGPnh-0005go-V9
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 11:47:27 -0400
Received: from relay.sw.ru ([185.231.240.75]:36336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iGPnR-0005EX-Hf; Fri, 04 Oct 2019 11:47:20 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iGPnK-00019e-Hh; Fri, 04 Oct 2019 18:47:02 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] fix migration with bitmaps and mirror
Date: Fri,  4 Oct 2019 18:46:56 +0300
Message-Id: <20191004154701.3202-1-vsementsov@virtuozzo.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 quintela@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

It's a continuation for
"bitmap migration bug with -drive while block mirror runs"
<315cff78-dcdb-a3ce-2742-da3cc9f0ca97@redhat.com>
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg07241.html

The problem is that bitmaps migrated to node with same node-name or
blk-parent name. And currently only the latter actually work in libvirt.
And with mirror-top filter it doesn't work, because
bdrv_get_device_or_node_name don't go through filters.

Fix this by handling filtered children of block backends in separate.

Max Reitz (1):
  block: Mark commit and mirror as filter drivers

Vladimir Sementsov-Ogievskiy (4):
  migretion/block-dirty-bitmap: refactor init_dirty_bitmap_migration
  block/dirty-bitmap: add bdrv_has_named_bitmaps helper
  migration/block-dirty-bitmap: fix bitmaps migration during mirror job
  iotests: 194: test also migration of dirty bitmap

 include/block/block_int.h      |   8 ++-
 include/block/dirty-bitmap.h   |   1 +
 block/commit.c                 |   2 +
 block/dirty-bitmap.c           |  13 ++++
 block/mirror.c                 |   2 +
 migration/block-dirty-bitmap.c | 118 +++++++++++++++++++++++----------
 tests/qemu-iotests/194         |  14 ++--
 tests/qemu-iotests/194.out     |   6 ++
 8 files changed, 121 insertions(+), 43 deletions(-)

-- 
2.21.0


