Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3866DF42C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:48:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYti-0006Nh-Vn; Wed, 12 Apr 2023 07:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtI-0004xE-70
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtF-0002TT-41
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id m8so20047771wmq.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299831; x=1683891831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRysGopMuvQKVUYQZTztZp4OETaqkIX63XPVMpwePPA=;
 b=QJ3F18qOPbwQNDoW+wchI3it8GRc+GussBXF1STfJmsi5SLrFqNbwQaYrs+ylqzIO7
 Qjhm3SIpvEuKhxgjP8BMI9HDxx+7veVSXfVAbtotqsMD/cU9dBo59Wkor/6+Fncn2BfY
 sVJCX5SEHZ6ImZFisg47wFz5z8Cr5cConbTB47l5zbqoVTpXx5a3j20gNs2aIFKxUduP
 F6AzjFKIvFwNXjuVolFS3LeJCXW8aZJZuGlH4wMJQ+OOIsKb8sTUqinobAGVizt0s6uP
 uRGn/cIt899oNqIvDLBJFvwt67k63LpZ5nqXhWTx83EXyDc9YshEgI5FR/vM6dqLdkhh
 qUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299831; x=1683891831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRysGopMuvQKVUYQZTztZp4OETaqkIX63XPVMpwePPA=;
 b=0LB4TwPDj2ACanb/Awd0QgsCRvaq/CVUYDIw6mMqvpl2NhmKCz+qxdvuJfnV5wgjkf
 kCgTqNpXj9PQ/sbH07EQE0lsaz8xa5sehB/cUjH6UapMVf4C1bz1Zkrb+X5Ng1bdW0QN
 ZTG+Ta3ZP8gW8ZDE055qhnYTKdS/kVqwUq+g4VBqxAHozsbUerbjmq/nOm9/U5sjx+6A
 R0zD10SzqmAQcL9JgotsKJYj3gUvvUbJIz6nBbARrV33lWxt2Ni5PyHOpZiqk14P+J2F
 +2s9X644Srmoe14YHisQMSQMcHtLsgpkkkZZep27cs0kPFlVZzZrUxzarEFOSUDfX4on
 d6Sw==
X-Gm-Message-State: AAQBX9e9HdQuU1huUnhpcNmyGFUd35hoCpC3Zf+B7GBcOlC2sUaHLfEI
 hf7accqJqbfSmfhB0E4uhKQI69Jst58TRoxaQ+wBIOTc
X-Google-Smtp-Source: AKy350bvuDFgwcboZTIKmtWn1tIaEAiu/BYgWnH6b8vMfrJfLAe2m3S8iUn1ZuTciYXd/2DIluW+gw==
X-Received: by 2002:a1c:7917:0:b0:3f0:9f28:fb6c with SMTP id
 l23-20020a1c7917000000b003f09f28fb6cmr1061289wme.12.1681299831380; 
 Wed, 12 Apr 2023 04:43:51 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 18/25] target/riscv: Hoist second stage mode change to
 callers
Date: Wed, 12 Apr 2023 13:43:26 +0200
Message-Id: <20230412114333.118895-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

Move the check from the top of get_physical_address to
the two callers, where passing mmu_idx makes no sense.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-19-richard.henderson@linaro.org>
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
2.34.1


