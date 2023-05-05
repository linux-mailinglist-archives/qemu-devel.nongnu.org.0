Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81626F7AA1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvL-0000pN-DV; Thu, 04 May 2023 21:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujv9-0000g8-4w
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:45 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujv4-00082f-NI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:37 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso16423979b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248850; x=1685840850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aS4kDtm5851BGcVcD1xdvmRa2zrcDeJrdu60JMY+Uks=;
 b=Bx905cAHBdM4SkO/YcOa5C4C5nWsLom8NxWh98R+GJcm/vHUEe38gq9jwdCtgk36oB
 C2rqsl8W/RFcsY1NCu8JMcWOomadxG4IMZdmTMUtL2BXAHQT9WcCxqBxtKXaHUXvnNjX
 f82fXhuzyuLhkBUuGTWDULBwMkI5uzvrrufHDKysBKbDwnNXzI1CxBribJk1ZE4QItBK
 cdWUMuiRL5NmUztdU7736T+C6NXohLJDDXNJnyz0lpUJYjhfGL6nPEkECv9t7zAr7Vly
 QKFZTQ8g2fMRG4VZda9mvU6aLxI0KWxXkzOdNWyxuHxuNOoGYa5mS0izcnGoxHrJUs5R
 eedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248850; x=1685840850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aS4kDtm5851BGcVcD1xdvmRa2zrcDeJrdu60JMY+Uks=;
 b=l1UCCy4GcvZuQqwxnTbMmikTzMbRScuNRQjsU5+3HKmiOqvAfdgejp3MT/uwROyb3b
 UhMl3RdgCW8s3m7VQqPLHXAQtvpbSMAqcisTrGWebMMjgyItZKjGGv4p+MQU0FT63p1P
 4vZEf2Rmft9a5GFBpjM4B8lRKg7ZuDTuxCRRkvc4nZ6PsY8pF7AOftzHxDE0jBnltiBt
 t8XaprRM4zTNMse8/k7bZt+Q/dISflaTUYKV92LMgusrWpuVcVw7eg6EGR7/+A5Zns7W
 LqdYLoEzuf4YF1OheGk51bz8ewIaJxU0fGbItHnRz9db3WCCelQKAiEQqEmyXG325z3I
 DnyQ==
X-Gm-Message-State: AC+VfDyI/uxh7HXhSqOGGd6ZfNs/WW3utTeLVM98XqGh1+jgERyw8Fl2
 UqoeirAcpUCAG6qajyEQUJ2hCMQD9ZUgYA==
X-Google-Smtp-Source: ACHHUZ4fbRsBECYhRVZib5KbvNO9cg69+zjMLIO1rGUAGw/AKx58QBiMlSW11dpDvT9F1J4kfPztjA==
X-Received: by 2002:a17:903:11c6:b0:1ab:16e0:ef5e with SMTP id
 q6-20020a17090311c600b001ab16e0ef5emr6379214plh.4.1683248850033; 
 Thu, 04 May 2023 18:07:30 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:29 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 73/89] target/riscv: Check SUM in the correct register
Date: Fri,  5 May 2023 11:02:25 +1000
Message-Id: <20230505010241.21812-74-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x433.google.com
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

Table 9.5 "Effect of MPRV..." specifies that MPV=1 uses VS-level
vsstatus.SUM instead of HS-level sstatus.SUM.

For HLV/HSV instructions, the HS-level register does not apply, but
the VS-level register presumably does, though this is not mentioned
explicitly in the manual.  However, it matches the behavior for MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-18-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-18-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 12 ++++++++----
 target/riscv/op_helper.c  |  6 +++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index baa4b3a1d2..38bd83f66d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -42,11 +42,16 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 
     /* All priv -> mmu_idx mapping are here */
     if (!ifetch) {
-        if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        uint64_t status = env->mstatus;
+
+        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
             virt = get_field(env->mstatus, MSTATUS_MPV);
+            if (virt) {
+                status = env->vsstatus;
+            }
         }
-        if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        if (mode == PRV_S && get_field(status, MSTATUS_SUM)) {
             mode = MMUIdx_S_SUM;
         }
     }
@@ -826,8 +831,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    /* status.SUM will be ignored if execute on background */
-    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index f83f7b5347..f563dc3981 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,11 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
+    int mode = get_field(env->hstatus, HSTATUS_SPVP);
+    if (!x && mode == PRV_S && get_field(env->vsstatus, MSTATUS_SUM)) {
+        mode = MMUIdx_S_SUM;
+    }
+    return mode | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.40.0


