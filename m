Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB25320B24
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:54:04 +0100 (CET)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq7W-0004Wt-NY
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqB-0006wB-Q3
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:07 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqA-000331-3a
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id m25so2579558wmi.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qiY3Lxu/BW+EniHEYptriDgJF2WkErM7WKpxb8HLVBM=;
 b=u/kcG6OkhUxDPYbhrrr8jPC3RTHtfxYoAFX1HKGBgTD9RdYWV6Gzq4/4Y+rWulk7Y0
 0VraqMS9p+DoOWSiKnP1+oZZISWSdD8XCIrC7hcruWofqYMKIsmPKV1e6gBIS9+XqQAI
 5iCVr0ZMzJe8KF8lc8NKc5+oZkzMCBrgBo9G7sEvjKr+8GGlmlgmTby8rhwmUucJaP7+
 UFRUQnWZELLAOfr9wMpoIawkhH33X0UszoZAuNSHdM+C5Y1mlVsis9Y26DbcDhFB7+uc
 xhzKlDnkVsgtbwOUOv1TV/+BgH9AXPN6ZJXzc9DScRBYYUSOBSyebZFVJjSYgkTYV8+R
 Aogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qiY3Lxu/BW+EniHEYptriDgJF2WkErM7WKpxb8HLVBM=;
 b=GBRYSkeyCAumkcpHytyVUFxn5HY4Yz2O25taNISo3avsCavql5j+Zbt1/nnjHZd4pb
 FqEmTOm3aoeHoQmYvzdeBhLQN/zWkEnLxULuGNst8Zd1B7iaYHnE+rVEOiZMMxwysKLO
 no1SsKerp6MlciRMApIVBvIeIAGG5nqRHn6esC+IoYSLFnd1jFLiX5BcZHY9uLE9POqc
 iYjeNTp2ceEWWmCDAybEC8unqv7TLjISO+GC9JEe/DrtJ4Y37Ykbf2W/+UZqbXbbcgA7
 /GQf9HjFvgOmsHblxUMzG24TZm7EK6Hpq7alUaAByGku2iXV9S/D4XS/Hx73fFWuyGEl
 7SGQ==
X-Gm-Message-State: AOAM532v+/uqZQP1sHES1Di6OWmVDdP15qIPsMfKsmGCtDSN5aLG4ziq
 l4/udLjw7gX/GECmTZ+QHpyxDz41gfo=
X-Google-Smtp-Source: ABdhPJxCZihkeyILZWEazvn7ExUU7qadoQ52NwqlPmMgSg01AsU3yp1Pe07R3stv9nkp+y+NVBC2vQ==
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr16382748wmq.92.1613918163586; 
 Sun, 21 Feb 2021 06:36:03 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a21sm25684358wmb.5.2021.02.21.06.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/43] target/mips: Let get_physical_address() take
 MMUAccessType argument
Date: Sun, 21 Feb 2021 15:34:07 +0100
Message-Id: <20210221143432.2468220-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-12-f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 0ad2d51b11c..f15cc48a062 100644
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


