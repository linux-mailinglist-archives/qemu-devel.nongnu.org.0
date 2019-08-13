Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B748BABC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 15:50:21 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxXBs-000729-NI
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 09:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34441)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hxXBB-0006Hn-89
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxXBA-0005rT-1N
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:49:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38674)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxXB9-0005r3-SY
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:49:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D925DC059B7A;
 Tue, 13 Aug 2019 13:49:34 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54F81000321;
 Tue, 13 Aug 2019 13:49:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 15:49:18 +0200
Message-Id: <20190813134921.30602-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 13 Aug 2019 13:49:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/3] tests/acceptance: Add test of NeXTcube
 framebuffer using OCR
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I was looking at Thomas' last series [*] where he adds the
NeXTcube machine, thinking about enforcing a new rule "new
machines must have tests". Then I realized the UART is not
emitting characters, so our current sample tests are not
helpful.

Since the framebuffer is working, I gave a try at dumping the
screen content via the HMP 'screendump' command, then parsing
the screenshot with an OCR tool.

The default ROM dump the bootlog to a console. Using the old
good tesseract tool we can recover some useful words to be
sure the guest is sane, its framebuffer is definitively working.

This test takes less than 6s on Travis-CI:
https://travis-ci.org/philmd/qemu/builds/552174983#L1836

   AVOCADO tests/acceptance
 (3/9) /home/travis/build/philmd/qemu/tests/acceptance/machine_m68k_nextc=
ube.py:NextCubeMachine.test_bootrom_framebuffer:  PASS (5.69 s)

Since v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00249.=
html
- addressed Thomas and Cleber review comments (detailed in each patch)
- add RFC to interract sending VNC keys

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06514.=
html
- use the English dictionary (Thomas)
- support tesseract v3 and v4 (much better results with v4, but not
  all distros provide it)
- add a test of the framebuffer width/height

Regards,

Phil.

Based-on: 20190709073222.26370-1-huth@tuxfamily.org
[*] "m68k: Add basic support for the NeXTcube machine"
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg02152.html

Philippe Mathieu-Daud=C3=A9 (3):
  tests/acceptance: Add test of NeXTcube framebuffer using OCR
  tests/acceptance: Run commands sending VNC keys
  .travis.yml: Let the avocado job run the NeXTcube tests

 .travis.yml                               |   7 +-
 tests/acceptance/machine_m68k_nextcube.py | 170 ++++++++++++++++++++++
 tests/requirements.txt                    |   1 +
 3 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 tests/acceptance/machine_m68k_nextcube.py

--=20
2.20.1


