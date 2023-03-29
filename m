Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7CF6CF130
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:33:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZcL-0004ao-2S; Wed, 29 Mar 2023 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc8-0004QU-Pa
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:37 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc6-000197-C0
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:36 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 f4-20020a9d0384000000b0069fab3f4cafso8594799otf.9
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvfwtJOvQxvFDVky3wFNB2cr+H5LaOTj5utth3jYeww=;
 b=TlW1dix6LGXVJy9/2/FBohKkcx03g5Wn62i8zCHom8FdU/muW1lU7EwyTjLqcA9b0Q
 I5tUIDXyUhgg77ax0Je8SDi2CL4u3XbYwhz4g5p4n/Ne1GMC2HuzksEthhqmJ/DcVSBr
 NBvagVY+W8tePmEA6xCThQ9nT1pYT/3hywWZG1JGw4vDBxHkpCkZcWf6hsVU/xZbcVeP
 TozUret4G0wOz8aX8E3gphLVheG2RkxKyX9WfhB5miDc/TNKdSxsiyBYDZGgAsGkBaiZ
 T1+6U78R88RYl/t9b4z2GBuZs2xj6kz1mHUItSS0Mx/BosM8wdn+ULAVArAzE9CHuoQL
 AiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvfwtJOvQxvFDVky3wFNB2cr+H5LaOTj5utth3jYeww=;
 b=Xvxn38mS80u8Dx88n5GFhi6kWZfFi4bvmtm4Yd0usx2uY/exGtMB2OMqslQ253TTZK
 yAErgmYtTtBLO3Yc3aT1l/QieL2obzBFu5JU7qsAYed6oufeQqITZ+I0mqhAlZIbpDAM
 janrdwxcDV73Ltewy18v9VkntuRYsb+VgN58PSIoEvwW6+RxN27Vq5n8SNzRFr5KLaGU
 HCt1nN5rJ7I89HSSXGDnYZkaglC0NJKqyI7RtqINFKswzKdwfj5LOslN6b+eSiSwI+ww
 KTa3R9czyNjsSdBLMqX+aiAX0Rl/weTdTAMOPurEb4esIbIMIRUdgoXGRrPVr200bpsc
 zXHA==
X-Gm-Message-State: AAQBX9fvhFXDfKjYdQm1IhdspwtvNF9ZgsTfWXPgg6caDxBjfBHXcDZG
 K19R2/S02KpB/2zuMYkYSi1UYTVBih5IJIPFkMc=
X-Google-Smtp-Source: AK7set9RRHxieHtmCYy5k9oq0NSymhkw5F8U0gaMqAHxHM0tEeYxxRR8R4kC5jotP8E69Jo2kbyTgw==
X-Received: by 2002:a9d:6b94:0:b0:69f:909a:a095 with SMTP id
 b20-20020a9d6b94000000b0069f909aa095mr9508106otq.6.1680110973004; 
 Wed, 29 Mar 2023 10:29:33 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 08/20] target/riscv: remove cpu->cfg.ext_f
Date: Wed, 29 Mar 2023 14:28:51 -0300
Message-Id: <20230329172903.636383-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
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

Create a new "f" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVF. Instances of cpu->cfg.ext_f and similar are
replaced with riscv_has_ext(env, RVF).

Remove the old "f" property and 'ext_f' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 20 ++++++++++----------
 target/riscv/cpu.h |  1 -
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bb714d0d8..f53400d40f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -812,12 +812,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
+                            riscv_has_ext(env, RVF) &&
+                            riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
-        cpu->cfg.ext_f = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -854,7 +854,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
@@ -868,12 +868,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
-    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -898,7 +898,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -931,7 +931,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (riscv_has_ext(env, RVF)) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -1100,7 +1100,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
-    if (riscv_cpu_cfg(env)->ext_f) {
+    if (riscv_has_ext(env, RVF)) {
         ext |= RVF;
     }
     if (riscv_has_ext(env, RVD)) {
@@ -1440,6 +1440,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVC, .enabled = true},
     {.name = "d", .description = "Double-precision float point",
      .misa_bit = RVD, .enabled = true},
+    {.name = "f", .description = "Single-precision float point",
+     .misa_bit = RVF, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1466,7 +1468,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1577,7 +1578,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e4cf79e36f..ce23b1c431 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_f;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


