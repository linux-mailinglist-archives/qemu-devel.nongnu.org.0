Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FAE6D9F77
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:06:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTyU-0001A2-Ps; Thu, 06 Apr 2023 14:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyR-00016c-Dj
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:40 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyO-0000eq-KE
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:39 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17683b570b8so43185741fac.13
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kV7z09+98ddMxW+lPuQeVv6kSGaKTK/aK1AU+q2WtVg=;
 b=Kc2V2GluUYxAHaM2MKAM7W7YcaF9LBCB0VP8U6/Xz23vrxV7CbGe+wprANq8TLWRVr
 Sav8M6JkuoMKUA0HmegQ+JBB9W57s98KwmP8zdF0Xi9RHgstVMf0XApYwR/dULz///zc
 Vbb1XznUWqdMNK+vP5/eidZWC85mTW1lQ5PdSssOuyk6y/C2rRcN2v8VSKXtksiqmewK
 8xT3Qa3uPb199w9DjZXOtqb6d96WzY7P+apTosKZDT5nYxu+uK0GVYFJYJBV96yeKdUw
 fl5hJkYDY08fZmCNMRd2XdphyXnhqzrSkcGPLkScMQnA9U6v7Wcwp+eV3fxCYjIqAm7C
 ba6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kV7z09+98ddMxW+lPuQeVv6kSGaKTK/aK1AU+q2WtVg=;
 b=5qmX9i/gHDSPTXZhfqeLZu1JTar345pz3nB1xkC4w4i+LXmVGmuj+7Fe3Pxlq1tXU7
 BXjfC9XheeJSB6kl9DKYNSzzEUJcBy8EeeBIDy7gmg11kKFmQjmMuDQeilrPH2FvO0EF
 l5zMbAMfU92SAeqmest4EISYKWb9Vr8W+c87CLOk9RilMqMc0cN0AYh9TXNc70v+NPJY
 4NTXYCI036NaVaZz+5N9txLqUS7/iAy8fPW+0WDURFaLsoBpccE5VQJANY2UaX6Zmlpu
 9Ks7XGwKn94UPzLFltDO47KDpqnXV1Bardm/JHJMGASxRilfy8regKluy5CC2r2z9jhG
 kAOA==
X-Gm-Message-State: AAQBX9eWbH5lgWUKNLctfktqvCH9tIAijcLDJFXVsnoFLmMdPdWCT7gi
 D/F+EIYqiC3OmuDT/p/FIPzba+aX+x5+ZAkAVYo=
X-Google-Smtp-Source: AKy350YV90xy+hlW+GBPL8Fm7T+FEq4HIs8ZCtkBbRtEByD9QtN90D2Biavx8j6Gz7eJAPznvKbWiA==
X-Received: by 2002:a05:6870:b489:b0:176:53a1:b65c with SMTP id
 y9-20020a056870b48900b0017653a1b65cmr148750oap.11.1680804273439; 
 Thu, 06 Apr 2023 11:04:33 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 11/20] target/riscv: remove cpu->cfg.ext_m
Date: Thu,  6 Apr 2023 15:03:42 -0300
Message-Id: <20230406180351.570807-12-dbarboza@ventanamicro.com>
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

Create a new "m" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVM. Instances of cpu->cfg.ext_m and similar are
replaced with riscv_has_ext(env, RVM).

Remove the old "m" property and 'ext_m' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 33db4fa4b2..24640450c7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -817,13 +817,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
+    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
+                            riscv_has_ext(env, RVM) &&
                             riscv_has_ext(env, RVA) &&
                             riscv_has_ext(env, RVF) &&
                             riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_m = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -1153,7 +1153,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
-    if (riscv_cpu_cfg(env)->ext_m) {
+    if (riscv_has_ext(env, RVM)) {
         ext |= RVM;
     }
     if (riscv_has_ext(env, RVA)) {
@@ -1505,6 +1505,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVI, .enabled = true},
     {.name = "e", .description = "Base integer instruction set (embedded)",
      .misa_bit = RVE, .enabled = false},
+    {.name = "m", .description = "Integer multiplication and division",
+     .misa_bit = RVM, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1528,7 +1530,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1645,7 +1646,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2b42de60b1..71540a33ec 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_m;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


