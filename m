Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C969314A675
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 15:45:40 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw5dz-00074e-Sd
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 09:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iw5ad-0002lJ-F6
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iw5ac-0002rB-Aq
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:11 -0500
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]:53963)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iw5ac-0002lb-5E
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:10 -0500
Received: from player159.ha.ovh.net (unknown [10.108.54.209])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id A074C1C0392
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 15:42:04 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 1E9EEEA8C420;
 Mon, 27 Jan 2020 14:41:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/3] ppc/pnv: Add a "hostboot" mode 
Date: Mon, 27 Jan 2020 15:41:51 +0100
Message-Id: <20200127144154.10170-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17779085432929618918
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfedvgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.226
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The QEMU PowerNV machine was first designed to start with a skiboot
firmware at 0x0, which then loads a kernel and ramfs acting as a boot
loader. Support of the POWER processor improving in QEMU, it has been
possible to support other firmwares.

These changes add support for firmwares mapped at a different address
than 0x0. First two patches are fixes/cleanups and the last one adds a
"hb-mode" option to the machine for this purpose. It needs some
discussion to see how we want to activate this new mode.

Thanks,

C.

C=C3=A9dric Le Goater (3):
  ppc/pnv: Add support for HRMOR on Radix host
  ppc/pnv: remove useless "core-pir" property alias.
  ppc/pnv: Add support for "hostboot" mode

 include/hw/ppc/pnv.h      |  2 ++
 include/hw/ppc/pnv_core.h |  1 +
 hw/ppc/pnv.c              | 28 +++++++++++++++++++++++++++-
 hw/ppc/pnv_core.c         | 31 ++++++++++++++++---------------
 hw/ppc/pnv_lpc.c          |  5 ++++-
 target/ppc/mmu-radix64.c  |  6 ++++++
 6 files changed, 56 insertions(+), 17 deletions(-)

--=20
2.21.1


