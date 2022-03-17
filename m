Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE394DBE04
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:15:16 +0100 (CET)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiTj-0006b9-MG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:15:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKm-00010i-1K
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:00 -0400
Received: from [2607:f8b0:4864:20::52d] (port=44576
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKk-0002Fg-GI
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:59 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c11so1809913pgu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zk2WWZW0S1igOGpBKjkWDy7mDtUeAKYWgc1671h+gmk=;
 b=lqlz3LFyWfyrmPTT9HVnrPtc0bl9bY8mn4ovC6q1AmyCjl3whMZd+i2fHsEnNPVolG
 6ahLbqDVS0CX5w50WADmV6hhLRgJYyeiR+6CCnqyIDSqfKl6YA7SxOmhnywoN99mFrt0
 bcwlzEXNNnINKI/jtcJtWuEadmDG5RIRXnSZ/FCrgDPhyRcoUa2BpmU+SEjS41Dwk+/z
 tkDleJWB1Hy34h9ZzQumhziKlBWPRoWyw8A2Q6blxi1VHMCr2U005X39qO3G6L1pXhDn
 VmpzI8arww/Hz4EJzFx5UjRkCi+aQ+xNcSuNIMaUt+BsNwRD5XNVgc6qidNZtjcKkA3d
 /Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zk2WWZW0S1igOGpBKjkWDy7mDtUeAKYWgc1671h+gmk=;
 b=22YKSMrrR0r3jVJVkUiGNct3bZxdVNArPIWCa4RMFxgveSIgt3GrgVdEzfMADqNb5s
 KkuYcXOYJ6sW5eVI+4fxq7+KBZYjUShC9gyQxYG6iBbzJOMFtIphWLJCNQ/2ln0E/Jwn
 v3eUtpqFKWr/AqX3CH2No8u7qLPewCqoteKFU7t/dnmYTB6cWvDeI5RJXE4Od1XqTqS1
 G/nHQ9XQzzv9cix6Vn/e8jZqd6yReerhgvBgDxVXtcSJKMEwfO10wdgokG0gU9WCVUiQ
 VDbP5A1nDHzR81eCLpSG82y5z8na1FK7+OoKyDm52loLI7Nc9RkgmfgdGSM5eF+FTBU4
 C6wg==
X-Gm-Message-State: AOAM531lGwsxumDmAM6M0D7YdVfihhyeyV/EN1ZwLI/TaneVb96wbw0D
 ru5/jMmpNxrgQdvsRq3djjZ8XK/1FKGz0w==
X-Google-Smtp-Source: ABdhPJwt5yghvfREArOwld5lUZeFbV0AztbCZp1j6exSgQbI2owlDip8zQ/bxlT271dEqN1sFpIzTA==
X-Received: by 2002:a63:8648:0:b0:37c:8fc8:ae4 with SMTP id
 x69-20020a638648000000b0037c8fc80ae4mr2289224pgd.482.1647493557181; 
 Wed, 16 Mar 2022 22:05:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 17/51] target/nios2: Rename CR_TLBMISC_WR to
 CR_TLBMISC_WE
Date: Wed, 16 Mar 2022 22:05:04 -0700
Message-Id: <20220317050538.924111-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WE is the architectural name of the field, not WR.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 2 +-
 target/nios2/helper.c | 4 ++--
 target/nios2/mmu.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 25b77916ca..81472be686 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -134,7 +134,7 @@ FIELD(CR_TLBACC, IG, 25, 7)
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
 #define   CR_TLBMISC_RD        (1 << 19)
-#define   CR_TLBMISC_WR        (1 << 18)
+#define   CR_TLBMISC_WE        (1 << 18)
 #define   CR_TLBMISC_PID_SHIFT 4
 #define   CR_TLBMISC_PID_MASK  (0x3FFF << CR_TLBMISC_PID_SHIFT)
 #define   CR_TLBMISC_DBL       (1 << 3)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index da3a289fc7..308d66ad93 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -89,7 +89,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                                                  cs->exception_index);
 
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
 
             env->regs[R_EA] = env->pc + 4;
             env->pc = cpu->fast_tlb_miss_addr;
@@ -124,7 +124,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                                              cs->exception_index);
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
 
         env->regs[R_EA] = env->pc + 4;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 826cd2afb4..0f33ea5e04 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -95,7 +95,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
                                  FIELD_EX32(v, CR_TLBACC, PFN));
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
-    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
+    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WE) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
@@ -133,7 +133,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
     trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
                                   (v & CR_TLBMISC_RD) ? 'R' : '.',
-                                  (v & CR_TLBMISC_WR) ? 'W' : '.',
+                                  (v & CR_TLBMISC_WE) ? 'W' : '.',
                                   (v & CR_TLBMISC_DBL) ? '2' : '.',
                                   (v & CR_TLBMISC_BAD) ? 'B' : '.',
                                   (v & CR_TLBMISC_PERM) ? 'P' : '.',
-- 
2.25.1


