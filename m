Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1E480EF3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:36:48 +0100 (CET)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Opa-0007DE-RI
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnP-0004GF-Tc
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:31 -0500
Received: from [2607:f8b0:4864:20::633] (port=43767
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnO-0004fI-5t
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:31 -0500
Received: by mail-pl1-x633.google.com with SMTP id l16so2749571plg.10
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/rRBsskKf+pcabivKrRy9d5npCioL1XjUd6hb25l10=;
 b=nASU4tT04YlJycPDDVwe+hUZGSyhEU5knl2QJrHDiS5VIPLYSUphbVgrOvlG1RYng5
 HTRM+OergQYdChNillykjQTFRC7XRQLRUcdwezra5eSXpMYVyf6Vt1j0/ANmh86GO6vy
 uY53WtZ3IxkiYwPvTugehmHVZiv45AcIA/aJIys0OHmbAgJsDeWFAXlvTc5J+vfOP+He
 eDvWWBnBjZCd1G6XzyG/bjw7S9QRLGyQKg50f4qhu27hLQKK3fK1kB3LSk6ev0hKlR6N
 l7U+HMmgvxah2IMgqZp7KAhBVrNbAwVMqAPMFvd2eS/4FokOxiJjbhCIsXzRFu0OdrsC
 sFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/rRBsskKf+pcabivKrRy9d5npCioL1XjUd6hb25l10=;
 b=uVtpj9LdAWmva9CoFNr3772AW+u0fWKZIAn3g6JfoQWL1fKG3g6kFNvgDwFCqSCn0l
 qPl7hW8ha1clk92x+gkaaaTVtBMXzgGcB5mfICvO2jzzn7LQ0Y1nAKcZSVZMB37ZE45o
 rjMZEfMZcXgrtLhKHsfJ40nPICnLzwHvwFdelFdWULD/te4Scv79La5VBunT/SvKtqgj
 uY3XTEoRPou74FB0XUdFvnEyBjnx8QMiEUgensoFMWN+QmYyY3gV374ykPiE4kKGn6wS
 MI+a7DeRD/e9epNfuxO/sUXgby1EWxHPFDTG9Lzj03wWAyx+taTjHyuy6QLslqLXvYRQ
 bXXQ==
X-Gm-Message-State: AOAM5310ALGzaxAHFWspnF5dhGkqY+zNfjzy2iMeOswL1wNO+AG4FuP3
 axJkMePktaoxCfT/5S6d9qU3H/BvzY5qTv4i
X-Google-Smtp-Source: ABdhPJzLtXKJq2wElXqubkkg0EtDeiGYrBCF4vzGvO2O4+meVvsTy1aUL2j3nwecEFz8cnSuMuubbg==
X-Received: by 2002:a17:903:2303:b0:149:50d1:19d0 with SMTP id
 d3-20020a170903230300b0014950d119d0mr24338575plh.86.1640745268718; 
 Tue, 28 Dec 2021 18:34:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
Date: Wed, 29 Dec 2021 10:33:38 +0800
Message-Id: <20211229023348.12606-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c        | 4 ++--
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/translate.c  | 2 ++
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 38cd11a8ae..5e98860a09 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,8 +562,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
-        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
-            error_setg(errp, "Zve64f extension depends upon RVF.");
+        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
             return;
         }
         if (cpu->cfg.ext_j) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d7b2db2b2f..3f3b3bb062 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -317,6 +317,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zve32f;
         bool ext_zve64f;
 
         char *priv_spec;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 52d93a41fd..7d8b34cf1a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -77,7 +77,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
 
-    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
+    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 340b9661a8..7bd3a5d1af 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -51,7 +51,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
 
     if (env->misa_ext & RVV ||
-        cpu->cfg.ext_zve64f) {
+        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8c3b0168b7..3d89a6650d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,7 @@ typedef struct DisasContext {
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zve32f;
     bool ext_zve64f;
     bool hlsx;
     /* vector extension */
@@ -706,6 +707,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
+    ctx->ext_zve32f = cpu->cfg.ext_zve32f;
     ctx->ext_zve64f = cpu->cfg.ext_zve64f;
     ctx->vlen = cpu->cfg.vlen;
     ctx->elen = cpu->cfg.elen;
-- 
2.31.1


