Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F037D2B384
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 13:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVEAi-00018a-2K
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 07:52:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE26-0003Hg-Dx
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE25-0003Ut-In
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE23-0003Su-Ko; Mon, 27 May 2019 07:43:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDD4B3087939;
	Mon, 27 May 2019 11:43:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BECD85D962;
	Mon, 27 May 2019 11:43:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:42 +0200
Message-Id: <20190527114203.2762-7-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 27 May 2019 11:43:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 06/27] memory: add IOMMU_ATTR_MSI_TRANSLATE
 IOMMU memory region attribute
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

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLAT=
E
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 352a00169f..146a6096da 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -206,6 +206,7 @@ struct MemoryRegionOps {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
=20
 /**
--=20
2.20.1


