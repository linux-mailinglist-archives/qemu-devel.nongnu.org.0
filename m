Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8615B643
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 02:00:01 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j22rI-0006x1-CD
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 20:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j22qE-0005dA-3B
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 19:58:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j22qC-0002ay-PX
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 19:58:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34457 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j22qB-0002YF-Na; Wed, 12 Feb 2020 19:58:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48HynM3Txdz9sRX; Thu, 13 Feb 2020 11:58:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581555527;
 bh=7Gg6Z/wiL+Cw6NTngjRjFNrE6PFhlASIwNXcvvmJZxs=;
 h=From:To:Cc:Subject:Date:From;
 b=AmpVhLXtzOwJ4/3OL5qqdvh7mbxiUK7/O9cG7+8aLDSjGqIMrQo2n1oZG33FQ3obq
 WKLsi0hjT+enYw6COIhdETQ0YwWOIAIPtRN8PfP0iabRX0wyYrghrE9mm+ga4qfvT9
 Ba1bf5o1zorXqwKanstEToxu4sngZOLVEOaR66iY=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com,
	qemu-devel@nongnu.org,
	groug@kaod.org,
	clg@kaod.org
Subject: [PATCH v2 0/2] spapr: Use vIOMMU translation for virtio by default
Date: Thu, 13 Feb 2020 11:58:35 +1100
Message-Id: <20200213005837.131791-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: mst@redhat.com, aik@ozlabs.ru, paulus@samba.org, mdroth@us.ibm.com,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upcoming Secure VM support for pSeries machines introduces some
complications for virtio, since the transfer buffers need to be
explicitly shared so that the hypervisor can access them.

While it's not strictly speaking dependent on it, the fact that virtio
devices bypass normal platform IOMMU translation complicates the issue
on the guest side.  Since there are some significan downsides to
bypassing the vIOMMU anyway, let's just disable that.

There's already a flag to do this in virtio, just turn it on by
default for forthcoming pseries machine types.

Any opinions on whether dropping support for the older guest kernels
is acceptable at this point?

Changes since v1:
 * Added information on which guest kernel versions will no longer
   work with these changes
 * Use Michael Tsirkin's suggested better way of handling the machine
   type change

David Gibson (2):
  spapr: Disable legacy virtio devices for pseries-5.0 and later
  spapr: Enable virtio iommu_platform=3Don by default

 hw/ppc/spapr.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

--=20
2.24.1


