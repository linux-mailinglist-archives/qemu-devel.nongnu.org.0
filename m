Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D929625485
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:42:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfT-00068O-0B; Fri, 11 Nov 2022 02:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfH-000664-8X
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:31 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfD-0007Yy-Dv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:24 -0500
Received: by mail-pg1-x530.google.com with SMTP id f63so3810782pgc.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hjVkb/BegzFHY39crLwouqTtFpyTgi6eJ2SZK52jGxk=;
 b=o9jMkB7M4yVweOS4/vjj+L+JS2xO3E1b2l8f3FdiFapm9Aq2u/dGvehN8vySjXcVnX
 JHFLCsM1FhA/aXfKFkfkGgoWCFnqQsysL6EaEz1L/d7UfmtDWZEso0hRVWuEyzs+R4Tu
 THXOpUZRsLlTP3MSxKa4rt+lAIxVcBdybki9rqsc9nrVRaHknnVOB2LnV9Vkg0V3vwfb
 z1vAtxMmcvioTtj88HUUPYnfg5+ktAnCT538V0pmB19v3PlGTLZ4cQB20W2RNnQF8rd+
 iWVeM+RBRZxVU7U+9zh53TaWeHJAbIQto9OsbCgnnaS0SHYtdBav1cQmDx+JDG7RJv+I
 2Taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjVkb/BegzFHY39crLwouqTtFpyTgi6eJ2SZK52jGxk=;
 b=QuYlg711y3F/dY95MFoemhaKUvUvupvdSqFZSfTBTjmIIwfd0wbCJdmQvUek5cpMcD
 MlpaH4xr1SbjhWvy6L1uou813b9aOuPbwh3ZlFcf/g/xuJIlqj/l/veuUwQIyu1rn4lh
 SJ2Zox9Os/88BAYinFFBgEGRNI/oo1XhNKJqx/+QapcyTs/Wu0a7lAePzOgmeVSUhcod
 JjXonz8VHibxOIL75zSYKv52ZSUbxZKdM0Z3G1Rm87AdLDHInbYg83KIMihZoWno5Ubi
 CPpjMDYba2NWWA9NcbAecO/3AXfm0a7Nwc/hvUY+hErc6EJP7nRtUNUdMf4kqZYG/t3g
 4Kpg==
X-Gm-Message-State: ANoB5pni/D9ukN646G6HTer7evTDhO9g3gCuP55N0SDh2aEd4E7cljcK
 mdxpbC1gs5JOjBXttW3ABwP2Q+bWrg+DE9Ur
X-Google-Smtp-Source: AA0mqf5XXk+HEgnOVuwNJo5frcwVEJjBIDx7CUJ4XitSvD7B4Ysf3deCalzUp1YSkR/lspk3C4mm5w==
X-Received: by 2002:a05:6a00:3486:b0:56c:8c13:234c with SMTP id
 cp6-20020a056a00348600b0056c8c13234cmr1515329pfb.12.1668152481919; 
 Thu, 10 Nov 2022 23:41:21 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 06/45] tcg: Remove TCG_TARGET_STACK_GROWSUP
Date: Fri, 11 Nov 2022 17:40:22 +1000
Message-Id: <20221111074101.2069454-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The hppa host code has been removed since 2013; this
should have been deleted at the same time.

Fixes: 802b5081233a ("tcg-hppa: Remove tcg backend")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h |  1 -
 tcg/arm/tcg-target.h     |  1 -
 tcg/tcg.c                | 32 ++------------------------------
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 485f685bd2..e145d50fef 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -16,7 +16,6 @@
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
 #define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 7e96495392..56c1ac4586 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -30,7 +30,6 @@ extern int arm_arch;
 
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
-#undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f5383bb2b0..ae7516627c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1551,25 +1551,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
 
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-            /*
-             * If stack grows up, then we will be placing successive
-             * arguments at lower addresses, which means we need to
-             * reverse the order compared to how we would normally
-             * treat either big or little-endian.  For those arguments
-             * that will wind up in registers, this still works for
-             * HPPA (the only current STACK_GROWSUP target) since the
-             * argument registers are *also* allocated in decreasing
-             * order.  If another such target is added, this logic may
-             * have to get more complicated to differentiate between
-             * stack arguments and register arguments.
-             */
-#if HOST_BIG_ENDIAN != defined(TCG_TARGET_STACK_GROWSUP)
-            op->args[pi++] = temp_arg(args[i] + 1);
-            op->args[pi++] = temp_arg(args[i]);
-#else
-            op->args[pi++] = temp_arg(args[i]);
-            op->args[pi++] = temp_arg(args[i] + 1);
-#endif
+            op->args[pi++] = temp_arg(args[i] + HOST_BIG_ENDIAN);
+            op->args[pi++] = temp_arg(args[i] + !HOST_BIG_ENDIAN);
             real_args += 2;
             continue;
         }
@@ -4166,12 +4149,6 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return true;
 }
 
-#ifdef TCG_TARGET_STACK_GROWSUP
-#define STACK_DIR(x) (-(x))
-#else
-#define STACK_DIR(x) (x)
-#endif
-
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
@@ -4211,18 +4188,13 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     stack_offset = TCG_TARGET_CALL_STACK_OFFSET;
     for (i = nb_regs; i < nb_iargs; i++) {
         arg = op->args[nb_oargs + i];
-#ifdef TCG_TARGET_STACK_GROWSUP
-        stack_offset -= sizeof(tcg_target_long);
-#endif
         if (arg != TCG_CALL_DUMMY_ARG) {
             ts = arg_temp(arg);
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       s->reserved_regs, 0);
             tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK, stack_offset);
         }
-#ifndef TCG_TARGET_STACK_GROWSUP
         stack_offset += sizeof(tcg_target_long);
-#endif
     }
     
     /* assign input registers */
-- 
2.34.1


