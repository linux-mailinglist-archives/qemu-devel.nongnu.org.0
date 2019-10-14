Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08968D61CC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 13:58:10 +0200 (CEST)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJyzJ-00053u-4W
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 07:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iJysy-0008BK-80
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iJysx-0005mb-4Z
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:51:36 -0400
Received: from relay.sw.ru ([185.231.240.75]:57688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iJyst-0005eW-Op; Mon, 14 Oct 2019 07:51:31 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iJyso-0002Oa-SQ; Mon, 14 Oct 2019 14:51:27 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] fix qcow2_can_store_new_dirty_bitmap
Date: Mon, 14 Oct 2019 14:51:24 +0300
Message-Id: <20191014115126.15360-1-vsementsov@virtuozzo.com>
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

Hi all!

Here is a fix for persistent bitmaps managing: we must check existent
but not yet stored bitmaps for qcow2-related constraints, like maximum
number of bitmaps in qcow2 image.

v2:

01: change assertion to error-return at function start
    Be free to add
    Reported-by: aihua liang <aliang@redhat.com>
    Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1712636
    if it's appropriate
02: new test
    Ohh, it takes about 4 minutes. Be free to drop it, as I doubt that
    it worth to have. The case is simple, we may live without a
    test.

Vladimir Sementsov-Ogievskiy (2):
  qcow2-bitmaps: fix qcow2_can_store_new_dirty_bitmap
  iotests: add 269 to check maximum of bitmaps in qcow2

 block/qcow2-bitmap.c       | 41 +++++++++++++++------------------
 tests/qemu-iotests/269     | 47 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/269.out |  3 +++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 69 insertions(+), 23 deletions(-)
 create mode 100755 tests/qemu-iotests/269
 create mode 100644 tests/qemu-iotests/269.out

-- 
2.21.0


