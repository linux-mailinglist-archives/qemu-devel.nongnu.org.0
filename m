Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1D108E48
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 13:54:14 +0100 (CET)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZDsb-0007Hm-68
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 07:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iZDr6-00068b-OF
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iZDr5-0008TM-M5
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:52:40 -0500
Received: from relay.sw.ru ([185.231.240.75]:42314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iZDr3-0008Oz-3v; Mon, 25 Nov 2019 07:52:37 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iZDqw-0007wx-WE; Mon, 25 Nov 2019 15:52:31 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-4.2 0/2] Fix bitmap migration
Date: Mon, 25 Nov 2019 15:52:27 +0300
Message-Id: <20191125125229.13531-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

We've faced a bug in rhev-2.12.0-33.el7-based Qemu.
In upstream, bug introduced in 4.0 by 74da6b943565c45
"block/dirty-bitmaps: implement inconsistent bit" commit.
At this commit we started to load inconsistent bitmap instead of
silently ignoring them, and it now I see that it breaks migration.

The fix is very simple, so I think it's OK for 4.2.. Still, it's not a
degradation, so we may postpone it to 5.0.

Vladimir Sementsov-Ogievskiy (2):
  block/qcow2-bitmap: fix bitmap migration
  iotests: add new test cases to bitmap migration

 block/qcow2-bitmap.c       | 21 ++++++++++++++++++++-
 tests/qemu-iotests/169     | 22 +++++++++++++++-------
 tests/qemu-iotests/169.out |  4 ++--
 3 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.21.0


