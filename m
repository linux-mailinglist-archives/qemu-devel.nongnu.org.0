Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE342655BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOe-0002MZ-BR; Sat, 24 Dec 2022 18:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOY-0002KZ-AO
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:38 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOW-0006Ix-J1
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:38 -0500
Received: by mail-pj1-x1032.google.com with SMTP id p4so7977136pjk.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICnDE5CkA2lmO28avcdDx7Ov//rZAy7zNfU1ruYzqlU=;
 b=cwggcCW4rnW3gXkxWMiPlWRWSUaEyNPWZorPNGibfV1/SDBkJCMWHe/WbMk7ee+HY7
 6m8oIoV5DdEmRwtOjFsS7qvhCXdrCSAYYp90qsrZn8e2aReOeny1RPTH0ItgKXK3S5X1
 jmtHLNYkNMT9CmU9ZfkD5h9iiYgRSUmPH4qRZDIUxix0bbNgPrSQWoU5WyMDfd9Fgu4o
 cx2dvzmzgSiFo7LjG/bT1+KhQw3WfRd9kTybjtkYOvcd4wvyFRPVuE/JL6iOQ5CJ2RVf
 Z9Q7G0zOlATtHT9ofTHVkgGyfc7qSNP4wy0w5amCXSPEJehVzDmtPDAx9q8iOZ6BtLDH
 F1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ICnDE5CkA2lmO28avcdDx7Ov//rZAy7zNfU1ruYzqlU=;
 b=ZIsQa68FQGOzYeeqp1Qp+dn8VqU71GdFj6Y+/j6Ypt+tzwFPs94Fj/Ed7/TtWLe10O
 B1ZkOHl2ms+qCr8Zqx5TU+geZ4V7pR124BDrqHZE6ph3q31XV1CGxvGHWY/siZiflc05
 PmuWRJfEqKKJFHsrsIJvaW6NWXq4ZSkXDXwbzNsoz/aSosm2DxjVAWx7OOsfRtfYBQpH
 AG2C7l4bMHpNCkcEd6yn/Rx4I9Q6fz8Z/iEFQUkYWsf/ra8jHn5gSv5Ggo23YhoYkcM+
 UaPNmkrdk6RyeZ2d4J1uMP3ugIg8T7sc7VQeWNso6nrx5jXZaARhjXFFJDgS42yyl1X8
 bs8A==
X-Gm-Message-State: AFqh2kp8cHaY0C/Y8p/rypCrMKVEfC7r824GXHkk2FSUY+hgh0G1uP5F
 L+tLm/OdOnv0rSsSSC6gMwyeEGKw3j3/Pnxr
X-Google-Smtp-Source: AMrXdXsry7QMWkTU9UGJHY+D4MycGyd7C0rhB2UePijdTBu9dDqTO1fxwAV5nXcuWoP7s6jexA4VGA==
X-Received: by 2002:a17:902:6b89:b0:189:cf92:6f5c with SMTP id
 p9-20020a1709026b8900b00189cf926f5cmr16456920plk.52.1671926255189; 
 Sat, 24 Dec 2022 15:57:35 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 13/43] tcg: Remove TCG_TARGET_STACK_GROWSUP
Date: Sat, 24 Dec 2022 15:56:50 -0800
Message-Id: <20221224235720.842093-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
index 215ddf2db5..05d2b70ab7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1552,25 +1552,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
@@ -3854,12 +3837,6 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
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
@@ -3899,18 +3876,13 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


