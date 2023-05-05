Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439F6F8A4C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 22:42:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2Ec-0007tH-Ef; Fri, 05 May 2023 16:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2Ea-0007ss-Ei
 for qemu-devel@nongnu.org; Fri, 05 May 2023 16:40:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2EW-0000Ig-Nc
 for qemu-devel@nongnu.org; Fri, 05 May 2023 16:40:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30644c18072so1535973f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683319250; x=1685911250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=04PDWTiVcol9O/kAEE+WF1yegdYTPx6n2A8yUSecuKY=;
 b=puh/aw1vxxq2Y5ju1L4CcN4BL28vJw6P5h97TSUfSjUQmptCajxGFN8iMVFckAoZUU
 FGP4cSRT1Ch6RDO3TbNg2cYZK67tSI8ueNUCpc6hinU3X0wNuFLA4VXHUzW42UGFgebm
 c9Eev8Xo2RLH7jCiASxb7+NyBm5w1J2aw7mNH7F2DNLgIqGNJ2GZAagmZqAPhuIPyZSC
 XtZpmrFGXVfH5OqFJ+8omMzFDoa4Flhnoo+rf7W1ZcmvX0WgLTqXm5V6doEKXELmnCZH
 70t9S/FClNPCjPVtM3pwl7VAfm3BFFYWDkx/zymZa/YasvO7sP4JleX5TE0D++ISEf4W
 bgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683319250; x=1685911250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04PDWTiVcol9O/kAEE+WF1yegdYTPx6n2A8yUSecuKY=;
 b=H3FzewR+lS1hnkI+wBIULbyv1+BHaO76HLCMKMHRSxSTPSnHfX6F3xqqDNaDIaqNnz
 PehK3sRxKqon8HihZTIaNyokK8Ed71F/PFjREp3zGhNJfT+dBbncLvAMIZMoEK3XHIei
 MLRqoFH9mR4UAI5G818/nRSZ4wurhhKMTu3t7RZ0rzs7qnLJaPcjePw0hO2xon6XUFou
 nFJrvy8KYP8jvwxCMSDr+FBblSy/LLxC7FM8Gre/A6Np19IbF8VbEYV7GsoVWqppo2+g
 4OTJ+Hf5cs7iqbXIuTcOQwJM9U50PWsqJPiOt8ZMNf5bBSomSvTfC1xVLjfF7iuvUHDe
 dbhA==
X-Gm-Message-State: AC+VfDwrKVkmbMkvSiW3D6dbzeUvAUdLsP6LfwZOKES4nA3W/J3oOvjs
 wFebvkGJe7sLeO1NLKHloIq/74AZNUBCQwXxNjJjmQ==
X-Google-Smtp-Source: ACHHUZ5hf97T6sz/9DHjvgu3esUf8tUU2HWJgMAQ8CuMq+UVpHqgD57+H7FenJWmLl6ofCV4qvNCcQ==
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id
 k8-20020a056000004800b003077c2ddc79mr2185611wrx.16.1683319250603; 
 Fri, 05 May 2023 13:40:50 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 l11-20020adfe58b000000b002f22c44e974sm3319045wrm.102.2023.05.05.13.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 13:40:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] accel/tcg: Fix atomic_mmu_lookup for reads
Date: Fri,  5 May 2023 21:40:49 +0100
Message-Id: <20230505204049.352469-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A copy-paste bug had us looking at the victim cache for writes.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

To be inserted before patch 3 in 

https://lore.kernel.org/qemu-devel/45cba357-ba20-399a-27e6-5e99741179d0@linaro.org/T/#m5dc55cf04d564f4a8f97bc95e7f0e427c24a4f0b

r~

---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3117886af1..0b8a5f93d2 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1835,7 +1835,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!VICTIM_TLB_HIT(addr_read, addr)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_LOAD, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
-- 
2.34.1


