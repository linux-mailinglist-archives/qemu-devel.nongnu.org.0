Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6506A9316
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zx-0001aU-7F; Fri, 03 Mar 2023 03:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zl-0000Ob-Cd
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zj-00083X-Lv
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:29 -0500
Received: by mail-pl1-x635.google.com with SMTP id ky4so2002755plb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832947;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZYYFQkf7br/XYCwuLnMNO1BPXLZr4qEybUL4n7cJiY=;
 b=VdagSACTnvPU46mGK5+SarJgHik7Sp/HHnkfKVsDZF9LWMZW2su2rg1SNvazTmTq+3
 noU4YEWQPtl8W1Qy55oDNy8g8q74LR5MFqTLMH2T01N54nh5vzHiBdya2K+IvpkoX7xc
 IUool7l/q0fEQYtMpzuMNEHcqmPzaqtgnE80ZejgPIsO59uSHx++aoWR2RpbENhqoRCK
 j7qofs1k0iEylKYqz0InP0qr7zUW1MPJnZSVmrv6rbyi6JOw0Ny0u2vIvpG0m5cd6NES
 /m5fSXqsQJtvzSKeKZ2/83a7rsMzfXr8ZLjD8xRpkKCXaRy/7RLvJjVT7sL5glqWXNZ8
 tAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832947;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZYYFQkf7br/XYCwuLnMNO1BPXLZr4qEybUL4n7cJiY=;
 b=ea0zws6RXAfI1+PbsHquBzFrNbiPcJv5BkFbvro+FVwKjqqpmg+RnV8bqmFsnwu858
 qKZO2J6rHk9sPI/Jk/Cy7t6hwQXfUFi3sBTsVGFX1HHk/b8f1deth1jjVonzpAMhiFqK
 6KiZ4JMRhKpd/7gnCGB5zEKzNVIbE0sHxaOe/ks2934GzL+gL3liM2I+8nkGh1yWPDDv
 wZLvOba9/yx9mt/buSVKidp8bziXnGcrtWXqZYKIN3p3Z/yMbOSVJRfrOq5kTIsPfHWI
 XzBxgCIXZaCl9dBlCG25/Ckhfes7Il+EVROdn2apF0DCUnBfi4r1OLVuC+c8P7nPHhlI
 nA3w==
X-Gm-Message-State: AO0yUKXGuZMu41lIQoa8oeNkVcD2UuOf+RgPHFNjxCrYoRwy/qEhzDvW
 6LvfiDWORs5aGs1DfOHMuoW6YdUUWPN4DbEJ
X-Google-Smtp-Source: AK7set9Xlo2YLH5StYx2rh1bbhR1WKrf1lUgrubCXuRJugu8sDhhKRaztkysjJ7E+dJ2kuqvuNsJ1A==
X-Received: by 2002:a17:90a:1c3:b0:237:3f83:61f3 with SMTP id
 3-20020a17090a01c300b002373f8361f3mr944748pjd.16.1677832946849; 
 Fri, 03 Mar 2023 00:42:26 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 u5-20020a654c05000000b0050376cedb3asm1003844pgq.24.2023.03.03.00.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:26 -0800 (PST)
Subject: [PULL 52/59] target/riscv: Add *envcfg.HADE related check in address
 translation
Date: Fri,  3 Mar 2023 00:37:33 -0800
Message-Id: <20230303083740.12817-53-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

When menvcfg.HADE is 1, hardware updating of PTE A/D bits is enabled
during single-stage address translation. When the hypervisor extension is
implemented, if menvcfg.HADE is 1, hardware updating of PTE A/D bits is
enabled during G-stage address translation.

Set *envcfg.HADE default true for backward compatibility.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230224040852.37109-6-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c        | 6 ++++--
 target/riscv/cpu_helper.c | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c8580f0c80..32cb297cfe 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -613,8 +613,10 @@ static void riscv_cpu_reset_hold(Object *obj)
     env->bins = 0;
     env->two_stage_lookup = false;
 
-    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0);
-    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0);
+    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
+                   (cpu->cfg.ext_svadu ? MENVCFG_HADE : 0);
+    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
+                   (cpu->cfg.ext_svadu ? HENVCFG_HADE : 0);
 
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 44a8f267ae..7b7df01935 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -937,9 +937,11 @@ restart:
         }
 
         bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+        bool hade = env->menvcfg & MENVCFG_HADE;
 
         if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
             pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+            hade = hade && (env->henvcfg & HENVCFG_HADE);
         }
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
@@ -998,6 +1000,10 @@ restart:
 
             /* Page table updates need to be atomic with MTTCG enabled */
             if (updated_pte != pte) {
+                if (!hade) {
+                    return TRANSLATE_FAIL;
+                }
+
                 /*
                  * - if accessed or dirty bits need updating, and the PTE is
                  *   in RAM, then we do so atomically with a compare and swap.
-- 
2.39.2


