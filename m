Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B976CF11B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZcT-0004vm-8N; Wed, 29 Mar 2023 13:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcR-0004vM-Vu
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:56 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcQ-000165-DF
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:55 -0400
Received: by mail-oi1-x236.google.com with SMTP id w133so12171349oib.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tNrnnPCdwyCQXcNW1F0Rg4ywGRq+Tg38j44yL/tfXA=;
 b=K23LYA5tg62/Bi02STDYn8Vl5djlPi0mXLVvOq336iCu5WsMAgHFKIroY8Yloq/25t
 U+GZtMVQ+LrelQWdYLDKs+0rILNcfB5mvz4EPVDyMtxw7sOIcPzdcXT1fAWOAOAHGH/B
 rullnTH1B/zOU9jC+nsxNt0Ros6Wq8G1GTYDEMT7/2B2fiPH+jhgHg7UEy/G8PMxtOkH
 /x404PtXNk0AjRXKegoFpZmHib18tqEXAj4yTHIiv3FAvJjqtrwgFHiUQDTU4MBxxDtK
 xbEb1yCiYCWNO4+xmxWtzqOP+q48rPxCLhf2igPSZ5bUIhiQ6CGS0lD4GAz5ZwvxkFWl
 Yi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tNrnnPCdwyCQXcNW1F0Rg4ywGRq+Tg38j44yL/tfXA=;
 b=2ElsbhNOuta4VvqaRXU2KXFP6x4j5weIJdwNml/uvflZTIZKg5ayYwPD+EzbM2S2M5
 kMU7fWNsC25rI5HKc7uYlwb4RfZ7Ao62M8BLvD5Q5020A41zYKHjII9bIiTr7QVc2Oxo
 7x8hoxW5RHCB5UMs14oYy9UnNDRuWqUF0IWzU+yTJfzcGSJYBKhbIjhzoyYxkrc1IkYj
 cY8wyvC0Za4hJhycFcYYFsW2obIvn0pE039YwRSA9Gv/mOYzpsnwmhkER3GFYZmoH+jo
 nAOyLm9vEo0V8pO/bihBV+ARbwabuwt3owvmkD4AhcCbEwSp7Sdv4ikrZW6SemmG1vjQ
 Jtkw==
X-Gm-Message-State: AAQBX9evtTttjrR+n3rRHCaEp+1tmNbXUwouRzlnbRycyXiBelL4r0Cf
 RuFHlfFsqnqlUxoA2lqMWqxYpRIPiCxh7l9WS7g=
X-Google-Smtp-Source: AKy350ad/6hdWQY3+ugIveXORMC9EWhXzarnMteCJdxjjWqItSlSSawZEIWLajhhMe9/qMkf1NGwKg==
X-Received: by 2002:a05:6808:7c5:b0:389:5164:9db2 with SMTP id
 f5-20020a05680807c500b0038951649db2mr3565720oij.48.1680110993245; 
 Wed, 29 Mar 2023 10:29:53 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 15/20] target/riscv: remove cpu->cfg.ext_j
Date: Wed, 29 Mar 2023 14:28:58 -0300
Message-Id: <20230329172903.636383-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Create a new "j" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVJ. Instances of cpu->cfg.ext_j and similar are
replaced with riscv_has_ext(env, RVJ).

Remove the old "j" property and 'ext_j' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 6 +++---
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 76dcf26f6c..86edc08545 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1118,7 +1118,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_v) {
         ext |= RVV;
     }
-    if (riscv_cpu_cfg(env)->ext_j) {
+    if (riscv_has_ext(env, RVJ)) {
         ext |= RVJ;
     }
 
@@ -1451,6 +1451,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVU, .enabled = true},
     {.name = "h", .description = "Hypervisor",
      .misa_bit = RVH, .enabled = true},
+    {.name = "x-j", .description = "Dynamic translated languages",
+     .misa_bit = RVJ, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1547,7 +1549,6 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
@@ -1579,7 +1580,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
          * We don't want to set the default riscv_cpu_extensions
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f3cb28443c..43a40ba950 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_j;
     bool ext_v;
     bool ext_zba;
     bool ext_zbb;
-- 
2.39.2


