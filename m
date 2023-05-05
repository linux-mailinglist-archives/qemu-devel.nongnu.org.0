Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A26F7A81
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuR-00074q-F1; Thu, 04 May 2023 21:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuA-0006r1-33
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:47 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1puju6-0007lb-0m
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:36 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16304697b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248791; x=1685840791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXiRfA1lCxh93roVIvQPkq79XyZvB0MaIu5Q6xvGzsE=;
 b=ppZW1pOixIx29J7mn7yjJybyaYczUrmMHc1zI7WTMzabGCIWGU183yV4VzEnKYLPMY
 NULd87NFI7jNHFwI+S5snpGJbswae9Sq20tXX6LywQgIli+lZgDtB32JATU4XkJ5u2JT
 eCL4MpTcg851TYxmSEwxAnkdhAngBygZ5xFDQpYsZEp03lheU2MmWyaP6z1KsMlCogFs
 6KDihBLP5lJ6KYuHVMk11/l87rsNk3+r7j2sszstANnuiV+zXakio95FMyHQmkxw0BRv
 cC9xylNFJY0+PirZKhycm9eqpuH7VG4BLOkENKTer7ETCgWqvX/IbjtssS4fu+a8hZjV
 VG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248791; x=1685840791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXiRfA1lCxh93roVIvQPkq79XyZvB0MaIu5Q6xvGzsE=;
 b=j0/Tdy8OfPPTAIeNZXqu965StazeeMIE7S1EC5e9loqnpjckewCodaBEQrGNoDowjM
 HDRMsoCVLgmwVUael2abJGjRWPm9u/UJTpd/97yJA8xHsmkujvZgoha5sgHr376+q1TS
 +Vjxp8Ox1rQ3dmn0r3CW7ZekRusU3ddIOEEIEHBSeR4Z+P4P6h+jEKYofvFW4sqjtLWJ
 f42t+0hmq6FayUh6Be7lRR52NRu9hTFcxixjD7Fk/JRoizBmu671u+06O0cWMl34PQG5
 Etiv+Q19AKEKcJDHqpW5AzU1wjhOXIdhb/eE+A2EW5SH6FCyL4xDNGNwptXP2idQgyBF
 2Dnw==
X-Gm-Message-State: AC+VfDxJAHYDjarXmL4JHLqJMgG46pjczfDFGouCz+Rsqg+YoJivAeph
 PQJF3TLDqAyGWswh5EPnYrN7lEwsjTIznA==
X-Google-Smtp-Source: ACHHUZ40lrafRaG4jlQiCPvkBd+7wk6+NB7tzU87UQM4zFyCEY9aIv4u+V9+qvggurXLobe0ANCPJw==
X-Received: by 2002:a17:902:e5c5:b0:1aa:f818:7a24 with SMTP id
 u5-20020a170902e5c500b001aaf8187a24mr6499844plf.1.1683248791167; 
 Thu, 04 May 2023 18:06:31 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:30 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yi Chen <chenyi2000@zju.edu.cn>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 57/89] target/riscv: fix H extension TVM trap
Date: Fri,  5 May 2023 11:02:09 +1000
Message-Id: <20230505010241.21812-58-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
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

From: Yi Chen <chenyi2000@zju.edu.cn>

- Trap satp/hgatp accesses from HS-mode when MSTATUS.TVM is enabled.
- Trap satp accesses from VS-mode when HSTATUS.VTVM is enabled.
- Raise RISCV_EXCP_ILLEGAL_INST when U-mode executes SFENCE.VMA/SINVAL.VMA.
- Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
  SFENCE.VMA/SINVAL.VMA or VS-mode executes SFENCE.VMA/SINVAL.VMA with
  HSTATUS.VTVM enabled.
- Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
  HFENCE.GVMA/HFENCE.VVMA/HINVAL.GVMA/HINVAL.VVMA.

Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406101559.39632-1-chenyi2000@zju.edu.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
 target/riscv/op_helper.c | 12 ++++-----
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f4d2dcfdc8..d2271da137 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -449,6 +449,30 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
     return sstc(env, csrno);
 }
 
+static RISCVException satp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && !env->virt_enabled &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (env->priv == PRV_S && env->virt_enabled &&
+        get_field(env->hstatus, HSTATUS_VTVM)) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    return smode(env, csrno);
+}
+
+static RISCVException hgatp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && !env->virt_enabled &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -2679,13 +2703,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
         *val = 0;
         return RISCV_EXCP_NONE;
     }
-
-    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    } else {
-        *val = env->satp;
-    }
-
+    *val = env->satp;
     return RISCV_EXCP_NONE;
 }
 
@@ -2708,18 +2726,14 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     }
 
     if (vm && mask) {
-        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        } else {
-            /*
-             * The ISA defines SATP.MODE=Bare as "no translation", but we still
-             * pass these through QEMU's TLB emulation as it improves
-             * performance.  Flushing the TLB on SATP writes with paging
-             * enabled avoids leaking those invalid cached mappings.
-             */
-            tlb_flush(env_cpu(env));
-            env->satp = val;
-        }
+        /*
+         * The ISA defines SATP.MODE=Bare as "no translation", but we still
+         * pass these through QEMU's TLB emulation as it improves
+         * performance.  Flushing the TLB on SATP writes with paging
+         * enabled avoids leaking those invalid cached mappings.
+         */
+        tlb_flush(env_cpu(env));
+        env->satp = val;
     }
     return RISCV_EXCP_NONE;
 }
@@ -4215,7 +4229,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                          .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Supervisor Protection and Translation */
-    [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
+    [CSR_SATP]     = { "satp",     satp, read_satp,     write_satp     },
 
     /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
     [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
@@ -4252,7 +4266,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
     [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
-    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,   write_hgatp,
+    [CSR_HGATP]       = { "hgatp",       hgatp,   read_hgatp,   write_hgatp,
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
     [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,
                           write_htimedelta,
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index bd21c6eeef..0c10dd7a78 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -381,12 +381,12 @@ void helper_wfi(CPURISCVState *env)
 void helper_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    if (!(env->priv >= PRV_S) ||
-        (env->priv == PRV_S &&
-         get_field(env->mstatus, MSTATUS_TVM))) {
+    if (!env->virt_enabled &&
+        (env->priv == PRV_U ||
+         (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_has_ext(env, RVH) && env->virt_enabled &&
-               get_field(env->hstatus, HSTATUS_VTVM)) {
+    } else if (env->virt_enabled &&
+               (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         tlb_flush(cs);
@@ -403,7 +403,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S && env->virt_enabled) {
+    if (env->virt_enabled) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
-- 
2.40.0


