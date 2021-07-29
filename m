Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F303D9A91
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:37 +0200 (CEST)
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uFv-0006uE-S7
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCM-0003sB-HC
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCK-0002LY-RI
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id q2so4834157plr.11
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WttpZGwoJ8C1HOXRuAuZ4Zlp1+wh9azqUEzkNumwXlQ=;
 b=d3SWz4x4xxsxPkh2QmaZSjXlWfoIA6EUNCgIf7bbnBS7mYbIG7Ut66lKcFUbdY7muz
 ZpsoaX9IVNncfYqUlgaFy1jRzRnpFbnft4glmr1JNbXxbJXJ+1NVGcMxrz+6lre2eZfD
 2bMiVGTHPDVt6Dr345AaGa+soevAKr42pOJpB7mc9KIZH9r3u432NZs6zkSiWWwzzxqy
 DN1Y6NZyjaeA5f08et2zmpemH1BLsT/543t1wwx3jwJCNs0oWzN4iEyw4qRvU6/qhQOm
 cyMBDR5IciJjAOAXEUVw2/T4n9DVya+iLi843T3MBKh/kzCONgmYfxQ9J84807y1UBcK
 tZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WttpZGwoJ8C1HOXRuAuZ4Zlp1+wh9azqUEzkNumwXlQ=;
 b=fn7EgIu9GcGQ814Qnfnbphi2ORk6B7kEdMf37oqDN8nTR1ab+FHfJ0cmPCdtpxtwq4
 d4e5RN3QoLzeGRc8xzpdpU3M0kzrGYcpKW10MUxqwF+J4a5IffLRLljk5ING0moaUWNJ
 BIIbZeC96/Z//CIFd92szoRRSFcgfNHOP/ZcETmF7mHwRAUU1e3a3kZKY7mb6fF3RodQ
 JLEs8W+FyMkgP1Gxn2bu1XyPVZGW5gHrQKc380o+fR3XALW2ZNXh1noWnxx4pgKHHrFs
 wCXn+Obz0np8+JeLbC8D6NSxnavUsJJ7Tn9QuoP/rxzyqMniuoZ7XqVXSn3q6/lRB8Xr
 qqmA==
X-Gm-Message-State: AOAM531y6rBe8x8lA/NF7Ug4bfaOnq17FhhF4gRLLOLIeEeRo2BHCE1Z
 4ph+FT4k9Sv6Bhnh0+7dzKK42T3lAs9ctA==
X-Google-Smtp-Source: ABdhPJzZK+aJfO55kxTWX0d+5F6aqrM2C71RLe3FR99kWwCNrURUmiv9koo6mmNEly6eBTmPDTYOFg==
X-Received: by 2002:a63:5064:: with SMTP id q36mr1476387pgl.196.1627519611590; 
 Wed, 28 Jul 2021 17:46:51 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/43] hw/core: Make do_unaligned_access available to
 user-only
Date: Wed, 28 Jul 2021 14:46:05 -1000
Message-Id: <20210729004647.282017-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

We shouldn't be ignoring SIGBUS for user-only.
Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index eab27d0c03..513d6bfe72 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -60,6 +60,13 @@ struct TCGCPUOps {
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
+    /**
+     * @do_unaligned_access: Callback for unaligned access handling
+     */
+    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr);
+
 #ifdef NEED_CPU_H
 #ifdef CONFIG_SOFTMMU
     /**
@@ -70,13 +77,6 @@ struct TCGCPUOps {
                                   unsigned size, MMUAccessType access_type,
                                   int mmu_idx, MemTxAttrs attrs,
                                   MemTxResult response, uintptr_t retaddr);
-    /**
-     * @do_unaligned_access: Callback for unaligned access handling
-     */
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
-
     /**
      * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
      */
-- 
2.25.1


