Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36506DF43E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:52:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtg-0005xa-43; Wed, 12 Apr 2023 07:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtG-0004wy-V6
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtF-0002Rd-3j
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id v6so10561386wrv.8
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299832; x=1683891832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dyXCtchSD+HKn11xxL6vJfEveqvcGr2NQzNKSenNrQ=;
 b=BKIDOmBSyPRnXY7Vdzj9fSl2kqvbzlnJEMpcXPAvRXqM8mjU6jcsGgHhKLfj7WaOen
 19yCWM6+e9R6QpUNCH6gf+g7yOA/jHBywUDfReRRihufm53f11lU0+uqxfjEaLfbpCpo
 if1D869VpRXNqfm+vBPSjmdGtZb8uj4QCWjRNpBKlwmzn2UWFF9FWMMDWqscxpxAeXXp
 MYDSMl2508/6OMKFSes0NHL/1QcgQp9Yrm73FIHiBsncLssgJtSdJUrejYFqHybQyXC2
 P4idbz5EH7vx7mSpct2onVk55GqflZuA+avYDu9b5vgBki9txWF5KcMV+ZaW6NzTSnUp
 ifDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299832; x=1683891832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dyXCtchSD+HKn11xxL6vJfEveqvcGr2NQzNKSenNrQ=;
 b=DVXda2iKIEMQs7vMhWRLU3vQs0CD6oboIl8vv0ZR8fmeQy+J+JK/44PTIpPf2NliEc
 M5aqlfJ9OXUVHE8yt0spWMYLCk1/DdyNve62dXIesSe6GlDorKTDC0eKQRiHwNWr4rcc
 LdvNx5OkhDIn4Ak9MLR0BHyvXZsNFhLGtaJyQTSufEAa+6+71RV5C570l1BYdAZNem0F
 v2ACG++tdm+PPer/XVP2HQ7wtuZ4splXtbWKtAP5R8zHdITvRkzDJb2teyRlgek3boaM
 94KAaDdXXLGw13TqjVLy4vUpSM5t6nZM7d3Tdt/+DCuSMNx31RvGNMI6e94uCqDDJiKZ
 TlSQ==
X-Gm-Message-State: AAQBX9dqWyOFMqEmIIO+wGRVoxJwBbIaDhnOOmh1nprRT1QGJeJZqw4V
 Ha7UA0/ARZI7a34tCxirtDvGj+eZseFC8AunkRteQa0A
X-Google-Smtp-Source: AKy350Y4mSs9yEOtaPu8bsIuycDfsZRSCjMoxh4lcsT3j/olLMkDihgx+xJAFc4OLJkyCBbdmnM1Tg==
X-Received: by 2002:a05:6000:1003:b0:2f2:d852:c3f8 with SMTP id
 a3-20020a056000100300b002f2d852c3f8mr4209725wrx.39.1681299832312; 
 Wed, 12 Apr 2023 04:43:52 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 19/25] target/riscv: Hoist pbmte and hade out of the level
 loop
Date: Wed, 12 Apr 2023 13:43:27 +0200
Message-Id: <20230412114333.118895-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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

These values are constant for every level of pte lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-20-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5753e4e612..7c9f89d4d3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -856,6 +856,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         return TRANSLATE_FAIL;
     }
 
+    bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+    bool hade = env->menvcfg & MENVCFG_HADE;
+
+    if (first_stage && two_stage && env->virt_enabled) {
+        pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+        hade = hade && (env->henvcfg & HENVCFG_HADE);
+    }
+
     int ptshift = (levels - 1) * ptidxbits;
     int i;
 
@@ -916,14 +924,6 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        bool pbmte = env->menvcfg & MENVCFG_PBMTE;
-        bool hade = env->menvcfg & MENVCFG_HADE;
-
-        if (first_stage && two_stage && env->virt_enabled) {
-            pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
-            hade = hade && (env->henvcfg & HENVCFG_HADE);
-        }
-
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
         } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
-- 
2.34.1


