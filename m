Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053A6DF402
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:44:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtA-0004j5-MX; Wed, 12 Apr 2023 07:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt3-0004f4-Il
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt0-0002NE-NI
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id l18so10512595wrb.9
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299816; x=1683891816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=es1PvJYw9d2r23P0DzMd3BW6TZP7rodwja8w1R+yBl8=;
 b=W552nbUcyiIpxvWAZBhvSMuF18TcXEgyQL7K0GjcOm5tUVwtOjJP9jx8+UD7pnkqVX
 RvaHOa1VaVCa4QEsXda6aukwBZPHDbK5s4e9Vw0d3hNcxkVsuTWlfKKfCTRsA4pOY6g/
 SKlpwF4XSu+LwhnvRya87ovbxfPTazDwq5+UFahXPWxuAcfRRJi7ubBMCeljt2S9eMK/
 qQSx2ZRta2/ihOQzlTpz3BKBdFeC8QdNZ0AKwu/Mhp/omO6tbS6tpfRtOEmJzd0E++5f
 glt9i40OyGJt3aLWh+j9sqjaakFF+Y41kZ2d4jpAjX0NKkfGF0fHcDqsDW1t3tIMNc23
 xmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299816; x=1683891816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=es1PvJYw9d2r23P0DzMd3BW6TZP7rodwja8w1R+yBl8=;
 b=Lr1Cqt8pXbUDmnb8whcVbFiNZrIjb4Xm4OhnFCVNWenMppj9QtaEwHJZZl0PgC1tu/
 mP82EkBx+36XCkKBx/VV11NwNNhcMwhcZWoUGIWCjE9Z2/3/HSFIXNYE/o3iAOiCHzcD
 67au2gFw016ve4R9bTYUkPqhY1EGXwi7Og3b9/pCeivaMCvouzmcckS7zvlrRqAtOsFA
 RzwQyJl3iubfKcUycx3pKBuEjiZzNDlApHJ+tIgDZorcIoNheAOeJL4gIVFkPAvWMZvC
 pYp/3fuOW/TV/TlcTZJYq22wI8RmdwjFYFLDx7MvJXBLBADUSpDNbjgkFh9J5BDZhGEc
 Wdaw==
X-Gm-Message-State: AAQBX9cQJ42CiLjeNK67h9mwBGuhC1p8Q31rpsCwSIEvs4MmI/asqsvC
 519go9XldEEBhfQlyIA7OXkdGKOVvh/89RHlsrG+/Nsm
X-Google-Smtp-Source: AKy350bqgd0aFXGysbBv3mGQaoiFiDA+0wmjjGyJo3FuSL7xHdTClwvDHoyLgEDLGn1BMZ7pX17Jhg==
X-Received: by 2002:adf:fecb:0:b0:2e5:1ee3:df77 with SMTP id
 q11-20020adffecb000000b002e51ee3df77mr12169128wrs.46.1681299816220; 
 Wed, 12 Apr 2023 04:43:36 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 01/25] target/riscv: Extract virt enabled state from tb
 flags
Date: Wed, 12 Apr 2023 13:43:09 +0200
Message-Id: <20230412114333.118895-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Virt enabled state is not a constant, so we should put it into tb flags.
Thus we can use it like a constant condition at translation phase.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-2-richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  1 +
 target/riscv/translate.c  | 10 +---------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 86e08d10da..aa53d0e256 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -648,6 +648,8 @@ FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+/* Virtual mode enabled */
+FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 433ea529b0..1d90977d46 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -104,6 +104,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, env->virt_enabled);
     }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0094922b6..ebd00529ff 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1171,15 +1171,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
-#if !defined(CONFIG_USER_ONLY)
-    if (riscv_has_ext(env, RVH)) {
-        ctx->virt_enabled = env->virt_enabled;
-    } else {
-        ctx->virt_enabled = false;
-    }
-#else
-    ctx->virt_enabled = false;
-#endif
+    ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-- 
2.34.1


