Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6536F31BF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:02:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU5X-0003Ko-R9; Mon, 01 May 2023 10:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU59-0003FP-Py
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:59 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU57-0006Jr-EK
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:46 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6a5f765d5b8so2049359a34.3
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682949643; x=1685541643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVfCWugO+d79FP1i2Ns8iOcgsT4DvHnnHZJJ7O7e71Q=;
 b=AJDs8SRQBqWTg1DtaiAJvY8o7kjSTWKr6PQtvhOfc1/T6TigMMIjSJfr/ANZwZZDLS
 PoHOsP1lavYSA1IyS8Prqi0Sr+gGw7XzVK+ZeZ/YZKNMEHtQl6fimGv7vuobBEdt+ZW7
 FdL/Lt8OpSntPdhjVtKmcij8U2DuxBzQRg0DQzuNQLuhD6cxcbLNdeBzVY/1Xe43HiLK
 PgtqRKZQFjOQays+TjWlTtA13cq4QCKIfKB4BAw+6CUDxDwSDsBHmBMbGxTdIPyMTCBk
 D+AwxXYxwR6Q2Ud1pugtQZhIrnpCZSFtxM/qHAXQXcHTylmOyM08sGUzgQ3vn+Lu25Vs
 f44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682949643; x=1685541643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVfCWugO+d79FP1i2Ns8iOcgsT4DvHnnHZJJ7O7e71Q=;
 b=AWAdiSsgQdy7V2d4NPPH9gMQHnI6G06xXSJitKj/tp3M8hGqPV2+s9fQkcVCfRsB+J
 lRUHwO35Ju83Ih2VRAN5HDdpVh8evtuqNnfp0hjpsyTFlgjNcbwuj8nPPMZjroGA3SmV
 egl0QaCdQKxVocI5SrCrhUfJIOcK0105F4qJNr/Iypl1y5XvkoJPtrIZJVOj4KduV7Zb
 AUGK3GMqVG42+zZnhHRuxIE7pSDXEpQAwxaFRtXEodiGZmOhyzxoA+icquJTOV0a8Zun
 OqSVw5mL0rX/ptuXSaVeigYlZm/aa0b4HdLZVLM0/BxFTZ4euLec/MLZG921LAy61oUG
 mGdQ==
X-Gm-Message-State: AC+VfDwDcap5Q8bAHEWZXyfwwWjKknMhTavF8oDmPEx9TXd4jocPme/P
 G7qLGFbNrJUaq8b5rxN4UB35O6s1W0ymlRG/HDkmNQ==
X-Google-Smtp-Source: ACHHUZ7hD8HVWEZPJrWFvbneZUudSX6crfX9UZy9qbZe3gMrKCIrCOLunaOX2h1YQhbUBEbVQ6IPhw==
X-Received: by 2002:a05:6830:157:b0:6a7:b0e9:7614 with SMTP id
 j23-20020a056830015700b006a7b0e97614mr7669531otp.14.1682949643247; 
 Mon, 01 May 2023 07:00:43 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a9d6c0c000000b006a44338c8efsm10744342otq.44.2023.05.01.07.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:00:42 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 2/3] target/riscv: Reuse tb->flags.FS
Date: Mon,  1 May 2023 19:30:19 +0530
Message-Id: <20230501140020.3667219-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501140020.3667219-1-mchitale@ventanamicro.com>
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-ot1-x32a.google.com
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu_helper.c               | 6 ++++++
 target/riscv/insn_trans/trans_rvf.c.inc | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b68dcfe7b6..695c189f96 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -119,6 +119,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
     }
 
+    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
+    if (!riscv_has_ext(env, RVF)) {
+        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE)
+             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
+    }
+
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b2de4fcf3f..509a6acffe 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -19,9 +19,10 @@
  */
 
 #define REQUIRE_FPU do {\
-    if (ctx->mstatus_fs == EXT_STATUS_DISABLED) \
-        if (!ctx->cfg_ptr->ext_zfinx) \
-            return false; \
+    if (ctx->mstatus_fs == EXT_STATUS_DISABLED) {                           \
+        ctx->virt_inst_excp = ctx->virt_enabled && ctx->cfg_ptr->ext_zfinx; \
+        return false;                                                       \
+    }                                                                       \
 } while (0)
 
 #define REQUIRE_ZFINX_OR_F(ctx) do {\
-- 
2.34.1


