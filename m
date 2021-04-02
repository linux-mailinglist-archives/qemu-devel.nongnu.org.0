Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8A352DA6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:21:24 +0200 (CEST)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMXz-0002vT-Ob
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVQ-0000vC-CY
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:18:44 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVN-00035N-1Q
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:18:44 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so6368396pjb.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=l9y2N/FQMRgq1j+ah+xdquCl5SSxrHBiED0OUHza/FscU/Lp7cdzoLyMh73W+tzlDx
 mjD9L/l8cxDVuZiTEDoHux51ozT6oCdK8M4UZZVG8/GfQkteGDmfxDtIGfTh0s//Xj5e
 sEJBi8VJ1rbtBg3NkAM/yLYb74i2s5m0ZAaT7a/1PU1V/5Oscu1N2bTSHkobcvdUt2GZ
 VWU+fWQmtAwTXtvWTId2zfXPTJfivQNQsmppzqCAs5o0vKGgxhXtZSKui4AMVVCwVMOb
 +kSmlnGVLvoD0CWWo52c9ZuPhfV3W5qtlt9Dpkf3kUIN54ZqxZvwHLIHxONubLH5A+Xk
 tZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=k4WbTCaEGxo0n/P6R7kFsQXMY+XMwrnt9lTg6qOZEymRctDJVdBWIITh3n9gfli41c
 PCTcV3zkjKOswrLewMCloAk6HHAl4LoMr5dV+VwaClGEuQauVaDR+2ze+wlnvmdMNSAJ
 xWy1koCTpBXFlW+BX6TVSCJrH19xZHfy0unVegvvX8z8ABCZtZOdGl8ofm1KvB6gXX6S
 qZY5bWoML6M36i8K5ePXH1e4cqEjderYX9adHifjaB0G93+PKpTG6wxEXE/EmF7oB0tX
 kE3faCS6IEvJ264WocflqoGZYDlfGLQURmCQwpMMEoeQGk96BWcRZigiGh8Tr3RLZnQa
 wNwQ==
X-Gm-Message-State: AOAM5305BiUxXP/EYcE8+SebeTfOwIHmQVRUqz0zO+JT1gblZh6A6trq
 RhoaARxvSbl6o5SMXbl+exwtxhwBZ5Lghg==
X-Google-Smtp-Source: ABdhPJwEExtx5HQ6m5bTu8aX5ByMQ5KSQGjAY8m4qKYQ6iyfepHziEg80zTemt/ZPaldxDvREZlfYQ==
X-Received: by 2002:a17:90a:5910:: with SMTP id
 k16mr14965471pji.207.1617380318663; 
 Fri, 02 Apr 2021 09:18:38 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id m7sm8821761pjc.54.2021.04.02.09.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 09:18:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Fri,  2 Apr 2021 09:18:33 -0700
Message-Id: <20210402161835.286665-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402161835.286665-1-richard.henderson@linaro.org>
References: <20210402161835.286665-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


