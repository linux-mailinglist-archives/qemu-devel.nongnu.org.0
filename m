Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E256F7AA9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:20:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvJ-0000m1-W7; Thu, 04 May 2023 21:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujv9-0000gC-SZ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:45 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujv5-000839-SP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:38 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-51fcf5d1e44so1000925a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248854; x=1685840854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNZtPPrKtoAPNdvExZgKDefGNHGLbWUnU+i+ILhcCsA=;
 b=OpMiUtBRVNBwb394ujoELGOmkuZOjVrE9t5NOB6jiFhD/GSX9CJ0mG46iqg3dxnNYx
 N+IpK+LrPPKMEkjBbeEZnd+e1Zlw52H5s12a0dZcLbjAs0vpm+28hTtssf85X4IKB0Mm
 cKM8I4jlaJrYh0jfRxzSwCV8Yg74SPcDIMewyB9XTY800lTZ+1Rz17zchiRiK1Yp6YVE
 03gyOAMDTsDzdHj+Lp7dc3owA3TE3yz24mVVntjdjb/K45U3h4pkoUEUImJ6pDg3arrS
 Kt38CSqqlSHpBax6ygZaDKIj05CPdefVKkawJ/O0iBmjXmkayWb+Wu2ySSolLi7bAl6O
 Qg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248854; x=1685840854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNZtPPrKtoAPNdvExZgKDefGNHGLbWUnU+i+ILhcCsA=;
 b=crYamuyjmr04I5tSqkzDpp7LhndcRqjKQuyxCXdPm+l6UQJAcpWpZhDB2sqw4zHChw
 SR1bH5fpp0G7VTZiWdtJt0nJXUqGPi31+0Lf8AKVJreFfLfIIO1tBc8U4MDv/aE16n6X
 rFXMcPj+MRlzeL8yYrjvH8BsnLK771wXoOwUDqcyIQ9bO6IJIeeleZPi2Cdh14yX1D2Z
 gKwnlysMxcd4pYHXS5l9TuGWj9bsrSwR0HtcpfxA1Qp2SatG1sDJyQtbxfDQaKl4Z5ml
 pxCZeB1r1l5gc3u/HTTwLDyRT4LF7DGdli511gRmPzTxJKxAEbnKlM3Y/V8P/YjMEf3U
 wCvQ==
X-Gm-Message-State: AC+VfDyaAQFYeXDFE5Xq4MxeTmQWVhxusxchoG0XrhI56GHcQ3zJZSJt
 w3MGDcnFs3D4Ckxx1tdVGujJZfrHllC9wg==
X-Google-Smtp-Source: ACHHUZ7LamyBx3HlxEKu4ycJUZICcSEYbNKb0yOfuDpODHvFoDOoyMnYmHI/Gr/vnPyoD3ucJ9Y0wg==
X-Received: by 2002:a17:903:2352:b0:1ab:109e:a553 with SMTP id
 c18-20020a170903235200b001ab109ea553mr6741687plh.62.1683248853667; 
 Thu, 04 May 2023 18:07:33 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:33 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 74/89] target/riscv: Hoist second stage mode change to callers
Date: Fri,  5 May 2023 11:02:26 +1000
Message-Id: <20230505010241.21812-75-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
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

Move the check from the top of get_physical_address to
the two callers, where passing mmu_idx makes no sense.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-19-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-19-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 38bd83f66d..5753e4e612 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -777,14 +777,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    if (first_stage == false) {
-        /*
-         * We are in stage 2 translation, this is similar to stage 1.
-         * Stage 2 is always taken as U-mode
-         */
-        mode = PRV_U;
-    }
-
     if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -890,7 +882,7 @@ restart:
             /* Do the second stage translation on the base PTE address. */
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
-                                                 mmu_idx, false, true,
+                                                 MMUIdx_U, false, true,
                                                  is_debug);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
@@ -1271,7 +1263,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             im_address = pa;
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
-                                       access_type, mmu_idx, false, true,
+                                       access_type, MMUIdx_U, false, true,
                                        false);
 
             qemu_log_mask(CPU_LOG_MMU,
-- 
2.40.0


