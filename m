Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D060733E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:07:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnzn-0007nz-K8
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:07:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmII-0003if-Tc
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHz-0003Ox-07
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHu-0005uX-Ub
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:54 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 10so1624762pli.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lLnD6XwJTmW9yrKiJSoQgxFQEO0sDHADUyXUWB1TLM0=;
 b=sUyarQfIbw3q46Wh+JXz723n+4A/ESoDQG0DHNgqhjYvF0E9UQEdikgVh2Ir4IATXX
 WWbTasQyjtr1/5YUS7fF048ROwOTEtD+x9m1SfiqxGzRMwzNl0Qf6+p4SrERJyl1Lu9F
 Q9kR8J6j+QLK5O929H6bRM16JBTcpw8UNl+9Xh634oM/0W1F3MD84bZQW9A/Epgr5eDd
 /YHc7URMjJkzY34YuouAoqHTFEqaTdWLvMGVBKtI5pmL/AMWEz1LS9GHSdsSYA+WzuUK
 cMVcMuY8oQo3+R3AJfXu6vtNobVUoHjHnKacOdlidGJ/wxbjdfSQ9AT3PL1H7QDu8vpn
 ubmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLnD6XwJTmW9yrKiJSoQgxFQEO0sDHADUyXUWB1TLM0=;
 b=6XzePgahtoxr0BcEjq/Tlj5ERWGtVkizrBxqmioxcIZf2J93llHFtNqcZA0bFmPAqg
 5w4jf0oZQT5lxHf1QfJC/EAHo6KeIcFPiax0E/W3dfLrjAE+1COPKs6WIZTOftBAJ6nn
 Fy6WBg8xhVR9jtnLlELccnp9cQIpaGlJMF6nn8q7fxCAp/HeFAAir4TSw7zRshan0Q54
 /RYyyoYotpokIdgDvi42cdHHKyVdRRZKVCRA/YtJsVtq4t4LPOExBIiMZEINAFrDDlcC
 KjqR+z+wnxGbaExQegHEbAe6R+opOZJx9USmLabXTuozvezuhWH6QwE3JdgEF3gq+2CI
 EfYw==
X-Gm-Message-State: ACrzQf3T872PiAkcfBimncWt8pp78iSppcK/Oh+vGPIY3vlZS3IayXVW
 6O9TYmIKoZk7nhlzJE+EfQNeZKA2ZP7y9g7f
X-Google-Smtp-Source: AMsMyM67FSLQqMlHRE450SrbPeluq9rHmNeBXaezUpsw/EamBSuApdr9dDUaaV0MHiyngpUYsDGleQ==
X-Received: by 2002:a17:902:f7cf:b0:17f:9081:a3f7 with SMTP id
 h15-20020a170902f7cf00b0017f9081a3f7mr17734395plw.3.1666336669259; 
 Fri, 21 Oct 2022 00:17:49 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/36] tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Fri, 21 Oct 2022 17:15:44 +1000
Message-Id: <20221021071549.2398137-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill in the parameters for the host ABI for Int128.
Adjust tcg_target_call_oarg_reg for _WIN64, and
tcg_out_call for i386 sysv.  Allow TCG_TYPE_V128
stores without AVX enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     | 10 ++++++++++
 tcg/i386/tcg-target.c.inc | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

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
index 82c8491152..3b0c567270 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -120,6 +120,13 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
             return TCG_REG_EDX;
         }
         break;
+#ifdef _WIN64
+    case TCG_CALL_RET_BY_VEC:
+        if (slot == 0) {
+            return TCG_REG_XMM0;
+        }
+        break;
+#endif
     default:
         break;
     }
@@ -1194,9 +1201,16 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
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
@@ -1683,6 +1697,22 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
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


