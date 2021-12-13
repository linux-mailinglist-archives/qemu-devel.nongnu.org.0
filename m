Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A5472DB3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:45:43 +0100 (CET)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwleA-0000sg-Dx
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:45:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlO2-0007pG-Hd; Mon, 13 Dec 2021 08:29:02 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:52279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlNv-0000Cd-Ie; Mon, 13 Dec 2021 08:29:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9CA5ED19BE9C;
 Mon, 13 Dec 2021 14:28:40 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003e093cf8b-9406-4ad7-bf0f-34bc4a6f89af,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 00/19] ppc/pnv: Add support for user created PHB3/PHB4
 devices
Date: Mon, 13 Dec 2021 14:28:11 +0100
Message-ID: <20211213132830.108372-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fea02d0c-df84-4f9a-97d4-320d993d6bd6
X-Ovh-Tracer-Id: 5370542558249782054
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On the POWER8 processor, powernv8 machine, PHB3 devices can simply be
created with :

   -device pnv-phb3,chip-id=0,index=1 

with a maximum of 3 PHB3s per chip, each PHB3 adding a new PCIe bus.

On the POWER9 processor, powernv9 machine, the logic is different. The
the chip comes with 3 PHB4 PECs (PCI Express Controller) and each PEC
can have several PHBs :

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

The PEC devices can be created with :

   -device pnv-phb4-pec,chip-id=0,index=1

And the number of added PHB4 devices depends on the PEC index. Each
PHB4 adds a new PCIe bus.

The following changes are mostly cleanups and improvements of the
PHB3/4 realize routines to enable support. One important change is
related to the way the powernv machine populates the device tree. It
depends on the object hierarchy and it is necessary to reparent user
created devices to the chip they belong to (see PATCH 5). PHB3 is a
little more sophisticated because of its SysBusDevice nature (see
PATCH 6).

It would be preferable for libvirt and user to add one PHB4 (one PCIe
bus) at a time but that's another step. The plan is to merge real soon
the first patches which are required cleanups of the models and give
some more time for the last ones.

Thanks,

C.

Changes in v2:

 - Addressed Frederic's comments 
 - Reworked patchset order to allow pluggable devices at the end.
 
Cédric Le Goater (19):
  ppc/pnv: Change the maximum of PHB3 devices for Power8NVL
  ppc/pnv: Introduce a "chip" property under the PHB3 model
  ppc/pnv: Use the chip class to check the index of PHB3 devices
  ppc/pnv: Drop the "num-phbs" property
  ppc/pnv: Move mapping of the PHB3 CQ regions under pnv_pbcq_realize()
  ppc/pnv: Use QOM hierarchy to scan PHB3 devices
  ppc/pnv: Introduce a num_pecs class attribute for PHB4 PEC devices
  ppc/pnv: Introduce version and device_id class atributes for PHB4
    devices
  ppc/pnv: Introduce a "chip" property under the PHB4 model
  ppc/pnv: Introduce a num_stack class attribute
  ppc/pnv: Compute the PHB index from the PHB4 PEC model
  ppc/pnv: Remove "system-memory" property from PHB4 PEC
  ppc/pnv: Move realize of PEC stacks under the PEC model
  ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices
  ppc/pnv: Introduce support for user created PHB3 devices
  ppc/pnv: Reparent user created PHB3 devices to the PnvChip
  ppc/pnv: Complete user created PHB3 devices
  ppc/pnv: Introduce support for user created PHB4 devices
  ppc/pnv: Move num_phbs under Pnv8Chip

 include/hw/pci-host/pnv_phb3.h |   3 +
 include/hw/pci-host/pnv_phb4.h |   5 +
 include/hw/ppc/pnv.h           |   7 +-
 hw/pci-host/pnv_phb3.c         |  29 ++++-
 hw/pci-host/pnv_phb3_pbcq.c    |  11 ++
 hw/pci-host/pnv_phb4_pec.c     |  94 ++++++++++++--
 hw/ppc/pnv.c                   | 218 ++++++++++++++++++---------------
 7 files changed, 256 insertions(+), 111 deletions(-)

-- 
2.31.1


