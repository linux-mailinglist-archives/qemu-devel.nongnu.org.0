Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DBB191C29
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 22:46:58 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGrNx-0001sI-Km
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 17:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1jGrLA-0007NZ-Ln
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 17:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1jGrL9-0004vn-MZ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 17:44:04 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1jGrL9-0004vX-Gb
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 17:44:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7a7f150000>; Tue, 24 Mar 2020 14:43:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 24 Mar 2020 14:44:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 24 Mar 2020 14:44:02 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 21:44:02 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 24 Mar 2020 21:43:56 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v16 QEMU 12/16] memory: Set DIRTY_MEMORY_MIGRATION when IOMMU
 is enabled
Date: Wed, 25 Mar 2020 02:39:10 +0530
Message-ID: <1585084154-29461-13-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1585084154-29461-1-git-send-email-kwankhede@nvidia.com>
References: <1585084154-29461-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585086229; bh=5enwOLQUs3mOZ9vXJXPKczJKjLtl0ueXpgpQhr+I2rU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=Q7b+HjzhcpRn3ZLnwp8cVvRgG/GXdobIfntleZocZhcuQnN736DZIa9BviBpkQjoy
 HVsC9R37OE6aHaLrFUNk0p87xF5BsCE5uvZqAiGkUtmZpVFU88IPmq4XPQagYteYdX
 DphOTDdqaq0qqx7iZgirV27xB663bD/Q4kw4/gw8hbgMYX1ocAauImG0GHDc4KP0Ca
 SnMYSMK1PXnSCncNyef5zUjmvEWvi0MD6kQh5qRPDHksYZSq8npG3CEQPXnhKHhoB+
 ejiBF/7CiFnwGEhRyr5aeFwF0rt4DWyrcLTKTbBWh07aSXum57Rm8Hnm+E23dFxQLc
 7+HGKYnsNqflw==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 216.228.121.65
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index acb7546971c3..285ca2ed6dd9 100644
--- a/memory.c
+++ b/memory.c
@@ -1788,7 +1788,7 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
 uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
 {
     uint8_t mask = mr->dirty_log_mask;
-    if (global_dirty_log && mr->ram_block) {
+    if (global_dirty_log && (mr->ram_block || memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
     return mask;
-- 
2.7.0


