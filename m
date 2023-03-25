Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592336C8E2C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:30:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg30q-0008Dl-6z; Sat, 25 Mar 2023 08:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg30o-0008DZ-E7
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:28:46 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg30m-0005Xo-Tu
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:28:46 -0400
Received: by mail-io1-xd2c.google.com with SMTP id bl9so1912640iob.8
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679747324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afbDBfHu3xZ5ENlfuk7S6Io4S9eISw3U+JX32ROX2Ik=;
 b=x/T0dIFr+H8J3B5vI55m4C/iKnxm8r0gj5nbn+tAH+eZF/gJP8UrPQQJGzGL1MKM9V
 in0tocQBOkZseV+yyr6dH6BKi+X0FUlOlaU4Jpk/RiXSxOFp+h6E9cvUrDLDOIQGzcFk
 achDG82WYl61V11t54Jlk7E4Shc0n3+e7fV6OJEX1kra7uzfh/X1j33nnV3KENrI6/C0
 /ISLQ9UZzNdehYVMbh7H+Yf5KYe2HOi7IyfZzPgNDFGnlk3D3/xr12JGij16S1Dh2zFS
 SCIcYAPgBcX7zQF4pnf7aiYrkyXYRDqUuUxmuaTvE3cBE5UXZk6Z5+jNlpcjz0dI7ywB
 RRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679747324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afbDBfHu3xZ5ENlfuk7S6Io4S9eISw3U+JX32ROX2Ik=;
 b=WDo7hCj4bJoEjs5WU07WeEDP9h7XJ4V0vAbvr6uco/GILWrpWlVswyd7SRKLK8F17n
 3kddW7bjH5u2rzWHXq/QbYEqBOXwOs4Q9YwofVrpKEnA1QpqGcc8Iggh5hA1+a8VJoNu
 tkuI13Ujayo43Pj9G7VcHkRd2mVJlw52l45mAhvZYSAi/YN3CaScyva9L85cdd43GcBB
 PpUpGC/Mq382IXpl8T0APkvu3VglMiWwy7rMHhGqgQEMbgazXWB5PNrClouRGO+K1pGD
 Sy8HqoEs6A2aT7SvEPekrzezz+hLhSDJTPuruNv1jT6nzSHLMJPrJXX0ByBqYxkKojat
 gsIA==
X-Gm-Message-State: AO0yUKWvNT7OOt5v6n7MvynJJW2gstm6FzB/8ybmCZMngt8CSp9sBhCR
 ltQ1ITQXRRcxBm7CaSBsECenZ+BvYUb+rdo7r/I=
X-Google-Smtp-Source: AKy350aqvUQ0m0j0Gw0RwKG20EyVtVbjtEkaYY5nfpWuiuduM6walryf+kjAzIRF/fkNvJrB1RjCLA==
X-Received: by 2002:a17:90b:2247:b0:237:b5d4:c0cc with SMTP id
 hk7-20020a17090b224700b00237b5d4c0ccmr6085698pjb.39.1679741686609; 
 Sat, 25 Mar 2023 03:54:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 18/25] target/riscv: Hoist second stage mode change to
 callers
Date: Sat, 25 Mar 2023 03:54:22 -0700
Message-Id: <20230325105429.1142530-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Move the check from the top of get_physical_address to
the two callers, where passing mmu_idx makes no sense.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0017ecbf37..833ea6d3fa 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -791,12 +791,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    if (first_stage == false) {
-        /* We are in stage 2 translation, this is similar to stage 1. */
-        /* Stage 2 is always taken as U-mode */
-        mode = PRV_U;
-    }
-
     if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -902,7 +896,7 @@ restart:
             /* Do the second stage translation on the base PTE address. */
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
-                                                 mmu_idx, false, true,
+                                                 MMUIdx_U, false, true,
                                                  is_debug);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
@@ -1274,7 +1268,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             im_address = pa;
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
-                                       access_type, mmu_idx, false, true,
+                                       access_type, MMUIdx_U, false, true,
                                        false);
 
             qemu_log_mask(CPU_LOG_MMU,
-- 
2.34.1


