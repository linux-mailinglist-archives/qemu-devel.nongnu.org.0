Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7A6DF41F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:47:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYto-0006xj-Ro; Wed, 12 Apr 2023 07:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtO-00056K-AC
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:44:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtL-0002PS-40
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:44:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g5so13963917wrb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299838; x=1683891838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NoQh8yWVm3hAFzwy/qPB+auaAmUwei9hlZGr86CydxQ=;
 b=kt3E4SgZNmIZI+gaYwAzRQ8G1J/IB70YWIOS6Xe7xnUxDG8lkGx6VhPkGFaptJG5E/
 YMme7EOKqeHOcWMJcKUT5hKe+aV/G/D+jKiDd3d+T+Su9jAIMjej7Cv8PC8umikoDGPz
 36E+Pcjnmf9dvuwJ8ulyJSvzDcEs/8H+BiDEeP0gZjtzb6+iVVwnzS7xUwcFpdIVBTR9
 lUA80wGv0sotcNnp05C3mgHI9Ec90WVUNi2jkbwsXNhXq1btYsjpqr80CDKkFOFK1haU
 C5pNjswMDesfg/FvNOced0WwXcjsFiQiyxtzCmVdC1JOHQ/CBj/DfRcY2hIL9k8MPf0j
 UVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299838; x=1683891838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NoQh8yWVm3hAFzwy/qPB+auaAmUwei9hlZGr86CydxQ=;
 b=jVzC4oLT0j9LIpbZCa5a5e+HDiakXpBUxP1PzuedFWPIRn5/utcVdayrJ2+CetppZN
 S8H6bPZqCs022gT9kxDXFR3oh28j20WvG7+lISYS6ivsqRxcsNi9rLpuZDISN2VrG1FL
 7VUoOjXXn3d+Xynq/4SoTdSP0HvzIZGBmu2RPJrKozVy8XcNA/VlYDgfMd1AK1FHe1DH
 2p47536lDDb4oGjie5Rb0C2Fibzk/9ulrKaToYMkdSR/ZwWa1HLwP6gIRt6b09W9UaOx
 Mqg1b7JpWY8c30ga82h1ROxPZljZ/HdHUfFslybsKYP4UnqM9Z1iejZinbj23B/5QlMp
 hSjg==
X-Gm-Message-State: AAQBX9d+kDlexAlsXS8hLKdhugegVHMTYkl9Dhp3FELAZxH06+tDvuml
 52t+Rtl7CpOfd5Wwp1KX7+/OPACARY870SPmqsSqRw1p
X-Google-Smtp-Source: AKy350bAWVGAYOxT+xcVUgwRtHS5FUJU5BapyJ0dBrOulkAQlTU6yRKZ2fO1OHCYS8tmRLdeDyY9RA==
X-Received: by 2002:a5d:4846:0:b0:2ef:ba74:663 with SMTP id
 n6-20020a5d4846000000b002efba740663mr10594545wrs.27.1681299838379; 
 Wed, 12 Apr 2023 04:43:58 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 25/25] target/riscv: Reorg sum check in get_physical_address
Date: Wed, 12 Apr 2023 13:43:33 +0200
Message-Id: <20230412114333.118895-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

Implement this by adjusting prot, which reduces the set of
checks required.  This prevents exec to be set for U pages
in MMUIdx_S_SUM.  While it had been technically incorrect,
it did not manifest as a bug, because we will never attempt
to execute from MMUIdx_S_SUM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-26-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7849e18554..32a65f8007 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -786,7 +786,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, widened;
+    int levels, ptidxbits, ptesize, vm, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -817,7 +817,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx);
+
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -985,15 +985,15 @@ restart:
         prot |= PAGE_EXEC;
     }
 
-    if ((pte & PTE_U) &&
-        ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
-        /*
-         * User PTE flags when not U mode and mstatus.SUM is not set,
-         * or the access type is an instruction fetch.
-         */
-        return TRANSLATE_FAIL;
-    }
-    if (!(pte & PTE_U) && (mode != PRV_S)) {
+    if (pte & PTE_U) {
+        if (mode != PRV_U) {
+            if (!mmuidx_sum(mmu_idx)) {
+                return TRANSLATE_FAIL;
+            }
+            /* SUM allows only read+write, not execute. */
+            prot &= PAGE_READ | PAGE_WRITE;
+        }
+    } else if (mode != PRV_S) {
         /* Supervisor PTE flags when not S mode */
         return TRANSLATE_FAIL;
     }
-- 
2.34.1


