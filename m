Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD06F7A7C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:15:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujwB-0001Ha-IE; Thu, 04 May 2023 21:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvW-00017l-Ua
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvU-00088A-Dn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aaebed5bd6so8178965ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248879; x=1685840879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWK90p2Eci+LzLUTXl/keL5kSllvMWrMFH8qzWh6iwY=;
 b=RJZex31dgTh4SmG7V5ceoc0MB41RwRii862/vbRykHAnk7Rxy2vtS/+PnZX0x7ZcSN
 STcDpc5slZq6/sxFWp3AlZlime31WukCJFoq/fn7/Y9G7TgZPtyhPkAI8z6xrxDsfeUP
 O9QoXCEPsP8lj2lkceykYVCNxzK4q9WYa2afBRaGQOArWu+1N8LZL0/WrIZfM3O8PJVU
 sey3PP4ICJDc8gItkNw/wnbTmowmO+m+jvJXG40G0PWYM82jr8gm3XfzBWo++StfAwhR
 LotKwaklfB3mjQT1XyD9lBuAWfhFCBOu4QBpgP68a6HMspKpj1JkiynYHNGNXeTlDdqn
 qpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248879; x=1685840879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWK90p2Eci+LzLUTXl/keL5kSllvMWrMFH8qzWh6iwY=;
 b=PEHXm+bR0wGnOEPzt3VFT9QKpN3Hd7CumZcqH+i1BGY43Dz3Jruz1sPeDPabwe4fr4
 cLFZvcYK8ZAwpFISsf+shJvSLj/rpfazfPX0qB9Pubkzzs9iWeJXiDRzfXVBo3+eRbRq
 2pFSRcvEdJgKGVh7FFKbgMX/HG/+hIbZ18A0c3pyFy6Xol2vdjKrYQ262s/fvvWpDL7b
 FaujXQX+7uFIbH4bysgyyDLyF9EHQhVOyV3kBtZxkpkyF9euHkSQa/WT46wBgvWHVzVh
 pQ2cHjkDILAI2hjev8IHpqsovcFvhoqhKEqi6uUuZ9Cjmfo3Sni+9BEXGzGgNNzMvqNQ
 OqOA==
X-Gm-Message-State: AC+VfDyizwzMoepl7pdAtXOsgRvyACi8wwUUayHkcu3pT6tNVpqofGQ3
 fJQIlZnveNXUhyF7kS0tjH+7iTH4sLL0qw==
X-Google-Smtp-Source: ACHHUZ4HbeMhPG7ciY5wDZyZCYapkvKHFvhnmaKRnWD4p9EXyvsFvxofPy34tDmHL4tAceLsadZi3Q==
X-Received: by 2002:a17:902:dac5:b0:1a9:ba26:6cfa with SMTP id
 q5-20020a170902dac500b001a9ba266cfamr6943413plx.64.1683248878736; 
 Thu, 04 May 2023 18:07:58 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:58 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 81/89] target/riscv: Reorg sum check in get_physical_address
Date: Fri,  5 May 2023 11:02:33 +1000
Message-Id: <20230505010241.21812-82-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x629.google.com
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

Implement this by adjusting prot, which reduces the set of
checks required.  This prevents exec to be set for U pages
in MMUIdx_S_SUM.  While it had been technically incorrect,
it did not manifest as a bug, because we will never attempt
to execute from MMUIdx_S_SUM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-26-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-26-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7849e18554..32a65f8007 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -786,7 +786,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, widened;
+    int levels, ptidxbits, ptesize, vm, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -817,7 +817,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx);
+
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -985,15 +985,15 @@ restart:
         prot |= PAGE_EXEC;
     }
 
-    if ((pte & PTE_U) &&
-        ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
-        /*
-         * User PTE flags when not U mode and mstatus.SUM is not set,
-         * or the access type is an instruction fetch.
-         */
-        return TRANSLATE_FAIL;
-    }
-    if (!(pte & PTE_U) && (mode != PRV_S)) {
+    if (pte & PTE_U) {
+        if (mode != PRV_U) {
+            if (!mmuidx_sum(mmu_idx)) {
+                return TRANSLATE_FAIL;
+            }
+            /* SUM allows only read+write, not execute. */
+            prot &= PAGE_READ | PAGE_WRITE;
+        }
+    } else if (mode != PRV_S) {
         /* Supervisor PTE flags when not S mode */
         return TRANSLATE_FAIL;
     }
-- 
2.40.0


