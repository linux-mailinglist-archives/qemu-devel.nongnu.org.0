Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF466C5A47
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:24:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf75k-0007EI-6S; Wed, 22 Mar 2023 18:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf75i-0007EA-UC
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:37:58 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf73U-0007Nm-Bw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:37:58 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 f17-20020a9d7b51000000b00697349ab7e7so11217671oto.9
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2R+rQMSkEdEke1MAtmbFcS3DoytJRnqZrbo/rWklDY=;
 b=gwD/H1BSdDHwvp+BsaJOiJY7SrJu/stQc96eDmmRw5BVsnJP8pxBlW/TRARRi2lurf
 xJuLOg7oLo3ZrbTiq+uAOTrS407Qr2cas+NVdKVWkQKASITy5Awlr7RgUW8hnCRRQqD6
 ZFLDOvfReLs8kD56ByQkC/Io7N9BauDyQkjrosZeWao5FfeFxZDiL4YJ6zTkDsQQDB4D
 GoWlxMD6+Ihg4QKdsFbOg5JU1h2yZgsDIX1RHSief0FejwwHaKSx1Wl7S/vQBKI12KRz
 Arua/xShLbPCQ+PPN1GMNmKF/PeZYVEsq1u+6TrsZJKObj8HgtROOBg58zBCXgcbMvWC
 JG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2R+rQMSkEdEke1MAtmbFcS3DoytJRnqZrbo/rWklDY=;
 b=qBgln0+j+Cv4wFQMCNsNQvh24W0817xagmUANPUxSULeaNRNJIUynb4IssUz7M5g89
 /JvbZ+TsYNW7PyK/M+vPDB2R0twb2ArAeQtVGuDVNQevMxPQarnF2V6LvSwgTylS6Vt6
 M+sy/TmcKARFjUo+PBcFrochbFiZZui96NneWXmPEANWRv+E1zyLVo1tWy97wiw2Lbsu
 Czthn08++3zoU1aewH8dOK9QCQX16j0oy9Vz7RYqzZ0H0eIjjbaSj5iEomPODzcflVC4
 RwXij4ng0qQ6Tzk3q04pXQGMuI5ywQ3gDD+UPrGAf2bt9RQNmcJZU8yPN44c4YBuyfUL
 ji6A==
X-Gm-Message-State: AO0yUKVcsfATPKTxmd6fWt7iGjA9Kil+aiKsTtq6ypf/iVENEhEAvdWc
 CTOkEIKWxFA7dL/lKa90lSQoR3sN+WubbWYabrQ=
X-Google-Smtp-Source: AKy350ava3Qw3oh5a6QzMDjKV5HZAK66z6MEdo+1GzrbxmWBI9BW0f+duQHVQuNpnKFBSHfuch7+TQ==
X-Received: by 2002:a05:6870:9582:b0:177:af07:6842 with SMTP id
 k2-20020a056870958200b00177af076842mr864638oao.35.1679523696648; 
 Wed, 22 Mar 2023 15:21:36 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 24/25] target/riscv: update cpu->cfg misa bits in
 commit_cpu_cfg()
Date: Wed, 22 Mar 2023 19:20:03 -0300
Message-Id: <20230322222004.357013-25-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

write_misa() is able to use the same validation workflow
riscv_cpu_realize() uses. But it's still not capable of updating
cpu->cfg misa props yet.

We have no way of blocking future (and current) code from checking
env->misa_ext (via riscv_has_ext()) or reading cpu->cfg directly, so our
best alternative is to keep everything in sync.

riscv_cpu_commit_cpu_cfg() now receives an extra 'misa_ext' parameter.
If this val is different from the existing env->misa_ext, update
env->misa and cpu->cfg with the new value. riscv_cpu_realize() will
ignore this code since env->misa_ext isn't touched during validation,
but write_misa() will use it to keep cpu->cfg in sync with the new
env->misa_ext value.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++++++++--
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c |  3 +--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 41b17ba0c3..88806d1050 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1204,8 +1204,20 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
     }
 }
 
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext)
 {
+    CPURISCVState *env = &cpu->env;
+
+    /*
+     * write_misa() needs to update cpu->cfg with the new
+     * MISA bits. This is a no-op for the riscv_cpu_realize()
+     * path.
+     */
+    if (env->misa_ext != misa_ext) {
+        env->misa_ext = misa_ext;
+        riscv_set_cpucfg_with_misa(&cpu->cfg, misa_ext);
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1374,7 +1386,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, env->misa_ext);
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ca2ba6a647..befc3b8fff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -597,7 +597,7 @@ void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
                                  Error **errp);
 void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
                                    Error **errp);
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8d5e8f9ad1..839862f1a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1396,7 +1396,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
@@ -1404,7 +1404,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* flush translation cache */
     tb_flush(env_cpu(env));
-    env->misa_ext = val;
     env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


