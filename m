Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1DE049B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 15:11:29 +0200 (CEST)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMtwd-0003H1-HR
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 09:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMtkW-0006zy-P1
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:58:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMtkV-0006T2-HU
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:58:56 -0400
Received: from relay.sw.ru ([185.231.240.75]:55190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMtkN-0006KD-KQ; Tue, 22 Oct 2019 08:58:48 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMtkH-0003xx-17; Tue, 22 Oct 2019 15:58:41 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 00/10] Further bitmaps improvements
Date: Tue, 22 Oct 2019 15:58:29 +0300
Message-Id: <20191022125839.12633-1-vsementsov@virtuozzo.com>
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
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

The main feature here is improvement of _next_dirty_area API, which I'm
going to use then for backup / block-copy.

v2:
01: just use INT64_MAX instead of adding new constant
08: add separate function nbd_extent_array_convert_to_be and converted
    state of NBDExtentArray, to make these things explicit, and avoid
    extra memdup.
09: Save part of comment for bitmap_to_extents(), add Eric's r-b

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
 block/mirror.c               |  15 +-
 block/qcow2-bitmap.c         |  11 +-
 nbd/server.c                 | 242 +++++++++++++--------------
 tests/test-hbitmap.c         | 314 +++++++++++++----------------------
 util/hbitmap.c               | 133 +++++++++------
 8 files changed, 373 insertions(+), 464 deletions(-)

-- 
2.21.0


