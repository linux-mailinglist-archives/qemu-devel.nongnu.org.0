Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7495311A5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:38:14 +0200 (CEST)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntA8L-00060D-Lc
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ntA2L-0006Lc-45
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:32:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ntA2G-0004Nh-Hg
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:32:00 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q4so13418486plr.11
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiJzMuz84xw5wmmABM5sb4kbwcLrYRDhSlSku9cJw0g=;
 b=kUYPhJtXF5kPrR4H1ahLcjqJNfpZ25m35YPoscLrYZaK8sykNQVo9KGvfEWaR2xKKm
 loF2esAJd+lt2Nf0SKwSQbLUJBjsasB82Rpqa1Pu93a63NHyF0DZxE92tCxCzg+sNAMk
 QIVnQHX417ShCPlmehna5W4WyTaHebvBcUqHhvnyaU8GIx3AKPW1q3/ES5ugIo1vWc1B
 nwVlaAtT1SxNc/bj/pvIjgvPNz4JLRleVftpsGqwhFkQGx8zisNDkupf1XOG8En1mcG6
 5v9HuCl5hPECUZTJ5XS2Ox3vz/6ChefteCaJC4RtPW2e6qlFRPDA8VyRrxkohjM+ncYz
 678w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiJzMuz84xw5wmmABM5sb4kbwcLrYRDhSlSku9cJw0g=;
 b=lfsUADL0RHOqUdIaUKsjJO8G2TaaUmTHm885X/T3uLaWCEvL979SMmsauwj6CEg2/M
 1+l0lWtU1HZZqO6COdTEN+0H8CdDb2vwBXLDvJbFd5/UvRr7+L34OatY4UxKDvqLBvEe
 TJzxPo5A4iD93LdGggxPbl9GBxSQFeqAzSnd7pgsiyCuJ00yKXC1seQefbbf55E1kaJj
 KkhS73qZW+sAT/a/mqfoHePdWaDV2k8FWPgiO59bmj0JAHC/6BWvkO70rXR76FV+3B1K
 PbftTUlqs/eKk0PVlbCzIP8pW1hHRrMYGOdcXiIyw/TP7xCR3GO0z55CFxVhdzzgr35R
 Armw==
X-Gm-Message-State: AOAM5313K6OcPUMAnNg6xwfC9Zksu6jtxPhMf5BheO2oltUll7JfSBpQ
 A6IOQmZcPOXET3tTkUSyrQIG/Y6NNK3jw/sh
X-Google-Smtp-Source: ABdhPJy5KL4hlob/Hhg8wYV9bL05GVSh7ACauPuR3ykheubnat3vb4zgUXRQ3+VgGJS9z0eaCABySw==
X-Received: by 2002:a17:90b:3908:b0:1df:56a8:aa with SMTP id
 ob8-20020a17090b390800b001df56a800aamr26683379pjb.28.1653319912370; 
 Mon, 23 May 2022 08:31:52 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a639255000000b003f24a2be89asm4959507pgn.8.2022.05.23.08.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 08:31:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Subject: [RESEND PATCH v2] target/riscv: Fix typo of mimpid cpu option
Date: Mon, 23 May 2022 23:31:46 +0800
Message-Id: <20220523153147.15371-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fixes: 9951ba94 ("target/riscv: Support configuarable marchid, mvendorid, mipid CSR values")
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


