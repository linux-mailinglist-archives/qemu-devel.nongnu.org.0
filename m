Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C956CA478
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:47:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmCL-0008Mt-9B; Mon, 27 Mar 2023 08:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCI-0008LC-72
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:38 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCG-00020r-Of
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:37 -0400
Received: by mail-oi1-x22b.google.com with SMTP id bj20so6220433oib.3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vq/xPb0BGeP1/p/eR3juVD9psMw0Nrkru0VCkDWX58s=;
 b=jTw0gjjND1X6zfG7n0gpjNNFy3qrBWePEDlRdONiDJZWXGYm0g3LPKsY482kd/3Kwx
 Lk4TVWWmxOcAanv2t0S7eaBxi1VTU5scejcTQCbqnnKikD2XyXYTfZSjBW+sR6DB/7Cp
 q3fbiXPtu067qdnqEA1eWRvSIqS+l+RYsj9JuDDThDiIMPmnv3hw+l2VyZEXa/ygmYj7
 nKyMXuY87oqlNCQW0KTOep09v2c19PdpQ8CT7JRgnEZvK7PpTs1QXZ/Vv/R6fqXQ6d8y
 18ghHmoCDsERB374ll9CgkYIg3M+/pILRZFkVDVg2n7KTIueXJnohxiMa/xwUySbxq5N
 EfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vq/xPb0BGeP1/p/eR3juVD9psMw0Nrkru0VCkDWX58s=;
 b=SsEfRwYKpR9KM5mi0qOFFELX5YSXobvkR608exonEhEDez9W7p5uCqCxw1VgQR49XK
 4cms+iKcFh+bXGSxsEuNUZcLUDXbD9RdjYKPQElMsVnb73uzDeecnENkutlK4VMC9bXE
 I0etoLHVjlI/ObBjCd+45pnNDLYbzDjNgt4VCr0F3s2kTGMN7aECzJTeP2Q96nekCCxm
 Yim2Q/0mwF2Bv+FchkdsVEiDH+woVjzNfrzJZohI0LqMuKowMnHJ1Cs+VkuIsETeEj9s
 gusM9jrbp9mzUH/omBFGfhy6VBrYS4wKNIDJlZuIUZVFwKRTlMJ/0zi3Yfp7xOcIfJkS
 280Q==
X-Gm-Message-State: AO0yUKVwrk9+rLHm8M7RYMi3IJ51JGc4V/5KKOd6DHumelVLjVNBmdnU
 wYsM6Sn+4CtGpvcwJKaIYEd/1Gft/63S90a1jmw=
X-Google-Smtp-Source: AK7set+U4qZi37wu0JYoMcUXcUnl//i8lYCMCxKWtUlLTXDNGFFb7OG62qlY4OJBBB/QVi3fXdG3gQ==
X-Received: by 2002:aca:f01:0:b0:384:2b1d:45a with SMTP id
 1-20020aca0f01000000b003842b1d045amr4626846oip.30.1679921015727; 
 Mon, 27 Mar 2023 05:43:35 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 14/19] target/riscv: remove cpu->cfg.ext_j
Date: Mon, 27 Mar 2023 09:42:42 -0300
Message-Id: <20230327124247.106595-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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
---
 target/riscv/cpu.c | 6 +++---
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 90c8fc0f30..8589f7bd67 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1119,7 +1119,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_v) {
         ext |= RVV;
     }
-    if (riscv_cpu_cfg(env)->ext_j) {
+    if (riscv_has_ext(env, RVJ)) {
         ext |= RVJ;
     }
 
@@ -1452,6 +1452,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVU, .enabled = true},
     {.name = "h", .description = "Hypervisor",
      .misa_bit = RVH, .enabled = true},
+    {.name = "x-j", .description = "Dynamic translated languages",
+     .misa_bit = RVJ, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1548,7 +1550,6 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
@@ -1580,7 +1581,6 @@ static void register_cpu_props(Object *obj)
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


