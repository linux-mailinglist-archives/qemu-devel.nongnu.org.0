Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073FE02B9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 13:20:33 +0200 (CEST)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMsDH-000650-8r
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMsB3-0004AD-Mq
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMsB2-0007h2-LN
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:51902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMsB0-0007dj-39; Tue, 22 Oct 2019 07:18:10 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMsAw-0003JX-9C; Tue, 22 Oct 2019 14:18:06 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/6] block-copy: memory limit
Date: Tue, 22 Oct 2019 14:17:59 +0300
Message-Id: <20191022111805.3432-1-vsementsov@virtuozzo.com>
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

I'm going to bring block-status driven, async copying process to
block-copy, to make it fast. The first step is to limit memory usage of
backup, here is it.

v3:
03: add Max's r-b
04: fix commit message and include guards, add Max's r-b
05-06: add Max's r-b

v2: [mostly by Max's comments]
Now based on master (Thank you Max!)
01: add Max's r-b
02: add Max's r-b
03: - refactor block_copy_do_copy goto/return
    - add small comment to block_copy_do_copy
04: - a lot of renaming and wording fixes
    - refactor to use "available" instead of "taken"
    - refactor co_get_from_shres
05: rebase on 04 changes
06: drop extra things from max_transfer calculation

Vladimir Sementsov-Ogievskiy (6):
  block/block-copy: allocate buffer in block_copy_with_bounce_buffer
  block/block-copy: limit copy_range_size to 16 MiB
  block/block-copy: refactor copying
  util: introduce SharedResource
  block/block-copy: add memory limit
  block/block-copy: increase buffered copy request

 include/block/block-copy.h        |   5 +-
 include/qemu/co-shared-resource.h |  71 ++++++++++++
 block/block-copy.c                | 182 +++++++++++++++---------------
 util/qemu-co-shared-resource.c    |  76 +++++++++++++
 block/trace-events                |   6 +-
 util/Makefile.objs                |   1 +
 6 files changed, 249 insertions(+), 92 deletions(-)
 create mode 100644 include/qemu/co-shared-resource.h
 create mode 100644 util/qemu-co-shared-resource.c

-- 
2.21.0


