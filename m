Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26322325BF0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:27:50 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFTnB-00049k-6W
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfg-0006RI-Uf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:20:05 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfe-0000hL-7N
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:20:04 -0500
Received: by mail-pl1-x632.google.com with SMTP id f8so4552024plg.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2T2I9B8Qr2i8UewrvMYg5J+k8mGCyY+FDehGaTqquBY=;
 b=eUuBmnpbgQ6EmG2IOt7jmHtirURAAC2NLtCc34GFKtzGGUUdUYezRWOnz1luVhPq8r
 jRD69ts3URwk1jBsTd39EezOmdWUojbpXWRLLoSZjPwMzAixC075do4GDPowtIyPO1CY
 qhk0mG7dQErwMVWEFVXEBK7IcRL5BbarXAulxjPO0couq2yBr8NdsRNO+WYEAiSqL00r
 9B7AdfDBWEU6JTBqOZG2Ewzd9HVgvQT32GVauMTogzemRLFhxvY48zDmYJdrs082DIZq
 fxAvpErhWSollOkVSTYvWJm1Jg+ZpbHopAnAMQpJUfg+KnwW5wDrQut7rIcN0NyH3a0N
 ibeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2T2I9B8Qr2i8UewrvMYg5J+k8mGCyY+FDehGaTqquBY=;
 b=PjiTCLkdaQS5hQVnX7D763/LpyPAMdUE2f7G+FFZywfej0HbBk7wuezOnQ/C5WCuQS
 luNrDkWQ1zssxRPEkSxkAVSUVHgkbb1sGKe362AEuvXYI7U+FFDrTZHzozcKzfC4ysbj
 dhHLKYRfWx8J7kpq5JNxNTGcFQl1yuVjBmtoa7wqE49C5hkuybdQ/H8QXwZHsW3sSI02
 2QJCFrncmhCmAZxX8pnNf7lrO6W+b0euLQWJgFpKXYhHljo4iIZ4G1gkmYygvALKh+n7
 /3QNz8ZJx9XhVOWPmtSPeQ8S3ryJUgULqrVuDUo8XdlTWjtoyLr3/LV5408fxayZobv9
 733g==
X-Gm-Message-State: AOAM531IA2vR9mvP0ec9/QZHyCRY12Cb6WLNaYeIAjDp8VyU8JxfElHY
 fTFiLnQPfW8mwoZ0QkAOkK11bTlxu+2Fxg==
X-Google-Smtp-Source: ABdhPJysNqmOAmrUu5wWnpsVLLLkqOaHdID6k+dkeeXEJdUkCNJLYf7prZqM8caKIx2xCYNLGFYLeA==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr1219338pjb.56.1614309600653; 
 Thu, 25 Feb 2021 19:20:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 07/75] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Fri, 26 Feb 2021 11:17:51 +0800
Message-Id: <20210226031902.23656-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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
index 89867a93643..5152bb84261 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static int fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return 0;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
@@ -246,10 +242,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return 0;
 }
 
@@ -260,13 +252,8 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
-    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
-- 
2.17.1


