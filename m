Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAC643C7E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlT-0003D1-25; Mon, 05 Dec 2022 23:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlQ-0003CF-DE
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:04 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlO-00034t-LT
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:04 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-14449b7814bso11174675fac.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SacWV5YLoc+ezygdmhALMN+CMHKPyRlUGybTvfOjJZg=;
 b=bTKerDwUSsdcLuOTxqoidm6iPAwEUW1j1WomXgPBB8SKeKPGeoeDR4jEluCtR2mf2G
 8wmHPxjhYEZ5FcH4T4seAZmSp8k1w6sLJ/+ZpHOSNwn+LP0KtBVbwo/UDtumvQKFlhuH
 HSlLztmN0/gECAxkB8SL4WDLQTkk3+2g2Z46hmhFN/coURGB77vYmSvLPTl6O4OPIPvN
 llU5tDZfzFNiH9LsRjt8s1cu/HPst6ZlC4UdthzIAKPF654M8kEoNPqnfCAInlmJ4Q9N
 S1/LqYLt9uXaGm5VBjA5JUiB0W6/ee4jo+v4Y5ECEz68tHV1JER9YNl4xVkzOKAozZGR
 3iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SacWV5YLoc+ezygdmhALMN+CMHKPyRlUGybTvfOjJZg=;
 b=keT+FiH5Upp7UPci1Escah1bn7hgAA0K4410dSKbWxGM53Ox897FzsHgTpaQrFUJhI
 P1VRVcmTeMNshNxRYPW2r3qghP+KIxxL14Sx1YMQQ2xp1Uyv0lLYc4llSXOKpgBZKHb2
 LWvkMK4gzt1jKKhVbadgvKZQLlYRfvtc2JXVD/Zazh5UI6i9170gAYq0rvqdMvPtQumD
 4GEzWHhJyr1HnBR1WaGHHqHyPyU3/etwM4Gtz/toZ7tLv9l5bDwgOm2RLR8hSCD9G6C3
 fy80qjwVb/Iqd87M2UbWH8go+oY9yFf0VlcM47Hls1w3ij6WTxyxjputS7/tSjv7toDO
 yGpg==
X-Gm-Message-State: ANoB5plk7fqksB5bukA9T8Kiwz6tm5gvWtbZ0tDywgzKoyvyV9X6r7Vi
 w1y25jQwZvPVsIGCcjRnnOuabcFemhj5/u5YLWw=
X-Google-Smtp-Source: AA0mqf5nvHBdpUg7XK36uj16zk7tljLuWF65NyEYZ3VBS/5MdmqTahezFrETPbwhbO5tBbtgEA1QyA==
X-Received: by 2002:a05:6870:9f0c:b0:13c:97e9:5d40 with SMTP id
 xl12-20020a0568709f0c00b0013c97e95d40mr38037384oab.42.1670301661224; 
 Mon, 05 Dec 2022 20:41:01 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.41.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:41:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] tcg/loongarch64: Implement movcond
Date: Mon,  5 Dec 2022 22:40:49 -0600
Message-Id: <20221206044051.322543-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.h         |  4 ++--
 tcg/loongarch64/tcg-target.c.inc     | 33 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 7b5a7a3f5d..172c107289 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -31,3 +31,4 @@ C_O1_I2(r, 0, rZ)
 C_O1_I2(r, rZ, ri)
 C_O1_I2(r, rZ, rJ)
 C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, rZ, rJ, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 086c90bda3..624fbe87ff 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -96,7 +96,7 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 
 /* optional instructions */
-#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
 #define TCG_TARGET_HAS_div2_i32         0
@@ -132,7 +132,7 @@ typedef enum {
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 /* 64-bit operations */
-#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_div2_i64         0
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 325ae3b5c9..2044897e36 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -596,6 +596,30 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
     }
 }
 
+static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg c1, tcg_target_long c2, bool const2,
+                            TCGReg v1, TCGReg v2)
+{
+    int tmpflags = tcg_out_setcond_int(s, cond, TCG_REG_TMP0, c1, c2, const2);
+    TCGReg t;
+
+    /* Standardize the test below to t != 0. */
+    if (tmpflags & SETCOND_INV) {
+        t = v1, v1 = v2, v2 = t;
+    }
+
+    t = tmpflags & ~SETCOND_FLAGS;
+    if (v1 == TCG_REG_ZERO) {
+        tcg_out_opc_masknez(s, ret, v2, t);
+    } else if (v2 == TCG_REG_ZERO) {
+        tcg_out_opc_maskeqz(s, ret, v1, t);
+    } else {
+        tcg_out_opc_masknez(s, TCG_REG_TMP2, v2, t); /* t ? 0 : v2 */
+        tcg_out_opc_maskeqz(s, TCG_REG_TMP1, v1, t); /* t ? v1 : 0 */
+        tcg_out_opc_or(s, ret, TCG_REG_TMP1, TCG_REG_TMP2);
+    }
+}
+
 /*
  * Branch helpers
  */
@@ -1537,6 +1561,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
+        tcg_out_movcond(s, args[5], a0, a1, a2, c2, args[3], args[4]);
+        break;
+
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_ldst(s, OPC_LD_B, a0, a1, a2);
@@ -1740,6 +1769,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_remu_i64:
         return C_O1_I2(r, rZ, rZ);
 
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
+        return C_O1_I4(r, rZ, rJ, rZ, rZ);
+
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


