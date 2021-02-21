Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A88320B03
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:43:08 +0100 (CET)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpwx-0006Ty-OQ
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppc-0006Wx-AY
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:33 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppa-0002jS-Sx
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:32 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u14so16354086wri.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQxDBZO7sFXhWDGEGkug3RCjC8QMl+zjRYDt8T67Y9E=;
 b=gAvmYfI8awH4B02RRSR0SsXo58Kz77aeS/NbXj9BSbFTt3+8AQsS2P8MP+jYUou8eB
 LqLE1731G+QvU2+EmZdlz4Umbfmo1vkbMy6lHsSlR9nbYpjAnOtgwFA8MR98CZpwtxmu
 J5Es6R3wLTLVtPwDVlQ4QwhhLFkzkbEdu3rG5WQ8sbSVoSWZpH3MBTeC7Hxrn5gJ64M2
 AErjkWlUKc45KtbEKLlwLbinaGfa8INZ9H01+cTGuHMws1guAYLBzB2By8Q6s7q5qckq
 x3Eh3XNWykuGokyZ0FBE77yAmriABlqSD+ekIPNJo8iu3uDZdbMYYoHDcmUyZeD185+I
 iEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PQxDBZO7sFXhWDGEGkug3RCjC8QMl+zjRYDt8T67Y9E=;
 b=jWFlkv2e1zvduKadrMMGzJD56ykmxV0fFihFK7WnW0CnLHvm0z08Cbb2ZBduJJrzpl
 2oCm44mPje95V6BI54t+fUYZ+x2ECkr9asIf8OdrvmwHA5AJK11TmPtKnucj/tT2wRP0
 tAVJLHDue15IvSmDS/tUhNTF83wL2RSWFWVwv7NbEukl+hFcpKOwFUykFOIzN0RuctSL
 fQsPU3dVG/uEt0xEr1N7rK7ZRXYFmtaW6nBMBLMX2Rj/6+bQCp4uBEU/xfYW5N59VtkW
 1/74Vo6VMFGBGEMpwNJmWa2+qh9dltyTdnaF95BoJsfJZOinI7PtFD4K5lt0G3JjdDyr
 H5pg==
X-Gm-Message-State: AOAM532KZwxRzyYJ35cyl/1DOAg6VZNiwRB4IOmkuQ7wBany1grHojSZ
 Ol+FPM5mwHfuYTYVvEl0BjQYPMpMeF0=
X-Google-Smtp-Source: ABdhPJxfPIk+bnQPMdiYgV01q6uTtkB8gpU/Aq9m9BsBPKuVEZHWZeKDC/97vKP1dA+848l1NaPIBw==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr17839526wry.356.1613918129347; 
 Sun, 21 Feb 2021 06:35:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v10sm19179559wrq.22.2021.02.21.06.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/43] target/mips: Remove access_type arg from
 get_segctl_physical_address()
Date: Sun, 21 Feb 2021 15:34:00 +0100
Message-Id: <20210221143432.2468220-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

get_segctl_physical_address() doesn't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-4-f4bug@amsat.org>
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


