Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBA670FAA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:12:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzP-00027F-0F; Tue, 17 Jan 2023 20:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzN-00024S-DH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:41 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzL-0002FV-Nk
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:41 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 gz9-20020a17090b0ec900b002290bda1b07so635809pjb.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=di6N0vCGrpxWgO4hD16WY7qQUgaqSSofB9q2lj/lJG4=;
 b=tmIYp5OIpIWHVYofD6pgKSZYCAKeY0nUi6RiH0NXATZfGILkug6rO0X2feiuT4386p
 ZYA7Sevznhv2b4ie8X2Y0VJXHO3R8VR1TfL0hyYK9k82XsEX1Ttn5JDk/483sdDx9Lx+
 3cNHH7ko7eODorOl1Lx2onFdBUyRHi0SP+xqKVl/oZIhZH7nUhOM2vOcAZZrdZijBfPe
 9SIW3wiyPQFypdU9/CmxMT7p/fB8aMYauqAGZCzW62+0hxJyOCZEfQayl9MQxOvtpObs
 cNn9My7H1INYU2yoPWObXchjO1yUzelQ+xSoogqxuQzs+k95ZeTwpa1uNiguqamq3sv3
 w7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=di6N0vCGrpxWgO4hD16WY7qQUgaqSSofB9q2lj/lJG4=;
 b=MUF9l4nX9E6Q8hYAXGci4p0Nkd8LF9c88TePJGrsw1z5MReqHInkSPCTQPVywAEig5
 CitNRcFF1LziHizhjY9IonE6FsMO98tx7bIGyB9VhgT0QQDaWSVTT31z3wK75boOX+eb
 p1ywCsippGk5zw40AI+Xkc4tpow3ezxs+lXQn6I2qS6ysjkV9m0zJnviKZ6pJWg/w+FV
 2rbjiuPoH/CFX+paVfRUvw1XoilRXG8dO8rY5Ulty18zRSLKqHtapNaA4gkpQujl30Gb
 +rvloz3Ffof2Aft+VnU8Hmvdn2X3hcD9DNKo7+oiKoGjZGyAb9hryD+pslsTcFaSFb2N
 8u7g==
X-Gm-Message-State: AFqh2kpmghJNopKW66i/PDEOIY2LZ9mrB4LVpX3zThVF0aR3ERktxg/5
 JR+d4N/dBsVBkILhhv89zW3GGZprC4GXPGdu
X-Google-Smtp-Source: AMrXdXvLR2r3HUgS/86yMnv9PO9+XmOSL6BywJB7rMXlL8acZMCM6iQqn0F6Vqeusag5yG3jwq3ouQ==
X-Received: by 2002:a17:902:c1d2:b0:194:7400:7c14 with SMTP id
 c18-20020a170902c1d200b0019474007c14mr5792877plc.34.1674004298492; 
 Tue, 17 Jan 2023 17:11:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 08/10] tcg/loongarch64: Implement movcond
Date: Tue, 17 Jan 2023 15:11:21 -1000
Message-Id: <20230118011123.392823-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


