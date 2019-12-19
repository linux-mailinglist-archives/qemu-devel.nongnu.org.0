Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EE125E7E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:06:09 +0100 (CET)
Received: from localhost ([::1]:38083 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihsh6-0004p8-CS
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsf3-0002el-KI
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsf2-0007uF-6I
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:04:01 -0500
Received: from relay.sw.ru ([185.231.240.75]:57606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihsev-0007Y6-Fn; Thu, 19 Dec 2019 05:03:53 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihser-0004j2-2a; Thu, 19 Dec 2019 13:03:49 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 00/10] Further bitmaps improvements
Date: Thu, 19 Dec 2019 13:03:38 +0300
Message-Id: <20191219100348.24827-1-vsementsov@virtuozzo.com>
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

v3: rebase on current master. Mirror don't use _next_dirty_area any
more, so mirror chunks dropped (patches 05 and 07) and 07 commit message
changed.

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
 block/qcow2-bitmap.c         |  11 +-
 nbd/server.c                 | 242 +++++++++++++--------------
 tests/test-hbitmap.c         | 314 +++++++++++++----------------------
 util/hbitmap.c               | 133 +++++++++------
 7 files changed, 366 insertions(+), 456 deletions(-)

-- 
2.21.0


