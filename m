Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F910B5D3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 19:37:01 +0100 (CET)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia2BP-0006JJ-Io
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 13:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia1kA-0006dh-UO
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 13:08:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia1k9-0003sW-Jr
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 13:08:50 -0500
Received: from relay.sw.ru ([185.231.240.75]:49992)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia1k6-0003iq-7B; Wed, 27 Nov 2019 13:08:46 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia1k0-0002UU-CF; Wed, 27 Nov 2019 21:08:40 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 for-5.0 0/7] block-copy improvements: part I
Date: Wed, 27 Nov 2019 21:08:33 +0300
Message-Id: <20191127180840.11937-1-vsementsov@virtuozzo.com>
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

This is a first part of my
  [RFC 00/24] backup performance: block_status + async

Patches are mostly separate by their idea, but sending them all in
separate is inefficient.

Vladimir Sementsov-Ogievskiy (7):
  block/block-copy: specialcase first copy_range request
  block/block-copy: use block_status
  block/block-copy: factor out block_copy_find_inflight_req
  block/block-copy: refactor interfaces to use bytes instead of end
  block/block-copy: rename start to offset in interfaces
  block/block-copy: reduce intersecting request lock
  block/block-copy: hide structure definitions

 include/block/block-copy.h |  57 +-----
 block/backup-top.c         |   6 +-
 block/backup.c             |  27 +--
 block/block-copy.c         | 379 ++++++++++++++++++++++++++++---------
 block/trace-events         |   1 +
 5 files changed, 316 insertions(+), 154 deletions(-)

-- 
2.21.0


