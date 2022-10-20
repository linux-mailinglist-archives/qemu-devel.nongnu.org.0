Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5460638D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:52:02 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWts-0000Cg-Eg
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:52:00 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWrA-0007Ge-Q4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7G-000468-Qe
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7E-0000y9-7L
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m6so20074571pfb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aV7leB8My78EqE2WvpaW/QUa1BwI9gtdQsk3y5nTaWs=;
 b=Mfw19+ONPM8EkSi/IXdEdXXWgWIMmRbfMcge34zUGGUpzChjmcLkSEs4b8wSzsgTH9
 ufLsXDkOvHkmLYzHsNjTFPuchYymv7BT0402eXVJrKJgFmpHn4psuVxtz2WnhNaNzhIx
 FAoFVi0z+lrMGYE9ex1xRalboZUaNv2MRo88oMBrGWDMxEFviKR3Z4j2AHOnZVl6ZVT4
 ON19S0IshurrstzwjL556e88d5c1zZB9wHNKNtzcVvivO6OZUdMqp3mi1LlORmcnPCkO
 DS5rlfQ5STV+k7VZ8R6Eo5T3TB+MVtaTIOR1l9ZNz/O6Tb/h3RbpVUbuAgv0l66VTJJk
 KDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aV7leB8My78EqE2WvpaW/QUa1BwI9gtdQsk3y5nTaWs=;
 b=Wumm+bZdxISMWhojwcjXMoXx7n4bVhsVf1GCjx1zzNIYJtuMnulhgKnTEHBjln9MKs
 cZ9oeV+exKIPnRbaRa/lHbBScOh3chY99ONk+9tdwVzfnslvVEoE5wbX5tvyr1J0cQFu
 JukVmYddXK6XfItq+qTkCMD2HaSyltC2xoNKJO1PgUL6UESxk6qQxeVZzvh5fSv99BQl
 m7CVgq/AP5DPGWF4jFSPrL4X8kzPchcGnBXTne2hGFgXM2UMjX8Mk43LsFL3ICmBYwK+
 J4RBje1oW8z6ZqWpCdcvMhCOvJzjiIhnICsGnyaPlwHOU8VXxJR2Q1viRmyOBjg60/il
 F/7Q==
X-Gm-Message-State: ACrzQf2K1yURduLvHaiF+uLNGjZ/VUIvzvTOUcbVC+v+Y+/dsvXzveVB
 w+mSdXZIu3tHKzpGnXg0lefQUV5dUbZA0o02
X-Google-Smtp-Source: AMsMyM6klyg00QK8qH+WmnLdL0IxD1XEHrUpBg6U8zFgh2PJFMxExViKKUGPeqduoIlJyfMs7QaQ5A==
X-Received: by 2002:a05:6a00:80e:b0:563:4ad2:9d39 with SMTP id
 m14-20020a056a00080e00b005634ad29d39mr13736293pfk.66.1666266814792; 
 Thu, 20 Oct 2022 04:53:34 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/31] tcg: Remove TCG_TARGET_STACK_GROWSUP
Date: Thu, 20 Oct 2022 21:52:17 +1000
Message-Id: <20221020115242.2301066-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

The hppa host code has been removed since 2013; this
should have been deleted at the same time.

Fixes: 802b5081233a ("tcg-hppa: Remove tcg backend")
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
index e9ff3c92e5..6c4f949c85 100644
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


