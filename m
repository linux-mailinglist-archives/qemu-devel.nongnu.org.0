Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B203078CE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:56:51 +0100 (CET)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58j5-0003BX-0m
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58VF-0001H3-GN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:35 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58VD-0007X1-VW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:33 -0500
Received: by mail-ej1-x62a.google.com with SMTP id l9so8146110ejx.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8+6cLNWr/uAS+TNZ6Hbe5EtuSlUEfhm1Od8LZpx7QA=;
 b=Ez2jppMXKYC1Pm4NLSeqnCEK5zPShk7o/LP/y6I6Jtim2STIzSlmsb7YvMQfnttsfb
 jpMWPD1Y/Dv5g/lMuH8Izoq1ZLbXxZZSwRztmsdFKBZUO15evR3KuWfpVHpRasyE7Ne9
 DA/oXWFLQczXRqBJLJ1aDIXcpl14LpzOUIsQDaGHLqIdBmCMff+L7KRMi0Uq6uVyI9b3
 +wrp0O6ITJ0Y1k/06UnMgpljrbaW/5gUcMaaQlTqIhU3TDX8IO2Xj0t6UHG7TXtcPvI3
 XjcTcxKKltCze1IS0Tj/lyBTlIlH5CjGhJxVKQo/t947docoMRNLfR0Qu5/pIrl1Rnu2
 6+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M8+6cLNWr/uAS+TNZ6Hbe5EtuSlUEfhm1Od8LZpx7QA=;
 b=poEnMrP8cdwMCQBfxbRUovm3QoNDHCrXcNE7/a20Jpi5N3JIcV7NB2F0cTfacE+GIM
 heLn0mEaS6HdQ7qgTpDLeFysuyGiAzkXiV03NO3oJxJVSg9+sXzEZEJLFOGEimS8rk5N
 JcX1SAKd7I7zZ33b5cpnwpPNForFcuP3KVng5Xvp0aQ0vr6dQP5Yp262u24IGsHg3iab
 2xn2nkGhU32CI11RMshBS3K6pIQE6tf5tfAZw6Ml149TkP+EoBkSs6OlKBsvrzxQbH4B
 N6S19q69zDbMGuBJwp2ta30JwrAy2Qw+5k72fMcEEDxZ+ZMauHOUUcKW9z2KupOWFf1c
 Gglw==
X-Gm-Message-State: AOAM532aBGB38xDZpR0LsRYfKL2NDCnLQanZM2PrF20pgZBLKjWLE7fO
 9+lepWTNySO6nbb7DU+86yGm0cAzYxM=
X-Google-Smtp-Source: ABdhPJzB3atE4VDXUGrdYO2P/VxE34XduNNg15qvPzoCExAdpXqLlQzFuxpLgZRXuD4jxETYJWa7Xw==
X-Received: by 2002:a17:906:7f8e:: with SMTP id
 f14mr11046445ejr.198.1611844947767; 
 Thu, 28 Jan 2021 06:42:27 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g10sm2362757ejp.37.2021.01.28.06.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/13] target/mips: Let get_physical_address() take
 MMUAccessType argument
Date: Thu, 28 Jan 2021 15:41:23 +0100
Message-Id: <20210128144125.3696119-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these functions:
- mips_cpu_get_phys_page_debug()
- cpu_mips_translate_address()
- mips_cpu_tlb_fill()
- page_table_walk_refill()
- walk_directory()
call get_physical_address() passing a MMUAccessType type. Let the
prototype use it as argument, as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 21b7d38f11c..64e89591abc 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -259,7 +259,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
 
 static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
                                 int *prot, target_ulong real_address,
-                                int rw, int mmu_idx)
+                                MMUAccessType access_type, int mmu_idx)
 {
     /* User mode can only access useg/xuseg */
 #if defined(TARGET_MIPS64)
@@ -306,14 +306,14 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
             segctl = env->CP0_SegCtl2 >> 16;
         }
         ret = get_segctl_physical_address(env, physical, prot,
-                                          real_address, rw,
+                                          real_address, access_type,
                                           mmu_idx, segctl, 0x3FFFFFFF);
 #if defined(TARGET_MIPS64)
     } else if (address < 0x4000000000000000ULL) {
         /* xuseg */
         if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
             ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, rw);
+                                        real_address, access_type);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -322,7 +322,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
         if ((supervisor_mode || kernel_mode) &&
             SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
             ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, rw);
+                                        real_address, access_type);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -349,7 +349,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
             /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
             if (env->CP0_Status & am_ksux[am]) {
                 ret = get_seg_physical_address(env, physical, prot,
-                                               real_address, rw,
+                                               real_address, access_type,
                                                mmu_idx, am, false, env->PAMask,
                                                0);
             } else {
@@ -363,7 +363,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
         if (kernel_mode && KX &&
             address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
             ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, rw);
+                                        real_address, access_type);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -371,17 +371,17 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
     } else if (address < KSEG1_BASE) {
         /* kseg0 */
         ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          rw, mmu_idx,
+                                          access_type, mmu_idx,
                                           env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
     } else if (address < KSEG2_BASE) {
         /* kseg1 */
         ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          rw, mmu_idx,
+                                          access_type, mmu_idx,
                                           env->CP0_SegCtl1, 0x1FFFFFFF);
     } else if (address < KSEG3_BASE) {
         /* sseg (kseg2) */
         ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          rw, mmu_idx,
+                                          access_type, mmu_idx,
                                           env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
     } else {
         /*
@@ -389,7 +389,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
          * XXX: debug segment is not emulated
          */
         ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          rw, mmu_idx,
+                                          access_type, mmu_idx,
                                           env->CP0_SegCtl0, 0x1FFFFFFF);
     }
     return ret;
-- 
2.26.2


