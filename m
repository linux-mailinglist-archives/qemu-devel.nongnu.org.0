Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7A6DF425
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:48:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtg-00060T-Cc; Wed, 12 Apr 2023 07:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtD-0004vg-Ee
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtB-0002OA-4S
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id j1so14578506wrb.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299828; x=1683891828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1b/kBvvVthJX/VbKnXsWeX6FiZxYMKF2JWi4jeCwEjI=;
 b=jfp6IJ9b6SfvDChBPWboAtWgpFxpKJNIvu7lhf0kVA7Eu8IQo2XlTqKRpz0rt/paXg
 4w6PfgYIt946339LuxW6JFkQxE/OaKO2mhL+B8VSXySbn7HywzBJpf90AU7vxSXfnkTV
 h+hNIxtWLpTcDL5tZLvJZm8e5039skLZYRe1Q49lDVzEXgmapyE3dJh6IuCpU/bswRHr
 HJmr7Y7mi5rHCefuGETh0/fLqzwYFcvR0atM7FqWAZ8WPNAWKSjEorGFD1tI8jLsmh/d
 pFlizOwI5NWUBKjoF/hLYZLnoAB8LGxECo+fRmMOfs+ttNQguj1yignVOd0pawzOa3h4
 jm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299828; x=1683891828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1b/kBvvVthJX/VbKnXsWeX6FiZxYMKF2JWi4jeCwEjI=;
 b=Z2+xApHnFaZdfMrfjrZN2ipWh4MlNOcJec8oLTaMW21/tZPKUb3OWoTPL0rWjJxh9I
 4mlYI3Ex9o7W+ZR/hZ2wvgi4YOismWp3GiZl7term8f/45v9MNBnUUIuK7Ry+UMcCjI0
 JOyrLVpmsVZFWOmt/2+HK3m0kBmBX2DX8OK3JdwOucBW7uPzsC4P+cfPlvPMLsKZP+hh
 1TRSo8X3K3NFzZ0cyCqA+BkzZfOd19ascAFSC6/QX2s6N9SDA7Ig3rIyXj2SuISAXYWG
 JqM20klOOnkpNWJ25OW/QoYtZq4VH92jHBjgZG5xxFInZDiX3iUSp4/bp54/qHNSTalQ
 duAA==
X-Gm-Message-State: AAQBX9fEUQCd9ZHF3w/pPoB4EqUZjC0iO0IdHSCLyyqCvf35bJW0uVuN
 Sr21feyk0uqPSfoUBQo9lWR7ygmxvMnHMpZNcSKae+NP
X-Google-Smtp-Source: AKy350Zklz/sR+JJFQpTGIjMKnrtVHh3IcxpkkuU7U+heZ+X0HG7fk3a48HRreXt5LQJw7RVQy8m6g==
X-Received: by 2002:a5d:540e:0:b0:2f0:27cc:1e7 with SMTP id
 g14-20020a5d540e000000b002f027cc01e7mr4409096wrv.9.1681299828407; 
 Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 15/25] target/riscv: Move hstatus.spvp check to
 check_access_hlsv
Date: Wed, 12 Apr 2023 13:43:23 +0200
Message-Id: <20230412114333.118895-16-richard.henderson@linaro.org>
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

The current cpu_mmu_index value is really irrelevant to
the HLV/HSV lookup.  Provide the correct priv level directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-16-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 10 +---------
 target/riscv/op_helper.c  |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9dfd1d739b..ccba3c45e7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -770,14 +770,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    /*
-     * MPRV does not affect the virtual-machine load/store
-     * instructions, HLV, HLVX, and HSV.
-     */
-    if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
-    }
-
     if (first_stage == false) {
         /*
          * We are in stage 2 translation, this is similar to stage 1.
@@ -1250,7 +1242,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * instructions, HLV, HLVX, and HSV.
      */
     if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
+        ;
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
         mode = get_field(env->mstatus, MSTATUS_MPP);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index a5de3daee7..49c19d971d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
+    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1


