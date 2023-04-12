Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6F46DF416
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:46:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtc-0005VB-Eb; Wed, 12 Apr 2023 07:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtC-0004sW-6x
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtA-0002RC-Fq
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id g5so13963307wrb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299826; x=1683891826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctqzVVZjJ45Im/ugL7sow9fNEblGak+zrzESoiQbQPE=;
 b=xUJ/UTUS1t2FeTQIcLLY7FY8FvnT0PrL2a2JNjJB4DJztR2lK/dqGE+j+aoTJ16ncB
 dMfavDP08SUjeKTCxh6HejLswjK8pdHCg1RQ3LDkNPoKcYNk5W8Q9VOliTQ7DqxzTZYB
 jOVkSZQcAjNV4Vpxg/cbEPQyhrW2SYWX7nzzBmlDSLkLMB5xjxAdilOswW8EIIiKLxpw
 +iXDtReQ/AC2WUAnJXpXM0hkuL0hScHyMVySKO3qxeh8hYNNGvUIOR4I3ssNU9vI5qJB
 tRGtM6Cw3gpfC7ZM/Ikl4PbIL7d41fPJr9Uvns5cqKNRXpaeFzvvP68KZnP76kntXzSH
 r8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299826; x=1683891826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctqzVVZjJ45Im/ugL7sow9fNEblGak+zrzESoiQbQPE=;
 b=5xVj83psEJYfgJJqtn1QAU7ZIAYKo5XAcVWCx9HXr0E7QmQ0LqXBNtRmXn4Ox6E/kQ
 9LkgS9cxovPFfxihL7rk5PGYyswAgeWv8pD0NaxGvyHjFBss9CYFWdpOh5P6kVW/KJLe
 2D6xms1av1Am9P+eXhHzYQcR1VE9c8x7pSL42B4wpjGQMcc2543G3nsGxoG8DhHg8Jse
 1Vn1yC0qDZZqkIsCm2fXQbnQJLJp0ADZQs7+/62upeK5thUvzCFmIaMNfGytMsZ1GdxK
 y2fYyU43Rsez5DVSUrMuZJGzqnngfwN1INFeROSKJfcjibhH2BlAKi8ftSkO/HoJk8Iy
 Pqew==
X-Gm-Message-State: AAQBX9fNwce1Ed6+4iSDHv4JTX0wOrpL4uElm+lYx4e6GcGzQTn/OcQq
 LMePvHXLSP6fjKRR/sVsjVUUptzo02pB5emxWWjP9hqA
X-Google-Smtp-Source: AKy350Zv2UeMEO2ESCuvf8xzRPh0ExPADi2rrt8wm4FYxQTWUVHkFJ9H98dY19TCRbIZrFGafy08cg==
X-Received: by 2002:a5d:4b4c:0:b0:2f2:af44:60e7 with SMTP id
 w12-20020a5d4b4c000000b002f2af4460e7mr1598229wrs.68.1681299826504; 
 Wed, 12 Apr 2023 04:43:46 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 13/25] target/riscv: Introduce mmuidx_priv
Date: Wed, 12 Apr 2023 13:43:21 +0200
Message-Id: <20230412114333.118895-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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

Use the priv level encoded into the mmu_idx, rather than
starting from env->priv.  We have already checked MPRV+MPP
in riscv_cpu_mmu_index -- no need to repeat that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-14-richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 9 +++++++++
 target/riscv/cpu_helper.c | 6 +-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 0b61f337dd..4aa1cb409f 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,15 @@
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
 
+static inline int mmuidx_priv(int mmu_idx)
+{
+    int ret = mmu_idx & 3;
+    if (ret == MMUIdx_S_SUM) {
+        ret = PRV_S;
+    }
+    return ret;
+}
+
 static inline bool mmuidx_sum(int mmu_idx)
 {
     return (mmu_idx & 3) == MMUIdx_S_SUM;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 29ee9b1b42..57bb19c76e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -758,7 +758,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = env->priv;
+    int mode = mmuidx_priv(mmu_idx);
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
@@ -781,10 +781,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
-    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
-        }
     }
 
     if (first_stage == false) {
-- 
2.34.1


