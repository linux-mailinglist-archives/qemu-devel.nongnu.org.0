Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145456F7A5E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtl-0003UW-0V; Thu, 04 May 2023 21:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujth-0003CM-UH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:10 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtY-0007dV-4X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:09 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aad5245571so8033315ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248758; x=1685840758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5PHm+/0fHo5woJCY6EqmLZmNlnAPjLAIx4jrfLf5nI=;
 b=boIiUE1KBvoAkfwTXKXmkZzE6ONoXcnQEJERd14G3I9YjNh97aoSj2kD5asDZrJrSX
 GuitXYvoi9LWWNz5DCwxmYkSKvrJg6H+x7GJGhzOfM2u9fUETqmd6qGRaNg96Fq8CtAj
 T59RAoU0tGBF3DvnFKd2rQr8kbbgOfzBOgng2fFZPqWesi/nNye7SGTQmXY7DS78Wggg
 bGw6Q6LyR53ak6VqvIg/UT8UqgRnhSbOz36rI9Z96eCAQLj4FmHSSi5xgTzcDO09gsg5
 /anp0N5KxZVraaJUPzfbOvymt2eBjemUEmekSQDY4kJFpH1S370HYbcFDmrPOyvvGe8V
 fsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248758; x=1685840758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5PHm+/0fHo5woJCY6EqmLZmNlnAPjLAIx4jrfLf5nI=;
 b=SI4Sxz0AAfkPXsTTbhgKUN+TfnXTEa4rDgzskZr7CFMtpNBH24TnPbxuanhtk2G6gY
 zXTyDZi7h/pxZQMyfZQwEZQKUVSs1NoWt2etfFlko1EPezs65tgfJnvzhC1qtVuMSj+U
 XEHS+5iDJdL6s+f5ITJmDrWOxi/WJoc/V2DMuOtb+Mrf2IX5Y5v0azAv4yVwQ+D9HmNP
 BrKUPi0EMyG/VvkgMv2Yu3VGxiWOA0Dc9PJHNnAfxqTfdSU9yOlQLcUdFvaZ9iCPdbO3
 Q6i91WOk0IB0U45lsdFqSRGnk0LcriFBqZxvJDI7WV8yUY+L4iILedHM3K3VdiVrxHM3
 FQlg==
X-Gm-Message-State: AC+VfDwPACciW++obBfSwar9vfc3xBj30k1pkcYvfmeNA+aUxowMbsSm
 5cocAOprQAc/Q2rwPYE0HdNMFGhrVc5++g==
X-Google-Smtp-Source: ACHHUZ76Smpne7P0I1CkVRiOW4OLYbtq19bYeimOK9L3a6Qp4kebte8ABc28pSuzWtQtTOWeRbFZaw==
X-Received: by 2002:a17:902:f691:b0:1ac:2cc6:296d with SMTP id
 l17-20020a170902f69100b001ac2cc6296dmr4450855plg.34.1683248758661; 
 Thu, 04 May 2023 18:05:58 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:58 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 47/89] target/riscv: remove cpu->cfg.ext_j
Date: Fri,  5 May 2023 11:01:59 +1000
Message-Id: <20230505010241.21812-48-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "j" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVJ. Instances of cpu->cfg.ext_j and similar are
replaced with riscv_has_ext(env, RVJ).

Remove the old "j" property and 'ext_j' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-16-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 -
 target/riscv/cpu.c | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 823be82239..1aff93ba91 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_j;
     bool ext_v;
     bool ext_zba;
     bool ext_zbb;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6291224905..3bdd6875a8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1178,7 +1178,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_v) {
         ext |= RVV;
     }
-    if (riscv_cpu_cfg(env)->ext_j) {
+    if (riscv_has_ext(env, RVJ)) {
         ext |= RVJ;
     }
 
@@ -1511,6 +1511,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVU, .enabled = true},
     {.name = "h", .description = "Hypervisor",
      .misa_bit = RVH, .enabled = true},
+    {.name = "x-j", .description = "Dynamic translated languages",
+     .misa_bit = RVJ, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1607,7 +1609,6 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
 
     DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
     DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
@@ -1648,7 +1649,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
          * We don't want to set the default riscv_cpu_extensions
-- 
2.40.0


