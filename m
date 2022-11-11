Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8C6254AA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgs-0007JC-Rg; Fri, 11 Nov 2022 02:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgN-000745-KG
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:35 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgL-0000K1-Vr
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:35 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so4083684pji.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xWtD/TEe250UHjk6klCm4KJGVjq9QANqtB38KitJ/cg=;
 b=qAccBX9XdMhBmHK6UCYYJhlWFg0QQ4y+W8/ZvtS6k2z+UhkZarJrt4IsC7T86crMYC
 NJoSyH5QGTC+GN6UHMHSac0phYCdZsqmgymPVNLeM3e2Z5TyJsap1csp2rpdPwxnKwVO
 5Jt6V1n6xJzjno0qxUwWTjlvM8eyW6FvlYbGOnmFnk+0YJOJ+UNLYK9Hn0sfN6aC/3de
 +8I/5UkZekf68UmWVlINH9VjBZrsJyJHIN0cZlvgvO3AY6Dmn4ndP2HFYphxYcPbrzIm
 vp/j4MZKR9TywKayWRvuhI4S6ANMqXld1kZS5gYhdIGaegNJGHCESAnBzOiG//Fo6QcP
 /zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWtD/TEe250UHjk6klCm4KJGVjq9QANqtB38KitJ/cg=;
 b=FB2KZrk/yw53mJFaxx9SRwR7nRXeQmza/8PhZGQDtoN2sfEoL0w5TaikWJWWUpqCui
 vSfQWyI50E4uqmBl4flVeSay7Fg4I7TwTxWnc+cT3OsUx5A1QuHbrIGHz5YekBM4fYr2
 zN6ze80UQQhvONhcmBl0xSrJ160uA18TnVgH+HHfayXNkzgo3ngtDcPEQJJdi/1V95QU
 eVESO5wjW5RU6DgZXe/LaIjCEY41oHdTJ5VHnzBTzOYZdmhE3p5FguveeR1pT2ZxxV4I
 L/yWR/p2Td0wbJuyMhr2fwIhHhN/Kk+EJWeMt9jV74kZ0GcGevEXam4oLGjDMeQVcXTw
 AYNA==
X-Gm-Message-State: ANoB5pmx0QeQjUByHCl7E34BhDxBFN+Kj2t9z6KwCRhBVRu5C+RmD5zK
 dyetTWdcke+C22Xf0DVoa985GrbgE9AVPSvY
X-Google-Smtp-Source: AA0mqf75U0S0+NiR2XV3TlA2wNcaAUfeMIkrrlwzWwhbTXoYqAi62RsILnW3LTjd74PO0UWDTdh7ew==
X-Received: by 2002:a17:902:8210:b0:17c:b7ac:86f with SMTP id
 x16-20020a170902821000b0017cb7ac086fmr1060981pln.140.1668152552506; 
 Thu, 10 Nov 2022 23:42:32 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 37/45] tcg/i386: Add TCG_TARGET_CALL_{RET, ARG}_I128
Date: Fri, 11 Nov 2022 17:40:53 +1000
Message-Id: <20221111074101.2069454-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     | 10 ++++++++++
 tcg/i386/tcg-target.c.inc | 30 +++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7edb7f1d9a..9e0e82d80a 100644
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
index ab6881a4f3..c96b5a6f43 100644
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


