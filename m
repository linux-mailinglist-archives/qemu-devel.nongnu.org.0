Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C142EADC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:02:34 +0200 (CEST)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIAj-0006Qq-Nw
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvt-0005uQ-NC
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvr-0002BD-Us
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:13 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso1141498pjw.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjjleQGbXRW4tAMoN47fJ3uas3dGDPOB9nUw9Bqw9TM=;
 b=Ar9gYUUMD6SXXNtt/iOnU41dMqfKcpAx9p4hzyV00Sxygt7J5Z8jpsbmGfU0vZnvx9
 RZXi67WHFgxwPabFyNJ6TLbVHO60IsqX0txI1FXk5WD02UvtM7KNPR86ERpNTry4AFte
 C3cfnijorq+NeqpFV/ve1HxtnEid6njdIia+/3/VquRxzqMJ/ifqxjdv5BUIqh9/A1bR
 b7Yp7AP+bGmHME1DM2OV9yYDFxxY9DRmpIHgA9JAmunk+8kixeTyspgP4kqXKbp5hJAe
 JHwaxJYEKgrnlHKULw5vP01n9CQpOkzf6aOA4FLq8Z43WPSnikPHwHpyZyBfbS2y/Khm
 GPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjjleQGbXRW4tAMoN47fJ3uas3dGDPOB9nUw9Bqw9TM=;
 b=7JFyPa/JqWO3pujt1wgISEUFBzSHDUaeiy0hnxCC4OZx0EEmaPyVhezQuZWHPlfKIz
 MI9/u6l3v5HskqX5DIXXjiGf32pucrO6PCJpU7MRWsyHPpqf+J/W5JchVCWTdL2G1E4X
 R9cuK2VWzefWxS+F4wOWpg2Ac5lxbBKqdNUP8dn7beNVVT4kW1PEWxqEF7JnitRMTGuU
 s6XmoCZRwUa3CooE7gAgFymztIeQEMEr1RUjywnviHu48B4B3NjuRFNBSUBZGtgv0C86
 NHzJ/k1aORY83H065FDkBM8XW7A3rLxIXmGg/mQxbseorKj/nKIQ3Vr+tDMRKNbfXE2e
 IF6A==
X-Gm-Message-State: AOAM532+P7o8po+BKeOBNO9RLS88pDuSYdHA7vyprxYQq3II2y0iYUwW
 ake4pGmH/AguhadmtvAxGTYRf9vH4TpChS/i
X-Google-Smtp-Source: ABdhPJwuI2Hc+Jl35KBq0RB2pDFmPrYaSn8VwMrrezeNpGBe7bG4hPzVcUbt1KA39c3kMfkR9G3JIA==
X-Received: by 2002:a17:90a:d48e:: with SMTP id
 s14mr27140979pju.49.1634284030569; 
 Fri, 15 Oct 2021 00:47:10 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 09/78] target/riscv: rvv-1.0: add vcsr register
Date: Fri, 15 Oct 2021 15:45:10 +0800
Message-Id: <20211015074627.3957162-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
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
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ca3ddd313b0..b8816822b81 100644
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
index c71f3f34e88..57591753059 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -338,6 +338,26 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
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
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
+    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return RISCV_EXCP_NONE;
+}
+
 /* User Timers and Counters */
 static RISCVException read_instret(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -1532,6 +1552,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
     [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
     [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
     /* User Timers and Counters */
-- 
2.25.1


