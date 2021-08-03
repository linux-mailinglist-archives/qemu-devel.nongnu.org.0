Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93583DE556
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:29:10 +0200 (CEST)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm3B-0000MB-S8
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpr-0003mD-0N
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:23 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpp-0002Q9-HB
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so1787596pjz.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
 b=IVuOGlvJMF0mPQoCf3eQ5wFizSGb315LeI8tj8BpSKMXbt+V3jNayWYYC3eAiWnQm1
 csx9tAEuNUNrtEz//UoTuELo/TNRDOz7FmbVOxoIYDNDPhzIcE3JU6cvuMipMGhDb71Y
 9F8eGDhrsWgkmvuE2R8joOyr9TSfEH1qzwQNefNcsmV6k+o9yD5F9JUSvxnN6rsDtn/c
 f4DgMKq9KM94CPQokR/XZCJrqKWX0Gqz5jBy0rMVYyX2od7hz4mPjextDlI4LyCkueFo
 DllymuBuhQPKusIJM4+ZFspsRrVMg7fxSvvownmRZ+nmgzdqcgCPjB6MhmCUykpc4mQR
 awrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m05buOlilVsg1jOgQZXZCdgZzJEMTUJnbRDwgrpDcZU=;
 b=rzNs7khPzbvYzW8E8vlz/icahwSvFDlU0c/mmPJ+Xfs3NNtEDC33Rtb109/Qil0HD3
 d+iFPw/sjhLaFPyzQJcO61wvtEm60x7OF9Zwm0h7M6fScAmfh12ld9RgQ8QKM6PrYO+w
 IU6hZnH875K6IpxXRcw6+L1VuxXUZSn4dKLuHuyLC/s13GJRoUpbab3/ycv+g2qOzJE1
 K+8e3USMd0Z/nqR2GPIJZYvoygUjvQqNwDiDZ1G/6BVT7z1Hr2upuJyJlRjdLor2eZL1
 r3VVI6rilUXSKQ0QYN4r3IsDVlPAP//PxinX55q0xjWUVTtgwObGN2tf6wopTXNp37pw
 flnA==
X-Gm-Message-State: AOAM532fVrzMOulKFc4tUw936h9YiwOEaNBO05okQtqt0Vz7BYQM9le0
 pl39xMiMwv4qazRGPmssaQ0Uqbd8UKHYNg==
X-Google-Smtp-Source: ABdhPJzUistIG1UjT+NCxnxJk/50b8k7ZErBoHmmA2a/XFdwK4xjls8z33Y4UvBVyblBrDCcjDKaOw==
X-Received: by 2002:a63:682:: with SMTP id 124mr51040pgg.299.1627964119740;
 Mon, 02 Aug 2021 21:15:19 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/55] target/arm: Use MO_128 for 16 byte atomics
Date: Mon,  2 Aug 2021 18:14:17 -1000
Message-Id: <20210803041443.55452-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 13d1e3f808..f06399f351 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -560,7 +560,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
     newv = int128_make128(new_lo, new_hi);
@@ -630,7 +630,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
 
     /*
      * High and low need to be switched here because this is not actually a
@@ -656,7 +656,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
     newv = int128_make128(new_lo, new_hi);
@@ -677,7 +677,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
     newv = int128_make128(new_lo, new_hi);
-- 
2.25.1


