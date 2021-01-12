Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EB2F2BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:57:14 +0100 (CET)
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGQL-0002JR-3h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAE-0002nu-4r
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:34 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAC-00075w-9Q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:33 -0500
Received: by mail-pg1-x534.google.com with SMTP id q7so1080574pgm.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q2Zu7KHEYh0SN8c7PC1800VkW2dCDTh319BhnZOQBFs=;
 b=gzuOaj54gnAaVJ42T942J/hR1k8m+r34QuEsx+CbmOgal4bFqHV73YyngEsT3bYb92
 bfwQ8DCMDYO+Ir3MR6IAmSiG2fEIZAmjEw1jAvvjWvkSpAbodxBaKsYd6TAnig/FpwpO
 XKOXSg1Fsrl3sXQO1/IkFkkBmftKMdLwGzDCtQ/Hxx0XJZFwLBcTK32u5l+U8SCjuy7A
 TlUc6URK98RMdblltgZ90U0SsjoTqnpTEBEPyK+j+idIqYyRyHPB5mcL8jyGtLpOhw5+
 qjfTAnf0bidx3CJU4Gc0Dc/7yZLWKVU02bX4NjLXhVIUdJT7q2cbRcp54rByNUqllTz0
 B1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q2Zu7KHEYh0SN8c7PC1800VkW2dCDTh319BhnZOQBFs=;
 b=p8D4SdqpOkA9FSmSvGUc65+L0g2J8p32YC/D8mf4tJ6YBli7bpFVxkc9U+ItrgrxfK
 +4i6d3+7Zl2L6HTrEKzcTRDP71H+6b0DYg+oIFp8GgKGfBXoD/tyDSoaIFmfArC3JPnN
 EdKIUy57VId4vXeEgVnEaTWmnaCpbbsdKNEhhKNHYEJGDX+RvOlGuNEUTANYOim0BVZb
 1qtylbEjtaOeJ/vvawYMu3JDnODFcXZ+JU0Jcay7pFY6pYk+DN03TMgDS7Y2kiSJtuiU
 479b26X1XVS3nQzyubtF5EOR4ZHQFeLSfn8sIeI/eNWvo5JdUF5O4Ng26+6A2c47JoT4
 jC5w==
X-Gm-Message-State: AOAM531zNhSryNVtCQbp22cyeWqJOUBBMsviSDH24WRqUq83kkPo3qDF
 0SrE19yPkZlQQjDjVIpCOtaz3fWzi1xf20n2
X-Google-Smtp-Source: ABdhPJwmNYsTzCX2imdXoeP8RmGuirZRupWzl61w5XsYmETVdhzyI2qvBtigVHiwTSsEfwH8ulIQyw==
X-Received: by 2002:a63:1b58:: with SMTP id b24mr3977328pgm.38.1610444429762; 
 Tue, 12 Jan 2021 01:40:29 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:29 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 08/72] target/riscv: rvv-1.0: add vcsr register
Date: Tue, 12 Jan 2021 17:38:42 +0800
Message-Id: <20210112093950.17530-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8edf81692e6..2538580a62a 100644
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
index 6eda5bacb7c..4ac1ed8cfa8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -335,6 +335,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_SHIFT);
+    return 0;
+}
+
+static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
+{
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
+    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
+    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
+    return 0;
+}
+
 /* User Timers and Counters */
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1397,6 +1417,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
     [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
     [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
+    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
     /* User Timers and Counters */
-- 
2.17.1


