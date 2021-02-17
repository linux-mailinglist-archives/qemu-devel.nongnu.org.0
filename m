Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8631E33F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:52:13 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWc8-0004hV-6q
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRP-0000Md-Be
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:07 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRM-0004gg-28
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:06 -0500
Received: by mail-pg1-x530.google.com with SMTP id 75so6129874pgf.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKMqug/uvk4wMgHy5mH79wL6sqcjbk2He0GvstqA04M=;
 b=dL6YCej4rLazl8wNXiSnLDcWaPzPpuCsNbwiQZ3zL12Xt1GBCE7bHsWq1setRHOr/J
 ODExBTvYB3lPHHeI/cNWe6YAu1MC1THz0wuPM4Yiyyb5v5KlBXSQHvr6uLOXoqj/Cxom
 haAZu401O93Ds0jss2QfxmvNC35QihNd/Er5DgYXke49vsj6poTI8BXsZuN2TgVnMjq6
 t9RZbu7VXua/P3YVRwf7tg29J80M3gy6J5hq+RULTj3nxrIzzs+V41f2vJeKs1jyYD56
 Lc7dkfY4GqXfNvVNRhMZZluhfbFt7ZtVPSoRr+T+B7Izo9Vn+tZ6vb+X1xJa+Dvg6QTy
 9hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKMqug/uvk4wMgHy5mH79wL6sqcjbk2He0GvstqA04M=;
 b=k9zgsrFk+4Lmhqk0jAcuMfL7QaXs3IA4l/3mOXl0f009fLvqxfzkJDObmdE/nEzlh1
 O/PJenM5Ra1bBYgy8EpWzfNjxOo6qOQcvGx7TxfBjxNljymQt+3ivA/rWwxbeqtqghxn
 msqUG4NIl94dWL1+wb9VWeoYG2WOOgG2F3gL5kWhkXtZ4pf4Xod9hLoa1rUQEZ2kaADW
 zqf9qBAnC95CgncoSCSAwGcgrC4JtJte1cchiW6uRV8h+MSAqBy1Kq+Q4lhNCqj7g9OA
 tnBUFU+OAvIKvWtQj4ChjfCKWnfY5QEKiMgYgYkEsT/ujVZqfumU3DLqBAh9cEytqa7b
 iXxg==
X-Gm-Message-State: AOAM531bSob4nDJNdGdIGNdBM2GEl6jjucsjb3a6nehjnhnec6InFOga
 LEU4BdEbEN2wL8sq2smFejticZqfJ62Rtw==
X-Google-Smtp-Source: ABdhPJz5u6kzS0i+S/0p+Btj+f5hlfPywuEdHV/eBDV6pvxqDp6CXkfazrDR7wYYcnvQBpNz2M5x4w==
X-Received: by 2002:aa7:92d9:0:b029:1bb:b6de:c872 with SMTP id
 k25-20020aa792d90000b02901bbb6dec872mr1577503pfa.68.1613605262469; 
 Wed, 17 Feb 2021 15:41:02 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/35] Hexagon (target/hexagon/conv_emu.[ch]) utility functions
Date: Wed, 17 Feb 2021 15:40:05 -0800
Message-Id: <20210217234023.1742406-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/conv_emu.h |  31 +++++++
 target/hexagon/conv_emu.c | 177 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+)
 create mode 100644 target/hexagon/conv_emu.h
 create mode 100644 target/hexagon/conv_emu.c

