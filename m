Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08551531192
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:21:43 +0200 (CEST)
Received: from localhost ([::1]:33010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9sK-0007HO-VK
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nt9pL-00049V-IJ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:18:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nt9pJ-0001ok-7j
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:18:34 -0400
Received: by mail-pg1-x52a.google.com with SMTP id a38so11090302pgl.9
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a5XlyGgGUyxRxhc5UCrHgjGkBfg44+H9qGio3HRyORE=;
 b=Tk8hyUQQzow4SkR0iptagnizWiPHcIQeHjPM184E/RiVpSuiytwAXTtCZApx2iYAb2
 RzOvHnC6F5KUe7Y0IOt3OsBXEXNirf+qijHuPYh2zRn3Vva+oYM3Y/KTzgedO6XtwGnV
 O28I/1ptBiFyQXztm0pjiq5Fcq0NvsJDmsDLa+mz3AhUU/H7d/fX2rGoYAYuTxE1EeOh
 yQ5Fd3vzHNezaAK4KDxUBD8kmy9/QUO1FvuEkSPxDtbV2n1oSUO7TPE1EE4f88cypAbc
 EmjdXu4yKaJ5YIIYUiXH5bt3f+PAW0SFxTTRvz3NGP7UkmRQPv1TKCurQUglLjObiQe/
 NL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a5XlyGgGUyxRxhc5UCrHgjGkBfg44+H9qGio3HRyORE=;
 b=WE9SjzgK370Qcx1hNsxA/Lhg37WIlMXMsC78clqOyhed0mWXvlRUB1dQaXArqTI2jg
 PBI2qNzP+XTgDAWq0Wm28GEE4ctfjNo5ewD0zwr0E40po2fFJjC05uYLTeVWKi5luMHL
 9bdguUl34dLWjVZkRAFi7S1aFqujox/+ANWctD0velmVLmVOTDUFH8GpJRRHOsh01k89
 lyO3XD3NyMrF/lgTx5T1LCildMr4A0EViOOe4V6Zr4tTgbXWvRkvkoGD6zeN4/SHInAs
 Z4vk68ftMBzeVTlzS6QuvqnmoENqdq9i981WAlXj+biIE7Hm/AlrqfjyfPgpXFXC6q87
 sRqw==
X-Gm-Message-State: AOAM533wpDDxurMHdcHnAUdrW+Vy03BNh29sBmKx6lSXU+kn1lGJrCNx
 xyIbPAfgjk+AK2zpWPFa6aq4HW1W7nGT8J8l
X-Google-Smtp-Source: ABdhPJwkM/nt4lbz8ThGeuk0kqjz+xV7zYDXpil99a3zr1R+Ky4l8eN1PYO4Roi+UGf8dDt+HEWtqA==
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id
 q5-20020a056a00088500b00510950ff787mr23721500pfj.83.1653319110866; 
 Mon, 23 May 2022 08:18:30 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 f28-20020aa79d9c000000b0050dc762818fsm7499442pfq.105.2022.05.23.08.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 08:18:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2] target/riscv: Fix typo of mimpid cpu option
Date: Mon, 23 May 2022 23:18:23 +0800
Message-Id: <20220523151825.7759-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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


