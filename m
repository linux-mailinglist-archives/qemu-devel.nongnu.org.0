Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B46F7AA5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvJ-0000kW-Ev; Thu, 04 May 2023 21:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuw-0000Hw-1n
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:26 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujut-0007lb-W6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:25 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16307806b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248843; x=1685840843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lZiXeB7ApdXEaksXsIhLSnMPRCJzB+5QIy3AM8RHG4=;
 b=TB8kMYmxMqnXINYyfwqLCwl+2DfOjA++zXtWZajsPhL68XhqOb7gmms3zwn4Ln2gCu
 8/rYZzHoE3NXHesVG7P8Nt8l7iZ30ynKKUN5+knS4EtAE2V0S+wcFeCzZmHv6u+jqEZU
 RVJd5q1Eg8ZOzGdWZFkQCVrky3pjBFGt9/N3SzbguDI+1T8f3ysWkxmD7X07bVwrWfSP
 JZW8XxD2SbbesGlP0eSLtuCTAYaU7nxb2lw9nJ8u/U6SfsGuo2eAxhCJT3gkiqn3hnYZ
 ozRy/4+YjvsitA+8in84Xr8f/hZ3PEvnBrGPZcj1OCqdT2VIik35p5LHdmLJeqSRPhmx
 XF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248843; x=1685840843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lZiXeB7ApdXEaksXsIhLSnMPRCJzB+5QIy3AM8RHG4=;
 b=J8AO0uf9Lr16RA+Lo84uqRPnrHUtlu9xzA1OIzFtUGU5EO7QHd2FWyClAqRV32nOfu
 LnqpaUCW2E1H6Mpci7j+EsuvdrcsHqCxLjIvRE2YR+1tM+yZ6ur1n4JrLH6KC1z653uN
 8tPS1hT4GE82nI1JfltUkXEKg4ZjjYYkPg81SgYhD96lotaeUvpf9dDKlFUC325eLyhF
 K0KNtdU8sFCBZw17CcTCv9dHF9y+kQjKqBMV39GYPP+D7lS/CVuvagfpMpIOPQup4vIS
 hD9Bj07tBMD6KcFqUz2CWtJ9TjbdxAIaxa5HftIZMKs1IfeYW7iYmlizz2TObIdu4LaQ
 8/cw==
X-Gm-Message-State: AC+VfDw3UC7GvuEnFR3K16Sam0fgCju9cefanqKcGv5/PRXMCcPk5b48
 ZRk7J22EoOjTu30tMzWO76muDlW3N4TTKA==
X-Google-Smtp-Source: ACHHUZ4ef8lGXaeydsn1VanF9sZ8k4FECP9AmSB6+1iuTeiidYsPhmdHwOgB4l/clX8/ondyNPpIxA==
X-Received: by 2002:a17:903:2443:b0:1ab:197c:b510 with SMTP id
 l3-20020a170903244300b001ab197cb510mr6078789pls.31.1683248842940; 
 Thu, 04 May 2023 18:07:22 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:22 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 71/89] target/riscv: Move hstatus.spvp check to
 check_access_hlsv
Date: Fri,  5 May 2023 11:02:23 +1000
Message-Id: <20230505010241.21812-72-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The current cpu_mmu_index value is really irrelevant to
the HLV/HSV lookup.  Provide the correct priv level directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-16-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-16-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 10 +---------
 target/riscv/op_helper.c  |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9dfd1d739b..ccba3c45e7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -770,14 +770,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    /*
-     * MPRV does not affect the virtual-machine load/store
-     * instructions, HLV, HLVX, and HSV.
-     */
-    if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
-    }
-
     if (first_stage == false) {
         /*
          * We are in stage 2 translation, this is similar to stage 1.
@@ -1250,7 +1242,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * instructions, HLV, HLVX, and HSV.
      */
     if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
+        ;
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
         mode = get_field(env->mstatus, MSTATUS_MPP);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 6122f5fbe5..f83f7b5347 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
+    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.40.0


