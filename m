Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18566F7A60
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:07:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtz-0005z2-JI; Thu, 04 May 2023 21:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtx-0005jX-9Y
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtv-0007i3-1o
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aad5245632so8442635ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248781; x=1685840781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZGjFNLoqqGuNOvjc//J6vmOrtdne6dPztqTW31lhQM=;
 b=hJ8flvXhg7JJ+3jwRbPXw1pR73KPPs+h8A+GpcjmledHZnsCeN0JTr+9skMxRxJwRt
 VJLrXWOij2Opegxxq7bRrq5I5yST8k+HzuWQ8OPNbannggKtoxYKSyFFonmRFHiM/G6E
 1vMvWrgeFFlUJJPgVUu0xiaUeLtYw8OQyb2+rEBJJmRAyhXSev3MSy7Stq5ciH2ymCEK
 hXPmE9k4ycNwQBTy29JpD+qbMCJUHxwBKoXHbkSF5GoxQg5cB7GAbgFrq5R5sXr7gEw7
 Yy0l/GEghFCy5Gnvv4TM9yWAD8MVK8IiU3w58XJ0gbkIdKz7EMwqkTQDBYgadFnI764Q
 J9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248781; x=1685840781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZGjFNLoqqGuNOvjc//J6vmOrtdne6dPztqTW31lhQM=;
 b=KuHRMJKdGTK59TGtVS2FYjE5ddh/W+Iq/QKQjy+whjgdK9bEbp1OxrjHnvej5T2Zom
 x+qghnU+v91m6KzRUrUVzR2C6tk/Vk4YzBR0/VQW42bTPqqzy6Rn6VgLCHAg5yZkTewT
 rwDq89itQUUKcrrvTX38l8Gisr68tXA+vfE9RHO6gUSkyNKBqdzIrw69OyyGwPuOvCVZ
 vOktxhCW8fQB6kBPsQMp35xLg/JXFUe9HCja4UIzmQKvXHg/VUQprLn9/Vfh2KzQCxZI
 L2I9F3Glv3dqw1nQ/evgV94DzhAjkN+dEiOq/Rcvodj6jgIyJw5y5Ihu3zI2aAjFi4Lp
 myTQ==
X-Gm-Message-State: AC+VfDzC4YmuBS0FWXJC8yiB33OrYktpvPD21lHrVPMlS2AwxmFtJh1Y
 twigJdG2A+PTvppqW9yOEhdcvL0t5Jcbyg==
X-Google-Smtp-Source: ACHHUZ7h1lHB73p6NiP01pregwc/pVVlAshbHy7j49dViNhMrLxU3K5MmqEdVdKvpmFP6tuNMczQyQ==
X-Received: by 2002:a17:902:db08:b0:1ac:3103:c555 with SMTP id
 m8-20020a170902db0800b001ac3103c555mr3929044plx.58.1683248781336; 
 Thu, 04 May 2023 18:06:21 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:20 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 54/89] target/riscv: Use PRV_RESERVED instead of PRV_H
Date: Fri,  5 May 2023 11:02:06 +1000
Message-Id: <20230505010241.21812-55-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

PRV_H has no real meaning, but just a reserved privilege mode currently.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230407014743.18779-3-liweiwei@iscas.ac.cn>
[ Changes by AF:
 - Convert one missing use of PRV_H
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu_bits.h   | 2 +-
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/gdbstub.c    | 2 +-
 target/riscv/op_helper.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f47c3fc139..86e08d10da 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -684,7 +684,7 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
         case PRV_U:
             xl = get_field(env->mstatus, MSTATUS64_UXL);
             break;
-        default: /* PRV_S | PRV_H */
+        default: /* PRV_S */
             xl = get_field(env->mstatus, MSTATUS64_SXL);
             break;
         }
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 101702cb4a..a16bfaf43f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -608,7 +608,7 @@ typedef enum {
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
-#define PRV_H 2 /* Reserved */
+#define PRV_RESERVED 2
 #define PRV_M 3
 
 /* RV32 satp CSR field masks */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2310c7905f..29ac7956f7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -650,7 +650,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     if (newpriv > PRV_M) {
         g_assert_not_reached();
     }
-    if (newpriv == PRV_H) {
+    if (newpriv == PRV_RESERVED) {
         newpriv = PRV_U;
     }
     if (icount_enabled() && newpriv != env->priv) {
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index fa537aed74..524bede865 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -203,7 +203,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     if (n == 0) {
 #ifndef CONFIG_USER_ONLY
         cs->priv = ldtul_p(mem_buf) & 0x3;
-        if (cs->priv == PRV_H) {
+        if (cs->priv == PRV_RESERVED) {
             cs->priv = PRV_S;
         }
 #endif
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index b8a03afebb..bd21c6eeef 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -141,7 +141,7 @@ static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
     }
 
     if (env->virt_enabled &&
-        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
+        (((env->priv <= PRV_S) && !get_field(env->henvcfg, envbits)) ||
          ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
     }
-- 
2.40.0


