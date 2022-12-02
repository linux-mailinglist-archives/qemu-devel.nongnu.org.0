Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D863FFF6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:49:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymV-0002Zc-PT; Fri, 02 Dec 2022 00:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymT-0002Yd-7n
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymR-0003La-LK
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:12 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d18so3717460pls.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3JD/f0hFHTzby97/VLdXB5SxHv9aWMa1hli7BFmcVc=;
 b=gvv79NKeQ+R8at+IM1pFsTQc2h37ekNdDU24KnfiodWNArffhsI+czYwn3fkOjesji
 Mk4+a/uKvSBCSryUXbK+OPTskuhr8pnf+bjcYTpF4gH8OW9rrOgD2wG8YsSmiwqSHze0
 vJJ8AjtqzWHPN4uNqjcMvZq2MYFAMbhFdA4gXIhIaZ4bMgbncT2qTID8uRzjoY/RqNHD
 PHrQ+WTQ3IGW/QYnm3pyjW0jvrBI7A0L71dodtrw/LOkDOk8UgOHiqonp4c+zKvwxf+l
 ntPLtWGuahXR2SvfHGcHT7rbW7S9VMPvBxZTe89s5UcYc0NH16GVNvcAsGmq+hCctgOI
 7qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O3JD/f0hFHTzby97/VLdXB5SxHv9aWMa1hli7BFmcVc=;
 b=ccJGJh9FDf7hmHI2eHjvk3YbCTZixXChFmdGmQZKwjaTtXcB9QJ4PdZET/71rr9zI2
 eoyhN9LfdvxGK9gVUsPfZCpGLWQ2Gk5yGBxJxUedlwK4DJRXEqeE/hyQqdwMTXkxz5VS
 hZzEz9eB0a/48fj8dniz/OrjXrUjnkNRchI0F+3MbDrnXJ8nfW8JcrzY52MS04x+es1Q
 O2tLcPxNLVgrggMcb1PEPyBQYZa7z1QXtWI/ht7qr4Twf9guqt3wVUSrYU4KXjKKCuoM
 XjENf4Vi0OGnDU6ltV1jeBmi00xqVSHU/Oov4uJAXefamFUegnt5zs95x8ihLy0xzHvq
 lKrA==
X-Gm-Message-State: ANoB5plehycMslV5JNm0bi3CyIkSx9LZMqEBJDA/eFngqbeETCm9NPbZ
 nIWO1zI7wHPhYK75b6J3ZaFz+eXEJRW4+aJB
X-Google-Smtp-Source: AA0mqf7warzlblHAGLHLbIG858d8Cwbcqf3lMocE6Uo0txwJbGwRdvU/CQUH3DgCdJbpRbl924sH6w==
X-Received: by 2002:a17:902:f651:b0:187:190f:6aa7 with SMTP id
 m17-20020a170902f65100b00187190f6aa7mr53784622plg.131.1669959610321; 
 Thu, 01 Dec 2022 21:40:10 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 10/34] tcg: Remove TCG_TARGET_STACK_GROWSUP
Date: Thu,  1 Dec 2022 21:39:34 -0800
Message-Id: <20221202053958.223890-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index 72187887c1..98d51e538c 100644
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
@@ -4125,12 +4108,6 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
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
@@ -4170,18 +4147,13 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


