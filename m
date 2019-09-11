Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D7BAFDD4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 15:41:39 +0200 (CEST)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i82sM-0000E7-Gq
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 09:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i82qh-0007VJ-72
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i82qf-0006NB-WC
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:39:54 -0400
Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94]:56211)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i82qf-0006Ma-Q8
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:39:53 -0400
Received: from player792.ha.ovh.net (unknown [10.109.146.175])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id B95B3141E4D
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 15:39:51 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 0539A9C4DE63;
 Wed, 11 Sep 2019 13:39:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 11 Sep 2019 15:39:35 +0200
Message-Id: <20190911133937.2716-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17953318443619224550
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.61.94
Subject: [Qemu-devel] [PATCH v2 0/2] spapr: reduce the number of IRQ
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,=20

A typical pseries VM with 16 vCPUs, one disk, one network adapater
uses less than 100 interrupts but the whole IRQ number space of the
QEMU machine is allocated at reset time and it is 8K wide. This is
wasting a considerable amount of interrupt numbers in the global IRQ
space which has 1M interrupts per socket on a POWER9.

To optimise the HW resources, only request at the KVM level interrupts
which have been claimed by the guest. This will help to increase the
maximum number of VMs per system and also help supporting nested
guests using the XIVE interrupt mode.

Thanks,

C.

Changes since v1:

 - split the patch=20
 - removed useless 'reset_all' machine flag which supposed to preserve
   migration compatibility

C=C3=A9dric Le Goater (2):
  spapr/irq: Introduce an ics_irq_free() helper
  spapr/irq: Only claim VALID interrupts at the KVM level

 include/hw/ppc/xics.h    |  5 +++++
 hw/intc/spapr_xive_kvm.c | 29 ++++++++++++++++++++++++++---
 hw/intc/xics_kvm.c       |  8 ++++++++
 hw/ppc/spapr_irq.c       |  9 +++------
 4 files changed, 42 insertions(+), 9 deletions(-)

--=20
2.21.0


