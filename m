Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2229143F98C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:14:43 +0200 (CEST)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNyD-0004IJ-56
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNk2-0004mb-JV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjz-0004XV-GR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so6424386plc.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=QpltkP8BH4ObMsPpXwDOSw83dPrkG6AlW8l+a1375ljRaLLM+C6IuNrJLd+vcvyJ9a
 u1B/QgacW2Ecm276Cd0K/PozKJtbxPCr09DlpPfIBBrgCZYtIMilfbfAk8a70e1B2ab8
 rdFCBqp6sRqmX9BMZ4ARLJgYsIDkQDpT1u+8e6d7lszCRJ/eGy+qTJPlLJenTV+ihfjI
 7ehqvuROtTY9wIqxqIilZmK9xXeWi0fst7ez8rf/rsxf0aG/qRfdE9/nDoVT6MH1w4Ym
 BPz2qVZCaZVKkMkj0Z3Q0BrTSXYK6D9ztdmwKyitnevjIO5TT+eBAvmDr67Jmpp05SUI
 J+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=OUvOiXoUhBvFUxSO3J09cRLI/a+jli09pPQRv+dzXrko0WxLS35NRTuZMiTfaFIEaD
 eQZpFSTxMWleYc6egCLGIR1Cg/JrR8OQde7vbbansnyyruUiW4fZIrPua7XRYRLnyCL7
 BNJa1hEcHSlZ3+Fs4JAfVURpjDvbR7NYXtSba/3hIlBpWHgYAoytaV+JXKhAKLB9Pfm1
 Eogw20XaGfajSiw+hXLlKX43/i423kO1i5h8aB7qAnjYi8wHU6n714tFuzMGDV2aP5oQ
 YcOJcZaaVVSBOPb9YRpprmSNssfjlzt9sZ6YU2/P8z3RE8yAwdsY5rMYrG/kU9ypyDJk
 nDfA==
X-Gm-Message-State: AOAM5318S0RD5ddIYm7v8H5pb6evNWpVFacZDVFlgDQBsrjy7ZRTN3K4
 8VK8lrHaiH1RsDDbS4B/XeCTwWqQr0HfqrAu
X-Google-Smtp-Source: ABdhPJxBLui/yYXjBTS57bdDbFK8IVga9ZLH3gpSPo/SkjJuL9r1OV9eCJ1FqoebkxyUm46GqI0raQ==
X-Received: by 2002:a17:90a:9906:: with SMTP id
 b6mr18244270pjp.180.1635497998107; 
 Fri, 29 Oct 2021 01:59:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 08/76] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Fri, 29 Oct 2021 16:58:13 +0800
Message-Id: <20211029085922.255197-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove VXRM and VXSAT fields from FCSR register as they are only
  presented in VCSR register.
* Remove RVV loose check in fs() predicate function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bc149add6ce..c522260986c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa_ext & RVV)) {
-        return RISCV_EXCP_NONE;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -261,10 +257,6 @@ static RISCVException read_fcsr(CPURISCVState *env, int csrno,
 {
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return RISCV_EXCP_NONE;
 }
 
@@ -273,13 +265,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_FS;
-    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return RISCV_EXCP_NONE;
 }
-- 
2.25.1


