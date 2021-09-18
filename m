Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF941083A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:58:20 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfXX-0008E7-68
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLj-0005Ea-23
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLQ-0006t2-Pz
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:02 -0400
Received: by mail-pl1-x635.google.com with SMTP id n2so5777437plk.12
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DnPKZsYD4ZUYg+zokoIL0aqocBtGju8WD3IhYIaHRac=;
 b=yffMT/ZjFLfxgTY1cEQIo4KJSWtd8EXUzQkcHY5f071b97Hp70o8Ut8zWqC4KtrAMQ
 lnUsWQY6BkhgEClDKTjvMbMKD2opAQ5GsSBoXKHFzYMImNlcx1wO2WmT/fYCrtVFPZ80
 0mfcVj/gOwXEQMSEplXa+2lzneBQN+Xp7f+sMibz9gprwv+Okhs7ermzjOao0eae5RH7
 bpxzX9LbmsxkhMBSkr9LSflIbpQNPLtj2cmxr+ithqaJPl5cZAndQfQP2HipAi6sFmXk
 U9zuEtlWdu3aVpp6w0Nu4HWGGsnIJZnjSYZrTTJaNxh1ZwD4LJylnr9YgbYUKGUJRsg1
 KD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnPKZsYD4ZUYg+zokoIL0aqocBtGju8WD3IhYIaHRac=;
 b=AOhreCzuHnccS/34nzdqPe3LGnVN1s2iwhpAY2fJV79XGXK58mMmNmC3TKDmI+Unda
 cZuhy9timjxIpCgNxWgkmNzTztbToWTy5F6KhNCNw/09eDclP/Nk+34GMMMcr7kwv2zb
 bOJdUFQiNa/zIAfmlf2JSj0+PzIg5qbov5QibdHv3uq7JnityGAX1I0YTnnKtsB3svVU
 GAIuPoKk4DVLzyysj0CHuB58xPsyltzbvkhHBCPjUyu7smX0007JrYD6zOixrWmB09i3
 Elz0ztXIJRPOeqvukKBptYInN+6TtxKV+0Idqcigu7fz4Qfe4n5lihTSYI/QXKHNDyPG
 B45A==
X-Gm-Message-State: AOAM531Mh4Vrt3VUMOjHnXK3R6HxVHusFxZTOEztGf5b5mZSbzauW+1G
 bcyD9NVLp9l3BCqeZ/yPA3zt4N6Wcb78oA==
X-Google-Smtp-Source: ABdhPJzg5CIDogyNIg4nWBK+GxE4T2575hXJZkvcd4Appp0P6hR1K1Rh2Bhhg/uTCpfRpv36JKQuFw==
X-Received: by 2002:a17:902:9a06:b0:13c:86d8:ce0b with SMTP id
 v6-20020a1709029a0600b0013c86d8ce0bmr15339135plp.51.1631990747074; 
 Sat, 18 Sep 2021 11:45:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/41] target/arm: Use raise_sigsegv for mte tag lookup
Date: Sat, 18 Sep 2021 11:45:08 -0700
Message-Id: <20210918184527.408540-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 724175210b..2575e65860 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uintptr_t index;
 
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
+        raise_sigsegv(env_cpu(env), ptr, ptr_access,
+                      !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
-- 
2.25.1


