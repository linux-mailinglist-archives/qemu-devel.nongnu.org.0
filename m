Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819A06C5A0C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf70F-0006vS-1t; Wed, 22 Mar 2023 18:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70D-0006vB-3c
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:32:17 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6y4-00072l-Hb
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:32:16 -0400
Received: by mail-ua1-x92b.google.com with SMTP id m5so13737015uae.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWIoScj5d/AB/UflSRxN6pqPw6JdXgdwjDu9WZeLHZc=;
 b=APQQg5862ILO+ClJvbI8bKAWUvOUto5D1aBFxqlxmnHCP9XaClGzWi1tEGdGnhn47g
 kH3g1g/sLC2HFgGuDodkODlMJoEzwKkX6U0BCya6KLNffUTa1Ct90CdlsbzoPHiJ18fu
 E4BDRnjJHIreV6vWjj4RIF8yvnQ2hukvl79bx2N7zK6mHHs9w47GL4LrenTe8lWpAxO1
 YVmOpwUgm4+l7xMzGKHMU+Vsr9mn8suf3L9q9y+TdyDoLFm573A9w5F48RzGZtQ6+HrA
 /DakP/Bm3F8bBVtDNtGNLLlGXE95FDeG1/7/BT7TZ+OkN94tNdNJd7/dv7Zr5BuTQfb6
 PxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWIoScj5d/AB/UflSRxN6pqPw6JdXgdwjDu9WZeLHZc=;
 b=aTs811hg0z79NSt6kGHL2GQMQEWPCe06JWuddIirLK4wFqB8pNtV3eJAYz820KU7y6
 gs7ndz+JJWPAQaJccmE9vE+ZKAdrqimoKiJ8SS12tAMUzor3025DjITk5FC9hBuHJCZI
 FBhv+xS/x/bEmbujtndPGzmHYQn63pRQNHfCjKXRzchT3aejcsYpLaRKLOyuAD9Pc5Uq
 KL22Mzp/AcTW9bKPKUyBM/Kzsrmo5SpY0j5DdFgx/YUKNrwehBrWS8vM72lfre5QU98U
 IzMLC9OitLwystrlglNQ4A9iIGrEdgbvaZFYCChYMVd6sXC8YvU47q1gZp+s3Gnr/H9S
 CGrw==
X-Gm-Message-State: AO0yUKWzXFfVhRBwiIZ0195gKhqwTXqKdogiF6ubwqbodkkOiYshGTYL
 WYByTCEKIa72YAtOmKkT+0AKjWbZKoxcoxTlmPo=
X-Google-Smtp-Source: AK7set8roRQ/GTe4p205ue3h1dRPJ8gN3+dFwPb3Xo6GGJHthM/0Ch6Y21hnopf6kJmYHcypqOlBMg==
X-Received: by 2002:a05:6870:b506:b0:172:7218:9c01 with SMTP id
 v6-20020a056870b50600b0017272189c01mr710660oap.2.1679523693464; 
 Wed, 22 Mar 2023 15:21:33 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 23/25] target/riscv: rework write_misa()
Date: Wed, 22 Mar 2023 19:20:02 -0300
Message-Id: <20230322222004.357013-24-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ua1-x92b.google.com
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

write_misa() must use as much common logic as possible. We want to open
code just the bits that are exclusive to the CSR write operation and TCG
internals.

Rewrite write_misa() to work as follows:

- mask the write using misa_ext_mask to avoid enabling unsupported
  extensions;

- suppress RVC if the next insn isn't aligned;

- handle RVE. This is done by filtering all bits but RVE from 'val'.
  Setting RVE will forcefully set only RVE - assuming it gets
  validated afterwards;

- emulate the steps done by realize(): validate the candidate misa_ext
  val, then validate the configuration with the candidate misa_ext val,
  and finally commit the changes to cpu->cfg.

If any of the validation steps fails, the write operation is a no-op.

Let's keep write_misa() as experimental for now until this logic gains
enough mileage.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 12 ++++------
 target/riscv/cpu.h |  6 +++++
 target/riscv/csr.c | 59 ++++++++++++++++++++++++++--------------------
 3 files changed, 45 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0e6b8fb45e..41b17ba0c3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1018,9 +1018,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 }
 
 
-static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
-                                        uint32_t misa_ext,
-                                        Error **errp)
+void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
+                                 Error **errp)
 {
     Error *local_err = NULL;
 
@@ -1113,9 +1112,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
  * candidate misa_ext value. No changes in env->misa_ext
  * are made.
  */
-static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
-                                          uint32_t misa_ext,
-                                          Error **errp)
+void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
+                                   Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1206,7 +1204,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
     }
 }
 
-static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
 {
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dbb4df9df0..ca2ba6a647 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -593,6 +593,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
+void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
+                                 Error **errp);
+void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
+                                   Error **errp);
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
+
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..8d5e8f9ad1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1343,39 +1343,17 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+    Error *local_err = NULL;
+
     if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
     }
 
-    /* 'I' or 'E' must be present */
-    if (!(val & (RVI | RVE))) {
-        /* It is not, drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
-    /* 'E' excludes all other extensions */
-    if (val & RVE) {
-        /*
-         * when we support 'E' we can do "val = RVE;" however
-         * for now we just drop writes if 'E' is present.
-         */
-        return RISCV_EXCP_NONE;
-    }
-
-    /*
-     * misa.MXL writes are not supported by QEMU.
-     * Drop writes to those bits.
-     */
-
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
-    if ((val & RVD) && !(val & RVF)) {
-        val &= ~RVD;
-    }
-
     /*
      * Suppress 'C' if next instruction is not aligned
      * TODO: this should check next_pc
@@ -1389,6 +1367,37 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    /*
+     * We'll handle special cases in separate. If one
+     * of these bits are enabled we'll handle them and
+     * end the CSR write.
+     */
+    if (val & RVE && !(env->misa_ext & RVE)) {
+        /*
+         * RVE must be enabled by itself. Clear all other
+         * misa_env bits and let the validation do its
+         * job.
+         */
+        val &= RVE;
+    }
+
+    /*
+     * This flow is similar to what riscv_cpu_realize() does,
+     * with the difference that we will update env->misa_ext
+     * value if everything is ok.
+     */
+    riscv_cpu_validate_misa_ext(env, val, &local_err);
+    if (local_err != NULL) {
+        return RISCV_EXCP_NONE;
+    }
+
+    riscv_cpu_validate_extensions(cpu, val, &local_err);
+    if (local_err != NULL) {
+        return RISCV_EXCP_NONE;
+    }
+
+    riscv_cpu_commit_cpu_cfg(cpu);
+
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
     }
-- 
2.39.2


