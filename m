Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E515C19BC3A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 09:10:13 +0200 (CEST)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJtzQ-0000MN-Kh
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 03:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jJtyF-0007jN-Cc
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 03:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jJtyE-0004Xc-15
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 03:08:58 -0400
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:37511)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jJtyD-0004Vx-R0
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 03:08:57 -0400
Received: from player687.ha.ovh.net (unknown [10.110.115.149])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 88C2B99A48
 for <qemu-devel@nongnu.org>; Thu,  2 Apr 2020 09:08:55 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 1AF3D10FD55DB;
 Thu,  2 Apr 2020 07:08:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 0/4] target/ppc: Add support for Radix partition-scoped
 translation
Date: Thu,  2 Apr 2020 09:08:43 +0200
Message-Id: <20200402070847.5921-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 10342235072680528870
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdefgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.91
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

The Radix tree translation model currently supports process-scoped
translation for the PowerNV machine (Hypervisor mode) and for the
pSeries machine (Guest mode). Guests running under an emulated
Hypervisor (PowerNV machine) require a new type of Radix translation,
called partition-scoped, which is missing today.

The Radix tree translation is a 2 steps process. The first step,
process-scoped translation, converts an effective Address to a guest
real address, and the second step, partition-scoped translation,
converts a guest real address to a host real address.

There are difference cases to covers :=20

* Hypervisor real mode access: no Radix translation.

* Hypervisor or host application access (quadrant 0 and 3) with
  relocation on: process-scoped translation.

* Guest OS real mode access: only partition-scoped translation.

* Guest OS real or guest application access (quadrant 0 and 3) with
  relocation on: both process-scoped translation and partition-scoped
  translations.

* Hypervisor access in quadrant 1 and 2 with relocation on: both
  process-scoped translation and partition-scoped translations.

The radix tree partition-scoped translation is performed using tables
pointed to by the first double-word of the Partition Table Entries and
process-scoped translation uses tables pointed to by the Process Table
Entries (second double-word of the Partition Table Entries).

Both partition-scoped and process-scoped translations process are
identical and thus the radix tree traversing code is largely reused.
However, errors in partition-scoped translations generate hypervisor
exceptions.

Based on work from Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Thanks,

C.

Changes since v2:

 - removed the changes on the routines raising the exceptions to take
   a 'cause_excp' bool.

Changes since v1:

 - removed checks (cpu->vhyp && lpid =3D=3D 0)
 - changed ppc_radix64_walk_tree() and ppc_radix64_next_level() to use
   an 'AddressSpace *'
 - moved call to ppc_radix64_get_fully_qualified_addr() under
   ppc_radix64_xlate()
 - reworked the prototype of the routines raising the exceptions to
   take a 'cause_excp' bool.
 - re-introduced an extra test on nls in ppc_radix64_walk_tree()
=20
C=C3=A9dric Le Goater (4):
  target/ppc: Introduce ppc_radix64_xlate() for Radix tree translation
  target/ppc: Extend ppc_radix64_check_prot() with a 'partition_scoped'
    bool
  target/ppc: Rework ppc_radix64_walk_tree() for partition-scoped
    translation
  target/ppc: Add support for Radix partition-scoped translation

 target/ppc/cpu.h         |   3 +
 target/ppc/excp_helper.c |   3 +-
 target/ppc/mmu-radix64.c | 426 ++++++++++++++++++++++++++++-----------
 3 files changed, 312 insertions(+), 120 deletions(-)

--=20
2.21.1


