Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E396B1AA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 00:16:29 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnVkK-00060V-4w
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 18:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41479)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hnVk4-0005Xe-PS
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 18:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hnVk3-0002Cc-Kk
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 18:16:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41202)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hnVk1-00029y-4I; Tue, 16 Jul 2019 18:16:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1BAFF368E3;
 Tue, 16 Jul 2019 22:16:08 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB305E7A5;
 Tue, 16 Jul 2019 22:15:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 00:15:50 +0200
Message-Id: <20190716221555.11145-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 16 Jul 2019 22:16:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v6 0/5] hw/block/pflash_cfi01: Add
 DeviceReset() handler
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello it's me again, insisting with this series because there are at
least 2 different report of guests bricked on reset due to the bug
fixed by patch #5:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1678713
https://bugzilla.redhat.com/show_bug.cgi?id=3D1704584

Patches missing review: 2 and 3

The pflash device lacks a reset() function.
When a machine is resetted, the flash might be in an
inconsistent state, leading to unexpected behavior.
Resolve this issue by adding a DeviceReset() handler.

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00962.=
html
- addressed Laszlo review comments

Since v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00395.=
html
- consider migration (Laszlo, Peter)

Since v3: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01668.=
html
- more reliable migration (Dave)
- dropped patches 6-9 not required for next release

Since v4: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg02785.=
html
- document why using READ_ARRAY value 0x00 for migration is safe

Since v5: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03366.=
html
- avoid trying to be spec-compliant and messing with migration. KISS.
  review/test tags reset, sorry.

$ git backport-diff -u v5
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/5:[----] [-C] 'hw/block/pflash_cfi01: Removed an unused timer'
002/5:[down] 'hw/block/pflash_cfi01: Document use of non-CFI compliant co=
mmand '0x00''
003/5:[0031] [FC] 'hw/block/pflash_cfi01: Extract pflash_mode_read_array(=
)'
004/5:[down] 'hw/block/pflash_cfi01: Rename 'reset_flash' label as 'mode_=
read_array''
005/5:[----] [--] 'hw/block/pflash_cfi01: Add the DeviceReset() handler'

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (5):
  hw/block/pflash_cfi01: Removed an unused timer
  hw/block/pflash_cfi01: Document use of non-CFI compliant command
    '0x00'
  hw/block/pflash_cfi01: Extract pflash_mode_read_array()
  hw/block/pflash_cfi01: Rename 'reset_flash' label as 'mode_read_array'
  hw/block/pflash_cfi01: Add the DeviceReset() handler

 hw/block/pflash_cfi01.c | 77 +++++++++++++++++++++--------------------
 hw/block/trace-events   |  1 +
 2 files changed, 41 insertions(+), 37 deletions(-)

--=20
2.20.1


