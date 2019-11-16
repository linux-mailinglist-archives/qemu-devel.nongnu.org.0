Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEDFFF3EE
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Nov 2019 17:36:43 +0100 (CET)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iW13y-00070s-0B
	for lists+qemu-devel@lfdr.de; Sat, 16 Nov 2019 11:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iW11j-00053S-5R
 for qemu-devel@nongnu.org; Sat, 16 Nov 2019 11:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iW11h-0005TZ-Nd
 for qemu-devel@nongnu.org; Sat, 16 Nov 2019 11:34:23 -0500
Received: from relay.sw.ru ([185.231.240.75]:37812)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iW11f-0005RR-22; Sat, 16 Nov 2019 11:34:19 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iW11X-0005cn-SZ; Sat, 16 Nov 2019 19:34:12 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] fix & merge block_status_above and is_allocated_above
Date: Sat, 16 Nov 2019 19:34:06 +0300
Message-Id: <20191116163410.12129-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I wanted to understand, what is the real difference between bdrv_block_status_above
and bdrv_is_allocated_above, IMHO bdrv_is_allocated_above should work through
bdrv_block_status_above..

And I found the problem: bdrv_is_allocated_above considers space after EOF as
UNALLOCATED for intermediate nodes..

UNALLOCATED is not about allocation at fs level, but about should we go to backing or
not.. And it seems incorrect for me, as in case of short backing file, we'll read
zeroes after EOF, instead of going further by backing chain.

This leads to the following effect:

./qemu-img create -f qcow2 base.qcow2 2M
./qemu-io -c "write -P 0x1 0 2M" base.qcow2

./qemu-img create -f qcow2 -b base.qcow2 mid.qcow2 1M
./qemu-img create -f qcow2 -b mid.qcow2 top.qcow2 2M

Region 1M..2M is shadowed by short middle image, so guest sees zeroes:
./qemu-io -c "read -P 0 1M 1M" top.qcow2
read 1048576/1048576 bytes at offset 1048576
1 MiB, 1 ops; 00.00 sec (22.795 GiB/sec and 23341.5807 ops/sec)

But after commit guest visible state is changed, which seems wrong for me:
./qemu-img commit top.qcow2 -b mid.qcow2

./qemu-io -c "read -P 0 1M 1M" mid.qcow2
Pattern verification failed at offset 1048576, 1048576 bytes
read 1048576/1048576 bytes at offset 1048576
1 MiB, 1 ops; 00.00 sec (4.981 GiB/sec and 5100.4794 ops/sec)

./qemu-io -c "read -P 1 1M 1M" mid.qcow2
read 1048576/1048576 bytes at offset 1048576
1 MiB, 1 ops; 00.00 sec (3.365 GiB/sec and 3446.1606 ops/sec)


I don't know, is it a real bug, as I don't know, do we support backing file larger than
its parent. Still, I'm not sure that this behavior of bdrv_is_allocated_above don't lead
to other problems.

=====

Hmm, bdrv_block_allocated_above behaves strange too:

with want_zero=true, it may report unallocated zeroes because of short backing files, which
are actually "allocated" in POV of backing chains. But I see this may influence only
qemu-img compare, and I don't see can it trigger some bug..

with want_zero=false, it may do no progress because of short backing file. Moreover it may
report EOF in the middle!! But want_zero=false used only in bdrv_is_allocated, which considers
onlyt top layer, so it seems OK. 

=====

So, I propose these series, still I'm not sure is there a real bug.

Vladimir Sementsov-Ogievskiy (4):
  block/io: fix bdrv_co_block_status_above
  block/io: bdrv_common_block_status_above: support include_base
  block/io: bdrv_common_block_status_above: support bs == base
  block/io: fix bdrv_is_allocated_above

 block/io.c                 | 104 ++++++++++++++++++-------------------
 tests/qemu-iotests/154.out |   4 +-
 2 files changed, 53 insertions(+), 55 deletions(-)

-- 
2.21.0


