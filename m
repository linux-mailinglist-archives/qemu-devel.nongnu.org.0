Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF106CB200
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:52:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvfo-0006Mg-CJ; Mon, 27 Mar 2023 18:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfl-00069q-1W
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:41 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfj-0007Sm-Ag
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:40 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso1602739oos.7
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmMWbCrPv5l0fIbQgbQqbSoOhugkHcaBfvc6wr9W+VU=;
 b=TpSzUAM/7rdpnAplPa/9uCwiujG/KH1RHk82RLcwc087UAccie0f707c9s3eshfqmL
 4v4q/yv6qTc4EZ1jHwW3ixV0lv7Nvm0FwnvQLjE2INR4Klc8OHKzVCS7x98+oA/TAdf5
 uRZX53ryOmnftdRrtJJk7zQu450OW7AZOw9KDQnK3HmhfX1FsnWbNzlldg0h0ogHfa3P
 C9iUEio39K0V+3HywPeDHAMmVPQvXXU4ZYuMlBl5nIfZRdqiq630YZkbAfTtRWB42RTt
 jwyEjnM8ahqTmoU4RR3cJgCIsFp2SPAZQvGpno9zDmzPpeIW7X6LSy9rhPJN0B3xAtq2
 E5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmMWbCrPv5l0fIbQgbQqbSoOhugkHcaBfvc6wr9W+VU=;
 b=X3gLPzg/q53UPdBKjVbTpuMHb68rZxunmq+Ujrhwph6iGSTlIo7jNnmEJQt7g5JjiE
 IAbMXZBuTJIsPfaswMumuPC3pfcUXjTX7ms2o1RyJfGOtsDiAa+66Ms90GDXUudPdZGz
 Y9Eo7ew2kaSf2Efpjfn6tx1kuAvoIP3j7lUSGV2k+ZPLFkSJTe6+GbD8JvwDmtN5oCWS
 CttE8ayaMQosshGk9QkWiQynn8C4o2HHc6fN9K50xCqVVkFWuMUqglDzKiAmEHCQY+M0
 3bZTehZNKAWdHM5SjjbXw7LJDLYH/Q6raoF3/o1ef4Xnyh65SmBUsTnjRBpsGSdkl0mt
 r7yQ==
X-Gm-Message-State: AO0yUKUpuF8OGySGrmO0bsp9w9S/P6+GZdyc7oZAKBAKI0Vzp8PKf7iq
 yCUpyOqkNWLFq+Dyw1Ine2kVZ0gI9soj524aCFc=
X-Google-Smtp-Source: AK7set9U83SlWimVRiob6A3/J01WQuF6lMFFrbdLa2cUn/u9QHaYD0o9QLntTrzttgt9bPi4reC8zg==
X-Received: by 2002:a4a:4512:0:b0:51f:e2ab:5535 with SMTP id
 y18-20020a4a4512000000b0051fe2ab5535mr6378051ooa.0.1679957438261; 
 Mon, 27 Mar 2023 15:50:38 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 14/19] target/riscv: remove cpu->cfg.ext_j
Date: Mon, 27 Mar 2023 19:49:29 -0300
Message-Id: <20230327224934.363314-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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
index 9fa7104801..e02d6f06e8 100644
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
 
@@ -1452,6 +1452,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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


