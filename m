Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78058441FE8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:20:21 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbuu-0000Mu-JQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9B-0007tr-TY
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:01 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:34328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb99-0001CN-K6
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:01 -0400
Received: by mail-qt1-x829.google.com with SMTP id v17so16553948qtp.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTKdaHiEpe60z+ThGKt8c3K8jQRQXSW+5obPKHUiPMs=;
 b=RwYtp+HJ0qo3kSBV6JhaZvb76eRw5Yq8Hkhu/Zpo0GcvsPan/2mj2+fDdL9EbDKbiW
 HgAset2upzR3bL52CHTmSyPs4iG/FBU+FbkqiKk5MnRVpw3lt7WfyVMtMq6v1Q//8Itt
 TnZoPfj/7spT0J1zRevlM0fm352gnjSLZgPW6oQSlj3vcLzngheGT2qlN7kp1sHNzB+k
 W8WH5Z3wotvPF8XLm+jZUax89aOYgwH/o5GLcS5bhrGSnhnFirfaCrHQeZ0Tuaf6tAaR
 /gdHHl4U9mkX9qozpDIXGjgqw5vyYHhq0fvULiOiFbF1XkI061gBZRAzQfTiGttqY7tt
 O98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTKdaHiEpe60z+ThGKt8c3K8jQRQXSW+5obPKHUiPMs=;
 b=kHS6kgXihJqVGzb0VT6ikaLkmPvuPmVpXTc4IWD7wToXrKePN/UVTpunKSGBdVKjdb
 F6dVqFaTsOxFQsGHuzcaYk8JL01JFxeH046vxM763DQi0vSCV5J0XPZPDyon6ic+3T0w
 AwO/n/rNGRs9IeFgfi4oopj/m/5W8/yaXUzBLcTNqWl9QYoEdmZ17TfoXI+kHB6CPIjM
 +y25yccunpP8e5NeKHHjFHwKzQp4f8/hKamTHMd9FRaBA3OfPBsisU/+vs3Na+Dt6Hgx
 aWCGSBE3SWGI5nmRDvrchHS27BBImGxQ+RduxZVz2XG4GJaABEFj6kspn5n702MAjubI
 9rQg==
X-Gm-Message-State: AOAM531k6TzJGMHspQyDX0+VxeLt3G2RqgaTXLzk+hQQQNAZQ07Douks
 Z7BcUVZtL5LTZ5cna0BNXF9uq3eUMf4LBw==
X-Google-Smtp-Source: ABdhPJwjrfHgPH+jmAUW3Wqmep4WCmLU0unWjH4nJbRIEuBmas9w2OPEz8B/e0f+dLeLWE3jOu2Cjg==
X-Received: by 2002:a05:622a:52:: with SMTP id
 y18mr18468744qtw.177.1635787858678; 
 Mon, 01 Nov 2021 10:30:58 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 47/60] target/microblaze: Do not set MO_ALIGN for user-only
Date: Mon,  1 Nov 2021 13:27:16 -0400
Message-Id: <20211101172729.23149-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel will fix up unaligned accesses, so emulate that
by allowing unaligned accesses to succeed.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 437bbed6d6..2561b904b9 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -722,6 +722,7 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
 }
 #endif
 
+#ifndef CONFIG_USER_ONLY
 static void record_unaligned_ess(DisasContext *dc, int rd,
                                  MemOp size, bool store)
 {
@@ -734,6 +735,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
     tcg_set_insn_start_param(dc->insn_start, 1, iflags);
 }
+#endif
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
@@ -755,12 +757,19 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, false);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
 
@@ -901,12 +910,19 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, true);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
 
-- 
2.25.1


