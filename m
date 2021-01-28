Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A2307878
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:45:57 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58YW-0004IP-3s
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UY-0000WJ-VO
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:50 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UV-0007Hg-6l
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:50 -0500
Received: by mail-ed1-x531.google.com with SMTP id s11so6882516edd.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFGwwR/4NSh0QtY/SzSQl7FxOSMKZM6tQtbM7nkbMcg=;
 b=cXhKKg6xPaGb6ovWbCxn+FyPIAOuYN9c85+TIxoyIW91BWrIK47ulNT3AU/kFPwtbu
 0lhBKL32Xf8yYuWnL4P2t7vUQ1n17mSH4SLbpbVLwaO7PGchDLKCth0AQlNBW0c10KEg
 lNmvjya8ONmm3KffX2iZND6TV2uC5CD3Y2Bw9HBhKz7L+sJCBQqIsAnE0Mz/CUDnAehJ
 IO3UKIhW51/l5ueIt3IBi6k0/G9pRoNlAhLEKdi8anyl8TghGbiTDMNOAIoHh1QKPY31
 ++EkfNtpQC7ncbreFfUTO/DSHRVPaUYE9BVEbmS6cz+ULsMRxo92S56TRw3+NUqogfmi
 Wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iFGwwR/4NSh0QtY/SzSQl7FxOSMKZM6tQtbM7nkbMcg=;
 b=aCFNpMPjOSufnS+891wGrmIVCxlF0CuuIQq9OAPs4sgimb1dWVLWUSvubF7/L9xH0v
 v1YyktI6aUfgCHBLF8MJafJNmHi2LA73TQjQA3FGQLoD0jxl/XC4ogmNysRRBd1gaNAL
 5fCxTuzmz2m08psR9kxjESbYd+g9PCy9S3mv7bpJOCVEAoayOA5EqakfrLFqnqLrrnPW
 2gmFPHX+7XveAYZcn1ogOkObT+KQJivDkf+vD7evtZMHeVpcaNhV09few4Z67eb9kHtG
 P44Wobd/Hq8FFinU8CvhSC2V0mijpM23uDt2UC5mpBh6rdFQLKG7qt8Z9+ekPnDrZ9YJ
 c+jQ==
X-Gm-Message-State: AOAM532kwZnEEnmUKaV5l5QSWnDc3IW1ByTc7nb/uNaJyGObA1p+KXah
 PahCW6fTesK3XQ1AUXbLopf1TTxIT5k=
X-Google-Smtp-Source: ABdhPJy39/k6Ufoi6RsleopAbSRzIp96i1oV+DIK2U/bngLd2qBu5kod9npJ9zWNsF9XvDYMgnjGKA==
X-Received: by 2002:aa7:db4e:: with SMTP id n14mr14386597edt.101.1611844903589; 
 Thu, 28 Jan 2021 06:41:43 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm3121997edy.57.2021.01.28.06.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/13] target/mips: Remove access_type arg from
 get_segctl_physical_address()
Date: Thu, 28 Jan 2021 15:41:15 +0100
Message-Id: <20210128144125.3696119-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
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

get_segctl_physical_address() doesn't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 9906292440c..d89ad87cb9d 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -245,7 +245,7 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
 
 static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
                                        int *prot, target_ulong real_address,
-                                       int rw, int access_type, int mmu_idx,
+                                       int rw, int mmu_idx,
                                        uint16_t segctl, target_ulong segmask)
 {
     unsigned int am = (segctl & CP0SC_AM_MASK) >> CP0SC_AM;
@@ -306,7 +306,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
             segctl = env->CP0_SegCtl2 >> 16;
         }
         ret = get_segctl_physical_address(env, physical, prot,
-                                          real_address, rw, access_type,
+                                          real_address, rw,
                                           mmu_idx, segctl, 0x3FFFFFFF);
 #if defined(TARGET_MIPS64)
     } else if (address < 0x4000000000000000ULL) {
@@ -370,26 +370,26 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
 #endif
     } else if (address < KSEG1_BASE) {
         /* kseg0 */
-        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
-                                          access_type, mmu_idx,
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          rw, mmu_idx,
                                           env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
     } else if (address < KSEG2_BASE) {
         /* kseg1 */
-        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
-                                          access_type, mmu_idx,
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          rw, mmu_idx,
                                           env->CP0_SegCtl1, 0x1FFFFFFF);
     } else if (address < KSEG3_BASE) {
         /* sseg (kseg2) */
-        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
-                                          access_type, mmu_idx,
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          rw, mmu_idx,
                                           env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
     } else {
         /*
          * kseg3
          * XXX: debug segment is not emulated
          */
-        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
-                                          access_type, mmu_idx,
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          rw, mmu_idx,
                                           env->CP0_SegCtl0, 0x1FFFFFFF);
     }
     return ret;
-- 
2.26.2


