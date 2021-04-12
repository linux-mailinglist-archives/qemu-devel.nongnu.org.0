Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA3435C424
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:37:50 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtwz-0003Nb-CU
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrN-0006dh-4X
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:32:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrK-0000Gs-0U
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:32:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p6so5638878wrn.9
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MjfoM0Tks4eQc7j9h/yQNaMry9uJE+PRMj4/Mx8eY0c=;
 b=d8qwOd2E11UeRyOfUjp+TYmZSWJu0RjP8b2Wpl+cWC1+NOM+FrnEz+kmySLUPIZobz
 NGvxXtZM2RRHj/V0ueNt7JfwNOvpwD5nvlbmEowB/0hXDhrc4p8TFob8EjHqOjqBB3xg
 kjthSK5ZzSD5ux/SHkd/ib3h+z5fNiBsPvApcVv1knKVFCIQPwyiFjMD523KLAwSyuHx
 oKsTI4380ntufhDwwzSqSYbWAgD+fxHgIFyUEwtIPcO9wxxoGcdsvGm2y5zia0KTfohP
 K+BD9E4ia352q8Yn0ieCZbmlhO9l2OllOAQHUY7RAzqwyumk4QEqZUV1ozXCtET09jTE
 hspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MjfoM0Tks4eQc7j9h/yQNaMry9uJE+PRMj4/Mx8eY0c=;
 b=kuYMFKnjTpZC5O1pECGuVD2nbbazp+596zspAfW9M21g3/QQUQ3bEAOSRxlAwmbAew
 hmyf6NkpHuo/dMh5mBUSvmfr8bZQjPhUnDndJ97xINOSzjeaTIEk9Qs8YUSHtAmwtBSe
 VLOv/+BptCwxgufMdqj0NNFddCY5zJoZleu1BWtzFVdbsnqKGhN/woJk/Wu+ZO1/D7uc
 CmDJKvBj0Ua34Ra7aOBCvEn7EwkyJuxA4xZVXQdmVI3CCPEyr3yvhoqR9JTuXB9iIwmm
 2pdXFTqaevRGpWblFGN2r5AXfFiXsv70Sl3/MW7bxlzICaWZr9z6QLbCFtSsqyU81wy2
 L9Sg==
X-Gm-Message-State: AOAM532jtIouA6Fl0ydzGZVe9H/+SjBV+KywcPBQeI5FpCbjEb6156EP
 Ah8msUDd6117e0ro9ji3trygZ4EKwWoaDSVk
X-Google-Smtp-Source: ABdhPJzyR2XI/qpQv5/r7/6Imrm3KdKPhPukAxEaaiNIZqe9Ua0Fx8yqlysmkoA4XCiXJTyY7s7cHA==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr30606885wro.257.1618223516396; 
 Mon, 12 Apr 2021 03:31:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d2sm16878651wrq.26.2021.04.12.03.31.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 03:31:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Mon, 12 Apr 2021 11:31:51 +0100
Message-Id: <20210412103152.28433-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412103152.28433-1-peter.maydell@linaro.org>
References: <20210412103152.28433-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We can remove PAGE_WRITE when (internally) marking a page
read-only because it contains translated code.

This can be triggered by tests/tcg/aarch64/bti-2, after
having serviced SIGILL trampolines on the stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 0bbb9ec3463..8be17e1b707 100644
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
2.20.1


