Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FA6F7A62
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:08:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuS-0007AL-7B; Thu, 04 May 2023 21:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuB-0006rn-Nx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:48 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1puju9-0007ph-Rw
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:39 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso16420775b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248795; x=1685840795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43SGISdmrbl+ksWlytg3Bw5IaTqyK3kj2xiFSyap57I=;
 b=J4ydM6RZvX3i4ddaJy3egeCGy7Yfqa6eU/vZ8KR0s50dh+Z+B/wZyJtaD0RLL4P7Cp
 YsynbBCrJpQNyGlmaY4c+HQzQCr88q3E/CMLxC4mqolY67tN3EWix/agOK0RkoV/nG00
 CRhkPKK7iZOMVloShkWn3b1ElxmT0Wz/PCpa2EnsBz6Ycn0JOnvKuI4i4V56qYfLxwhO
 sNzfT7Xq29dX0oEx44YSVsOcIhJshmQZkp7CviPfEK/4hNMz/8ph22kIeGi0U7MoHzcs
 U3DQDBWBKBMNItPCifDBN7rE078UHKMEZvh+LnU6m3utY5tKdOC/wZ1MQInebWz8qXgG
 fGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248795; x=1685840795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43SGISdmrbl+ksWlytg3Bw5IaTqyK3kj2xiFSyap57I=;
 b=EJmqb0ZkVPcDhCkFgFrxrGkut26H2c2ub8uAxJgHVIIeQYZiCrrDMYLZc01EZEfAgw
 AZiQbWw2AJiRVkC8RchWzy2eaKcX1AEnuv0RlffYScFJEIFo405+sgJuQotrR2U6zH28
 yp0PKvOdB/cyGMgk9LC1xEdJO5U6EOWjulW/lg43hP0/fGfWo03FcZVFibF4ab/8ARKp
 POqaJODQkp1aJc16qla9UXHtThc2/QdOZJGmgr6zs2XYQDb5O+TqvAbTsup14F12wEyk
 jS/YkpOjZzTrQ2SeBOap81fOUAQQ255p5MUX6QW039pdsGXopILvgc6hzGII/rY9Nq+M
 lV/g==
X-Gm-Message-State: AC+VfDxffL1dtidxAPUO2aRPooDv6pNJl+Mp3QX/Sd3An67iPHKokXr3
 MQ3vLcu/ArRubprFFt3PoR0MdFhxagCk/w==
X-Google-Smtp-Source: ACHHUZ5wgGuQoqe8pz7qR4Tb000uxi0tsUYReCZMRCwXjBx+aTs5Y+BvOpCxsJ3BHlk//t0Qxp4RKQ==
X-Received: by 2002:a17:902:9044:b0:1a6:7ea8:9f4f with SMTP id
 w4-20020a170902904400b001a67ea89f4fmr4777832plz.26.1683248794910; 
 Thu, 04 May 2023 18:06:34 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:34 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 58/89] target/riscv: Extract virt enabled state from tb flags
Date: Fri,  5 May 2023 11:02:10 +1000
Message-Id: <20230505010241.21812-59-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Virt enabled state is not a constant, so we should put it into tb flags.
Thus we can use it like a constant condition at translation phase.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-2-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-2-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  1 +
 target/riscv/translate.c  | 10 +---------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 86e08d10da..aa53d0e256 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -648,6 +648,8 @@ FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+/* Virtual mode enabled */
+FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 433ea529b0..1d90977d46 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -104,6 +104,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, env->virt_enabled);
     }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0094922b6..ebd00529ff 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1171,15 +1171,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
-#if !defined(CONFIG_USER_ONLY)
-    if (riscv_has_ext(env, RVH)) {
-        ctx->virt_enabled = env->virt_enabled;
-    } else {
-        ctx->virt_enabled = false;
-    }
-#else
-    ctx->virt_enabled = false;
-#endif
+    ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-- 
2.40.0


