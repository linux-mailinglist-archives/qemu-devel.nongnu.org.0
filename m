Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B6442D4C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:57:20 +0100 (CET)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsPn-0007BT-Ie
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhA-0001On-PU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:12 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh8-0001xf-Fi
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:12 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bm28so4109887qkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTKdaHiEpe60z+ThGKt8c3K8jQRQXSW+5obPKHUiPMs=;
 b=N8TzaLvvmIePLT2XYwIKRPe9+0MMbhaLgC53JeuVd4JhDZxAJKGV/XpwR0wXN7u2VG
 0vHglmEd20HGXzg7FDdY+xWtUS+7YCnLVV5D0p0ePpdcSLxbUGjyBDcnjEeSV2JaxZq0
 gykmz9rXmH+JqpxPE27wGXxEyUoneSRoZKEFHCNFOUFx2ew7RrOoFgnd7hy5cwXiK9vM
 xw429n1VXwEzkgW17qLpLKz7PgSqYbwaojRhFZ067e/+CX9ig02uerbxnH89U2UAEuKV
 5ekEytvQGP6GktlpnRgyt3ZyyW3t2RPC/LLK9+pdDuj+ys6ZqtDX8CQjqR42h0MTMN9I
 1UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTKdaHiEpe60z+ThGKt8c3K8jQRQXSW+5obPKHUiPMs=;
 b=7YByVAzegKcdtcuD9/3s0Qku8SYqFpeP8YgTZC2D4T+gmZCFXu5BLfWBaUBImwEXfg
 lkw/EhDCChSQdmCgfh3b1BxZ6K6H0dHnZXCJ9/MzWl/mCiS9yUZPeBZWYcHNOhAP50T9
 oUYy+I/ZJzWVH16mCAgu4keXDoMQFcTO/8fsvlGSo0uNu/VgNFec9I33UpJat1dEOSAg
 FzgTrsO9o/VMxQBymVdGu2tzrryyKJqmiHoh0Rp3rxebfgrJ76z91Unm1SwRryREM2XY
 M0wECxegtw0l1JHL0ZKwGVwTZDFQqabXO9KcKKmnF0796P/cuqPiOIV1onaWJWYiN0I7
 ujfA==
X-Gm-Message-State: AOAM531uEvo1yiVmANNm6ZFm8gwHNOqPlJovV7tQLggdLUH9YgI3sQ2Z
 5nyTyg7NLJQ2TikSrTpPY3Cnz193fco+Qg==
X-Google-Smtp-Source: ABdhPJxdukxnvHQfwXfmtBJqx+6CknhBBskNy1FTSHAX9QEuSz5TLXYsQIxMh5fD6sIxQmkalKy58A==
X-Received: by 2002:a05:620a:2950:: with SMTP id
 n16mr15421471qkp.405.1635851469541; 
 Tue, 02 Nov 2021 04:11:09 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/60] target/microblaze: Do not set MO_ALIGN for user-only
Date: Tue,  2 Nov 2021 07:07:27 -0400
Message-Id: <20211102110740.215699-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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


