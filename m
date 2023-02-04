Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AD68AB38
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:35:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU1-00056D-2Y; Sat, 04 Feb 2023 11:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTr-00051q-UV
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTp-0002X0-NK
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:35 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so7621906pjb.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/L7rpu7pR8QgddFOconCzyTsPMIEKIuZwLXecbYJWA=;
 b=wUW2Lu87DyzITuKavq6i9MazlUZqE53ZPpCnGgNBinvJ4OtLtZLS+FW9b/fAuv0R1C
 eYhXxdTqn5lS1rG2DJWl1+1b81Nf3jjHuN8nJNtnHCeuHZr+pPWvz8H8qevlqwiBXwqr
 PUQTV3PzB7FcdRQUb1IZsZgiNeGUHPIk/OFw4P1Yr9L+lxYnOSwrXJ5PR7isXluFCovo
 +3Tg52g5TBIowD5ot4vigHGzF1uSiqIcGoTw3VdmUbyiahTegBWJi7a1qBIUan820Z8C
 2BIpwWpWNZNr/OZfP02Ja+zKfHfY//vl17DzOrfTiXK2u9KlvGIZFG9oNxZuK3PG9Owx
 RfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/L7rpu7pR8QgddFOconCzyTsPMIEKIuZwLXecbYJWA=;
 b=2328hfL0XA4G3OnWYezJzr0q1/pkrP5cMx8spLviQyKNg3UuXQJu7XMZPu01bNjKoX
 H72LZ+Qjrhx870JHOSXkTQTuneXcHt6FnbBE/jSZwpEhr45hMzUkz5sYZRMeAmUyBAwC
 sI24RvIhyDT4FUoospBWYcn48foGIeLem0747jlNPcnbE33RPSOliLkNgVbmcApveaul
 +cEH4mwt9hE2WgmvvKVOqjznhBvP3Bak0lLe12MHYcb7rakFzTSdOeX2H2jnOpmL3Ve/
 orNhTr4tz3Ll7Tg02zyyj6AzVfuKn+L95oRmofMRN8hjCjqXFX6VkegG3PHA3+QlbRt3
 3BnA==
X-Gm-Message-State: AO0yUKVEFQQN1mc9aoOK+gR8UASv/3lDBSu83LCaCdMzFfFvxxM+gS20
 Zg5E/A7s7rGNYfLy3tzKhzoE0o1nMTQBO2mC
X-Google-Smtp-Source: AK7set881masjEYCVmYoJs+uALbFweUtDfZ1y/Kc8iUyczfJngbhv8S9J5UmzsFweaRUNcXNJW32uQ==
X-Received: by 2002:a05:6a21:3295:b0:bc:b9d2:f0f8 with SMTP id
 yt21-20020a056a21329500b000bcb9d2f0f8mr19914632pzb.24.1675528411334; 
 Sat, 04 Feb 2023 08:33:31 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/40] tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Sat,  4 Feb 2023 06:32:41 -1000
Message-Id: <20230204163310.815536-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fill in the parameters for the host ABI for Int128.
Adjust tcg_target_call_oarg_reg for _WIN64, and
tcg_out_call for i386 sysv.  Allow TCG_TYPE_V128
stores without AVX enabled.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     | 10 ++++++++++
 tcg/i386/tcg-target.c.inc | 30 +++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 5797a55ea0..d4f2a6f8c2 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -100,6 +100,16 @@ typedef enum {
 #endif
 #define TCG_TARGET_CALL_ARG_I32      TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
+#if defined(_WIN64)
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_BY_REF
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_VEC
+#elif TCG_TARGET_REG_BITS == 64
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_NORMAL
+#else
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_REF
+#endif
 
 extern bool have_bmi1;
 extern bool have_popcnt;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 2f0a9521bf..883ced8168 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -115,6 +115,11 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     case TCG_CALL_RET_NORMAL:
         tcg_debug_assert(slot >= 0 && slot <= 1);
         return slot ? TCG_REG_EDX : TCG_REG_EAX;
+#ifdef _WIN64
+    case TCG_CALL_RET_BY_VEC:
+        tcg_debug_assert(slot == 0);
+        return TCG_REG_XMM0;
+#endif
     default:
         g_assert_not_reached();
     }
@@ -1188,9 +1193,16 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
          * The gvec infrastructure is asserts that v128 vector loads
          * and stores use a 16-byte aligned offset.  Validate that the
          * final pointer is aligned by using an insn that will SIGSEGV.
+         *
+         * This specific instance is also used by TCG_CALL_RET_BY_VEC,
+         * for _WIN64, which must have SSE2 but may not have AVX.
          */
         tcg_debug_assert(arg >= 16);
-        tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
+        if (have_avx1) {
+            tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
+        } else {
+            tcg_out_modrm_offset(s, OPC_MOVDQA_WxVx, arg, arg1, arg2);
+        }
         break;
     case TCG_TYPE_V256:
         /*
@@ -1677,6 +1689,22 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
                          const TCGHelperInfo *info)
 {
     tcg_out_branch(s, 1, dest);
+
+#ifndef _WIN32
+    if (TCG_TARGET_REG_BITS == 32 && info->out_kind == TCG_CALL_RET_BY_REF) {
+        /*
+         * The sysv i386 abi for struct return places a reference as the
+         * first argument of the stack, and pops that argument with the
+         * return statement.  Since we want to retain the aligned stack
+         * pointer for the callee, we do not want to actually push that
+         * argument before the call but rely on the normal store to the
+         * stack slot.  But we do need to compensate for the pop in order
+         * to reset our correct stack pointer value.
+         * Pushing a garbage value back onto the stack is quickest.
+         */
+        tcg_out_push(s, TCG_REG_EAX);
+    }
+#endif
 }
 
 static void tcg_out_jmp(TCGContext *s, const tcg_insn_unit *dest)
-- 
2.34.1


