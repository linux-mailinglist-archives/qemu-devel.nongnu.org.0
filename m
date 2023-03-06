Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B36AC56F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrS-000449-H8; Mon, 06 Mar 2023 10:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrN-00041i-Un
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:45 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrM-00029G-9L
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so8471017wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kjhOQG1dHhfG5ep4fgX9p4eWjfIzvLEZJBm1JipGe8s=;
 b=OVck0MjtX2WWDnjkRgPx7z43pynLd8A6fdy/nhD2oNAvCtwR3JRm7O9QFKb8p4j0Xv
 RW5jC9QKV44aCy6BF52sSTzUjfSlNTgE0a38ohgF1v7fTS6wN4RxkOSFXvFObJX+l8dt
 eONzcxAnxLfod8vAoYpPqsOVO0x/URPVcDgsKsQU8l3c8yyMrnovlpOceua4HHra816T
 p/5wJ1PfcuOarzrrAlQMaxVK5OcjCmFUFLOjt0xQP8GCl1EFsCw0t94gqxIN6199Sk0a
 bWjXdMejY37156oQDeXL2xbaut+z4S9z02isn6uhfN4ND2vUNIjW6OqFtq9knGXdBsQQ
 BXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjhOQG1dHhfG5ep4fgX9p4eWjfIzvLEZJBm1JipGe8s=;
 b=Nf59WTzGZFMQYSPjPqJCGqSHKeno+FQcDWphnLIhyusoHfEB7o6Ngd4lnKtN3iMOZA
 R4zO1qGgyfCLYCBr0g545iKQSlgQK/8YjGgvmMSofwJQ8cGFkvuYohBtDi6C+RlMEK84
 VPjJYCDfl8HvN2q3VY7hr+IsOX55aDOvQKsWzmotwM5HJYTJA6qCk3LLmKKZ+izv1G34
 uMJgyeFZ1GuFDfCfR9mHyoalsTtO4kw02CyyBvMaOj/Fy7lCJsPuo3PczzZT0HVr6L9e
 jdrNsrsY7vaNLILIzbfUCFiN+M36NmufUG/fMkkh72hdVS3dKnc5psjCVu56xUMLjEFr
 EfuA==
X-Gm-Message-State: AO0yUKVSwQK5+8eM3YqpZKQObcd6OAL9cGdpB5zvJ0WpCZYNrvU25omK
 tV9Pjy4tTicfbXhSzp55tvjD8Cq2k72NJg1+QjY=
X-Google-Smtp-Source: AK7set8LG9gx0avPzFItyR6QJFfgX1wwVucnBvbsX9YNLFWJLGcZtyX0DZUCbC00GCTgygsYGOHGVQ==
X-Received: by 2002:a05:600c:3505:b0:3ea:f883:53ea with SMTP id
 h5-20020a05600c350500b003eaf88353eamr9042060wmq.7.1678116883013; 
 Mon, 06 Mar 2023 07:34:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
Date: Mon,  6 Mar 2023 15:34:21 +0000
Message-Id: <20230306153435.490894-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Define svep based on the size of the predicates,
not the primary vector registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 895e19f0845..d0e1305f6fc 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1


