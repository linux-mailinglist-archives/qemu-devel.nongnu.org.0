Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5A5BC2F1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 08:39:21 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAR6-0003Ss-2c
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 02:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHc-0007ns-VH
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:33 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHW-00007d-Fn
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:29:31 -0400
Received: by mail-pf1-x42c.google.com with SMTP id l65so27104324pfl.8
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aEzeiyOnBDFSi2B7ypiSrwctWh+UW5VrO8iwUiU5zvM=;
 b=CK90ViEQR1dzjlng0hAkO7hgpHgVXqSfu7lDK3BWoveEvoqrplQIAS+xDiVbesjxyM
 Onv3wiIvtBoQlStWsdb47Ks9DmgANCop1KcPJ2nTMc5oeLCnoawj7CyJ2fLZo1lZPdQ2
 k/1a8bERuZYbp/Tol4c2nq73PqZaLDF+eRHe0giPF4faQgjxHwtKKbLNIiwilR4Wz/18
 /jXsatPqxOU7U2qV1TeCIZ9laMZ2umdEze9Alh0QnpTA1xWb7MzwTCfawETUyoBW6fqu
 VmSZ+Lx1bLJQMOUxBWWd2Amyy3si0D0r9sIieUt93AlDo6/OexVxwUSHYFiQViweIgzY
 QEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aEzeiyOnBDFSi2B7ypiSrwctWh+UW5VrO8iwUiU5zvM=;
 b=OYglqENUq53PdJkOZlqScOBTqS/AnkjIZ6mPfQX+pFaPfiyziQdUxYKxe1aNsPFQz9
 pT+5FMVgpjnYt7zOPNjXg/GbGdFXeyoo/X5cx8z8hRqpGSdMfBR/oBW2+PaA6mFZBct8
 h+iVwvSgmB0NpJ83jCDdhjnfmtO9w4rMpmxWsKzCeY1V55pXI+itznuXAjahlHcpo47G
 OmTZMKs4YI/IWgD0y0zChfNa+9qrLkuA7ShDoBQNfYn8JOK2J24NjaZ6vSNgpuUZL3DH
 4qLLu6xHw7sQL0n4nc+lYruHO5vwMpFWaF9+aCDXXHKDQRw0IKrKF/Nuije1/GBZpPqe
 m/KA==
X-Gm-Message-State: ACrzQf1LnHZ880ZD5JEdVQ+a8usCU1A3tz5BeqcujnJFxTkK/V2gzM62
 MyvZyZOYFGlg9Zk4GSa0YW9gyWpZFMpvvA==
X-Google-Smtp-Source: AMsMyM6dnpEQbaNCKNdxa5D7ldSb74gzZZu2lpaULek5UA1Z2cCjdEpnGhirYuulzBeBAiYlcw5u2A==
X-Received: by 2002:a62:17d1:0:b0:54d:87d5:249e with SMTP id
 200-20020a6217d1000000b0054d87d5249emr7022675pfx.14.1663568964038; 
 Sun, 18 Sep 2022 23:29:24 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.74.146])
 by smtp.googlemail.com with ESMTPSA id
 y1-20020a17090264c100b001782580ce9csm17678574pli.249.2022.09.18.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 23:29:23 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 2/4] target/riscv: smstateen check for h/s/envcfg
Date: Mon, 19 Sep 2022 11:59:06 +0530
Message-Id: <20220919062908.643945-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919062908.643945-1-mchitale@ventanamicro.com>
References: <20220919062908.643945-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accesses to henvcfg, henvcfgh and senvcfg are allowed only if the corresponding
bit in mstateen0/hstateen0 is enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 87 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bbfdd49abd..59d5aa74ee 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -41,6 +41,42 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+#if !defined(CONFIG_USER_ONLY)
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+                                       uint64_t bit)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[index] & bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+
+        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
+        if (!(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1869,6 +1905,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1877,15 +1920,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1894,6 +1949,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1907,6 +1968,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1916,9 +1984,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1950,7 +2023,7 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1997,7 +2070,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
@@ -2046,7 +2119,7 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
@@ -2097,7 +2170,7 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
@@ -2156,7 +2229,7 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
-- 
2.25.1


