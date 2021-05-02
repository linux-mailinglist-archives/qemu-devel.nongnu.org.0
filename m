Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC7370E0A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:45:47 +0200 (CEST)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFE2-000364-V4
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnJ-0006uI-1c
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnH-000816-GP
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id n84so1939459wma.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Q+raHQIs2wulUOjH/a7oHvrT+XycjGTmZz6SqSk5mc=;
 b=E2DF2nkUs6uteuMxtb98eFPf8P9erq8hWAQmMX2Tft7uDoPxF3TgbcIpnz3IoZnaPr
 NXDVHO98Nz5RGah9UGL4guTomUYTAi1F3Te5iX7xLbQFCtIeSTm++NIAobH6SnH813P6
 xv88bAd2jKP7SBtYhZB/Tum9pLefmI/xKt/wMFfqPwGttyRcsOUpiP/2QkLxWppXhIm+
 SFnYm9qt6Gn8rQoUU7Ju++qr9uMcasn+aLMdFL4HTPxoShQ7QVfLIJoUl53eo35jRZuB
 0jiBmgi/JbdAu+pgJVcPNpzpcs95Q6RNt6L8X66YEAaqZdqaYJYbmz0GZC3jiwjCiSc7
 CW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8Q+raHQIs2wulUOjH/a7oHvrT+XycjGTmZz6SqSk5mc=;
 b=Hy/Wnu6aOriH3K5cUOPFYEBfrpczBIeYNYF4DGHa+al7aUVbtTSjhxpNCy6hbcHX4P
 h+x/49f/xRepsdokCIHXfvhnnapDAO5PSSJPWiuMhyGCWcdt3o8DPLWOOg8KsUftM1jw
 cuk971RuiMFCyxQwESoA/Vfl0dZNv2SwNvqwqKYfzbKkqFmTNkHpd/Gjwc0Q1hlzdeR+
 xJCL26qp+wekE5rQG9yRYfrRPN0ow3BcKWPZ4JE9qGkMODVGYuq7WJNl04n1Ah1cDz2Y
 MyYFeLj9tF++e+T6gKk6JbRrNpbhPIiiDY44sFIQzcXv7yWeCA1vG2pplx2fasPYS2uG
 Ny+Q==
X-Gm-Message-State: AOAM530b5OZpUnXWR2I/ReQP5IOsgk94R9e1Jyt+m/HqT7bxl9d3F6QZ
 gdi0mRz55EsPP+EWYopzlathUtCbR68vR+4E
X-Google-Smtp-Source: ABdhPJyllZyy74XvsUEauqP0ikYhe1w/hstBcKQW8Be4dITfAgbMLpBhqSdlHHeoePQkh5QN9qwWGw==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr17257677wmq.50.1619972285754; 
 Sun, 02 May 2021 09:18:05 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v15sm12080084wmj.39.2021.05.02.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/36] target/mips: Restrict CPUMIPSTLBContext::map_address()
 handlers scope
Date: Sun,  2 May 2021 18:15:30 +0200
Message-Id: <20210502161538.534038-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 3 map_address() handlers are local to tlb_helper.c,
no need to have their prototype declared publically.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-23-f4bug@amsat.org>
---
 target/mips/internal.h              |  6 ------
 target/mips/tcg/sysemu/tlb_helper.c | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 558cdca4e84..c1751700731 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -152,12 +152,6 @@ struct CPUMIPSTLBContext {
     } mmu;
 };
 
-int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, MMUAccessType access_type);
-int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, MMUAccessType access_type);
-int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, MMUAccessType access_type);
 void r4k_helper_tlbwi(CPUMIPSState *env);
 void r4k_helper_tlbwr(CPUMIPSState *env);
 void r4k_helper_tlbp(CPUMIPSState *env);
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index bf242f5e65a..a45146a2b21 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -26,8 +26,8 @@
 #include "hw/mips/cpudevs.h"
 
 /* no MMU emulation */
-int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, MMUAccessType access_type)
+static int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                              target_ulong address, MMUAccessType access_type)
 {
     *physical = address;
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -35,8 +35,9 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* fixed mapping MMU emulation */
-int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, MMUAccessType access_type)
+static int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical,
+                                 int *prot, target_ulong address,
+                                 MMUAccessType access_type)
 {
     if (address <= (int32_t)0x7FFFFFFFUL) {
         if (!(env->CP0_Status & (1 << CP0St_ERL))) {
@@ -55,8 +56,8 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* MIPS32/MIPS64 R4000-style MMU emulation */
-int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, MMUAccessType access_type)
+static int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                           target_ulong address, MMUAccessType access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     uint32_t MMID = env->CP0_MemoryMapID;
-- 
2.26.3


