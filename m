Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBF355AA0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:44:19 +0200 (CEST)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpkQ-0005sF-Ue
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgv-0001fe-H7
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgr-0006J2-0B
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id b17so7244791pgh.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=X/xm6Ep5i+3WG9oCNPKExXqJNHZTZUZo9HQfDwtMnsP5WgJECs90FR9/S1r5qNNJBa
 lkmwpACXwZHh9u+8vihMS+7CrVNHX/AaEwNjowi0Ka3K0N/8zEgF9JodWqRqp12KziSe
 rNF9gmmvvvSWjTRAedBDLLZWSDK3icm836KQLBYAYikdK55udG92S1zlmdF65mu1B2yB
 wdbIUNN+XzcErvMdKLLq0cKb5Q6z1Hx0SiK49Vd7p1Ne9hdAKkUMo/1rVotRYO04Emnt
 NdIfpdAFmR3JKsveCZJKfN1ZrbAqD0wDgNzRwWtZK28mxQ4AgH7i92yWpDXDXwMYc1BV
 P4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=EbmQLfehi78EnKp0QGf69eLEvthrs5ioGg3Qfa7bbMbHGEJEsW6dIi8VjZFdjneA+u
 jcWCekL1E1bTME9krQguIBiiuvg3zlVp3/4sdlmn+uHwEi6SbskPhKaP09K5RTmKVjkI
 nNZ3zoEGF2STuKF4LEYVxv7glHkZIUI2qAePRsVPwmTAWI2m8uhitA5NuzRkRBl0wKh+
 60tHdLyznatuBVuHl/bRqfh9ySElWyL810EdmK9fa37r8QDqvocmsNEobstHAhm7cZJG
 TSyM7qjrvd8Bn6pY6CL5KlB2LV3jQI+ePNa8sRuGL6fDf6VVeEazvFU9iEqAvY51v3V2
 eaKQ==
X-Gm-Message-State: AOAM531dUsAJxE2rcJLFJ1CMF9eqp9tOji+kOppEi2hxKu6W6sB5qsAs
 kpUX8RoCFY9KTlsCYfIGDmqUBZAupxTU6A==
X-Google-Smtp-Source: ABdhPJy6cxIBE/w8EOlYTmnkt8DIhs4rRwdHbGRXEgxiI7Z26x1RIkd7hKoZzUUOSYg0mBB8Zw9k6g==
X-Received: by 2002:a63:dc43:: with SMTP id f3mr20047475pgj.290.1617730835344; 
 Tue, 06 Apr 2021 10:40:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/12] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Tue,  6 Apr 2021 10:40:21 -0700
Message-Id: <20210406174031.64299-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


