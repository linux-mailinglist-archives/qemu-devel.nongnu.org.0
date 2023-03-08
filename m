Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6306B12EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:22:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0Gl-0008I4-NM; Wed, 08 Mar 2023 15:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gj-0008HO-7d
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:13 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gh-0002Wu-Lz
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:12 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bp19so8752oib.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sor+s3eQ6YdS90sfFqFUjUzQyje0tn81LV5CVbc+K3E=;
 b=fX5Hr9vurwT2ZCmmGnN7vixTIDanVoOIX7Jxodgh1UZ92VEifuTwQ8MXU1IEgCoRnu
 FIj2TNRR3wTS/0yF7W2K9G3w1vDjF3tlBPHGJ9cs13Rf1Jj+paBbta7CuUK94XvyG9sn
 9meMgGVGICHy780E4793sR6PBKK1Tfp2maAZzliOd7xWH5scBb4+4vGCiK4NdJ8CU8kn
 FC/VWcZiAxnVTvB4ROSoKTr1YXqGxOrf96ElenjMmB+SqFpgacL90LzSkl7U3KoWH0dR
 aAz6Z2CBQ1axjY7i6Xg0Bi7Ci5cBt8sVaFmLnNdmf19I/IZkrPurACB1cJdtPgTqa7tp
 a0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sor+s3eQ6YdS90sfFqFUjUzQyje0tn81LV5CVbc+K3E=;
 b=41Zf9vmTkcngG4Diqusr5381pXCTnjcBC3YBSrcoRy6k4wbRY4HLrktjeDoki/o/Xo
 QTnJ4bFO767ijOLKI34OrsdKD7hVvAe91ZQWgNqPtCDJWHabPsavl3TZhsPBs7PPGox8
 dKzR723nD+QqRh4NgcXL9+LYjfSAGLVGED9XXuLYu8Jk3vP4/PAAKDMQESKtlQI9+b6o
 RxnOvbTZ3B6TjU4sTtXNTTHymuYpR1qeZMTUow2pzIfp/a8FzADkRrOYMcqZ6RctlLST
 tQFWLlt3nYS4nwtrzIMfPUn2TyNopPifGAf/1vaUadbdK1hEKTSBLpE0YHJVhv7x0EDF
 dSMw==
X-Gm-Message-State: AO0yUKXtDj38T1tICK4we+Zi2rH1fJJBqts6JTnZX/0Ugxo6Pcaz4bHL
 a2J2H5tFpOqkrm1wxwY7ZPmrlHUcNCm8KHArWvY=
X-Google-Smtp-Source: AK7set+Qu3T22mIft7fKLxZuMUJTOX0fcIb8aL9FR6OLtxWVoBOE1+NeSbQRfIbuBQQNEJM0PBKNZg==
X-Received: by 2002:a05:6808:234b:b0:37b:1bf9:9cd6 with SMTP id
 ef11-20020a056808234b00b0037b1bf99cd6mr7748566oib.5.1678306810665; 
 Wed, 08 Mar 2023 12:20:10 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 13/17] target/riscv/cpu.c: split
 riscv_cpu_validate_priv_spec()
Date: Wed,  8 Mar 2023 17:19:21 -0300
Message-Id: <20230308201925.258223-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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

This function will validate and change/disable extensions that aren't
compatible with a certain spec version. Since the function is called
at the start of riscv_cpu_validate_set_extensions(), we're disabling
extensions without guaranteeing that they aren't being turned on again
after the validation step.

Create a new riscv_cpu_disable_priv_spec_isa_exts() helper and call it
at the end of riscv_cpu_validate_set_extensions(), right before
re-calculating the misa_ext value with the current config. This will
ensure that we're not re-enabling extensions that should be disabled by
the spec rula by accident.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a564de01df..49f0fd2c11 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -942,7 +942,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    int i, priv_version = -1;
+    int priv_version = -1;
 
     if (cpu->cfg.priv_spec) {
         if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
@@ -962,6 +962,12 @@ static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
     if (priv_version >= PRIV_VERSION_1_10_0) {
         env->priv_ver = priv_version;
     }
+}
+
+static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+    int i;
 
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
@@ -1183,6 +1189,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
+    /*
+     * Disable isa extensions based on priv spec after we
+     * validated and set everything we need.
+     */
+    riscv_cpu_disable_priv_spec_isa_exts(cpu);
+
     ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
 
     env->misa_ext_mask = env->misa_ext = ext;
-- 
2.39.2


