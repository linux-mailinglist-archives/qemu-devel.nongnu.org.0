Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E430442D42
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:52:57 +0100 (CET)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsLY-0004Wo-Nb
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhB-0001Pp-33
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:13 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh9-0001yT-Km
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:12 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bk22so12489403qkb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=szYdm483ZYIEW9rjhhKgbOHvhrW8GatAFQojoPP/TJRC2xMCLCFHgWmnV32cyhbcg9
 Ru+Z+9L1w7i8J+RferrqXTmfeFXCIg2FnseFMKU26dJwAXKgDfKQ2FXk7Sx4R6/t4zQY
 YoHEpjs1Wl/q0d/Kbw3qoS+NZt1P+RW5lO8mDCEAQzASPbCpdQjqvsuF3SY4D7GWAXxG
 BDva/Jty/okIoVVZhZbdjlCGw+ZYLO2uPyz2bIQ188oDLM4UKAMkyG27ykkorxYaRkuR
 X5PNju9iXkhCGMuWyxxxmtcaz87KwEDi9KIvg1NqxFSZzf7wfL4KjLONUWydFJlBMCTe
 mRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=Kc/nrew/LhRIecfglLLsR08dmdndI2Q3urStZULVqfhlCPQPL54UPdduOM1W19rUBk
 l/bhe9FNmEQyVJMVE5WjrDOJCBMSvf2taGRGLOkoJvZXQjBGoKV2XeUeLFCZ2xk3ubIL
 85cOFmbvjlKKt/XRU4ZJOrHRhdpuBX901Rj35Z4eXjZKbBo6cWwCCQDY7oxwua4/jbTD
 slkSlr4LDC0p2adtpJthoeMcqbYD4owxX77Ly7EtvdgLWMIen3dcKANEZsyF2fqzFF35
 qraVfzeMK8bvwEbKttDEXxv4AHmJBNRPXwQ8hFWSJO7clHUwF2Ogai3hDlPjVk8A9R12
 BX9Q==
X-Gm-Message-State: AOAM531QN2Y43nCgivSS/JnRUY1tph/UBh3TP6NqAkmOQY7L4HdXibTJ
 Z7qE2mxB8QzkGF/0pTNqSbuwIfw6wDTaqw==
X-Google-Smtp-Source: ABdhPJwGWMwx4uEMmMe4xI35VJuKvVUh0iOMVdsx9PM2Ieciqnu7NTd4quAwzCMQs6ie8f1mhw21eA==
X-Received: by 2002:ae9:eb08:: with SMTP id b8mr1484019qkg.1.1635851470804;
 Tue, 02 Nov 2021 04:11:10 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/60] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Tue,  2 Nov 2021 07:07:29 -0400
Message-Id: <20211102110740.215699-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 88a8de4b80..e568a54536 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1465,6 +1465,20 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 {
     CPUPPCState *env = cs->env_ptr;
 
+    switch (env->mmu_model) {
+    case POWERPC_MMU_SOFT_4xx:
+    case POWERPC_MMU_SOFT_4xx_Z:
+        env->spr[SPR_40x_DEAR] = vaddr;
+        break;
+    case POWERPC_MMU_BOOKE:
+    case POWERPC_MMU_BOOKE206:
+        env->spr[SPR_BOOKE_DEAR] = vaddr;
+        break;
+    default:
+        env->spr[SPR_DAR] = vaddr;
+        break;
+    }
+
     cs->exception_index = POWERPC_EXCP_ALIGN;
     env->error_code = 0;
     cpu_loop_exit_restore(cs, retaddr);
-- 
2.25.1


