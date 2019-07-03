Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F4A5E076
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 11:06:19 +0200 (CEST)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hibDW-00031y-Np
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 05:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq7-0006Ne-Px
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0008Dg-M2
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:07 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:45901)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0007Ub-BE
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:05 -0400
Received: by mail-lj1-f169.google.com with SMTP id m23so1441845lje.12
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 01:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=NIyWvQXIInPHkbPMAYxhV18GTR99MjAgFa+NcGYzhSA=;
 b=pxPctwCwJNXuSgb3S61OQQCOhKS8Zyd8UsCXrqNYFpn+7gRy+GGDqLMaGGMlIILU3b
 Wgo63xUDNZ7iIwPybiYiuX55yl31yVx4LiOWokmP+f4+f3hMQuGvlUWig0ngsXWUl19k
 bjvnpUjEOIQ92V0HDOUj0WhNNHgkOlqh8bYbtO2oBE8Bes0cp0zlk2Azs8hqoHALFZda
 X5pQGntQhEWO6vWDtYsL3zUdjyXUQyQRGGd7EqQYfBJq7MYUfTrRXoacVXI4/bplDrBA
 AEKr+7qfoKVumArYyZHrDHK8drtKWRyImkh1pq2u7zrBi8hrPGF+/lI7VfFIfYME0zyo
 XrYQ==
X-Gm-Message-State: APjAAAWtBuD/bFXKaVPLw4EE29Fte87kokx7CPpo6peqi5p9dmLxzD+b
 DReo17vpkh7/Nl0EsOOgkLNJ0RNu4pUwJA==
X-Google-Smtp-Source: APXvYqxMDGgINtI+spwh9sC7J1MM+5xr0t1R2SipoUHXZjD41tEulPGQ4NpVyMuKTnQN5d9zlYr11g==
X-Received: by 2002:a2e:5c88:: with SMTP id q130mr6282150ljb.176.1562143306550; 
 Wed, 03 Jul 2019 01:41:46 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id 2sm336790lju.52.2019.07.03.01.41.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:45 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:37 -0700
Message-Id: <20190703084048.6980-22-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.169
Subject: [Qemu-devel] [PULL 21/32] RISC-V: Add support for the Zifencei
 extension
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fence.i has been split out of the base ISA as part of the ratification
process.  This patch adds a Zifencei argument, which disables the
fence.i instruction.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c                      | 1 +
 target/riscv/cpu.h                      | 1 +
 target/riscv/insn_trans/trans_rvi.inc.c | 4 ++++
 target/riscv/translate.c                | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index be90fa7d0808..bbad39a337b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -441,6 +441,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d4e0f89e206..ba551cd3082c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -223,6 +223,7 @@ typedef struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_counters;
+        bool ext_ifencei;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 6cda078ed6ba..ea6473111ce8 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -484,6 +484,10 @@ static bool trans_fence(DisasContext *ctx, arg_fence *a)
 
 static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 {
+    if (!ctx->ext_ifencei) {
+        return false;
+    }
+
     /*
      * FENCE_I is a no-op in QEMU,
      * however we need to end the translation block
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 313c27b70073..8d6ab732588d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -54,6 +54,7 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    bool ext_ifencei;
 } DisasContext;
 
 #ifdef TARGET_RISCV64
@@ -752,6 +753,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cs->env_ptr;
+    RISCVCPU *cpu = RISCV_CPU(cs);
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
@@ -759,6 +761,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->priv_ver = env->priv_ver;
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
+    ctx->ext_ifencei = cpu->cfg.ext_ifencei;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.21.0


