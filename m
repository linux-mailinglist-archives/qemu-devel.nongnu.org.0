Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064F75C777
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 04:49:52 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi8rf-0002ux-6Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 22:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi6RW-0000ly-A5
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 20:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi6RR-0006jq-Hm
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 20:14:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35674)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hi6R2-0006E6-SX; Mon, 01 Jul 2019 20:14:13 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9F6FC07014A;
 Tue,  2 Jul 2019 00:13:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE45F10018F9;
 Tue,  2 Jul 2019 00:13:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 02:12:52 +0200
Message-Id: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 00:13:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/9] hw/block/pflash_cfi01: Add
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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

Maintainers spam list from:
./scripts/get_maintainer.pl -f $(git grep -El '(pflash_cfi01_register|TYP=
E_PFLASH_CFI01)')

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (9):
  hw/block/pflash_cfi01: Removed an unused timer
  hw/block/pflash_cfi01: Use the correct READ_ARRAY value
  hw/block/pflash_cfi01: Extract pflash_mode_read_array()
  hw/block/pflash_cfi01: Start state machine as READY to accept commands
  hw/block/pflash_cfi01: Add the DeviceReset() handler
  hw/block/pflash_cfi01: Simplify CFI_QUERY processing
  hw/block/pflash_cfi01: Improve command comments
  hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
  hw/block/pflash_cfi01: Hold the PRI table offset in a variable

 hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
 hw/block/trace-events   |   1 +
 2 files changed, 74 insertions(+), 67 deletions(-)

--=20
2.20.1


