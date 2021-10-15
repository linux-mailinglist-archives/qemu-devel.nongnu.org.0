Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0D42E7E1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:29:27 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEqU-0003qs-Pd
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYw-0007HY-UT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:19 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYt-0000Kq-2z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:18 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v8so3157928pfu.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDo26nxZuCe6knbSSj4pxxnp0xROgd5wgByOtwEaQmw=;
 b=SUyDN/bfj0pqlmb4veDFS7djOwRGHBtR8olsDB7rbMU9HqnIaNvkuCOH2u+Bg77bML
 NpXcn9smrHVUR3O/lG6oCWaiN4/XfH+wiNyxttxthkCuuaKE4dfLJEemRbw0XCLfmTYu
 pn2ODCUAqMZ3N3jZLVP8sRpii8uYMuL0JDCEONcQolzf0WptIX1o8nWV26pWhSLbnq8p
 J8hTjb87HrVA1vkBGtRsftOaBl9U8o6EoflgSRiYXjTLUVqWcY6GCSE11wdM8bDZkJUl
 zU6kb6e4+7yOgIy9+2siq9U30ySKrB5HgriUdnBIfQX8e/GBVjEFuW6BbcX5n3EU/obd
 Csow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDo26nxZuCe6knbSSj4pxxnp0xROgd5wgByOtwEaQmw=;
 b=W0b8GJYyyRs1ZZ7hDe3dSGdRVorINJ8gJKcNNiNNtPX4OVRrcSMRPKNHVx4x0FYHIL
 0Z087h4nYLm0qrhXstSQpspg5FUpxjbEK3fNvmxLADFZR1zt3Z4O0n5KjRtQHKQVLuzw
 f9WKHkN2/XVsc0z58DOsmoIQnbgcNGD6lzRhbXTAsQBZA9W2lQLTS2By9zJyN0G0WSMI
 S79rS8ln2cmP8ihRpyeXp0o7gbTbQtwNPSsuNb6sMXj4nXsxmyl48+ReE+kxnY3a1jVC
 4vn6Ss20dYS7zVO1/BGWAK0s3m48OSRBMg06gOJ6PCZkpXi2quWaL6BpIjzR1QGnJERu
 OdGg==
X-Gm-Message-State: AOAM532RpKQwrEu+/2cEsqMxp2cVKZziOWveuZ/veMlKQbsf+I+/XfeG
 ofjVNFu4m5STnsJncAL0cvFni/28Ljg=
X-Google-Smtp-Source: ABdhPJwoJKTjMk+tU3sWsMBavZDmilq/W1HrOF+gpbYjo96csj4Wcch/2cb8Xx4TpMJHPUe+PZ6Jzg==
X-Received: by 2002:a63:b204:: with SMTP id x4mr7163143pge.212.1634271073744; 
 Thu, 14 Oct 2021 21:11:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/67] target/arm: Use cpu_loop_exit_sigsegv for mte tag
 lookup
Date: Thu, 14 Oct 2021 21:10:08 -0700
Message-Id: <20211015041053.2769193-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

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


