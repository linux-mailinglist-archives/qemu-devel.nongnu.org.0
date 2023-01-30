Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03646681C02
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:00:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFt-0007s0-Fj; Mon, 30 Jan 2023 15:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFi-0007UP-Nz
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:48 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFf-0005Bt-9w
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:46 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 144so8751981pfv.11
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAq23tFP3V7GoWjZJ9sICzNMmPCjvQ4jyu54tebclPo=;
 b=qjQiZGB93/f0oBHU0w7HbzFnLfeIZcG+X+RObLIoh3CAPm8jFSc39N6utnjMKHWslO
 Pnhf4btS3E0jbc86VKqmKJLswQCXzrLOs68QZhqr5XmGwD6xB7gdYQ/N9GGMJuWloD9k
 EonqPWoXmJE2husTCDWHgiTqTPEqxekO5pdXLsQL+Eh1vK/J9LQqPjrVXkINuC31asJO
 Go2TCa2sqLj+jnIRkd+MH65eHXF7ufiXbaqjpg9dNyUZZdbRpLXgzrOh72BKtt7Q1N6K
 Oe2/TwncXCqBxMvDAx73oA6tkQ7d3VBwn+bDaSCxaoTOU9yLmmaPwyZXxJAC+hbfkT7Y
 WyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAq23tFP3V7GoWjZJ9sICzNMmPCjvQ4jyu54tebclPo=;
 b=uqxY/PB5TJ8UZmXmRt6GDYgedSX2FisqWG6rhl7qATcPodgocYmCjpFiRXRDDKU1Gx
 69N0qo+BaQS2b2rpi7I66wWeimU2j497f2qtRTwxfQ6EafFA9C/orgClFNgB8r7n9dCL
 9K/d2ujVqAZVSM4bv/BcBpVm23ZiTuwVDPOwaGAXkoB7MH+pdKORN2kL6/Mje2xljX0g
 lE9CLWYgTMXMFgZS13fENov0Q2pQnINfU/SCx4KRoYaSLSQ2ksvrOJF/5W5MFfdT4vsO
 1hBf2g5CMA2In+Hu+AzpdniUeFXL6ShwLu0xj9DB+lZTkpSZbwESyfkyOZQQl7DWs9Tp
 6WHA==
X-Gm-Message-State: AO0yUKWEmpUVsDIxdV4WAkv7SbD2LOLfCyb8OZ/DD48/kdpYh0ld9QzT
 FJx9jX1iPzLh6R0iZ8dSN5o3AmK5BWBrKl1m
X-Google-Smtp-Source: AK7set85pJziVDmPs9wNw8lH0fhSt6NqGdC+uf15uzTG5f0FAAE9di8a6UfEU2lfviZJxD6OgOCzvQ==
X-Received: by 2002:aa7:8493:0:b0:593:b538:760a with SMTP id
 u19-20020aa78493000000b00593b538760amr5341858pfn.5.1675112380636; 
 Mon, 30 Jan 2023 12:59:40 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-stable@nongnu.org,
 Sid Manning <sidneym@quicinc.com>
Subject: [PATCH] target/arm: Fix physical address resolution for Stage2
Date: Mon, 30 Jan 2023 10:59:08 -1000
Message-Id: <20230130205935.1157347-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Conversion to probe_access_full missed applying the page offset.

Cc: qemu-stable@nongnu.org
Reported-by: Sid Manning <sidneym@quicinc.com>
Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 57f3615a66..2b125fff44 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         if (unlikely(flags & TLB_INVALID_MASK)) {
             goto fail;
         }
-        ptw->out_phys = full->phys_addr;
+        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
-- 
2.34.1


