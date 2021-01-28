Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A550307882
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:48:07 +0100 (CET)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58ac-0007sd-8c
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58VI-0001Hm-8G
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:36 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58VG-0007YC-Pc
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:36 -0500
Received: by mail-ej1-x62a.google.com with SMTP id hs11so8150046ejc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+FuDmEP89SHTv5edxuWj6VZ9o05Wz8zJTpkyRmkCaQ=;
 b=nWDU2OueGlOy4nc0xCzxgLcBMSydNZLQdd9WW6t2e7ggHlzAI7ljpafcbhHu+yT3+a
 YErFgP7vIxj87QefKu9Dek0B6sX5YC8IK26FC802jm6BNVG6tkU4mQxTAoNrYbcJ80aL
 36J9BerM8zor+XZQxMkLKSG9wPYih3kRHVjdH16DQl6LmVfiG02Wr1fQXYivLkSo33h0
 bhnJhMH4DCTAb0JDi0pHAR/tkwSc/YkhplqjUnX46DpL0+GpP/Bq2rcDcFXhLuqpxPbZ
 2eLcLkFGiKkWf+BdIW9ClMnd4RiztIVPB5JSAVHCUAqQ8Ccjt2tzqdv9tPOWHcr+RpDk
 161g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r+FuDmEP89SHTv5edxuWj6VZ9o05Wz8zJTpkyRmkCaQ=;
 b=RtN3gv/CgF1RU/2Yx6DrxShWLk38WWVLuBCdyuEoNajucTO1VpTUSvI7Q6kw0CGRJb
 B8ciuLrF+qe+KRECnemjoo0fWULAH3hq8kk9M9vRP1TTnpMH0ZxQV4siPd04AhNMnVfk
 0ITJ9mLbiXspjJBBX431S4whYYZwblyUGF9PF0004VJtjhkAgFoPZD4oDhO20fI2e3J9
 gY0fDevPf7aGhDE5OXdoC9wqiFEyxvBVcUYfT++CzYODx0EvcwMI7SaRET2ImB3SJ5+O
 GYxAcX128wGMDOyeVwEQIy5UXwkY2N8dSb/eypovPw29SPLE3dkih4MeBGK5GA8e6iPT
 qtiQ==
X-Gm-Message-State: AOAM530eE1RQYeV9tgC4LtowVI5jy1bAbyP9CJgnkXyU+gDoBSq61VQG
 mOoO3iabFPG60HmQRzCYbBLe6b+ntpA=
X-Google-Smtp-Source: ABdhPJz4sMZwa6P4bJFeAjbVzfraEnl/UdmYDFXY3INEH7FKZxP3oh3Uv3L7fOEJziEX4xDEqO6Lng==
X-Received: by 2002:a17:906:f0c3:: with SMTP id
 dk3mr11189773ejb.540.1611844953105; 
 Thu, 28 Jan 2021 06:42:33 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x6sm2360798ejw.69.2021.01.28.06.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/13] target/mips: Let get_seg*_physical_address() take
 MMUAccessType arg
Date: Thu, 28 Jan 2021 15:41:24 +0100
Message-Id: <20210128144125.3696119-13-f4bug@amsat.org>
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

get_physical_address() calls get_seg_physical_address() and
get_segctl_physical_address() passing a MMUAccessType type.
Let the prototypes use it as argument, as it is stricter than
an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 64e89591abc..14f5b1a0a9c 100644
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


