Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F5753F7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 18:27:44 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqgal-0003iv-2W
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 12:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36717)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hqgaN-00033a-Jx
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:27:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hqgaM-0003nQ-Gb
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:27:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hqgaJ-0003hs-Px; Thu, 25 Jul 2019 12:27:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFF2783F3D;
 Thu, 25 Jul 2019 16:27:14 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-146.ams2.redhat.com
 [10.36.117.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3834F5D71A;
 Thu, 25 Jul 2019 16:27:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 18:27:00 +0200
Message-Id: <20190725162704.12622-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 25 Jul 2019 16:27:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] block-backend: Queue requests while drained
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

In order to avoid a dependency for this series, I borrowed a patch from
Max.

Kevin Wolf (3):
  block: Remove blk_pread_unthrottled()
  mirror: Keep target drained until graph changes are done
  block-backend: Queue requests while drained

Max Reitz (1):
  block: Reduce (un)drains when replacing a child

 include/sysemu/block-backend.h | 13 +++---
 block.c                        | 49 +++++++++++++-------
 block/backup.c                 |  1 +
 block/block-backend.c          | 85 +++++++++++++++++++++++-----------
 block/commit.c                 |  2 +
 block/mirror.c                 | 20 ++++----
 blockjob.c                     |  3 ++
 hw/block/hd-geometry.c         |  7 +--
 tests/test-bdrv-drain.c        |  1 +
 9 files changed, 118 insertions(+), 63 deletions(-)

--=20
2.20.1


