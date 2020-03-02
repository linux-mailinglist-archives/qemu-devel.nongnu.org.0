Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8861757F7
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 11:08:10 +0100 (CET)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8hzd-0000cD-KL
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 05:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j8hxV-0004Vo-6b
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j8hxU-0007lQ-5H
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:05:57 -0500
Received: from relay.sw.ru ([185.231.240.75]:48172)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j8hxR-0007jK-SN; Mon, 02 Mar 2020 05:05:54 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j8hxH-000350-J9; Mon, 02 Mar 2020 13:05:43 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] nbd: reduce max_block restrictions
Date: Mon,  2 Mar 2020 13:05:32 +0300
Message-Id: <20200302100537.29058-1-vsementsov@virtuozzo.com>
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent changes in NBD protocol allowed to use some commands without
max_block restriction. Let's drop restrictions.

NBD change is here:
https://github.com/NetworkBlockDevice/nbd/commit/9f30fedb8699f151e7ef4ccc07e624330be3316b#diff-762fb7c670348da69cc9050ef58fe3ae

Vladimir Sementsov-Ogievskiy (5):
  block/nbd-client: drop max_block restriction from block_status
  block/nbd-client: drop max_block restriction from discard
  block: add max_pwrite_zeroes_no_fallback to BlockLimits
  block/io: fix bdrv_co_do_pwrite_zeroes head calculation
  block/io: auto-no-fallback for write-zeroes

 include/block/block_int.h |  8 ++++++++
 block/blkdebug.c          |  7 ++++++-
 block/io.c                | 32 +++++++++++++++++++++++++++++---
 block/nbd.c               |  5 +----
 4 files changed, 44 insertions(+), 8 deletions(-)

-- 
2.21.0


