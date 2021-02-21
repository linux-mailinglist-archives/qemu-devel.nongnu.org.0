Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81C320B05
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:44:44 +0100 (CET)
Received: from localhost ([::1]:50324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpyV-0000nD-Mu
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppY-0006Vm-Pi
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppW-0002hv-JD
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id o82so11218964wme.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLacx+SK7+r33Ueo5eRwEHfvzZ5TV5s+TzirBVeah3g=;
 b=I3w6xQ6fuO8wapi1xn7mQon7PT0aGcEBLfng9EwF0voCP71mO3SF6r6h0zb+iuM37v
 PhkYp+0ZO0EXLq94mIg+kR1UJofoclEdbDoIb9A5GX+P5kZoAnDsjk2sCpJ1xeaFUzxD
 7WmAjmwZiCksyQYSg0PNaPxuYQo2PGdcGCX+i0bFgA34eHq/eFEFIZjyKuWvoPswyUBt
 UHyYY3CQM7nvhvfgwBOpF3r1Sod7Vlha8TT97/UfbpAYoaNN1YLweLN8X3woPZ2k1Fwc
 /okkHAkJUfEcX4TKiIYPgkl5NXD53BQNS/V/F6NOcG+x83Nxm13dphXg8LZd8ZbqoswI
 tgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mLacx+SK7+r33Ueo5eRwEHfvzZ5TV5s+TzirBVeah3g=;
 b=Gc9DX8SDtE6kg89MDHansyPryRal+F+yj5IeWTESpAxFYS5S1dK6a9k5iDcLMFgtUd
 jGiFrgNsxBl8tDWnkJNrjY8T59T0MFzb3adR+7gn01+WAUQAYWMK5ZhCDVZwsgFK33ir
 rDyeNT/LYtC/Zbm/KqV3/RpE2WHc4s9i3la0XDGUKHwN8WbUOe9DR378TK9+/BIx4Z3m
 EiGA4VnQU2xY+M5G7+NKTvSnA8+VWeuHaBVyz8cT5PQ9onynOLddB5NrHpVXnIibFEq4
 i+ipO2HLYCHISfaQyTt29chRa39D4buWXexMtQ5YDnG1ARt+iLe6kD9IKD6moJrgprlH
 scYQ==
X-Gm-Message-State: AOAM532VRGiJvvpwiSQe6hFLWjyg0Oe4pjLcZiZ4Q3bkxuozCfPH5yA6
 Q/bk6Uo85WMXZ3TYYyszG6PAAoHqzpA=
X-Google-Smtp-Source: ABdhPJz4Mo2dwogZ9FSgQ2qyZ99OW3pOczeN7XC7R+CgnVi1ZmfV8TsTUvbPCV/j+SCZ0NP68QYiVw==
X-Received: by 2002:a1c:25c2:: with SMTP id l185mr16140812wml.62.1613918124274; 
 Sun, 21 Feb 2021 06:35:24 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i7sm71893079wmq.2.2021.02.21.06.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/43] target/mips: Remove access_type argument from
 get_seg_physical_address
Date: Sun, 21 Feb 2021 15:33:59 +0100
Message-Id: <20210221143432.2468220-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

get_seg_physical_address() doesn't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-3-f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 1af2dc969d6..9906292440c 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -222,7 +222,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
 
 static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
                                     int *prot, target_ulong real_address,
-                                    int rw, int access_type, int mmu_idx,
+                                    int rw, int mmu_idx,
                                     unsigned int am, bool eu,
                                     target_ulong segmask,
                                     hwaddr physical_base)
@@ -253,7 +253,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
     hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
 
     return get_seg_physical_address(env, physical, prot, real_address, rw,
-                                    access_type, mmu_idx, am, eu, segmask,
+                                    mmu_idx, am, eu, segmask,
                                     pa & ~(hwaddr)segmask);
 }
 
@@ -349,7 +349,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
             /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
             if (env->CP0_Status & am_ksux[am]) {
                 ret = get_seg_physical_address(env, physical, prot,
-                                               real_address, rw, access_type,
+                                               real_address, rw,
                                                mmu_idx, am, false, env->PAMask,
                                                0);
             } else {
-- 
2.26.2


