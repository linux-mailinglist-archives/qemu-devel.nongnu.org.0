Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583DD59C422
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:29:50 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAJ7-00049r-Gh
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LR-0007ic-04
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:05 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LH-0000it-Gj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:03 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so11693294pjl.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BX+4xB/VDWHk38SQNes18SXGBzYUd9d/yvot5DujC+I=;
 b=n6ywuIDZmU/esoI0SslXsFkFgnj4YQVQmtEk90igcrxqCbjK0fCmqqNYYuJ6i/PrV1
 8xZtI3EGQ9wx979Ls7pyQr8xBd/5QLYZ29wh0vYJOGCv3Sijqg3eO9hP9Xc+CSMblkp4
 pURLEQxeH28HF678GhvlvV6WO6pZ+ieI2PMynqXippJTaaEFGixlDoRyRV1vpf5GheR1
 7PME3mapuHLKCGBKNbJOGncy4mt7UnYBgFTCcJm1z+YlQL2yb2X22lU7x3dh5vcdhYDT
 tBnW1m9vZwcVot3nOjfUrGmOveSy0sIC0Ygtd4e6vtRldKghttfSqvdKEW/3sKEL4kWr
 2w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BX+4xB/VDWHk38SQNes18SXGBzYUd9d/yvot5DujC+I=;
 b=vKuU3apAgQU8+QdDGrsXRx0JLO0Cwr+lbzUInxAf3yuVJ4PmRDix1suVwSgMY+EZ+X
 teia6fE1y5Tocy/Yd9Sm/pvfmGwT3my7dSHf3d4VoCQ6/RxZsfLjoGVIFYTdFx4F48YK
 wGrWd2Q2Uv/qtteUF043LyNmv8FGni/PsjvKKWBILExhHC8JRUiL35yJ5NUzjEL77jiF
 Uo4O058mdTC9UiUfIoAIsr3h/+SocxGWFWb2TLeSKl5rYIPPZaXuVXSsqaLuLylxLhgW
 kAXR3j7EuqzChelPVD66uhAT5h4oNoKVg2zs0ZJkIgjD3DKkdsaA222ZOafRrY/guNk1
 gWow==
X-Gm-Message-State: ACgBeo2W9yd66m1hmFQsniaBumZtwjNL2u0A447aC3/2HZ5a0wTHkMpO
 qO6OdPtslhkSreGGoYPQhyja/mJUwrwttg==
X-Google-Smtp-Source: AA6agR5o5amRR0ROpZ3ZUzi54uBGG+9Qd8WB+aVGNz9DreFDCusFuroLq38ojCGJqRK/AauRxJTmiA==
X-Received: by 2002:a17:902:f688:b0:172:f892:5c3c with SMTP id
 l8-20020a170902f68800b00172f8925c3cmr1906447plg.49.1661182074122; 
 Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 14/66] target/arm: Add is_secure parameter to
 get_phys_addr_v6
Date: Mon, 22 Aug 2022 08:26:49 -0700
Message-Id: <20220822152741.1617527-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the use of regime_is_secure from get_phys_addr_v6,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4609278b42..a6880d051b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -533,7 +533,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -556,8 +557,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -610,8 +610,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2508,7 +2507,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1


