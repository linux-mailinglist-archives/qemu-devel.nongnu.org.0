Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF66C8E51
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg3R9-0006TW-KJ; Sat, 25 Mar 2023 08:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3R7-0006Sk-7R
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:55:57 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3R5-0004sy-LN
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:55:56 -0400
Received: by mail-ot1-f46.google.com with SMTP id
 d22-20020a9d5e16000000b0069b5252ced7so2264026oti.13
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679748945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAPb1e70A2EeMvluMXyx4Hmmha63qgfKQDGsGkU+B1U=;
 b=oORgkqnbRlCH6IrTEQsw5glLfcLoaMe/qwmHbZBVhg9qUqCdGPJ2d8wEQJfiQwc0C5
 m3QmVpNwlZh26yas0sJlruEGobOYW6BtQ8+y4ptLLg4THQktcLzoSbeOBsl/QnIjaYcE
 otaBEFvb7tyg8N5SQIhGyMh0Dy8kByWtlNDBV0M3Aa1RHYfOntR2OIfCKAIqT9wFCejP
 oBOjFBREbnuKb6h3/esaCI1+ncFfhLz331CBMJaquUeZQbCySfkxW2zmiJz+H/xh/G8k
 Tmwd/87dCmhrACcmHMLKRLn9ftDhbT7iL5sAlBccL0n3DFGDYINnKgFDOfwTLZuxm19j
 CP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679748945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAPb1e70A2EeMvluMXyx4Hmmha63qgfKQDGsGkU+B1U=;
 b=FCXTJhxgdRIheVReZN9KQLGK5fkgdvnaKULYKvZgCWI5grt5gaW/885pNqjnGqRZcn
 hMPo4qBPRSHXTF0uvIRrYXYtJRs6CPdFdvyL5aIzmG94vVz/t/ldzGIVTK5p7Ts5ZZDj
 cX84KGEVpSz5svCoaCgJeSKthEOdoyW0KW/LUfmIL+AL8gCKjXPrdhA+yoGeLefSQUSY
 o89Qf0wOUXrC+NzATW4CaY7HivBIVqUoNkA6HWdJyZErfsIWG3vYH/0AyIjRc0uyYw7c
 i8IWOHVHfUzCc4MkKND6k7aJ9uRaG8Vq16KmcBuHUySJwjbHPPrq3o1DMDPlNz+ET6tv
 xAaQ==
X-Gm-Message-State: AO0yUKUqsRs55EgRwN/g3gheYMvps+pm3WqUi1waNB2uYNrfaU0XCgIB
 G6xjx9BFXwukVS82AqSE1fWP83w+N+k7zUYPYek=
X-Google-Smtp-Source: AKy350ZVUAj0LaYtphW8vVRQiBUoK6lBAWhtYd4P2MUMfJmBARMlo5+MI01Gm6ogY6R6bnNDJirU5g==
X-Received: by 2002:a17:90b:4c49:b0:23b:4bf6:bbfa with SMTP id
 np9-20020a17090b4c4900b0023b4bf6bbfamr6446087pjb.11.1679741692731; 
 Sat, 25 Mar 2023 03:54:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 25/25] target/riscv: Reorg sum check in get_physical_address
Date: Sat, 25 Mar 2023 03:54:29 -0700
Message-Id: <20230325105429.1142530-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.46;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-f46.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 target/riscv/cpu_helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 725ca45106..7336d1273b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -800,7 +800,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, widened;
+    int levels, ptidxbits, ptesize, vm, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -831,7 +831,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx);
+
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -999,15 +999,15 @@ restart:
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


