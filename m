Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEA6C8DB4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2Wc-0004Gw-9z; Sat, 25 Mar 2023 07:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2WZ-00042v-0B
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:57:31 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2WW-00025G-3k
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:57:30 -0400
Received: by mail-il1-x129.google.com with SMTP id n1so1506554ili.10
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lxv6IGzqjjzjN1C+1x2BdZrVLXQ9a8kJbiDfeO21NKI=;
 b=w7fbf+6YnmTnM3CFEpREEogTe/8DK8kegm/qooFM0RkK/TGQmfulbHD1SRZFiOcONu
 MtayMT3yCZnFCTJ21UKyhRljBnsSLEAa8R4uoRpJVJ2R9BrbRfq1YS8AnkYZFq0bpoDX
 GEcp27GRKZqf4MkgASHm7/rt7T9KedM3xC/nd5IAXLaWN26oQnHrHrhJoEsR5aqZW2g2
 7ybF9BIrNh/SyPy5/6syjGe7+kXYU12WGdmH5/piNO65kRNMvkpgvffYJzEsV0TAhD0C
 l5imDrOIYkS6S+61eq8CnAYBBB/0/uTUlzEJm0TS4dT4R2OJfywLRctSZdr9dBsuwRLJ
 kNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lxv6IGzqjjzjN1C+1x2BdZrVLXQ9a8kJbiDfeO21NKI=;
 b=bFp7+zFj8Yf6p5crsRp0Mnz+Z6PQ2Rj+DNvHunTIEIrEfCFb5xqxWZ3csS9hPecB5+
 QtRN1/JK3NRYgnuH1riBrPWw+gUzE/18RguBpbhAZpkqjzZsAYKjGi9HMyjOFFofAj/i
 FH30hwKfHNTl+tujp0AnkiCHVVBER8Md9ghWXRiOiYgI5UrRd88dr/TUKXy8wYMw8Uv5
 fXlSEfeCpHcm3Y/xA9BfRxwJSD+ZOLyUXxYRpCVTaqEX5jbWY0CK3J4GfGpqclPpx/p6
 EnNdMpRxK4eczhohG4IXFqSBEUnKAnbMvBQnhcyXZv2R9fa4pe2roh4jPc/03Yy9PpBV
 2uQA==
X-Gm-Message-State: AAQBX9eqL4PeAUIScnmgz58us1tBL6+AKuuF/BMt+1l1aKBAjd5OaVem
 KPf3V2cwBIxXiVj3R8VZ0MBgdYF2KUFlihs1+rU=
X-Google-Smtp-Source: AKy350YbzyZyaOOZALiHdGIL7lbVJuyOu5f4ZJnKKMm1uZyv6uFW+l+j5XekjzQkloSogJfY2osSxQ==
X-Received: by 2002:a17:90b:1e4f:b0:23f:4dfd:4fc1 with SMTP id
 pi15-20020a17090b1e4f00b0023f4dfd4fc1mr6425249pjb.43.1679741672055; 
 Sat, 25 Mar 2023 03:54:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 01/25] target/riscv: Extract virt enabled state from tb
 flags
Date: Sat, 25 Mar 2023 03:54:05 -0700
Message-Id: <20230325105429.1142530-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x129.google.com
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

Virt enabled state is not a constant. So we should put it into tb flags.
Thus we can use it like a constant condition at translation phase.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  2 ++
 target/riscv/translate.c  | 10 +---------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..12fe8d8546 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -650,6 +650,8 @@ FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+/* Virtual mode enabled */
+FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..9d50e7bbb6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -104,6 +104,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
+                           get_field(env->virt, VIRT_ONOFF));
     }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..880f6318aa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1156,15 +1156,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
-#if !defined(CONFIG_USER_ONLY)
-    if (riscv_has_ext(env, RVH)) {
-        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
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


