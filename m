Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9465645E8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:47:19 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vGA-0002y6-1g
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv7-0007zi-Ow
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:35 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv6-0006A6-86
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id bh13so308005pgb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QgifQ8/UXpFYLo0AlrMI1Z36M4FSsNZYn7tIgKAL9c=;
 b=H5v4vilyka3BgkgIpqCJt4oYPazHXLTCnBhc1r7rxIGQ1hvKLQ6U7MRvc0RGWAwD4x
 yKR9MHm15AiGe1TramaB9qh915N0OmNgiv+7NPO+VEHK3TvQWo3HG6T11Mxgyn82nQRt
 X/5c24FLGA8bt1expR+onIaVkDcjFWQiuaVsMLGqlL7rpNq+5szEBz7Rh3QUhiIklFSf
 R0I/K9VRsMHUrO2Dq9saIMp3ss9h1d86GtRpUXJG+hoM0sgKFPnP3EC6euweQ7NTtAGa
 tq6U5yPI0K7cTubDL4JWcePnab2KnnFyxD3w1zEJfLTUiRntWoIbQyIOTMkWSpouuXo/
 joGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QgifQ8/UXpFYLo0AlrMI1Z36M4FSsNZYn7tIgKAL9c=;
 b=C9oSXv0m1UjPXKbmp9J7NljVt1oVcR1RoR0XEGUTQDkf0+0TnImTmvqbJ0IrifV3ib
 adeVSQ9pi0ntotew4xzLORCwfeTPWSPU5FBjYN4Q1sIl+AbNwjzryyNLri50U3y61LXo
 dGL8ot+whJN242WJk6McCYISKD125yAt3PDve0/UOPrsZP/1948ktzBhhlqo9xBlsPK5
 n8xXPR/SugnohuxXPT4EKYG9MfON7hecex5K2INMAV3FRyJTKeNrGXuTVer4bMfykwEe
 vlEKhiyFT8NqpfL4Cp1yv3GtZUEW3aWF2ckd/TSLP4HE/oSIQqeSzSrqKfHOzVM9YmSb
 BYBg==
X-Gm-Message-State: AJIora9wGksb4+tSuWAhUiuvYl/NggTZf3zl8X3LNQ0kQJM1EpGX4rI/
 e4VNWM4ptilDsvKZzx0ZB72mWqqHQJuaFMnZ
X-Google-Smtp-Source: AGRyM1tGyLMjGWLQuEmvqnBy/S+NYNqI1K7AQ8MfaB0Ppdz31CjRWCCpR8k1wdkR260vykCLa/JEnw==
X-Received: by 2002:a63:5366:0:b0:411:415a:5888 with SMTP id
 t38-20020a635366000000b00411415a5888mr19769917pgl.286.1656836730864; 
 Sun, 03 Jul 2022 01:25:30 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/62] target/arm: Add is_secure parameter to get_phys_addr_v6
Date: Sun,  3 Jul 2022 13:53:38 +0530
Message-Id: <20220703082419.770989-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Remove the use of regime_is_secure from get_phys_addr_v6.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1bef9c6c60..d424dec729 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -529,7 +529,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -552,8 +553,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -606,8 +606,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2505,7 +2504,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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


