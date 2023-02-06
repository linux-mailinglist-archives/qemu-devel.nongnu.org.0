Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2F68C4E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP5Lp-000323-Cy; Mon, 06 Feb 2023 12:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pP5Ln-0002xT-23
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:32:19 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pP5Ll-0005vP-Fe
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:32:18 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P9YB033cBz6J7dZ;
 Tue,  7 Feb 2023 01:27:52 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 6 Feb 2023 17:32:15 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v4 08/10] qemu/bswap: Add const_le64()
Date: Mon, 6 Feb 2023 17:28:14 +0000
Message-ID: <20230206172816.8201-9-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230206172816.8201-1-Jonathan.Cameron@huawei.com>
References: <20230206172816.8201-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ira Weiny <ira.weiny@intel.com>

Gcc requires constant versions of cpu_to_le* calls.

Add a 64 bit version.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v2: Update comment (Philippe)
---
 include/qemu/bswap.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 3cbe52246b..eb3bcf2520 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -129,11 +129,20 @@ CPU_CONVERT(le, 32, uint32_t)
 CPU_CONVERT(le, 64, uint64_t)
 
 /*
- * Same as cpu_to_le{16,32}, except that gcc will figure the result is
+ * Same as cpu_to_le{16,32,64}, except that gcc will figure the result is
  * a compile-time constant if you pass in a constant.  So this can be
  * used to initialize static variables.
  */
 #if HOST_BIG_ENDIAN
+# define const_le64(_x)                          \
+    ((((_x) & 0x00000000000000ffU) << 56) |      \
+     (((_x) & 0x000000000000ff00U) << 40) |      \
+     (((_x) & 0x0000000000ff0000U) << 24) |      \
+     (((_x) & 0x00000000ff000000U) <<  8) |      \
+     (((_x) & 0x000000ff00000000U) >>  8) |      \
+     (((_x) & 0x0000ff0000000000U) >> 24) |      \
+     (((_x) & 0x00ff000000000000U) >> 40) |      \
+     (((_x) & 0xff00000000000000U) >> 56))
 # define const_le32(_x)                          \
     ((((_x) & 0x000000ffU) << 24) |              \
      (((_x) & 0x0000ff00U) <<  8) |              \
@@ -143,6 +152,7 @@ CPU_CONVERT(le, 64, uint64_t)
     ((((_x) & 0x00ff) << 8) |                    \
      (((_x) & 0xff00) >> 8))
 #else
+# define const_le64(_x) (_x)
 # define const_le32(_x) (_x)
 # define const_le16(_x) (_x)
 #endif
-- 
2.37.2


