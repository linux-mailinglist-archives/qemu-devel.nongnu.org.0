Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF0A653B46
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8u-0007qn-3z; Wed, 21 Dec 2022 23:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8l-0007oz-DO
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:07 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8j-00015K-L8
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683105; x=1703219105;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=UQnornUfT/vaDjeF5Z6CteaB75obyZRj7zvuhg79FR0=;
 b=gKOtYzYRFhGin/9P84W6WPaC463I6TSFwQDxTRLukBFte6sjny4fyJlE
 t80BQS3PV8kJccioBh5lionLY9TT2K1JntcDWW6wg7KCfiCbukFK5DZdX
 ffUhOmc5sSSp0aRl6Aiv4BT3NbcK8eLQsIYCDPrYGq8Pf76xCaTMk13Xh
 d2/SMdlEMBvayU9iGIXNJ24BlKWLL1KCpQgcPCsWuhCoGEYc5wTUrZNHx
 fdrDKiUc7cgiv6j2oD/dbKwBA/1ta/aRCLtEufOuBR2rYnnO+AYN8UHLO
 Hj5vXJW0UriOvwyByvy/2s0VE30dD277XAJebo3XDRerwVbykPrF6cbr2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957633"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957633"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:25:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733212"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733212"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:25:00 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:37 -0800
Subject: [PATCH v2 7/8] bswap: Add the ability to store to an unaligned 24 bit
 field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-7-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=2387;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=UQnornUfT/vaDjeF5Z6CteaB75obyZRj7zvuhg79FR0=;
 b=bW3809h1Txum7nDYbsKD/2LjWN3Nt7V86syYEfxpIeK26nBUMDZsF5aVinGGfsLwWD7NkRKvmPB4
 rfqk7tx1DINr9J5m9o1egvcmFluIEEzXsehen96H+4IcxbeqWlqJ
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CXL has 24 bit unaligned fields which need to be stored to.  CXL is
specified as little endian.

Define st24_le_p() and the supporting functions to store such a field
from a 32 bit host native value.

The use of b, w, l, q as the size specifier is limiting.  So "24" was
used for the size part of the function name.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/qemu/bswap.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index e1eca22f2548..8af4d4a75eb6 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -25,6 +25,13 @@ static inline uint16_t bswap16(uint16_t x)
     return bswap_16(x);
 }
 
+static inline uint32_t bswap24(uint32_t x)
+{
+    return (((x & 0x000000ffU) << 16) |
+            ((x & 0x0000ff00U) <<  0) |
+            ((x & 0x00ff0000U) >> 16));
+}
+
 static inline uint32_t bswap32(uint32_t x)
 {
     return bswap_32(x);
@@ -43,6 +50,13 @@ static inline uint16_t bswap16(uint16_t x)
             ((x & 0xff00) >> 8));
 }
 
+static inline uint32_t bswap24(uint32_t x)
+{
+    return (((x & 0x000000ffU) << 16) |
+            ((x & 0x0000ff00U) <<  0) |
+            ((x & 0x00ff0000U) >> 16));
+}
+
 static inline uint32_t bswap32(uint32_t x)
 {
     return (((x & 0x000000ffU) << 24) |
@@ -72,6 +86,11 @@ static inline void bswap16s(uint16_t *s)
     *s = bswap16(*s);
 }
 
+static inline void bswap24s(uint32_t *s)
+{
+    *s = bswap24(*s);
+}
+
 static inline void bswap32s(uint32_t *s)
 {
     *s = bswap32(*s);
@@ -233,6 +252,7 @@ CPU_CONVERT(le, 64, uint64_t)
  * size is:
  *   b: 8 bits
  *   w: 16 bits
+ *   24: 24 bits
  *   l: 32 bits
  *   q: 64 bits
  *
@@ -305,6 +325,11 @@ static inline void stw_he_p(void *ptr, uint16_t v)
     __builtin_memcpy(ptr, &v, sizeof(v));
 }
 
+static inline void st24_he_p(void *ptr, uint32_t v)
+{
+    __builtin_memcpy(ptr, &v, 3);
+}
+
 static inline int ldl_he_p(const void *ptr)
 {
     int32_t r;
@@ -354,6 +379,11 @@ static inline void stw_le_p(void *ptr, uint16_t v)
     stw_he_p(ptr, le_bswap(v, 16));
 }
 
+static inline void st24_le_p(void *ptr, uint32_t v)
+{
+    st24_he_p(ptr, le_bswap(v, 24));
+}
+
 static inline void stl_le_p(void *ptr, uint32_t v)
 {
     stl_he_p(ptr, le_bswap(v, 32));

-- 
2.38.1

