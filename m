Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B519B30F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 18:49:50 +0200 (CEST)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJgYn-0001k3-W5
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 12:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jJgW7-0006TH-Hy
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jJgW6-0007BV-Kn
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:47:03 -0400
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:60613)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jJgW6-0007Ak-FD
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 12:47:02 -0400
Received: from player772.ha.ovh.net (unknown [10.110.103.202])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id E490A27466F
 for <qemu-devel@nongnu.org>; Wed,  1 Apr 2020 18:47:00 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 42DEA1112C053;
 Wed,  1 Apr 2020 16:46:55 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 0/2] ppc/xive: Add support for PQ state bits offload
Date: Wed,  1 Apr 2020 18:46:51 +0200
Message-Id: <20200401164653.28231-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14232500726500133862
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtddvgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.52.148
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
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

When the XIVE router unit receives a trigger message coming from a HW
source, it contains a special bit informing the XIVE interrupt
controller that the PQ bits have been checked at the source or
not. Depending on the value, the IC can perform the check and the
state transition locally using its own PQ state bits.

The following changes add new accessors to the XiveRouter required to
query and update the PQ state bits. This is only applies to the
PowerNV machine, sPAPR is not concerned by such complex configuration.
We will use it for upcoming features offloading event coalescing on
the interrupt controller.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  ppc/xive: export PQ routines
  ppc/xive: Add support for PQ state bits offload

 include/hw/ppc/xive.h    | 12 +++++++--
 hw/intc/pnv_xive.c       | 37 ++++++++++++++++++++++++---
 hw/intc/spapr_xive_kvm.c |  8 +++---
 hw/intc/xive.c           | 54 ++++++++++++++++++++++++++++++++--------
 hw/pci-host/pnv_phb4.c   |  9 +++++--
 hw/ppc/pnv_psi.c         |  8 ++++--
 6 files changed, 105 insertions(+), 23 deletions(-)

--=20
2.21.1


