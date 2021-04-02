Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E33530DE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:46:44 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRcp-0006E9-N1
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYf-0000D8-Us
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYe-0007gG-9v
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:25 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h20so3029064plr.4
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=hLAgx1JVOhYAcJL9otyWbmwpWTmOyjSybBwxjW5y6nQJNKCYJEFEm4yPcTfRTdd8ch
 76w/7QBUQxbJLa/NbOAG4Lzq7UdeJ1yHFOCcAVANZx/IxUXx5p9m00yu5S1+LeqcvfT1
 LNzl+goP+LXE8QlqdjLnlbmh7f9lqnjm2HGwgxnB2CggfNamhp/UZ0lfJu+ixkiY3nfN
 qNWh2C6XfCJS5s4rtotaUIvKfaRpUigVs4xlZWAgxwV+U8TPjpGyh9CbWebluUfeQyTy
 dqBol5D/NhtnsIJL/BfK4KXYnsCKrexcK8MQAtKBPNOqjTiCGxXVk6EYWJFgm6TvN1fF
 Mnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=sXhHsj7nKanO9K3dXbixOISU7vD49YtyYCo/gLaB/xILfKysf5OVjdlGfyTDecULoD
 G8YzJb+ACEOHJW4QbNAJ8/YRW6gHm5OMZIjOLm+F2fT7UdIsZ6zNGvRN8tFnBWw6WGgE
 LSNB/QJW6DFH71XGra/cuZctf7pOEQeNJxntfKH06LCITgRAnht5/z/iUqiptznOLBBE
 SKhyElRFZXaSIzVx9lqtNAlA1sT5QcDGpaJ8IIftFADo31z7ySt4WXlIKQtrgBh6ivzB
 OElIot+G5Y7aTwNFVEjskTVZSI0xvMlNIR2yorhJjK8Xe3pZHiegDSuyc7bV/S2rwLgS
 RbEg==
X-Gm-Message-State: AOAM532rwoVaL33cPrpZRCjq5NnfxCMm2lyfwlOBa4pEaJBE3BFoP5Ws
 IAiPwTPF/bwGAeSvzNbP2QFYYyYOlIN4ng==
X-Google-Smtp-Source: ABdhPJwkSmgZpzR82SxsC1zrzJydItWP6Fn6ch9oV0ymybT/wzID6IdL5NKgttKev318kcCO0Lzq8g==
X-Received: by 2002:a17:90a:1f49:: with SMTP id
 y9mr16122803pjy.69.1617399742926; 
 Fri, 02 Apr 2021 14:42:22 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/11] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Fri,  2 Apr 2021 14:42:08 -0700
Message-Id: <20210402214217.422585-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can remove PAGE_WRITE when (internally) marking a page
read-only because it contains translated code.

This can be triggered by tests/tcg/aarch64/bti-2, after
having serviced SIGILL trampolines on the stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 0bbb9ec346..8be17e1b70 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -83,7 +83,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uint8_t *tags;
     uintptr_t index;
 
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
         /* SIGSEGV */
         arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
                          ptr_mmu_idx, false, ra);
-- 
2.25.1


