Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2E7011E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:34:21 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYSK-0006wF-MN
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hpYS0-0006O9-Uv
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hpYRz-0004nE-Qo
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:34:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45672)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hpYRx-0004lB-PV; Mon, 22 Jul 2019 09:33:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1768430833A5;
 Mon, 22 Jul 2019 13:33:57 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E882219D7B;
 Mon, 22 Jul 2019 13:33:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 22 Jul 2019 15:33:42 +0200
Message-Id: <20190722133347.15122-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 22 Jul 2019 13:33:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/5] block: Fixes for concurrent block jobs
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think the patches speak for themselves now.

(The title of this series alludes to what the iotest added in the final
patch tests.)


v3:
- Rebased on master
- Added two tests to test-bdrv-drain [Kevin]
- Removed new iotest from auto [Thomas]


git-backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/5:[----] [--] 'block: Keep subtree drained in drop_intermediate'
002/5:[0004] [FC] 'block: Reduce (un)drains when replacing a child'
003/5:[down] 'tests: Test polling in bdrv_drop_intermediate()'
004/5:[down] 'tests: Test mid-drain bdrv_replace_child_noperm()'
005/5:[0002] [FC] 'iotests: Add test for concurrent stream/commit'


Max Reitz (5):
  block: Keep subtree drained in drop_intermediate
  block: Reduce (un)drains when replacing a child
  tests: Test polling in bdrv_drop_intermediate()
  tests: Test mid-drain bdrv_replace_child_noperm()
  iotests: Add test for concurrent stream/commit

 block.c                    |  51 ++--
 tests/test-bdrv-drain.c    | 475 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/258     | 163 +++++++++++++
 tests/qemu-iotests/258.out |  33 +++
 tests/qemu-iotests/group   |   1 +
 5 files changed, 707 insertions(+), 16 deletions(-)
 create mode 100755 tests/qemu-iotests/258
 create mode 100644 tests/qemu-iotests/258.out

--=20
2.21.0


