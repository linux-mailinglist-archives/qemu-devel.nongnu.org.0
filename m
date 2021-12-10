Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BF46FC7F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:15:09 +0100 (CET)
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvb3c-000109-0b
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:15:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvan0-00047l-ER
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:58 -0500
Received: from [2607:f8b0:4864:20::1031] (port=46048
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamo-0006Fq-E3
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:58 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so6841730pjq.4
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R06wcFNGC4oKgJLCj0pYuJH5LhlhHgIoftURvgt5oNA=;
 b=ldnc0cPtKiseP3VPGgLbwWAL1LoWeTnqi8PB+JJbhe5Zbky2SClXOviQMFfrV3JoN2
 Q7CEedf933gzODeZW2tXZQuTpf1WzlHsXvEf82ak9n+U6LyCkM/ZZsCHEM3lkN4AjFbQ
 4OVU76dV8tBXkSO20jasndgfwBvfbRHlSdpQ0GPBKBFb2Ern73JwDEpuRIamQYOof9jD
 oD27uOVSD1PhHwVyTT/QZmzxXHizJBclQA3QEqiGvr8ruiusclQ6XA6kNAmtd74FQ4vn
 PInwiTe+HtIThD3GJJmw5TlNAgZ5iHEZ/cYwnl2tny27fJEqccM8JTN8K7IHf/6tGSb7
 lYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R06wcFNGC4oKgJLCj0pYuJH5LhlhHgIoftURvgt5oNA=;
 b=ntWGZY0HBIMnA1SOpbtEsgA2wD0AGuJF7nqn/JcEzyPNLGsMMkCH6Gq3avK1t/nVcb
 n4lQc6Qgzt4y+oDnnuIa0iECIjOwyF/fSdv86eRqCYCqWEZoIcreiZzDQQh8FrV/Dwwa
 UUM6UtupXn99b+aCvyeQhRCcEj0OIyg1blqhel/7zZ3uaI6DLXmD3rmgcKnpBTgklQd4
 9GrbwludzphNsq/HaFLLqsxM+if6oc911eklLaS8lx7pOGgz0G3pu87whahDpX5do//9
 9TyDNmm/wF5BAHg4G4EkEm5/C9NZhMJAYYpCkFwtYKMoQ8S1fzVShNcwlJE00OTWONo5
 N8pQ==
X-Gm-Message-State: AOAM530RgV6+rEbmFzZYWYr6+r9hT3Allybrh7Z5XX1kRLGZGk+nz2ba
 ZuuxRHq1yxkDeGup4USFr5sNssgUdJlYvc8O
X-Google-Smtp-Source: ABdhPJzetmBbuoveqRI3dVXAtv7P6lNFlxnnhxUuQLs2yb3ht2Hhy6GJPpA5AcxILl/ibF6JtscApA==
X-Received: by 2002:a17:90b:3890:: with SMTP id
 mu16mr21961773pjb.186.1639123065114; 
 Thu, 09 Dec 2021 23:57:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 08/77] target/riscv: rvv-1.0: remove rvv related codes
 from fcsr registers
Date: Fri, 10 Dec 2021 15:55:54 +0800
Message-Id: <20211210075704.23951-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index bc149add6c..c522260986 100644
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
2.31.1


