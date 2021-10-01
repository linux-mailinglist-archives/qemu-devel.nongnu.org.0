Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6D41F32E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:35:08 +0200 (CEST)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMR9-0000Wu-1f
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM53-00050T-Fr
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:17 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:46631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4z-00059s-R4
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:17 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id gs10so5960158qvb.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4orM2+k/w36SObBWIcKDbAPe9+W3VGWuqCQu4MwkhQ=;
 b=ISZSPyoqnInbLT4amaVBpq1c+UCl2x2aHxa++rXoEoRooNJOAaPMYFigVc8giI18Rl
 +MICo0zWP41vRJ6GPpiiuMx2C1XJP1ZAJn/myacVu3hWRcXVkDG+rL0/b5uAFIPqk7M9
 yYwnXVBQwcDz6Rf6HmeFV4UhwepWeB9tYWJ2Hp+Yv3UBtkNYx4Pj8qgY6N+uheCC2Y98
 shcPrUfEeNcRAlbbCEIlILGHHOawXp7h1TOEmt8wwtAAWv7ufe5nYoaPL4+wYFfcURYQ
 GVKkCFiwzJ8U0KzlnISobug6mUTvgkK09uYlQmMgi6i0Lw8c2kQ8igCw/nf5p5bMlv7F
 G1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4orM2+k/w36SObBWIcKDbAPe9+W3VGWuqCQu4MwkhQ=;
 b=lJZt4gBV/+EG7SYPga4VbvmfbXERykMd6DCZd4kiAxD6SRTFbGVNieUUI9uqlH/TKs
 kJETS7CA/7SwAQFU5bIb7N7Cb1Kx4oOnf+BwzWnXjV37cj0c4jYjgPQBShQ/WtuEaFLB
 rTNB/rHa18fWt3i3SlzKexxNktY7/H3vWxM0W4hAspYz2dsbe5hkLB+rBXRk2An7SJnF
 tl0fGTVJQ7fwvvGRbnWol5IGabAnaKrvDSwZ11X97kH1b399piLitpuOJ/yql4iPI347
 nVjBYN1dBB+qpe/dMWN6/Y8pjV82xPn3PRlOVkWA3VkLXIFph5A2vh15tVHgAvJwGVOV
 m1mA==
X-Gm-Message-State: AOAM531oqTcwCXLh0MZbqBxlkXV3FIGFOeNPRT2MhslBCnwJW+1DbWpW
 HEyKxX5RJLoaf9DxSfm8agG56roG0aMDKw==
X-Google-Smtp-Source: ABdhPJzgDAPmr4/NQkUgUDSfIOeHT8dLwbQU/XbKEBsGvMvutXGTX4Bfvay437jQ7o2Y5aVzqjd+fg==
X-Received: by 2002:ad4:5643:: with SMTP id bl3mr10198290qvb.54.1633108332577; 
 Fri, 01 Oct 2021 10:12:12 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/41] target/arm: Use cpu_loop_exit_segv for mte tag lookup
Date: Fri,  1 Oct 2021 13:11:32 -0400
Message-Id: <20211001171151.1739472-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 724175210b..1500a498b0 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uintptr_t index;
 
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
+        cpu_loop_exit_segv(env_cpu(env), ptr, ptr_access,
+                           !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
-- 
2.25.1


