Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B722193808
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 06:43:40 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHLIp-0006rS-Ci
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 01:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jHLFb-0003A3-Ra
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 01:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jHLFa-0000py-ON
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 01:40:19 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52557)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jHLFa-0000nQ-4N; Thu, 26 Mar 2020 01:40:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48nv2k4bs1z9sSJ; Thu, 26 Mar 2020 16:40:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585201214;
 bh=tFoVHKh7HsU8J89ErZFtizlb0QU9hcBN+dBv0Alr6Wo=;
 h=From:To:Cc:Subject:Date:From;
 b=pSyn+2zxuducNj6PIKeplUAeY72gP1706at90IJ1k+5wDbGT7gvELYE1CcVbFHrvx
 LSd+UayRooU1NRpeOtsRqy3wMjl9WqleLhXBbC0hRu2jqk6fOye8cQ0cKI/3043O01
 2lxT9OLIjmG4v3TBSgZZBGdRJ74tSSsJrw7D9qiY=
From: David Gibson <david@gibson.dropbear.id.au>
To: aik@ozlabs.ru,
	groug@kaod.org
Subject: [RFC for-5.1 0/4] Better handling of attempt NVLink2 unplug
Date: Thu, 26 Mar 2020 16:40:05 +1100
Message-Id: <20200326054009.454477-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, attempting to unplug an NVLink2 device will generally
result in the guest crashing.  If you're lucky, it instead simply
won't work and remain in a "pending unplug" state indefinitely.

There is code we could we could theoretically improve in qemu to tear
these devices down better.  However since NVLink2 devices aren't hot
pluggable in hardware, the guest side drivers usually don't cope with
that anyway.

So, patch 4/4 blocks attempts to unplug NVLink2 devices.  The others
are some preliminary cleanups to get us towards there.

David Gibson (4):
  spapr: Refactor locating NVLink2 devices for device tree creation
  spapr: Helper to determine if a device is NVLink2 related
  spapr: Fix failure path for attempting to hot unplug PCI bridges
  spapr: Don't allow unplug of NVLink2 devices

 hw/ppc/spapr_pci.c          |   6 ++
 hw/ppc/spapr_pci_nvlink2.c  | 120 +++++++++++++++++++++++++-----------
 include/hw/pci-host/spapr.h |   1 +
 3 files changed, 91 insertions(+), 36 deletions(-)

--=20
2.25.1


