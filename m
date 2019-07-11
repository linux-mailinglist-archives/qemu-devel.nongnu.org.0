Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898665B17
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 17:57:42 +0200 (CEST)
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlbS1-0004GX-24
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 11:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlbRh-0003eo-Md
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 11:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlbRg-0006NY-Go
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 11:57:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlbRb-0006Jn-D2; Thu, 11 Jul 2019 11:57:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 922CC3082E64;
 Thu, 11 Jul 2019 15:57:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1B95D9CC;
 Thu, 11 Jul 2019 15:57:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 17:56:58 +0200
Message-Id: <20190711155703.15627-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 11 Jul 2019 15:57:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v4 0/5] hw/block/pflash_cfi01: Add
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pflash device lacks a reset() function.
When a machine is resetted, the flash might be in an
inconsistent state, leading to unexpected behavior:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1678713
Resolve this issue by adding a DeviceReset() handler.

Fix also two minor issues, and clean a bit the codebase.

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00962.=
html
- addressed Laszlo review comments

Since v2:
- consider migration (Laszlo, Peter)

Since v3:
- more reliable migration (Dave)
- dropped patches 6-9 not required for next release

$ git backport-diff -u v3
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/5:[----] [--] 'hw/block/pflash_cfi01: Removed an unused timer'
002/5:[0048] [FC] 'hw/block/pflash_cfi01: Use the correct READ_ARRAY valu=
e'
003/5:[----] [--] 'hw/block/pflash_cfi01: Extract pflash_mode_read_array(=
)'
004/5:[----] [--] 'hw/block/pflash_cfi01: Start state machine as READY to=
 accept commands'
005/5:[----] [--] 'hw/block/pflash_cfi01: Add the DeviceReset() handler'

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (5):
  hw/block/pflash_cfi01: Removed an unused timer
  hw/block/pflash_cfi01: Use the correct READ_ARRAY value
  hw/block/pflash_cfi01: Extract pflash_mode_read_array()
  hw/block/pflash_cfi01: Start state machine as READY to accept commands
  hw/block/pflash_cfi01: Add the DeviceReset() handler

 hw/block/pflash_cfi01.c | 109 +++++++++++++++++++++++++++-------------
 hw/block/trace-events   |   1 +
 2 files changed, 75 insertions(+), 35 deletions(-)

--=20
2.20.1


