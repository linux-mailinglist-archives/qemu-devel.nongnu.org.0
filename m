Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8973946FD23
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:58:16 +0100 (CET)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbjK-00055H-KR
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:58:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoh-0006eB-L7
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:43 -0500
Received: from [2607:f8b0:4864:20::534] (port=36769
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaof-00071e-BE
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:43 -0500
Received: by mail-pg1-x534.google.com with SMTP id 137so7410599pgg.3
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j36ypXZHhaZHMYAYubo82Nrb0V4CPN+goTlHeUoXecc=;
 b=O22QCTumXal+nZ8h6/eJF26ujV8Cr/rnlkJ5s5oCGBaoEtpWug8XvDIIX5eGIFTOyS
 vOksqh2YSqvRwfMFiZHF7bJocaQtmiyZxLeDkbH3b1rr8jsQJqEw6g1gsFg/61f6CXWf
 5g8j0u0v+8kLZPDQtVuqxMoQy403i5FS3YwT34bvxckavRNUFMYSzmJO2FKbjFV+3EbO
 TyMoezGAjpJ10U6NpemqfE0yr2BvZMRRwrJozi+Alg2/Lxm9lBFh4qiuOH6WJgjGycXv
 hyEB2kOTh8+34S0cCs8BgyuR0BEUOak3j8cfdR2rFGZzfZ2m0N/MrNRx/Xnn015gTAdb
 onVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j36ypXZHhaZHMYAYubo82Nrb0V4CPN+goTlHeUoXecc=;
 b=r6FXWTcUZ/MYu2qoRlZFfXsFbW0qCyTamzVZtns76v2FNc2s9wQ+Mdrdjmh3fTSFes
 KdmxjwAXKjCE8+3AXBfv8983/MA4US3qOq5RHYWOu4DGZeJX2V01tFlLbdzwRz66fBsz
 r35zAI34pEYoOvb+tnbQxflUQ5WOwFwq2DMwFdzSS5RNq93vUaNQTyrcjlCbQ6VkQGz8
 BcCM7irmjOPLh2zV7RMy9Hdk9Hs1yPCeYDzzoaDSjd9qYhRjsFjb53OIe9yGwvtQsVIP
 tIMfanSWkJFG4Vh9+xySjfcEPRuQPB6zdQbyJt9pJDfHrgu75ZIXPYYp1vhd2TWCD+55
 3xsA==
X-Gm-Message-State: AOAM531NNcscrvp6yE/uHPPRxlBjDNK0XQpcVdktnLJwXFYk/pVypgDK
 oKhiC0RpNqoLC4WO3K25A9+/nVaT64M5ateR
X-Google-Smtp-Source: ABdhPJwMc0DZoT7XSp/yk03AhYRqJNF4RSwuckA1IRSZjioL6amXLf4GShIBQG+wQ36ENROe0lZ92Q==
X-Received: by 2002:a65:6243:: with SMTP id q3mr38897273pgv.593.1639123180049; 
 Thu, 09 Dec 2021 23:59:40 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:39 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 49/77] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Fri, 10 Dec 2021 15:56:35 +0800
Message-Id: <20211210075704.23951-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 804f423d5b..5c0c3d2547 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2652,7 +2652,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 71d7b1e879..f883fdf474 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4231,7 +4231,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4241,9 +4240,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.31.1


