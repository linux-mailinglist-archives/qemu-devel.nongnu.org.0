Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E61442C75
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:24:57 +0100 (CET)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhruS-00077s-8X
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreH-0003yN-LT
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:13 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0000x6-5u
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:13 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id bu11so5128382qvb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtawaHYSfgiYXorLPYx7eO4JeOJDito5IEpdHHHLhLI=;
 b=d5XBfcx5/8OSdGEct/WPG74GObZrYxKliUTjbRFV1f7A5bEhv3AgcYz0xLvQH5MuYj
 3YLtiPsUc87wonpche+Yq9CnPP8tf9b+9wJXVDcOglvh3Tn/C7gFgJ03nn/JFJActgb6
 N+7M1uPA7WIh9fdhTrgtzIxk5Ncu/dpNiNcSgnALn2UDO/O8I70gnIXeVmBMzNeaMqig
 gkM3oBvVKiWqC5WPYyTLe7mxl1fPHMp4XybjfVeYrbP/eFRV8yFbCNhW9lHyl1QhJPeJ
 44Yf/VeUnrO6aF6LJ1zRSAzqiUS2L9mXHXC+EaURiYsVBCXOKKRUQB3JoiRZQn7yc2G+
 MORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtawaHYSfgiYXorLPYx7eO4JeOJDito5IEpdHHHLhLI=;
 b=pMFc9XfdWKEmsxT/SxvNvkVt1ceqvo5Rcm2tCxFGwkSb+kSjDdJQ0lxVRiVF5FNC0W
 BXQ/Gru36ljBjdd1GVn/UNBq/PfAVdG6R2XGGZnbyLDiXDY+/lRfHwsL5sDizPXvP5U/
 cRDYgXFCIQKLeFnX//zZ3quEi1sWBFg5hksZLG7ue9rm1DAe6hnqciGS4CpZ0EIYRi4d
 80Mkpp2HQdDfcFE6G7cgzRkNnJv+LBvQ4QeF0FSC+vEvDJ7TGuf9dDId9Mf/wTPXLjFH
 GpWQelzdaNS7kdTXMr3mCL93Mh46pYmVEilQe9ixM4a9ET52ssFbcF0BRVntHxO3Oo7E
 wVoA==
X-Gm-Message-State: AOAM533mEXFfydxHWDE7zCY7GH42k50KS4pNMKckjyP8pjSzHdx/lrNj
 Co4vU3cJWGwQXt9d9Qn9/wgnisN28bbpGw==
X-Google-Smtp-Source: ABdhPJxiKZvyo5zTeEQxTj5dzcW1xHzVh11zs9NFMHP1C5kInX4zmsgCYryelG5R6jpqTbJWNuyrPQ==
X-Received: by 2002:a0c:b341:: with SMTP id a1mr33425202qvf.21.1635851282246; 
 Tue, 02 Nov 2021 04:08:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:08:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/60] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Tue,  2 Nov 2021 07:07:15 -0400
Message-Id: <20211102110740.215699-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for riscv linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c |  7 -------
 target/riscv/cpu.c          |  2 +-
 target/riscv/cpu_helper.c   | 21 +--------------------
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index e5bb6d908a..b301dac802 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -87,13 +87,6 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_TRAP_BRKPT;
             sigaddr = env->pc;
             break;
-        case RISCV_EXCP_INST_PAGE_FAULT:
-        case RISCV_EXCP_LOAD_PAGE_FAULT:
-        case RISCV_EXCP_STORE_PAGE_FAULT:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
-            sigaddr = env->badaddr;
-            break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d53125dbc..f812998123 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -694,9 +694,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = riscv_cpu_tlb_fill,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f30ff672f8..9eeed38c7e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -814,7 +814,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
@@ -822,7 +821,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
     int prot, prot2, prot_pmp;
@@ -954,25 +952,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     return true;
-
-#else
-    switch (access_type) {
-    case MMU_INST_FETCH:
-        cs->exception_index = RISCV_EXCP_INST_PAGE_FAULT;
-        break;
-    case MMU_DATA_LOAD:
-        cs->exception_index = RISCV_EXCP_LOAD_PAGE_FAULT;
-        break;
-    case MMU_DATA_STORE:
-        cs->exception_index = RISCV_EXCP_STORE_PAGE_FAULT;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    env->badaddr = address;
-    cpu_loop_exit_restore(cs, retaddr);
-#endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 /*
  * Handle Traps
-- 
2.25.1


