Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A1320B29
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:56:51 +0100 (CET)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqAD-0008Ko-W5
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqF-00073i-KO
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:11 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqE-00034x-2y
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a132so11245054wmc.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfNdRFst6LfLn0VNAb4bbFY7EBizJDIkL87O+WLW55E=;
 b=YGx1C8/Lgapx6r+HfbjwLjKjnunq1C8sJnKv23a/u4LgnsqNPsqCO+y0kCjL/ZvkcV
 1FWiblsbq1eRp042IJ2g+9LBciVH1QupZvYU9Xgkcx91zMWwbGOfV3BH76+UmeYBWVm7
 L8JHgPqK5r3wC7+TSBuy9oc7us2cNLCQzLvqfrbczV1Rp2FBDs58bW1hOtHBZGaXXGrb
 5LUV3LHe3qeFJyEVvLbrDyIHtUaVFxg6dGBbusC3+5baSbhGc9LHI47BSqRu7/zuev8z
 zIhhb4MbmCH5L3R3dOi4jVU+nNoVtT6UCmjuB5T7nFSfArYCsJ+1TsxfB4x6dS0+yu63
 QqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wfNdRFst6LfLn0VNAb4bbFY7EBizJDIkL87O+WLW55E=;
 b=RABP4XcQrcCbKKF0LqNWO2wzXb6labeFwOIln0TG/9AWzIAm+vpgkEjJiEny2MMN+0
 WLv4zmNN3L7+gnVq25ZcQr3IZmYjEeR/muA8ziHsIwv3OWU3l7UkGrweWv9yHh4vAIOl
 hSH3LfvEf9w0yqOkjxpujz8RnAnOu//tcJD8PPKwJA1UeMMhDfVPel7UpFiisvp98KMh
 XBE1dbHnhyrWIqtH86grFcnHoKVgBs2DVVo1xjtkY3/aEBdvC/w3xoATVL3b+kXT600u
 wUzzuy2lEIZ28OZXE5BvMXrdTGDPFJLK5Hus4erjnskosD5L9Y7ncPAof3Z9NpMPLz/m
 NVGQ==
X-Gm-Message-State: AOAM530KncfKwzskP/U7r/rEkqLLMWFaW+mWX8OYEl0GoUG9I5h9qHgp
 /3pclsnZ856PFmBt8gzAsX+L0Ds/ZuQ=
X-Google-Smtp-Source: ABdhPJxxcilPx80bgWpMFNgWWdKQx05Oy036cMxEsnAeg2jynAzK7FFxmGorOR7ILMQ58CuSFtTNIg==
X-Received: by 2002:a1c:4386:: with SMTP id
 q128mr16402247wma.184.1613918168555; 
 Sun, 21 Feb 2021 06:36:08 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s11sm21388671wme.22.2021.02.21.06.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/43] target/mips: Let get_seg*_physical_address() take
 MMUAccessType arg
Date: Sun, 21 Feb 2021 15:34:08 +0100
Message-Id: <20210221143432.2468220-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

get_physical_address() calls get_seg_physical_address() and
get_segctl_physical_address() passing a MMUAccessType type.
Let the prototypes use it as argument, as it is stricter than
an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-13-f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index f15cc48a062..4db8a7582d4 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -222,7 +222,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
 
 static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
                                     int *prot, target_ulong real_address,
-                                    int rw, int mmu_idx,
+                                    MMUAccessType access_type, int mmu_idx,
                                     unsigned int am, bool eu,
                                     target_ulong segmask,
                                     hwaddr physical_base)
@@ -234,7 +234,8 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
         return mapped;
     } else if (mapped) {
         /* The segment is TLB mapped */
-        return env->tlb->map_address(env, physical, prot, real_address, rw);
+        return env->tlb->map_address(env, physical, prot, real_address,
+                                     access_type);
     } else {
         /* The segment is unmapped */
         *physical = physical_base | (real_address & segmask);
@@ -245,15 +246,15 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
 
 static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
                                        int *prot, target_ulong real_address,
-                                       int rw, int mmu_idx,
+                                       MMUAccessType access_type, int mmu_idx,
                                        uint16_t segctl, target_ulong segmask)
 {
     unsigned int am = (segctl & CP0SC_AM_MASK) >> CP0SC_AM;
     bool eu = (segctl >> CP0SC_EU) & 1;
     hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
 
-    return get_seg_physical_address(env, physical, prot, real_address, rw,
-                                    mmu_idx, am, eu, segmask,
+    return get_seg_physical_address(env, physical, prot, real_address,
+                                    access_type, mmu_idx, am, eu, segmask,
                                     pa & ~(hwaddr)segmask);
 }
 
-- 
2.26.2


