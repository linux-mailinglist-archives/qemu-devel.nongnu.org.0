Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B381A6F7A74
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtf-0002Zo-9d; Thu, 04 May 2023 21:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtS-00024c-Rb
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtR-0007by-7Y
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aad55244b7so8541205ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248752; x=1685840752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cDlZ4Zbd9WcpiDWF+eyHE4GUnPL/j5qqsryflmQ1crU=;
 b=luQt+STFKqVAZfcqt5cri+iT61UIzah4GfqSQUkcwAOrxjZ9lQSCyf1QAhva+K5KNq
 cKxsujNKIDPF4dR/E1StOQ7xfpe0nuOf/G5ZpwRTW75CQMO7aZDjeQKDjaslOvK5QxUD
 bEzP/1rXH0DQ3ybMQiKZ4Fi5/ym/sL3/FRwH+1FCx3y7LsXyq2RyXezg86jgcHoOk1yu
 V4zgfCs1jOmrN+JS/OsE7F6guVfTEzwPaUFe/gnfmsalOJ9uX+D0t4k5N8gjTc9Jm0D2
 pd46JHHLfThYMvh6pSWKyB8JaqYTWnb2D+jY2AQOZZO3ZCdPS5OZ4T4Hm06TfQY1hAnG
 SLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248752; x=1685840752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDlZ4Zbd9WcpiDWF+eyHE4GUnPL/j5qqsryflmQ1crU=;
 b=gc/VLbALlWrs2x5Ijl8pQ63tHC9nbLB1lHwdpm4XvT7GvQ2N16/g+swwv4QwJsoR5Z
 LG+Dja7irAbqQJOPUzmZJXJlkTHIUg/1ZGduF5nEkwSB0/U7MHWadCLt6r8bXAHQwbko
 DJPdRBYjuOxC2tTBBQ3FLaixodDrg4e/olRlMuSW0CdTQQ2fQUqA81q0dKq4mw08P5Py
 aBIR9dSDyAC6h9ENMnmWKS/oI2iFem/QGv0ofqfyG3axcUDEOmBC0vzDmiw3KZpO9KUd
 DfkhbV9KgjVg66VDsOp2XcPlItVDtfDok8JtuVykTB9vXK688bU1UONmbCKK7lWeKKNV
 2V7Q==
X-Gm-Message-State: AC+VfDyLQqbzHgMIiDIPV7y5EJRRNL8jHH/g19Fj7nNslv4+GpA99T5j
 nDzH4WY1Fkx8QSZ/NEwHe2tFD9HGEYou7Q==
X-Google-Smtp-Source: ACHHUZ4TFzczx87uAJi8dbngnzLLcqcw6EfGyppgFyh5hAo4euflEH1DMXzS5SNJyLW3tiU5ADwKsg==
X-Received: by 2002:a17:902:d2c2:b0:1ab:581:839e with SMTP id
 n2-20020a170902d2c200b001ab0581839emr6703330plc.65.1683248751755; 
 Thu, 04 May 2023 18:05:51 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:51 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 45/89] target/riscv: remove cpu->cfg.ext_u
Date: Fri,  5 May 2023 11:01:57 +1000
Message-Id: <20230505010241.21812-46-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "u" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVU. Instances of cpu->cfg.ext_u and similar are
replaced with riscv_has_ext(env, RVU).

Remove the old "u" property and 'ext_u' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-14-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 -
 target/riscv/cpu.c | 9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b8e541e5f..486061589e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_u;
     bool ext_h;
     bool ext_j;
     bool ext_v;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cded82ac7a..9565495839 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -407,7 +407,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_u = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -842,7 +841,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -1170,7 +1169,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
-    if (riscv_cpu_cfg(env)->ext_u) {
+    if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
     if (riscv_cpu_cfg(env)->ext_h) {
@@ -1508,6 +1507,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVM, .enabled = true},
     {.name = "s", .description = "Supervisor-level instructions",
      .misa_bit = RVS, .enabled = true},
+    {.name = "u", .description = "User-level instructions",
+     .misa_bit = RVU, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1531,7 +1532,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
@@ -1647,7 +1647,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
-- 
2.40.0


