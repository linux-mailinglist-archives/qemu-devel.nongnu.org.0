Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E36F1CF4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:53:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRL0-0004Oj-RJ; Fri, 28 Apr 2023 12:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKz-0004NW-C7
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:52:49 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKx-0005tj-HI
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:52:49 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-546ef028d62so63427eaf.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700763; x=1685292763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dIN9zI/PgwinfXAkOsAE9d4fwBU5Aj9DW4c0RUdpk0Y=;
 b=fUWu8QJfduUx6k7BKTtLmXQvz/Nhxv6onW24okY9zmoiu2koC2ThrdDUguXQlyS0NU
 JVUWMFDr8EXT7Ys+i6PsbXsfdJCu1yNkTD0LMKvBscIXn5KRASu+tbmjU9WFYsHChCPE
 V3pMlgkqGEVPkGdsfHh6e7TBeYQoVlWFU/bq7v9aa7MPPpFiCIeFRiyFu+G4MB6wmGOa
 yIPSJFC+OlaElQYVaWpvIeg86pJjO4HI21PpxOcr89nk9ZLBVYgcJ7646VdPuUo5QqKM
 dGVSDLYoB+6N7Ifp10cdJx4noDZvXAJ6meS/E64MFRtyODLztNWG+FoVixYy/ZLiKqBv
 05uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700763; x=1685292763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dIN9zI/PgwinfXAkOsAE9d4fwBU5Aj9DW4c0RUdpk0Y=;
 b=IKA6F7dIW71bwYHnrSaUm24alZf8J8BnusuImpsocR8U3rJyuixrDu18J92Koc4PQQ
 0vLpOh6DkXK+mVyZ2XNDbXqrvhoHd049ZHYi1dIeclLXDyKza5/VMF1kndrELrxJ0mah
 O7P+07wcXbGAkgUKGQlJKnPj4nPqLJdCeEBDbUQSMdGImVj0Xq06ukyfzR3Xc3JP+zaD
 OjxedQBv5jMHwCxmev0aAOhAiwZT68R2RNB/RmGx456UGCg3OTjMqvIRkF/o0LQNeXx5
 Q3vYuhRmztgVxplRRi/NHz+oUK8GWPDQLz2akVVYRqJADuvJSApRZ+j2qTTZv5ZCyV+x
 0CWw==
X-Gm-Message-State: AC+VfDwhbDE+f2JjaJGsI2k6sobdknGxjLgxMX7gHsthA+6+OsGNk1oo
 APkW1qz8s+eWB1XIWIHGiTHWrvXbeYJnKqowc1eYgA==
X-Google-Smtp-Source: ACHHUZ7C9QYCh0g0wGuGux0S1eBMjQZmjXAmvF8Qe69scnZudL/AnmC71D8LoatKbcYgg0T7x75DRQ==
X-Received: by 2002:aca:674d:0:b0:38b:eb6b:315b with SMTP id
 b13-20020aca674d000000b0038beb6b315bmr2602348oiy.46.1682700763253; 
 Fri, 28 Apr 2023 09:52:43 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:42 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/4] target/riscv: Reuse tb->flags.FS
Date: Fri, 28 Apr 2023 22:22:09 +0530
Message-Id: <20230428165212.2800669-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428165212.2800669-1-mchitale@ventanamicro.com>
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oo1-xc35.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When misa.F is 0 tb->flags.FS field is unused and can be used to save
the current state of smstateen0.FCSR check which is needed by the
floating point translation routines.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu_helper.c |  9 +++++++++
 target/riscv/translate.c  | 12 +++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b68dcfe7b6..126ac221a0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -119,6 +119,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
     }
 
+    /*
+     * If misa.F is 0 then the FS field of the tb->flags can be used to pass
+     * the current state of the smstateen.FCSR bit which must be checked for
+     * in the floating point translation routines.
+     */
+    if (!riscv_has_ext(env, RVF)) {
+        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE);
+    }
+
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 928da0d3f0..74f624aa62 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_inst_excp;
+    bool smstateen_fcsr_ok;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
     /* vector extension */
@@ -1155,7 +1156,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
-    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
+    if (has_ext(ctx, RVF)) {
+        ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
+    } else {
+        ctx->mstatus_fs = 0;
+    }
     ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
     ctx->priv_ver = env->priv_ver;
     ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
@@ -1178,6 +1183,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
+    if (has_ext(ctx, RVF) || !cpu->cfg.ext_smstateen) {
+        ctx->smstateen_fcsr_ok = 1;
+    } else {
+        ctx->smstateen_fcsr_ok = FIELD_EX32(tb_flags, TB_FLAGS, FS);
+    }
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.34.1


