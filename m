Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D064179EA0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 05:32:09 +0100 (CET)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9iB6-0006MT-Hn
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 23:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j9i9O-0004xg-7g
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 23:30:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j9i9M-0003gv-PP
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 23:30:22 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:52111)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j9i9L-0003dP-Je; Wed, 04 Mar 2020 23:30:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48XyTZ6MPSz9sQt; Thu,  5 Mar 2020 15:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583382610;
 bh=5AwBfwpk2JMdB3FHE+oRM9hHzQScunEXJtrQ9UdjIPM=;
 h=From:To:Cc:Subject:Date:From;
 b=cs7EjdfslwXugKtl0ovavzLkj7J7a7fsAAaxKFakG1UrY/ExKpBaQgL4rcrC8wsjU
 KWiFOSs4n03q3a32zbzaL3DWrRG551kEvN5YLzxOm8lKrREIfCUGK2P8JxbF+OVCVI
 wx5f9/1uZ74F56zTJeFYlHVdErYQM6ZqGxej1kDU=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	pair@us.ibm.com,
	qemu-devel@nongnu.org,
	clg@kaod.org
Subject: [PATCH v3 0/2] spapr: Use vIOMMU translation for virtio by default
Date: Thu,  5 Mar 2020 15:30:07 +1100
Message-Id: <20200305043009.611636-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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

Changes since v2:
 * Rebase and improve some comments
Changes since v1:
 * Added information on which guest kernel versions will no longer
   work with these changes
 * Use Michael Tsirkin's suggested better way of handling the machine
   type change

David Gibson (2):
  spapr: Disable legacy virtio devices for pseries-5.0 and later
  spapr: Enable virtio iommu_platform=3Don by default

 hw/ppc/spapr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

--=20
2.24.1


