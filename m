Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F6B19B9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 10:41:37 +0200 (CEST)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8h96-00015W-KC
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 04:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4x-00069u-Ot
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4w-0008K2-S1
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:37:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38432)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4u-0008Iw-MK; Fri, 13 Sep 2019 04:37:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB85B8342DF;
 Fri, 13 Sep 2019 08:37:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF0D060F80;
 Fri, 13 Sep 2019 08:37:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:15 +0200
Message-Id: <20190913083615.14719-7-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 13 Sep 2019 08:37:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 6/6] amd_iommu: Let
 amdvi_iommu_notify_flag_changed() fail
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case a MAP notifier is attempted to be registered,
let's simply return an error. This latter now is
handled in the VFIO code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 137ba367db..09dee48fac 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1476,7 +1476,7 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMem=
oryRegion *iommu,
         error_report("device %02x.%02x.%x requires iommu notifier which =
is not "
                      "currently supported", as->bus_num, PCI_SLOT(as->de=
vfn),
                      PCI_FUNC(as->devfn));
-        exit(1);
+        return -EINVAL;
     }
     return 0;
 }
--=20
2.20.1


