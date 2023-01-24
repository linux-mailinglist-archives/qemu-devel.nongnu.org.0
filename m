Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFA678DEC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:07:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gr-0008TK-CF; Mon, 23 Jan 2023 21:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gp-0008Sp-5v
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:35 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gn-0003se-3N
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:34 -0500
Received: by mail-pj1-x102f.google.com with SMTP id o13so13450247pjg.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0mmDm29bhUF/un9qqegtPH06CTbT3PUUr5zUFrPrVJw=;
 b=VhtfjV0VWIgq4balisUgNQAYRQyAc3JvpXii6AUxIXqZSFgl4o/BnANQRepR47G34L
 154d4UvF/8AG4QbmUJLaQ4RYB3fI7HTN3kW3Lk/UuT+4z2sQloiF5Ie9WPtXhddFh90l
 81570mLLTgNogySep/PIMOO3m2BDJvqiSoNKnD73aN0jS2HakFlkwfXDgIjMggsY3Vqv
 tnrCGzjj6q8YbN2PbWKJ2UhvNrkF7T+tGrRtAhPRmRDeXBQFbQ4FjazmQfE9eqy+tat6
 Km+dtFD5UTaIP2YEru1UlTQJhm6aVglL31IFU3o5GodfTy/ynzekcQI7igiajhwD4Vyx
 f3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mmDm29bhUF/un9qqegtPH06CTbT3PUUr5zUFrPrVJw=;
 b=HphWvpsUkNyJS13UUlWZssFykYK++U0BE105u4W5YbaoTTaBeVWueqmolsICk9kJp/
 u6x0eT3SOodkU4dzFIDLk53G3l2IWMNdFQ//wgMnWaORrSd/fcSkzU2zzTF/yMuXQoC7
 SYe9IDUAh3YiiDD0HvZeZF+oXZA/OZr64oDzBa1B+YaBLNUlxv6DxrauhwR2j5VMSljk
 Ici36WRFBbzyr3Ac405jxSZrsRMF8lRBwr91R+CYQHG6/v3Q+dgkmIQKMBpVWSq4/KLf
 89s9WsGBANhD36v0rAuhI8ZJNzSmlINLgSUM5G3PPUji7Z/OekYSshO8kJcqdIT1RTdf
 /EiA==
X-Gm-Message-State: AFqh2kpFBpBgSN4F/lTsOYATSoowMdHRfPcBHyILq/mqO6VBkSpVXuyA
 DsczrKn3VQNTefrvgYhgFSoroLdaNQytPCTC
X-Google-Smtp-Source: AMrXdXvb8pW5ML76UrvfElUOUCgIuH4atYtWBzThHZJZYHnGkHUnjwpMT5ypnY1hOrdHVM5Jw17mKQ==
X-Received: by 2002:a17:90a:aa12:b0:229:14ec:a3b9 with SMTP id
 k18-20020a17090aaa1200b0022914eca3b9mr27178611pjq.22.1674525932280; 
 Mon, 23 Jan 2023 18:05:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PULL v2 13/15] tcg/loongarch64: Implement movcond
Date: Mon, 23 Jan 2023 16:05:05 -1000
Message-Id: <20230124020507.3732200-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reviewed-by: WANG Xuerui <git@xen0n.name>
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
index 1c3e48d662..533a539ce9 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -97,7 +97,7 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
-#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
 #define TCG_TARGET_HAS_div2_i32         0
@@ -133,7 +133,7 @@ typedef enum {
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 /* 64-bit operations */
-#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_div2_i64         0
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index ccc1c0f392..29d75c80eb 100644
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
@@ -1538,6 +1562,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1741,6 +1770,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


