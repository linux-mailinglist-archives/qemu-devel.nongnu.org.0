Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6D4E9D71
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 19:25:54 +0200 (CEST)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYt7p-0002M1-DY
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 13:25:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5g-0008MX-Tf
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:23:41 -0400
Received: from [2607:f8b0:4864:20::633] (port=42754
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5f-000346-9Z
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:23:40 -0400
Received: by mail-pl1-x633.google.com with SMTP id p17so15253772plo.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L6+AqKjXtNkbK+bDI19e24j/hE2NKj1kvcBJT6uzycs=;
 b=YE1ASoogvsv5KlCpQX0XDaceGi6nmqRzokyuNVvmVVISpoaih84PSLupkhdrNBCg8L
 uDp0E2n1fYtvsSum4vDJC6MLyMbeChuw9bxfw1gA1HY7V768XpDQ3XpYoGPV5icui1ty
 7cd2DqAi1PWcCXjB3zTM8MFMyv8aSNecy6OHzKitjPEzd+crVPbFvYe5vFrUq/p/3dKe
 zJmgzPzgePeGpzCRclDPKoPGC7h+/pDsjVN0ksPPXjsrcOcikHS7EtopPq3ioeehYEiC
 qozgkYLwaRE7DxSLEf2VY18jMmOaBpzKeBK7SzIUyqrM+GlEllTO+r/Cxc6Fpi2nroln
 I+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L6+AqKjXtNkbK+bDI19e24j/hE2NKj1kvcBJT6uzycs=;
 b=8KBc5tKGwrdjG2DejHFXVUL+Elj32ucGbTWzn0xTa/WyTl6vQPKGAPgefdj4+zJIHN
 dr3dFzDXYUU/gcHe937BJqEKHky1EOlFgzPW849OjrwCu8OoB+7m8eCoMCjbxFTQ69OO
 HlOLJKxrzU9OdM7EMBmfWjL/l/gouqULk/QhTVIZap9PkJU1kSpdXzcO378p8E+wyySj
 BU+n7xRRxu5mY8fFXpYsLM51sH1K6SE6ddkGbl1gHmYwwkU0aTi1vOdiNMUwQd9udmkV
 jwhkqUR99ZqfkhvcDU4HfffUHR60e+B8ROYamSAKmo05qheW81xQ+uWiqgOFgrSkPdkX
 u2Vg==
X-Gm-Message-State: AOAM530TWmtIjEayh1Aj9tbALSqc6icNukAm+mIVm/W6CT0JRsywvk8y
 Ib04YGPv4F8bW3nuu5db5CAs2ztAUmMqYQDr
X-Google-Smtp-Source: ABdhPJxSmHshDLqNck26bx0yH8wFXvOwPr0qiEoxx/9jOq61iw1/KOzm2c63gJsuXb87ixd+QapQtQ==
X-Received: by 2002:a17:902:6943:b0:156:1d3c:1e0d with SMTP id
 k3-20020a170902694300b001561d3c1e0dmr2744706plt.76.1648488217590; 
 Mon, 28 Mar 2022 10:23:37 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17802504pfw.188.2022.03.28.10.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:23:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH v3 3/4] target/riscv: smstateen check for fcsr
Date: Mon, 28 Mar 2022 22:53:18 +0530
Message-Id: <20220328172319.6802-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328172319.6802-1-mchitale@ventanamicro.com>
References: <20220328172319.6802-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If smstateen is implemented and sstateen0.fcsr is clear
then the floating point operations must return illegal
instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index dda254a6c9..658f51bd40 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -73,6 +73,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, PRV_U, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -1617,6 +1621,10 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, new_val);
 
     return RISCV_EXCP_NONE;
@@ -1641,6 +1649,10 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     write_smstateen(env, reg, wr_mask, val);
 
     return RISCV_EXCP_NONE;
@@ -1662,6 +1674,10 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                        (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     wr_mask &= env->mstateen[index];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1686,6 +1702,10 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
     uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
                        (1UL << SMSTATEEN0_HSENVCFG);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
     val |= *reg & 0xFFFFFFFF;
@@ -1711,6 +1731,10 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
     int index = csrno - CSR_SSTATEEN0;
     bool virt = riscv_cpu_virt_enabled(env);
 
+    if (riscv_has_ext(env, RVF)) {
+        wr_mask |= 1UL << SMSTATEEN0_FCSR;
+    }
+
     reg = &env->sstateen[index];
     if (virt) {
         wr_mask &= env->mstateen[index];
-- 
2.17.1


