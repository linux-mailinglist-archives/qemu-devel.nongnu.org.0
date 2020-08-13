Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9832434A7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 09:16:15 +0200 (CEST)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k67T8-0003Ef-7F
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 03:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k67Rh-0001tH-QR
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 03:14:41 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:50529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k67Rf-0007cy-B7
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 03:14:41 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06529134|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.106841-0.00274049-0.890419;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07447; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=6; RT=6; SR=0; TI=SMTPD_---.IGxBKGW_1597302868; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.IGxBKGW_1597302868)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 13 Aug 2020 15:14:30 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] fpu/softfloat: Define misc operations for bfloat16
Date: Thu, 13 Aug 2020 15:14:21 +0800
Message-Id: <20200813071421.2509-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813071421.2509-1-zhiwei_liu@c-sky.com>
References: <20200813071421.2509-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:14:30
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, aurelien@aurel32.net,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.inc.c | 38 +++++++++++++++++++++++++++++++
 include/fpu/softfloat.h        | 41 ++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/fpu/softfloat-specialize.inc.c b/fpu/softfloat-specialize.inc.c
index 034d18199c..1b6c4e47f8 100644
--- a/fpu/softfloat-specialize.inc.c
+++ b/fpu/softfloat-specialize.inc.c
@@ -259,6 +259,25 @@ bool float16_is_quiet_nan(float16 a_, float_status *status)
 #endif
 }
 
+/*----------------------------------------------------------------------------
+| Returns 1 if the bfloat16 value `a' is a quiet
+| NaN; otherwise returns 0.
+*----------------------------------------------------------------------------*/
+
+int bfloat16_is_quiet_nan(bfloat16 a_, float_status *status)
+{
+#ifdef NO_SIGNALING_NANS
+    return bfloat16_is_any_nan(a_);
+#else
+    uint16_t a = a_;
+    if (snan_bit_is_one(status)) {
+        return (((a >> 6) & 0x1FF) == 0x1FE) && (a & 0x3F);
+    } else {
+        return ((a >> 6) & 0x1FF) == 0x1FF;
+    }
+#endif
+}
+
 /*----------------------------------------------------------------------------
 | Returns 1 if the half-precision floating-point value `a' is a signaling
 | NaN; otherwise returns 0.
@@ -278,6 +297,25 @@ bool float16_is_signaling_nan(float16 a_, float_status *status)
 #endif
 }
 
+/*----------------------------------------------------------------------------
+| Returns 1 if the bfloat16 value `a' is a signaling
+| NaN; otherwise returns 0.
+*----------------------------------------------------------------------------*/
+
+int bfloat16_is_signaling_nan(bfloat16 a_, float_status *status)
+{
+#ifdef NO_SIGNALING_NANS
+    return 0;
+#else
+    uint16_t a = a_;
+    if (snan_bit_is_one(status)) {
+        return ((a >> 6) & 0x1FF) == 0x1FF;
+    } else {
+        return (((a >> 6) & 0x1FF) == 0x1FE) && (a & 0x3F);
+    }
+#endif
+}
+
 /*----------------------------------------------------------------------------
 | Returns 1 if the single-precision floating-point value `a' is a quiet
 | NaN; otherwise returns 0.
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 4f72665b02..d7ce3e3483 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -372,6 +372,47 @@ static inline float16 float16_set_sign(float16 a, int sign)
 #define float16_three make_float16(0x4200)
 #define float16_infinity make_float16(0x7c00)
 
+static inline int bfloat16_is_any_nan(bfloat16 a)
+{
+    return ((a & ~0x8000) > 0x7F80);
+}
+
+static inline int bfloat16_is_neg(bfloat16 a)
+{
+    return a >> 15;
+}
+
+static inline int bfloat16_is_infinity(bfloat16 a)
+{
+    return (a & 0x7fff) == 0x7F80;
+}
+
+static inline int bfloat16_is_zero(bfloat16 a)
+{
+    return (a & 0x7fff) == 0;
+}
+
+static inline int bfloat16_is_zero_or_denormal(bfloat16 a)
+{
+    return (a & 0x7F80) == 0;
+}
+
+static inline bfloat16 bfloat16_abs(bfloat16 a)
+{
+    /* Note that abs does *not* handle NaN specially, nor does
+     * it flush denormal inputs to zero.
+     */
+    return a & 0x7fff;
+}
+
+static inline bfloat16 bfloat16_chs(bfloat16 a)
+{
+    /* Note that chs does *not* handle NaN specially, nor does
+     * it flush denormal inputs to zero.
+     */
+    return a ^ 0x8000;
+}
+
 static inline bfloat16 bfloat16_set_sign(bfloat16 a, int sign)
 {
     return (a & 0x7fff) | (sign << 15);
-- 
2.23.0


