Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7911A5DE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 09:30:59 +0100 (CET)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iexOb-0002kq-Uk
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 03:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iexNG-0001ht-2d
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 03:29:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iexNE-0003vc-UG
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 03:29:33 -0500
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:47975)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iexNE-0003rI-Lr
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 03:29:32 -0500
Received: from player730.ha.ovh.net (unknown [10.108.1.161])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 22CB81F02D4
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 09:29:29 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 2BB0CD03E771;
 Wed, 11 Dec 2019 08:29:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/2] ppc/pnv: HOMER fixes and improvements
Date: Wed, 11 Dec 2019 09:29:10 +0100
Message-Id: <20191211082912.2625-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12171259468526357478
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeftddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.150
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
Cc: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, bala24@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The first patch introduces a new XSCOM region for the PBA bridge unit
(Power Bus Access) which connects the OCC (On Chip Controller) to the
Power bus and System Memory. The PBA is used to gather sensor data,
for power management, for sleep states, for initial boot, among other
things. This first patch also fixes :

 - BAR sizes and BAR masks
 - The mapping of the OCC common area, which is common to all chips
   and should be mapped once. =20
 - OCC common area is in BAR 3 on P8

and more globally, it fixes multichip support which is currently
broken because of wrong mappings.

The OCC common area is mapped at a unique address on the system and
each OCC is assigned a segment to expose its sensor data. This is
fixed in the second patch.

Thanks,

C.=20

C=C3=A9dric Le Goater (2):
  ppc/pnv: Introduce PBA registers
  ppc/pnv: Fix OCC common area region mapping

 include/hw/ppc/pnv.h       |  20 +++----
 include/hw/ppc/pnv_homer.h |   3 +
 include/hw/ppc/pnv_occ.h   |   8 ++-
 include/hw/ppc/pnv_xscom.h |   6 ++
 hw/ppc/pnv.c               |  12 +++-
 hw/ppc/pnv_homer.c         | 109 +++++++++++++++++++++++++++++++++++++
 hw/ppc/pnv_occ.c           |  11 ++--
 hw/ppc/pnv_xscom.c         |  32 -----------
 8 files changed, 148 insertions(+), 53 deletions(-)

--=20
2.21.0


