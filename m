Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247A452E88B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:17:20 +0200 (CEST)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nryl4-0006k6-UY
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nryjH-0005lX-24
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:15:27 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nryjD-0005gw-8Z
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:15:25 -0400
Received: by mail-pf1-x433.google.com with SMTP id w200so7255004pfc.10
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLIOYUINGMgAoD6vzi/tWdUgV9JUL3c//1txnO7Zitc=;
 b=P/q949ZvlZGhqCMBl8XtnrY7S+xiJ4p8XTo34Vb+Tf+jcBE5j2/7PoFcrbne8PzT/z
 iTsHRgxqSkrFkpkYifqtmLDOj0nw6BM8LEYIV2UEQL8VL30GK/EyFlJ44nQbnXF4a/8U
 OKE1RhMkQlFji8beAPdFaf1gx/8MIyRL6+BWx1Bd1CTcHSeoX/44JNejG2/WgPxINNoa
 md7/ZuT13R7mz+/KbXbvgwm+C5NF1PSVvviFHRfUmuAfukX0qEPuoLYrt6pZtzY0xWqZ
 dFoJdJm28YQUBjixcoq71/Qi7wr3aPSpQBIJi4PlDBVQnuZisWOyHA6cow4K+vGJgFO1
 ESOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLIOYUINGMgAoD6vzi/tWdUgV9JUL3c//1txnO7Zitc=;
 b=KOJVvVwL1GnydFnGht4sXKedx2cXBGyGPcYodimaetDfqGIEibSsovfPyABNxjMUa6
 nM9/6obPC+0mDdFy7nxMI4JDL52Ko2MZH7Uief22sxNg2Ru6DjeBjvtmpAjLapm9Fnx6
 KKNstbMuZ3hXHeGvkxdREXEPBRtlX3ZpXtSBjg6qrtKELqF+cRByPf9UGZLVMc8lROft
 2vZ4xICqCn7C5Jcqi4NkJowUhNJprhCTX7hfLcjkT7ALh6hj5Q4JBRbP/fXLbon5tIGy
 PVFwwQjBPbi/RFJt0N5MFPE/j4ZPiJM6mlJpFX9rWTLsOP6PaEOxepZ2txRX6OOIxqBT
 0jwA==
X-Gm-Message-State: AOAM533MJ/ZFaFP/HSm2auPUiJ6dWoxr5y0bZ0Eic1JbBvJkgBV7t0yo
 7SWo36Q1U7LmV32Lh1evp4xkqA0jUyK+T+19
X-Google-Smtp-Source: ABdhPJxr6aGwm5te17lUrneUbEf3uX3tvzwF6ojLkaTp3ZLPcUSi5w1ywHwaQZJJiQjaqCIrIoq+5A==
X-Received: by 2002:a63:9a11:0:b0:3a3:3a8a:1006 with SMTP id
 o17-20020a639a11000000b003a33a8a1006mr7745048pge.116.1653038118548; 
 Fri, 20 May 2022 02:15:18 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t77-20020a635f50000000b003db8bc8db64sm4939141pgb.35.2022.05.20.02.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:15:18 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Fix typo of mimpid cpu option
Date: Fri, 20 May 2022 17:15:11 +0800
Message-Id: <20220520091514.17866-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

"mimpid" cpu option was mistyped to "mipid".
Fixes commit: 9951ba94

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 4 ++--
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6d01569cad..a1f847176e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -37,7 +37,7 @@
 #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
                              (QEMU_VERSION_MINOR << 8)  | \
                              (QEMU_VERSION_MICRO))
-#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
+#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
 
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
@@ -869,7 +869,7 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
+    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
 
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5ff7294c6..44975e3e5a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -408,7 +408,7 @@ struct RISCVCPUConfig {
 
     uint32_t mvendorid;
     uint64_t marchid;
-    uint64_t mipid;
+    uint64_t mimpid;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4ea7df02c9..0d5bc2f41d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -674,13 +674,13 @@ static RISCVException read_marchid(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException read_mipid(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+static RISCVException read_mimpid(CPURISCVState *env, int csrno,
+                                  target_ulong *val)
 {
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
 
-    *val = cpu->cfg.mipid;
+    *val = cpu->cfg.mimpid;
     return RISCV_EXCP_NONE;
 }
 
@@ -3372,7 +3372,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Machine Information Registers */
     [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
     [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
-    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
+    [CSR_MIMPID]    = { "mimpid",    any,   read_mimpid    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
 
     [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
-- 
2.35.1