diff --git a/target/hexagon/conv_emu.h b/target/hexagon/conv_emu.h
new file mode 100644
index 0000000000..cade9de91f
--- /dev/null
+++ b/target/hexagon/conv_emu.h
@@ -0,0 +1,31 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_CONV_EMU_H
+#define HEXAGON_CONV_EMU_H
+
+uint64_t conv_sf_to_8u(float32 in, float_status *fp_status);
+uint32_t conv_sf_to_4u(float32 in, float_status *fp_status);
+int64_t conv_sf_to_8s(float32 in, float_status *fp_status);
+int32_t conv_sf_to_4s(float32 in, float_status *fp_status);
+
+uint64_t conv_df_to_8u(float64 in, float_status *fp_status);
+uint32_t conv_df_to_4u(float64 in, float_status *fp_status);
+int64_t conv_df_to_8s(float64 in, float_status *fp_status);
+int32_t conv_df_to_4s(float64 in, float_status *fp_status);
+
+#endif
diff --git a/target/hexagon/conv_emu.c b/target/hexagon/conv_emu.c
new file mode 100644
index 0000000000..3985b1032a
--- /dev/null
+++ b/target/hexagon/conv_emu.c
@@ -0,0 +1,177 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "fpu/softfloat.h"
+#include "macros.h"
+#include "conv_emu.h"
+
+#define LL_MAX_POS 0x7fffffffffffffffULL
+#define MAX_POS 0x7fffffffU
+
+static uint64_t conv_f64_to_8u_n(float64 in, int will_negate,
+                                 float_status *fp_status)
+{
+    uint8_t sign = float64_is_neg(in);
+    if (float64_is_infinity(in)) {
+        float_raise(float_flag_invalid, fp_status);
+        if (float64_is_neg(in)) {
+            return 0ULL;
+        } else {
+            return ~0ULL;
+        }
+    }
+    if (float64_is_any_nan(in)) {
+        float_raise(float_flag_invalid, fp_status);
+        return ~0ULL;
+    }
+    if (float64_is_zero(in)) {
+        return 0;
+    }
+    if (sign) {
+        float_raise(float_flag_invalid, fp_status);
+        return 0;
+    }
+    if (float64_lt(in, float64_half, fp_status)) {
+        /* Near zero, captures large fracshifts, denorms, etc */
+        float_raise(float_flag_inexact, fp_status);
+        switch (get_float_rounding_mode(fp_status)) {
+        case float_round_down:
+            if (will_negate) {
+                return 1;
+            } else {
+                return 0;
+            }
+        case float_round_up:
+            if (!will_negate) {
+                return 1;
+            } else {
+                return 0;
+            }
+        default:
+            return 0;    /* nearest or towards zero */
+        }
+    }
+    return float64_to_uint64(in, fp_status);
+}
+
+static void clr_float_exception_flags(uint8_t flag, float_status *fp_status)
+{
+    uint8_t flags = fp_status->float_exception_flags;
+    flags &= ~flag;
+    set_float_exception_flags(flags, fp_status);
+}
+
+static uint32_t conv_df_to_4u_n(float64 fp64, int will_negate,
+                                float_status *fp_status)
+{
+    uint64_t tmp;
+    tmp = conv_f64_to_8u_n(fp64, will_negate, fp_status);
+    if (tmp > 0x00000000ffffffffULL) {
+        clr_float_exception_flags(float_flag_inexact, fp_status);
+        float_raise(float_flag_invalid, fp_status);
+        return ~0U;
+    }
+    return (uint32_t)tmp;
+}
+
+uint64_t conv_df_to_8u(float64 in, float_status *fp_status)
+{
+    return conv_f64_to_8u_n(in, 0, fp_status);
+}
+
+uint32_t conv_df_to_4u(float64 in, float_status *fp_status)
+{
+    return conv_df_to_4u_n(in, 0, fp_status);
+}
+
+int64_t conv_df_to_8s(float64 in, float_status *fp_status)
+{
+    uint8_t sign = float64_is_neg(in);
+    uint64_t tmp;
+    if (float64_is_any_nan(in)) {
+        float_raise(float_flag_invalid, fp_status);
+        return -1;
+    }
+    if (sign) {
+        float64 minus_fp64 = float64_abs(in);
+        tmp = conv_f64_to_8u_n(minus_fp64, 1, fp_status);
+    } else {
+        tmp = conv_f64_to_8u_n(in, 0, fp_status);
+    }
+    if (tmp > (LL_MAX_POS + sign)) {
+        clr_float_exception_flags(float_flag_inexact, fp_status);
+        float_raise(float_flag_invalid, fp_status);
+        tmp = (LL_MAX_POS + sign);
+    }
+    if (sign) {
+        return -tmp;
+    } else {
+        return tmp;
+    }
+}
+
+int32_t conv_df_to_4s(float64 in, float_status *fp_status)
+{
+    uint8_t sign = float64_is_neg(in);
+    uint64_t tmp;
+    if (float64_is_any_nan(in)) {
+        float_raise(float_flag_invalid, fp_status);
+        return -1;
+    }
+    if (sign) {
+        float64 minus_fp64 = float64_abs(in);
+        tmp = conv_f64_to_8u_n(minus_fp64, 1, fp_status);
+    } else {
+        tmp = conv_f64_to_8u_n(in, 0, fp_status);
+    }
+    if (tmp > (MAX_POS + sign)) {
+        clr_float_exception_flags(float_flag_inexact, fp_status);
+        float_raise(float_flag_invalid, fp_status);
+        tmp = (MAX_POS + sign);
+    }
+    if (sign) {
+        return -tmp;
+    } else {
+        return tmp;
+    }
+}
+
+uint64_t conv_sf_to_8u(float32 in, float_status *fp_status)
+{
+    float64 fp64 = float32_to_float64(in, fp_status);
+    return conv_df_to_8u(fp64, fp_status);
+}
+
+uint32_t conv_sf_to_4u(float32 in, float_status *fp_status)
+{
+    float64 fp64 = float32_to_float64(in, fp_status);
+    return conv_df_to_4u(fp64, fp_status);
+}
+
+int64_t conv_sf_to_8s(float32 in, float_status *fp_status)
+{
+    float64 fp64 = float32_to_float64(in, fp_status);
+    return conv_df_to_8s(fp64, fp_status);
+}
+
+int32_t conv_sf_to_4s(float32 in, float_status *fp_status)
+{
+    float64 fp64 = float32_to_float64(in, fp_status);
+    return conv_df_to_4s(fp64, fp_status);
+}
-- 
2.25.1


