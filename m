Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9E59720F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:00:03 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKWY-0003KW-S8
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOKV9-0000d4-6O
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:58:35 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOKV7-0000mP-Iz
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:58:34 -0400
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M7B3G11lSz67bZ4;
 Wed, 17 Aug 2022 22:58:18 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 16:58:31 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 15:58:31 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, "Shameerali Kolothum
 Thodi" <shameerali.kolothum.thodi@huawei.com>, Ben Widawsky
 <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/3] hw/cxl: Add stub write function for RO MemoryRegionOps
 entries.
Date: Wed, 17 Aug 2022 15:57:57 +0100
Message-ID: <20220817145759.32603-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220817145759.32603-1-Jonathan.Cameron@huawei.com>
References: <20220817145759.32603-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

There is no checking on the availability of a write callback.
Hence QEMU crashes if a write does occur to one of these regions.

Discovered whilst chasing a Linux kernel bug that incorrectly
wrote into one of these regions.

Fixes: 6364adacdf ("hw/cxl/device: Implement the CAP array (8.2.8.1-2)")
Reported-by: Bobo WL <lmw.bobo@gmail.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-device-utils.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 687759b301..83ce7a8270 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -141,9 +141,15 @@ static uint64_t mdev_reg_read(void *opaque, hwaddr offset, unsigned size)
     return retval;
 }
 
+static void ro_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    /* Many register sets are read only */
+}
+
 static const MemoryRegionOps mdev_ops = {
     .read = mdev_reg_read,
-    .write = NULL, /* memory device register is read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -173,7 +179,7 @@ static const MemoryRegionOps mailbox_ops = {
 
 static const MemoryRegionOps dev_ops = {
     .read = dev_reg_read,
-    .write = NULL, /* status register is read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -188,7 +194,7 @@ static const MemoryRegionOps dev_ops = {
 
 static const MemoryRegionOps caps_ops = {
     .read = caps_reg_read,
-    .write = NULL, /* caps registers are read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-- 
2.32.0


