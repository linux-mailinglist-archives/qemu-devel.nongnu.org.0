Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76A52920
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 12:11:50 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfiQX-0002z6-CI
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 06:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNQ-0001Tz-Dd
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNP-0007P9-2p
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:08:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfiNO-0007OB-Tb
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:08:35 -0400
Received: by mail-pg1-f193.google.com with SMTP id f25so8716143pgv.10
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 03:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=don9t9xuSfJ9sumgvWd/xcF8icVMgBCMEjRj7CpLYOU=;
 b=V/vRM1AtvLfCv9pWzBaucYEH76LjxDmyp3RUMI6pU+oWW/AmW2JETG1fhSSqa+0nGu
 Lw39OMceTLwbuoYj4MQQCEk1AtbjVlkwu/5d8U0mh9Lm5x8oi9PjbXcxmvTZf343FfQh
 5/YRjjEQmUyZ3UZJyx3akTCbzVAl2el5eBT0x11rBcv1PYvWBH8L6nWyt8uVPQJ4zLFS
 WWSw2+1xy4hpKjjTx2ftIv45v/sSuVhj1V1/V6Lu6+j1CyD6yeMSCMQX6hmD/Zcd/Lwh
 BLf0/y4gTeyp7nSndb+oCFesZij4g7sSv53SVxacuYjefxz5SKIuuPSirhqv0nKt2e/h
 oxKQ==
X-Gm-Message-State: APjAAAWx1rhgeTs7xKraPVIdfxN9OpbqIxhsifrsIu/gri2bzTDmwsiN
 xw3A3l40Xz06uYCrnrf2uB9+wk8ZtdMRPEjb
X-Google-Smtp-Source: APXvYqz2AL+V0vWeUKy+cJxZebE84fpBI1O0K56nZ+Tr+BiUm28Ur7QnKpXtdjcjxuX0qP07qpBE4w==
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr7757671pjs.55.1561457313481; 
 Tue, 25 Jun 2019 03:08:33 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id h1sm24806019pfg.55.2019.06.25.03.08.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 03:08:33 -0700 (PDT)
Date: Tue, 25 Jun 2019 03:07:43 -0700
Message-Id: <20190625100742.12522-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: [Qemu-devel] [PATCH] RISC-V: Add support for the Zifencei extension
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
Cc: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fence.i has been split out of the base ISA as part of the ratification
process.  This patch adds a Zifencei argument, which disables the
fence.i instruction.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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


