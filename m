Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF1320B13
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:48:27 +0100 (CET)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq26-0004u4-KX
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppW-0006TC-RV
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:28 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppQ-0002fw-UV
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r3so4696592wro.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYl+8CWL6PT+OOiW+f+gON8b+09cumwTEA/5uUAsIxU=;
 b=WdFyiHnzJxqOVp4rUZfnxgMCUmW/T+ySyNeJrMCvta6p9P0D+4QeQEJKCg4J1febIM
 qE6tauzmbPIlCD6drJ5DbLyUN+ueqLKmqwtWNBGVmHWWvhWgvU/r+yEbNd5dIwxTsxNW
 NLjN5A+SGnPY305k4Np4xGlOGZRw4EZ47bQ06qnTwUVTzK5s26N8sP3Pt0uFjUnL87eH
 ng11Up23ttbetBsB2qJGsu7Q4IIu5ac7WMbwHBEA4TNX410CWo5X2DTJiHzi6Iug/qgG
 swVr4EFCLLPNh9RoIos3/aIm08t6u3dCr0CCbPnOtBED9W8NU0m+5t7AmBA4CfzG83L9
 aCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GYl+8CWL6PT+OOiW+f+gON8b+09cumwTEA/5uUAsIxU=;
 b=ubbq0jQy9biG8E7JOq0eJcjlLKoQKppOs/xFNwLU1c8DKF55dyaRqkgpwT5cVfT4Yo
 f1Z7H/XS1N3RDSH+ecFYBt7la37NRgZv0tL3xWXfyuQMwD/Hx7R8OQw0eCDOv/OPhVjy
 hH/M5RkW3biOizER03aJ7UGeJIsa4KynN2uYKKzX7/7SJ+pEEWnr7yackXrJHo0guVxL
 SGlzXhOZdjLDT288sxkvEpV9FqsmxxKa7DKmCsEQbxobSwm+CuC6eQZ9amykeDq3El8F
 Xtdy4qH0k30i5x8TnaqLEC19xoczXFALVyCTy0Wcldv9pNI4417BNuNfvgNnIYitZ3AR
 AmXQ==
X-Gm-Message-State: AOAM533HyrICWrLQ/CjpALPvsDr54OQQ20UQ1eFy+NtiNZD9Om1XHP3o
 d5M2st+A3Pp0mAsCF9DSH133RFXVGeM=
X-Google-Smtp-Source: ABdhPJy3hPOH9dJOsWTGepvFnIijzQYnbXIhmH/W3fsRxUGsTlPsgeZ1ybXJzE3WJhKpLU/7IMjqew==
X-Received: by 2002:adf:f6c3:: with SMTP id y3mr17723834wrp.24.1613918119427; 
 Sun, 21 Feb 2021 06:35:19 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r12sm14570843wrt.69.2021.02.21.06.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/43] target/mips: Remove access_type argument from
 map_address() handler
Date: Sun, 21 Feb 2021 15:33:58 +0100
Message-Id: <20210221143432.2468220-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

TLB map_address() handlers don't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-2-f4bug@amsat.org>
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


