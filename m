Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9A84F14
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 16:48:49 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvNF9-0005rX-Kh
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 10:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44031)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hvND7-0004Oa-LU
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hvND6-0005Mr-QK
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:46:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45598)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hvND4-0005K0-UJ; Wed, 07 Aug 2019 10:46:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 286BB3023085;
 Wed,  7 Aug 2019 14:46:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-121.ams2.redhat.com
 [10.36.117.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF3B5D717;
 Wed,  7 Aug 2019 14:46:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  7 Aug 2019 16:46:25 +0200
Message-Id: <20190807144628.4988-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 07 Aug 2019 14:46:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/3] block-backend: Queue requests while
 drained
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, dplotnikov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes the problem that devices like IDE, which submit
requests as a direct result of I/O from the CPU thread, can continue to
submit new requests even in a drained section.

v2:
- Rebased on top of block-next
- Replaced patch 2 with draining mirror_top_bs instead [Max]
- Removed wait_while_drained parameter from patch 3 [Max]
- Covered blk_co_flush() [Max]
- Fixed some typos [Eric]

Kevin Wolf (3):
  block: Remove blk_pread_unthrottled()
  mirror: Keep mirror_top_bs drained after dropping permissions
  block-backend: Queue requests while drained

 include/sysemu/block-backend.h |  3 +-
 block/backup.c                 |  1 +
 block/block-backend.c          | 69 ++++++++++++++++++++++++----------
 block/commit.c                 |  2 +
 block/mirror.c                 |  7 +++-
 blockjob.c                     |  3 ++
 hw/block/hd-geometry.c         |  7 +---
 tests/test-bdrv-drain.c        |  1 +
 8 files changed, 65 insertions(+), 28 deletions(-)

--=20
2.20.1


