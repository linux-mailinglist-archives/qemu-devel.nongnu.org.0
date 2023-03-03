Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD86A9416
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:27:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zs-0000so-07; Fri, 03 Mar 2023 03:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zk-0000Jq-DQ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:28 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zi-0007mo-F6
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso1617321pju.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832945;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wEG7mxfnOkIxV6CDCb4kC+5QOReGUUxDqvx9Y/+Rtxk=;
 b=m8yLLbm6UZL2YA1fkfhaKl72Hn8cWH5yidV0M4t9EERqoeQGk87HAKZdCMmu2g3FoY
 ugdciknrOZLdV6uIgqOwQjBU7a2eldYZ/IXfLFwlBUcUyo2HcEkQ3FKbr3dqtFv8uam9
 jB0DqD5uh2wvrBUvsZORbN2QSwLduo3Hpfu+R5B/dfxjH948Ci4mihfrU4/1yNgxVZO5
 byCY7YiqYJtaxeIYs0XyL6A4jpaSoUeFkihm4g2BhdyyVLOfX8jwFpfMjQeEhJ7GX/sl
 Cxsrzdged6RNPXkFZiROLkn8Z8tFoHMI6hgbL1vPUBlCcc5jIeM0UGtIcGrYcWVZz/xk
 h6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832945;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wEG7mxfnOkIxV6CDCb4kC+5QOReGUUxDqvx9Y/+Rtxk=;
 b=ERM/L6mz6JN5/+FBlL8NVuO0wvV81Tk0w9DStFMCik/kpTq3L38FD9cJnvqwCUmrbA
 EL4Y5hUNMMukltZDU60mKB3w/aOujlJu/HHI7CJJwUb2D1H52tcM4/TIPVnc6ORFxTw5
 P6ORJhhYuGs3oL4nxY2A4yEnJb/RzzgfiO5yTSewqC64T2/UULvZuu3JOdQLKa3J+ZTF
 psMwIbd79SSe6TYcQkDqcfZ3kwOs4rvUvaKGN2f68w8CSaxl41j5D6YawgrqFVTTTZFy
 +InrgEcYWIpYHDb+xp4MdtZ5aGOjSH6cDFDW+8dd24Z9Uo+5vhAjnRzJHa9ni6z/f14M
 zSWQ==
X-Gm-Message-State: AO0yUKW3/J1Sou/IIR5olbpjBDuzehlnIt5GfQ6vyHHcS1Kjhq7/DOlX
 ncRNFJCwT2Fk9/XwoXmz+qOIug==
X-Google-Smtp-Source: AK7set+o6NuPg26G2f6XZT0jKCocZv61Le4Do71tXoid0KhDstEHWTAAvaNxAUsARqug1PyXe8hRmw==
X-Received: by 2002:a17:90a:1957:b0:237:659a:a44d with SMTP id
 23-20020a17090a195700b00237659aa44dmr1001355pjh.9.1677832945575; 
 Fri, 03 Mar 2023 00:42:25 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kl13-20020a170903074d00b0019a88c1cf63sm967345plb.180.2023.03.03.00.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:25 -0800 (PST)
Subject: [PULL 51/59] target/riscv: Add *envcfg.PBMTE related check in address
 translation
Date: Fri,  3 Mar 2023 00:37:32 -0800
Message-Id: <20230303083740.12817-52-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102b.google.com
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

menvcfg.PBMTE bit controls whether the Svpbmt extension is available
for use in S-mode and G-stage address translation.

henvcfg.PBMTE bit controls whether the Svpbmt extension is available
for use in VS-stage address translation.

Set *envcfg.PBMTE default true for backward compatibility.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230224040852.37109-5-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c        |  3 +++
 target/riscv/cpu_helper.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..c8580f0c80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -613,6 +613,9 @@ static void riscv_cpu_reset_hold(Object *obj)
     env->bins = 0;
     env->two_stage_lookup = false;
 
+    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0);
+    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0);
+
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
         iprio = riscv_cpu_default_priority(i);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3a9472a2ff..44a8f267ae 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -936,9 +936,15 @@ restart:
             return TRANSLATE_FAIL;
         }
 
+        bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+
+        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
+            pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+        }
+
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
+        } else if (pbmte || cpu->cfg.ext_svnapot) {
             ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
             ppn = pte >> PTE_PPN_SHIFT;
@@ -950,7 +956,7 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
-        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
+        } else if (!pbmte && (pte & PTE_PBMT)) {
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-- 
2.39.2


