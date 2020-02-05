Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA51529D9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 12:23:53 +0100 (CET)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izIme-0001wg-R0
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1izIjx-0005GW-3L
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:21:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1izIjv-0001OS-Uo
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:21:04 -0500
Received: from relay.sw.ru ([185.231.240.75]:41382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1izIjs-00015f-MJ; Wed, 05 Feb 2020 06:21:00 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1izIjk-0006Jd-50; Wed, 05 Feb 2020 14:20:52 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 00/10] Further bitmaps improvements
Date: Wed,  5 Feb 2020 14:20:31 +0300
Message-Id: <20200205112041.6003-1-vsementsov@virtuozzo.com>
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
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

The main feature here is improvement of _next_dirty_area API, which I'm
going to use then for backup / block-copy.

Somehow, I thought that it was merged, but seems I even forgot to send
v4.

v4:
01-04: add Max's r-b
05: switch test_hbitmap_next_zero_check_range args to int64_t too
06: fix s/UINT64_MAX/INT64_MAX/ in comment to hbitmap_next_dirty
    s/firt_dirty_off/first_dirty_off/
    Context changed due to 05 change, but I keep Max's r-b
07: simplify parameter check in hbitmap_next_dirty_area
    drop initialization in hbitmap_sparse_merge
    add Max's r-b
08: commit message tweak
    refactor converted flag to separated converted_to_be and can_add
    do not convert to be automatically in nbd_extent_array_add
    check uint32 overflow in nbd_extent_array_add
10: drop extra check from store_bitmap_data, add Max's r-b

Vladimir Sementsov-Ogievskiy (10):
  hbitmap: assert that we don't create bitmap larger than INT64_MAX
  hbitmap: move hbitmap_iter_next_word to hbitmap.c
  hbitmap: unpublish hbitmap_iter_skip_words
  hbitmap: drop meta bitmaps as they are unused
  block/dirty-bitmap: switch _next_dirty_area and _next_zero to int64_t
  block/dirty-bitmap: add _next_dirty API
  block/dirty-bitmap: improve _next_dirty_area API
  nbd/server: introduce NBDExtentArray
  nbd/server: use bdrv_dirty_bitmap_next_dirty_area
  block/qcow2-bitmap: use bdrv_dirty_bitmap_next_dirty

 include/block/dirty-bitmap.h |   9 +-
 include/qemu/hbitmap.h       |  97 +++--------
 block/dirty-bitmap.c         |  16 +-
 block/qcow2-bitmap.c         |  15 +-
 nbd/server.c                 | 251 ++++++++++++++--------------
 tests/test-hbitmap.c         | 314 +++++++++++++----------------------
 util/hbitmap.c               | 134 +++++++++------
 7 files changed, 375 insertions(+), 461 deletions(-)

-- 
2.21.0


