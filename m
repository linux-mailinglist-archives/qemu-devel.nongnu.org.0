Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6179F14DDB7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 16:24:18 +0100 (CET)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixBg1-0000IV-F2
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 10:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeU-0007Fj-3y
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeS-0007TZ-Vg
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:42 -0500
Received: from relay.sw.ru ([185.231.240.75]:47744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeQ-0007Ib-7p; Thu, 30 Jan 2020 10:22:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeK-0008C5-9B; Thu, 30 Jan 2020 18:22:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] request_alignment vs file size
Date: Thu, 30 Jan 2020 18:22:15 +0300
Message-Id: <20200130152218.7600-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi.

This is a continuation for thread
 "request_alignment vs file size, how to fix crash?"
 <2ca46523-44a2-1a48-dfa3-11bda9eef8e8@virtuozzo.com>
 https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg07276.html

Generic block-layer assumes that file size is aligned to
request_alignment, and may crash otherwise (see patch 03 for simple
reproducer).

So, let's at least check this thing on generic driver open,
and fix file-posix to consider file-size, when it wants to fallback to
large request_alignment.

Vladimir Sementsov-Ogievskiy (3):
  block/file-posix: add raw_getlength_fd
  block/file-posix: consider file size when fallback to max_align
  block: fail on open when file size is unaligned to request_alignment

 block.c            |  7 ++++++
 block/file-posix.c | 60 +++++++++++++++++++++++++++++-----------------
 2 files changed, 45 insertions(+), 22 deletions(-)

-- 
2.21.0


