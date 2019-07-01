Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730242B3AC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 13:56:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVEEd-0004RQ-JY
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 07:56:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2y-000431-DF
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2x-00044C-G7
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE2v-00042V-Gh; Mon, 27 May 2019 07:44:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB9723079B83;
	Mon, 27 May 2019 11:44:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2C275D962;
	Mon, 27 May 2019 11:43:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:50 +0200
Message-Id: <20190527114203.2762-15-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 27 May 2019 11:44:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 14/27] hw/arm/smmuv3: Fill the IOTLBEntry
 arch_id on NH_VA invalidation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8db605adab..b6eb61304d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -822,6 +822,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova =3D iova;
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
+    entry.arch_id =3D asid;
=20
     memory_region_iotlb_notify_one(n, &entry);
 }
--=20
2.20.1


