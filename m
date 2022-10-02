Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5B5F2451
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:41:24 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2xv-00053v-Ht
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nQ-0005Sc-EL
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nO-0006BH-Ta
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:32 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z20so1371019plb.10
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LEJVqUhskGeG1MhK0CsszCgPcQtH98gJ6ePcJwlk5nI=;
 b=hKE4l0sJZz6bYHI/i6Knryi1tN7ogOk8v7KTDoT/fXQF6wJT+H8+rZW3lTABjkzZ/S
 nWDfzsYO/iPbpg4w68bvadMIdkmRvL6hmXpJL9v0X1GS+S9eh39Ykhsbk0uf7AjG8MgY
 e20wQ9dbfue194RXIaLlwgsUJPSABvjZTr5KkoQpmAFItyJ+7hSLEDXL9jcdVHLhUi7k
 s+vL0hqLsxE5LL+oTKy5p0L/hr5aqOm2ZscfMRNWpAewgpZkXl9TtQtHTTPaZMeW4D+N
 lqfnmQrZN3eilUxP2xxDjgVogRR+k+b6e9pM2HQAXy/7bNFchB3TxjTfNxbb3CEWK9kD
 q2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LEJVqUhskGeG1MhK0CsszCgPcQtH98gJ6ePcJwlk5nI=;
 b=EiuwJRXUEj3oJAjJMm9vQPKZ4dXWiFLgKoMQ0d1ytupnDH8jVkXZ0q4Q60/bF8FXtR
 hDtEz60N1JYfaTO9YMfK+KgSOgw10nazr6dOaQ5bvBB7PCFKs8KOfZRG8fhESKGeOG59
 56M5GYO2sBXWx8dYLPY7Sd+u+8hxe5DZqyKCG1J1SNn1nevEWtT6/kwoViXMUbuLXuHO
 gqv68ORQ0zE3JcKes5iuNv9A/pj7yzehAM7/ajSR6g+LO9nAxbRKuDaxbSRWOHNxRMbi
 brixxt3KCB7ocW5wO9zbFwEpy2PJnV+Qni0zBCPX+/Gh5WO/XNHOWfnHocJU8btzknVm
 dvWQ==
X-Gm-Message-State: ACrzQf2psC76SfgOeR3Vg2gWi10Q3YICRGVG1gwkgoUKfClcBmUgrEfi
 BoCH9lJN19BxY7rUMf3Pdj0AJNOT5ke5Bg==
X-Google-Smtp-Source: AMsMyM4w8QPLe1UipWTPOkXignppZhXEM2GrKtbyc3OaEJpAxTvsa7BR74Rg037iTyko0mhgwUzhjg==
X-Received: by 2002:a17:902:db0a:b0:178:32b9:6f51 with SMTP id
 m10-20020a170902db0a00b0017832b96f51mr18270766plx.145.1664731829294; 
 Sun, 02 Oct 2022 10:30:29 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 2/9] target/i386: Direct call get_hphys from mmu_translate
Date: Sun,  2 Oct 2022 10:29:49 -0700
Message-Id: <20221002172956.265735-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a boolean to control the call to get_hphys instead
of passing a null function pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index eee59aa977..c9f6afba29 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -24,14 +24,10 @@
 
 #define PG_ERROR_OK (-1)
 
-typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-				int *prot);
-
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
-	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
+	(use_stage2 ? get_hphys(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, hwaddr addr,
-                         MMUTranslateFunc get_hphys_func,
+static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
                          uint64_t cr3, MMUAccessType access_type,
                          int mmu_idx, int pg_mode,
                          hwaddr *xlat, int *page_size, int *prot)
@@ -329,7 +325,7 @@ hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
         return gphys;
     }
 
-    exit_info_1 = mmu_translate(cs, gphys, NULL, env->nested_cr3,
+    exit_info_1 = mmu_translate(cs, gphys, false, env->nested_cr3,
                                access_type, MMU_USER_IDX, env->nested_pg_mode,
                                &hphys, &page_size, &next_prot);
     if (exit_info_1 == PG_ERROR_OK) {
@@ -395,7 +391,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
             }
         }
 
-        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], access_type,
+        error_code = mmu_translate(cs, addr, true, env->cr[3], access_type,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
-- 
2.34.1


