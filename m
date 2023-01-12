Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF856670B7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuqH-0005Sr-Nr; Thu, 12 Jan 2023 05:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFuqF-0005Oh-Fq
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:29:51 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFuqD-0001DR-Q7
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:29:51 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nt10n15ntz6J6JQ;
 Thu, 12 Jan 2023 18:26:01 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 12 Jan 2023 10:29:47 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v2 6/8] qemu/bswap: Add const_le64()
Date: Thu, 12 Jan 2023 10:26:42 +0000
Message-ID: <20230112102644.27830-7-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
References: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v2: Update comment (Philippe)

 include/qemu/bswap.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 346d05f2aa..c5cb9686c5 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -182,11 +182,20 @@ CPU_CONVERT(le, 32, uint32_t)
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
@@ -196,6 +205,7 @@ CPU_CONVERT(le, 64, uint64_t)
     ((((_x) & 0x00ff) << 8) |                    \
      (((_x) & 0xff00) >> 8))
 #else
+# define const_le64(_x) (_x)
 # define const_le32(_x) (_x)
 # define const_le16(_x) (_x)
 #endif
-- 
2.37.2


