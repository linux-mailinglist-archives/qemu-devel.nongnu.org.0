Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF943307867
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:43:57 +0100 (CET)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58Wa-0002BZ-T1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UK-0000FQ-BN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:36 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UI-0007EB-LE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:36 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so8079304ejf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86OADgMFXt0pB/TlfGwIBGmGBnkvqEMtjUaTaDnwVlY=;
 b=oLLDc7M6icxr13m0gYrMy1nltEQwWM4JUpSl59sTm0xPhjeAf7EXSugASPscbmbl7M
 iG75PKnetq7wVkVkmC0+mAG8M36LJco5KBP4taAJO/uhA2b6atL8VAZHpzY8+muHUhMb
 OGmVYFioVG8nbIufiUZkdtPAY166cj7S8ZB73j1rgnpe4RwKkRyEXA1LxIhk51Ftb9Q4
 7Hng42B1uRtX4Wm55HpTcmKFx1r58p0dG33zjG3ExmGNL+rqkuCixDHUyA3iFABkEENM
 C4gvvSjVl+w8UQunZ5eRDZqevxAblJmqBD7Fs/o2jLHlnVsrPuNlvuynUasC2E8UQTZv
 AvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=86OADgMFXt0pB/TlfGwIBGmGBnkvqEMtjUaTaDnwVlY=;
 b=Y7EzBYl/aIYWKVkTvNOwrSLOt1R2Sl3ntaexfTzztaJ51BRXNaRxUnQHioOfDlwrY2
 3jdyNjPWuDhVxGdXc6L0DKYU3YnZEIdACpr7vdU49nuqDkrB+l6iikaxt8Jrk8s8bX9f
 GgSm0r23+25SaPDRfbY+Rk7gS+8VrPhqCUcUCI1otQ1PphclvowaAUqkPynMd3otXTK6
 +Y2pc2+u9LJ1v+jf+RAfeOs78XYQqivULpv6qxawocGCZ9sWM7QHlhwN7Wvlz2ufEQYN
 NgyPb1wMsu0I5k9e6o0V68ftik+b2TCOoZs2O7R8dcoXkZ8H6qkiLF6eOejCHBMu56bV
 bdbA==
X-Gm-Message-State: AOAM533NWcECZw0XKLoJTgHX4B3yHyUASEa7o+5GPWJ+6+xJMA593rZ6
 mR0nv8TDMWTF4fKfWP0Ajbz071nTnFE=
X-Google-Smtp-Source: ABdhPJy/pTuc5ihnU07OF1u/Do51RCBCS04xNyJdMT4Xf56dRhA2y/youL/dv195bBR6CDElIjO7tg==
X-Received: by 2002:a17:906:c7d2:: with SMTP id
 dc18mr11109931ejb.149.1611844893061; 
 Thu, 28 Jan 2021 06:41:33 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v25sm3136321edx.49.2021.01.28.06.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] target/mips: Remove access_type argument from
 map_address() handler
Date: Thu, 28 Jan 2021 15:41:13 +0100
Message-Id: <20210128144125.3696119-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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

TLB map_address() handlers don't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   |  8 ++++----
 target/mips/tlb_helper.c | 15 +++++++--------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 5dd17ff7333..d09afded5ea 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -111,7 +111,7 @@ struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
     int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, int rw, int access_type);
+                       target_ulong address, int rw);
     void (*helper_tlbwi)(struct CPUMIPSState *env);
     void (*helper_tlbwr)(struct CPUMIPSState *env);
     void (*helper_tlbp)(struct CPUMIPSState *env);
@@ -126,11 +126,11 @@ struct CPUMIPSTLBContext {
 };
 
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, int rw, int access_type);
+                       target_ulong address, int rw);
 int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, int rw, int access_type);
+                          target_ulong address, int rw);
 int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, int rw, int access_type);
+                    target_ulong address, int rw);
 void r4k_helper_tlbwi(CPUMIPSState *env);
 void r4k_helper_tlbwr(CPUMIPSState *env);
 void r4k_helper_tlbp(CPUMIPSState *env);
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 082c17928d3..1af2dc969d6 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -39,7 +39,7 @@ enum {
 
 /* no MMU emulation */
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, int rw, int access_type)
+                       target_ulong address, int rw)
 {
     *physical = address;
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -48,7 +48,7 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 
 /* fixed mapping MMU emulation */
 int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, int rw, int access_type)
+                          target_ulong address, int rw)
 {
     if (address <= (int32_t)0x7FFFFFFFUL) {
         if (!(env->CP0_Status & (1 << CP0St_ERL))) {
@@ -68,7 +68,7 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 
 /* MIPS32/MIPS64 R4000-style MMU emulation */
 int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, int rw, int access_type)
+                    target_ulong address, int rw)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     uint32_t MMID = env->CP0_MemoryMapID;
@@ -234,8 +234,7 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
         return mapped;
     } else if (mapped) {
         /* The segment is TLB mapped */
-        return env->tlb->map_address(env, physical, prot, real_address, rw,
-                                     access_type);
+        return env->tlb->map_address(env, physical, prot, real_address, rw);
     } else {
         /* The segment is unmapped */
         *physical = physical_base | (real_address & segmask);
@@ -314,7 +313,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
         /* xuseg */
         if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
             ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, rw, access_type);
+                                        real_address, rw);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -323,7 +322,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
         if ((supervisor_mode || kernel_mode) &&
             SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
             ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, rw, access_type);
+                                        real_address, rw);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -364,7 +363,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
         if (kernel_mode && KX &&
             address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
             ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, rw, access_type);
+                                        real_address, rw);
         } else {
             ret = TLBRET_BADADDR;
         }
-- 
2.26.2


