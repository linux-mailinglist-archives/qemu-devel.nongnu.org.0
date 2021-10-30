Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F198440AA9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:39:08 +0200 (CEST)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsJv-0006Ba-7u
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryX-0002Ee-7Q
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:02 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryV-0000AJ-8J
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gn3so9425018pjb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fofFGJJJzbXM7L3Ibz3JhPAmpo8LElJ1YWB6iIwHWsU=;
 b=fm7voBt4LmR1MWoGh7sSn58zbwlF2SC5pppux4q31e1/8qO6MYm8s5PzzMFE3gkqvz
 JpnmG8HMRw60SDiZJEm9EdScJij5PvV9m0IsHl29uNCUVnii7g6eyi8StxY4+3N0azn8
 9CGQwegZFX5ECo8mTyKshzzCXnetZo9DKAFSpifaO/qYlNHy0h/4BZUeuM+rlaAhNR0w
 3l/tUbb6CN/bMUU478CxJ+MsN0O65cuyKbMFFY1Roegb2Wf8UyoVMtKzujtOdyDTe7U2
 Mh8MxtM9vHNJ3+ydHjzIQX/VKfioNuYXyavdtV1uZCbSYibIa7IF7prDJbULt9JDbdTV
 jXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fofFGJJJzbXM7L3Ibz3JhPAmpo8LElJ1YWB6iIwHWsU=;
 b=21gZgq2h1DwrzIwbcm2ZpFN9DUG2odIaZaAz4Ry1VF4py8jFF6kGhnEcNIVeI0bayO
 AlcJQaW/K7ckvROy4ocatinvqjPbO/oXTp7buI9hwGJweiVQBGToH7Zfc70tteqs5Hzb
 xsr2OrgFblvPZb0xKxKCOK+qLbVP12JszGtnjT1jEjLblHQHgctNzpXygucAad2Zev1c
 TG7OYi5JhTf7m46+BmBT/x0WHwdHFTEmfGDUfq4Uqmw8ytoYiS3IVuEqdDOG40/rGVHb
 kDEjqr0qdu3XmpGJyERAV1lXeMIJvsuSPFQW7zsaPQqVY4IFtDOLlcyO6Cy0Q4kn1Z+D
 /qbQ==
X-Gm-Message-State: AOAM533/RcKYZ5bLNd0+hkAWSdWTMRzdESoEVunAIkCS9XII598e/yQv
 wiqBVIjltJsohUiXMbpqzwoBRghulkqe2A==
X-Google-Smtp-Source: ABdhPJyPCqnXbcvT4LTlb5RbMTg1y3FWQpOGVZT2SMa+l5P19FpjnMX+BwgvnkXP6AsMH+GTGloXww==
X-Received: by 2002:a17:90b:fd3:: with SMTP id
 gd19mr2649234pjb.218.1635614217944; 
 Sat, 30 Oct 2021 10:16:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 22/66] target/arm: Use cpu_loop_exit_sigsegv for mte tag
 lookup
Date: Sat, 30 Oct 2021 10:15:51 -0700
Message-Id: <20211030171635.1689530-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 724175210b..e09b7e46a2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uintptr_t index;
 
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
+        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+                              !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
-- 
2.25.1


