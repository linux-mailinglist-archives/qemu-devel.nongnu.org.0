Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08B43F988
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:14:20 +0200 (CEST)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNxr-0002zj-88
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNk4-0004nW-VE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:06 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNk3-0004Z0-9i
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:04 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so6993030pjd.1
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pW7IA4ZZdUVEg/kVbkaG3JEXuXZZHLq94h4l5Oev8Ss=;
 b=flqzEcyqgM5fnJ9mQgJoap2a2BiBqC2P0nNZQfPkJj8rK5FX64teTwR2fBwAiuv9bI
 QPYtC0nJHYUs5XTWpDXkmugtR4WzLPaslk6WPBQqLRaOOCsipGm6F2UsejpYd8y5I879
 PCIIbd0zK3iz++a/osZlkwTcWsZ+iIsTwjwxST95VvoJPkEfs+AL5ibn1ZIhVagpMhjm
 Xh7tN9rClCywgfocapToqGMBR+o5+h/CX12GoJCdkRO+3Fa4XN3Q33kmswHq7XuIdlBt
 lVkpnzYSRMrLts/Bk95zFRwxiz+RSjqld0Njynw18gwQl+YXJqp9jwV7k7MjttMsREFa
 jIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pW7IA4ZZdUVEg/kVbkaG3JEXuXZZHLq94h4l5Oev8Ss=;
 b=DwLdqEDGuPkZIQoZnCpYx5kAlmWyc8Kvm+umz5yrUjNFvSCQLT2Fx1RXgvb/3xNFUt
 vw6eEUgjfkxI1vBWy6dp5RpMRBHJPzGn+gqqDLntymHiyKVKVfCsM856YR1Xqw54p8gr
 bayHG3Y/SYZLlmYslCQ0+T49WSzCTfYjjmtK/1f3XHiLbEt4D26SxNu42vGQ8766jLu8
 mv9Rd1qafbNAcGPvm8iQpPW0vTquVUqrvDJfL9JF4+I87k9C7w629Q5V3tA5vtmbw2FR
 a64gJtHJi5z3vLp+7Wumd0nZ5A9TjSyo+Jyc2CfjukQLV+Iv2cTwMwXXI9C4DChZUnKW
 yOiQ==
X-Gm-Message-State: AOAM533aqZZonjsjmqPgShuuWSbwG4ncfUK9UYfb0zv2p9zr0OuXW9Jr
 aQJCLlHGrYnFnqh0Aext/darYVYns2KjZfmN
X-Google-Smtp-Source: ABdhPJzOC6jejh5IQdazPVYiDlEyIRrrvgVyDKNcEwax50mlf+wZeSs/OvGoGX0fGRkwEf/pzGgu4w==
X-Received: by 2002:a17:90a:ead3:: with SMTP id
 ev19mr10155223pjb.3.1635498001989; 
 Fri, 29 Oct 2021 02:00:01 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/76] target/riscv: rvv-1.0: add vcsr register
Date: Fri, 29 Oct 2021 16:58:14 +0800
Message-Id: <20211029085922.255197-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb62da7549d..8dc6aa62c64 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -60,9 +60,16 @@
 #define CSR_VSTART          0x008
 #define CSR_VXSAT           0x009
 #define CSR_VXRM            0x00a
+#define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
 
+/* VCSR fields */
+#define VCSR_VXSAT_SHIFT    0
+#define VCSR_VXSAT          (0x1 << VCSR_VXSAT_SHIFT)
+#define VCSR_VXRM_SHIFT     1
+#define VCSR_VXRM           (0x3 << VCSR_VXRM_SHIFT)
+
 /* User Timers and Counters */
 #define CSR_CYCLE           0xc00
 #define CSR_TIME            0xc01
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c522260986c..832ccdcf331 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -336,6 +336,22 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_SHIFT);
+    return RISCV_EXCP_NONE;
+}
+
+static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |= MSTATUS_VS;
+#endif
+    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return RISCV_EXCP_NONE;
+}
+
 /* User Timers and Counters */
 static RISCVException read_instret(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -1816,6 +1832,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
     [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
     [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
     /* User Timers and Counters */
-- 
2.25.1


