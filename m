Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239087E11
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 17:34:14 +0200 (CEST)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw6uD-0005MF-Go
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 11:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hw6sN-00041b-I6
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hw6sK-0002p5-Rn
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:32:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:57592)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hw6sI-0002if-2g; Fri, 09 Aug 2019 11:32:14 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hw6sB-0004Cp-P9; Fri, 09 Aug 2019 18:32:08 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:32:00 +0300
Message-Id: <20190809153207.49288-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 0/7] backup improvements
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
 armbru@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

There are some fixes and refactorings I need on my way to resend
my backup-top series. It's obvious now that I need to share copying
code between backup and backup-top, as backup copying code becomes
smarter and more complicated. So the goal of the series is to make copying
code more share-able.

It's based on John's bitmaps branch, rebased on master.

v2 (by Max's comments):

02: Add Max's r-b
03: - split out backup changes to 03
    - handle common max_transfer = 0 case
04: splat out from 02
06: fix allocation size
07: - rebase on 06 changes
    - add Max's r-b

two patches are dropped or postponed for the next step

Vladimir Sementsov-Ogievskiy (7):
  block/backup: deal with zero detection
  block/backup: refactor write_flags
  block/io: handle alignment and max_transfer for copy_range
  block/backup: drop handling of max_transfer for copy_range
  block/backup: fix backup_cow_with_offload for last cluster
  block/backup: teach backup_cow_with_bounce_buffer to copy more at once
  block/backup: merge duplicated logic into backup_do_cow

 block/backup.c | 125 +++++++++++++++++++------------------------------
 block/io.c     |  48 +++++++++++++++----
 blockdev.c     |   8 ++--
 3 files changed, 91 insertions(+), 90 deletions(-)

-- 
2.18.0


