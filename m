Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3174BC368
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 01:31:07 +0100 (CET)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLDeU-00036J-O6
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 19:31:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDa1-0008Ht-AY
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:29 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=38419
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZF-00070C-Vt
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:28 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso5556612oon.5
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 16:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vjRD3ug4rdFPmWgfKqm0P1TF7W+2vgz9YTFoidRrVZk=;
 b=JMPEQfsf6hOd2Ceenip2HHIhFoER2ekkpYeRQWx7bbtBAXY7wV5C8ZpdtldbNtTotb
 naAcdR3YYDs+UqGfY2Nterh8I3t4LmT94OnJ1QNOHNsXnWsMb/D7fDF6+e8StunMJI/h
 VUtuqij/j5F+0lb2DHSudQRJuUyhAffICS+thOMGj0+A0zVLsy5/Rz4dHUt0vN0cmxc1
 fhDSiotT6jftU/DqmAEC9ynF2Oyp4A5ay3/9SFPa/Tubr9YrhU7gYJHwskw1nOaG3DDE
 hExGfsqEmIiOfV0TI1jmTlXC7OgwyVxAU9gXSA5PIYQI2BibPWsKN3Mljsrt9t8f8R6l
 FSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjRD3ug4rdFPmWgfKqm0P1TF7W+2vgz9YTFoidRrVZk=;
 b=O/9X9iJDYwCKTvnpnQwLN+AFKyM/eCh4LY+iGVKVvj6OKLGl+mbr0i0RrARlX3afJa
 dpLPclxCYYFxQ2Ad04FDncQ2xG6AdVYun6AY+0KmuCoB/2WZPePsoHL+fevTvIMUvnqS
 LGuuSDvbt81LQcEc8WdKvCnDochw25D2ae3Wj4VEPXpV3i9k2c0MosP1DNJUSQ/wWMzq
 xLPVqNLhJSYklpL2/UUrngNfO3lVxsPZ/m56ilPfOfvybLs33LjWZKjlQxBuEDBihsCe
 xOsuquth+vmzM+5yQ7iwBBtLCjayeXH4Ty+VZnAjI2q+oKGb9Q4xzhDfstvxjtP8YtnN
 QcYA==
X-Gm-Message-State: AOAM532WrNVG8PrtOkL6PLZnXDDpl/3mjo+q35RlVU/qVh5mkqZ6CwdR
 JT0sYRgKwAxScpVCqXBIHOBv0oTUeQmLLnYW
X-Google-Smtp-Source: ABdhPJwZYLK10+DzQ2kWAHfVtmYeedHxzTv2alv6faYLuCh8Yozc0vRDvLSvClTZC+0BYAW9MzTy8A==
X-Received: by 2002:a4a:3447:0:b0:31b:f530:bc52 with SMTP id
 n7-20020a4a3447000000b0031bf530bc52mr2721799oof.74.1645230340721; 
 Fri, 18 Feb 2022 16:25:40 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:40 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/12] target/riscv: Implement mcountinhibit CSR
Date: Fri, 18 Feb 2022 16:25:11 -0800
Message-Id: <20220219002518.1936806-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

As per the privilege specification v1.11, mcountinhibit allows to start/stop
a pmu counter selectively.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  4 ++++
 target/riscv/csr.c      | 25 +++++++++++++++++++++++++
 target/riscv/machine.c  |  1 +
 4 files changed, 32 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f6b994a74ed9..ea3862ccbf5c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -259,6 +259,8 @@ struct CPURISCVState {
     target_ulong scounteren;
     target_ulong mcounteren;
 
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb47cf7e77a2..48b39e6d52a7 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -367,6 +367,10 @@
 #define CSR_MHPMCOUNTER29   0xb1d
 #define CSR_MHPMCOUNTER30   0xb1e
 #define CSR_MHPMCOUNTER31   0xb1f
+
+/* Machine counter-inhibit register */
+#define CSR_MCOUNTINHIBIT   0x320
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d69bd2d88454..2283ff33a5d7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1379,6 +1379,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
+                                         target_ulong *val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val = env->mcountinhibit;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
+                                          target_ulong val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    env->mcountinhibit = val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
                                       target_ulong *val)
 {
@@ -3553,6 +3575,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
+                                                       write_mcountinhibit },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ebc33c9e2781..a34cc3f69c4b 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -299,6 +299,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.30.2


