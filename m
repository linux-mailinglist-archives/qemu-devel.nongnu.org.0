Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEC29294B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 16:28:20 +0200 (CEST)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUW95-0005YL-DB
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 10:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUW4Y-0001b5-F1; Mon, 19 Oct 2020 10:23:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5256 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUW4W-0004PK-GK; Mon, 19 Oct 2020 10:23:38 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3DB8E8E8725BB77AFC3B;
 Mon, 19 Oct 2020 22:23:31 +0800 (CST)
Received: from DESKTOP-80C7KIU.china.huawei.com (10.174.187.210) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 22:23:25 +0800
From: Zhengui li <lizhengui@huawei.com>
To: <pbonzini@redhat.com>, <stefanha@redhat.com>, <mreitz@redhat.com>,
 <kwolf@redhat.com>
Subject: [PATCH] virtio-iommu: fix incorrect print type
Date: Mon, 19 Oct 2020 14:23:23 +0000
Message-ID: <1603117403-17628-1-git-send-email-lizhengui@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=lizhengui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 09:30:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: xieyingtai@huawei.com, lizhengui@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type of input variable is unsigned int
while the printer type is int. So fix incorrect print type.

Signed-off-by: Zhengui li <lizhengui@huawei.com>
---
 hw/virtio/virtio-iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 21ec63b..bd6ce44 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -632,7 +632,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
         if (!bypass_allowed) {
-            error_report_once("%s sid=%d is not known!!", __func__, sid);
+            error_report_once("%s sid=%u is not known!!", __func__, sid);
             virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
                                       VIRTIO_IOMMU_FAULT_F_ADDRESS,
                                       sid, addr);
@@ -679,7 +679,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                    (void **)&mapping_key,
                                    (void **)&mapping_value);
     if (!found) {
-        error_report_once("%s no mapping for 0x%"PRIx64" for sid=%d",
+        error_report_once("%s no mapping for 0x%"PRIx64" for sid=%u",
                           __func__, addr, sid);
         virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
                                   VIRTIO_IOMMU_FAULT_F_ADDRESS,
@@ -695,7 +695,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     flags = read_fault ? VIRTIO_IOMMU_FAULT_F_READ : 0;
     flags |= write_fault ? VIRTIO_IOMMU_FAULT_F_WRITE : 0;
     if (flags) {
-        error_report_once("%s permission error on 0x%"PRIx64"(%d): allowed=%d",
+        error_report_once("%s permission error on 0x%"PRIx64"(%d): allowed=%u",
                           __func__, addr, flag, mapping_value->flags);
         flags |= VIRTIO_IOMMU_FAULT_F_ADDRESS;
         virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
-- 
1.8.3.1


