Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014BD2B32
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 15:23:33 +0200 (CEST)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIYPj-00079A-N9
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 09:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYIT-0007cO-QX
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYIS-0001v4-GC
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:16:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYIH-0001qr-Gw; Thu, 10 Oct 2019 09:15:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A6ED308C38C;
 Thu, 10 Oct 2019 13:15:45 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB6960167;
 Thu, 10 Oct 2019 13:15:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] hw: Convert various reset() handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:19 +0200
Message-Id: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 10 Oct 2019 13:15:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only patch 3/8 is missing review:
- hw/ide/piix: Convert reset handler to DeviceReset

Since v2:
- Fixed PIIX_IDE conversion (Li)
- Added more R-b tag.

Since v1:
- Removed the pci-host devices
- Removed the vmcoreinfo conversion (elmarco) but add a comment.
- Added Igor's R-b tag.

Following the thread discussion between Peter/Markus/Damien about
reset handlers:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
I started to remove qemu_register_reset() calls from few qdevified
devices (the trivial ones).

Regards,

Phil.

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01677.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06367.html

Philippe Mathieu-Daud=C3=A9 (8):
  hw/acpi/piix4: Convert reset handler to DeviceReset
  hw/isa/piix4: Convert reset handler to DeviceReset
  hw/ide/piix: Convert reset handler to DeviceReset
  hw/ide/sii3112: Convert reset handler to DeviceReset
  hw/ide/via82c: Convert reset handler to DeviceReset
  hw/isa/vt82c686: Convert reset handler to DeviceReset
  hw/input/lm832x: Convert reset handler to DeviceReset
  hw/misc/vmcoreinfo: Add comment about reset handler

 hw/acpi/piix4.c      |  7 +++----
 hw/ide/piix.c        |  9 ++++-----
 hw/ide/sii3112.c     |  7 +++----
 hw/ide/via.c         | 10 ++++------
 hw/input/lm832x.c    | 12 +++++-------
 hw/isa/piix4.c       |  7 +++----
 hw/isa/vt82c686.c    | 11 ++++-------
 hw/misc/vmcoreinfo.c |  4 ++++
 8 files changed, 30 insertions(+), 37 deletions(-)

--=20
2.21.0


