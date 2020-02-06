Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3617154307
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:28:44 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izfKt-0006kE-Ue
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izfJM-0005ZR-51
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izfJJ-0007hF-Rr
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:27:07 -0500
Received: from 4.mo173.mail-out.ovh.net ([46.105.34.219]:50333)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izfJJ-000704-M3
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:27:05 -0500
Received: from player788.ha.ovh.net (unknown [10.110.171.31])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 28E4612F5D5
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 12:26:56 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 553F8F1A6CFB;
 Thu,  6 Feb 2020 11:26:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] aspeed/smc: fix data corruption on witherspoon machines
Date: Thu,  6 Feb 2020 12:26:43 +0100
Message-Id: <20200206112645.21275-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17870283324729756433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheefgddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.34.219
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

We have been seeing a squashfs corruption on the witherspoon-bmc
machine for quite some time. It boots but quickly after boot
corruption errors start to fill the console. This machine has two BMC
chips with UBIfs on them. The romulus-bmc machine has a similar
problem when both PNOR are enabled.

After some investigation, it appeared that the SPI transfers on the
two chips were getting mixed and after more investigation, the User
mode select/unselect scheme of the Aspeed SMC model proved to be
broken. It's been there since the right beginning of the model. Here
is a fix.

Kudos to Andrew J. for the time he spent on this and Andrew G. for his
patience.

I pushed the code on my github branch aspeed-5.0 for more testing.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  aspeed/smc: Add some tracing
  aspeed/smc: Fix User mode select/unselect scheme

 Makefile.objs       |  1 +
 hw/ssi/aspeed_smc.c | 56 ++++++++++++++++++++++++++++++++-------------
 hw/ssi/trace-events | 10 ++++++++
 3 files changed, 51 insertions(+), 16 deletions(-)
 create mode 100644 hw/ssi/trace-events

--=20
2.21.1


