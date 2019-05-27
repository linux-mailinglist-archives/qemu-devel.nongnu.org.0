Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE582B45E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 14:06:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVEP0-0004Q2-9E
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 08:06:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4F-0005D7-2H
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE46-0005F7-8z
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE3r-00054r-6w; Mon, 27 May 2019 07:45:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92CFF309265A;
	Mon, 27 May 2019 11:45:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DCE65D962;
	Mon, 27 May 2019 11:44:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:59 +0200
Message-Id: <20190527114203.2762-24-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 27 May 2019 11:45:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 23/27] memory: Introduce IOMMU Memory Region
 inject_faults API
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

This new API allows to inject @count iommu_faults into
the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 25 +++++++++++++++++++++++++
 memory.c              | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9f107ebedb..593ee7fc50 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -57,6 +57,8 @@ struct MemoryRegionMmio {
     CPUWriteMemoryFunc *write[3];
 };
=20
+struct iommu_fault;
+
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
=20
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
@@ -400,6 +402,19 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
+
+    /*
+     * Inject @count faults into the IOMMU memory region
+     *
+     * Optional method: if this method is not provided, then
+     * memory_region_injection_faults() will return -ENOENT
+     *
+     * @iommu: the IOMMU memory region to inject the faults in
+     * @count: number of faults to inject
+     * @buf: fault buffer
+     */
+    int (*inject_faults)(IOMMUMemoryRegion *iommu, int count,
+                         struct iommu_fault *buf);
 } IOMMUMemoryRegionClass;
=20
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1216,6 +1231,16 @@ int memory_region_iommu_attrs_to_index(IOMMUMemory=
Region *iommu_mr,
  */
 int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
=20
+/**
+ * memory_region_inject_faults : inject @count faults stored in @buf
+ *
+ * @iommu_mr: the IOMMU memory region
+ * @count: number of faults to be injected
+ * @buf: buffer containing the faults
+ */
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf);
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/memory.c b/memory.c
index d90d8ea67e..16996ef14e 100644
--- a/memory.c
+++ b/memory.c
@@ -2038,6 +2038,16 @@ int memory_region_iommu_num_indexes(IOMMUMemoryReg=
ion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
=20
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf)
+{
+    IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_GET_CLASS(iommu=
_mr);
+    if (!imrc->inject_faults) {
+        return -ENOENT;
+    }
+    return imrc->inject_faults(iommu_mr, count, buf);
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask =3D 1 << client;
--=20
2.20.1


