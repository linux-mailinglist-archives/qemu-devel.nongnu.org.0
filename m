Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B956D9F81
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:07:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTyT-00016g-NX; Thu, 06 Apr 2023 14:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyL-00013C-1p
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:33 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyH-0000eq-5r
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:31 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17683b570b8so43185420fac.13
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x17gQvU5jjV/8z4M540QkhyEwhpbTSgb9uB+N0XU/Ck=;
 b=KAnX5UhBHO3RUbo2A+K9/2oQ9BbpMlYTHJvvAunZHFZbcEEY3fOGJ24Idka/kNkJ9b
 YOW+95eiQRJko3KN+UX+hdP5acWag5r+MH3bmzifsfapOeUDJ3jl2XNW5BLpxQE3EiA9
 vPF0MiWjpDlm7AYOG/Mw3VE5QFMQpjSnWoU9z9CA1IWRVCbrNMhnzzESEWTb0r87Us2j
 D5el3EEjpecuHZm0iqcwL1ajrP0JF+gvcZKUzG4Zh1ZtYSAlT9TY8mIQ135liB2+i9CI
 iPMlMV9pY3vx1pggTEuhyd6k0hG3BLbR16LqCTzVQc9KAgh/1cMCH5LEnS2eseVE6yXU
 9pdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x17gQvU5jjV/8z4M540QkhyEwhpbTSgb9uB+N0XU/Ck=;
 b=IyXF2F3a2Xf5Te+cnLmghyX8t64GR8GqRVw2p6qzcpUpf3ZpHvqKxYkCvZHUgnWJS8
 uJVKMCB+gMCMn6xfvf2pMPxMMz1Dpb+X+kbLR/B13TwrplReCLqnA23JYLhiLg91aQ5r
 /KdwfaNBZKEkojb/oMZCkitpMxB+YpGi5A0+zv4rjLzvJVar+ghBQhVx5sxbp1eEoefE
 DJHwnGIvE4zS7M1phTbXLW8Fxaazg81xCZ/koJajs1fny382XsJW6d7RQ2ma9Rlp64O/
 w2kihmPQHNueR4azdVMcE7aav3xulSJddXVYWtdMeXeOzA20uQoRd17XdNHXRNxkEson
 jhhg==
X-Gm-Message-State: AAQBX9fzxK73rCfTtEN24KEX2j9NPhcmXRgs+KVXMWj6dnaTxMJ1BZfn
 NbTExEjpzCYkubCynDhZ6IFxLNEmoClavMEQrPA=
X-Google-Smtp-Source: AKy350Ztt4xEFUekq3+eab/6aUEff3n5RfalIvy31Zn/EqftzJhEoOSfH4L//Y5xdUW8fy/VdeUeVw==
X-Received: by 2002:a05:6870:e243:b0:17d:1f3:3016 with SMTP id
 d3-20020a056870e24300b0017d01f33016mr3631243oac.5.1680804267754; 
 Thu, 06 Apr 2023 11:04:27 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 09/20] target/riscv: remove cpu->cfg.ext_i
Date: Thu,  6 Apr 2023 15:03:40 -0300
Message-Id: <20230406180351.570807-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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

Create a new "i" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVI. Instances of cpu->cfg.ext_i and similar are
replaced with riscv_has_ext(env, RVI).

Remove the old "i" property and 'ext_i' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 15 +++++++--------
 target/riscv/cpu.h |  1 -
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 715cbca1b3..f082748569 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -817,13 +817,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
                             riscv_has_ext(env, RVF) &&
                             riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -832,13 +831,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -850,7 +849,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
@@ -1148,7 +1147,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
 {
     uint32_t ext = 0;
 
-    if (riscv_cpu_cfg(env)->ext_i) {
+    if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
     if (riscv_cpu_cfg(env)->ext_e) {
@@ -1502,6 +1501,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVD, .enabled = true},
     {.name = "f", .description = "Single-precision float point",
      .misa_bit = RVF, .enabled = true},
+    {.name = "i", .description = "Base integer instruction set",
+     .misa_bit = RVI, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1524,7 +1525,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
@@ -1644,7 +1644,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e5680b0709..479b654d54 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_i;
     bool ext_e;
     bool ext_g;
     bool ext_m;
-- 
2.39.2


