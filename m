Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA23D9AD5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:10:39 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uZK-0002dV-H1
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCu-0004s8-Sg
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:28 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCt-0002lj-8i
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id l19so7863016pjz.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y3htsNcibb//oyWFRZUVyTFga9lFXhlXlFLrBR2CCus=;
 b=Zu4UsFpfILhadI/wuDLmu2eXpNLBjG0K94eV3E2q5xGpblqAUG20kcl3Cm15JdOzxl
 wyaDCQ/+g4Xef3Ld36xEbYjI8BfxnuiY2ZpRHAkrFNsRsSzx8H/9P0UdAqQIpHCkLv8u
 gxapMLFSI9b0WnW55H+jnSIJNQLcENQzqfS2Y8UlWb76up4JHUkbVWXcMVm08Yr91mSh
 sLOFlgNZStXplLR3UCtl3WFv2Y8euoh94HnplSay3T7mg5ny8wdsQX0e3VaUNnfdEpmA
 M1+W/9xbVab/GjoAD+bMSdA1GNYHCO9AAnA6K+bMmEyCDiKYpP1A7V/O889Rs6FTFx7D
 WlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3htsNcibb//oyWFRZUVyTFga9lFXhlXlFLrBR2CCus=;
 b=etmR7PtPOaz16tNIwVl/pLU2OflP4+l8PrN2wTWNEL6iN0KCGsrLVzzEYBKV4/Fby6
 6L5G9dOkj1bBDOlcFXtgNY8G1hdat2W8qY1Mj4DDdGrkG8dMskMU1D2Jtp1Z35CcGcGI
 c65ZMsHnchnRFua9kt4fvVVNuPt49mORbgtiBeVDcWEZXqTbqm7e16abA+vYuSP86OAM
 S1WQK77WPguZ+IPn7trOouEJxJRvSPeGZBmi7te9bc/io+5TfAQE5CGVjBsxK6md5eUa
 mO6qKtNhcIzcXlP/XSuqsCEqRWnDSCn1JguF25yTBOYDC6eqJ9svZ11JAnBcLRGX0VxM
 V/7A==
X-Gm-Message-State: AOAM532FFSAQTGMxxvbBX7FsH2cR7pozStW21pT7SW0j8WUsT/HU+dM2
 SVLRmvMirxGktY6zZmTfE5uEeqzpgxgODA==
X-Google-Smtp-Source: ABdhPJzT+jVBuvGz+Y0wA5cc0vp04I+M+qvKrQphTC/i7gq3h9VjguyD+ETyQEp3VlkKxBMzNu2szQ==
X-Received: by 2002:a17:902:c402:b029:12b:54cf:c2ab with SMTP id
 k2-20020a170902c402b029012b54cfc2abmr2256502plk.56.1627519645997; 
 Wed, 28 Jul 2021 17:47:25 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 30/43] target/s390x: Use MO_128 for 16 byte atomics
Date: Wed, 28 Jul 2021 14:46:34 -1000
Message-Id: <20210729004647.282017-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-s390x@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index ec88f5dbb0..3782c1c098 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1810,7 +1810,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
     oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
     fail = !int128_eq(oldv, cmpv);
 
@@ -1939,7 +1939,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 cpu_stq_data_ra(env, a1 + 0, int128_gethi(nv), ra);
                 cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
             } else if (HAVE_CMPXCHG128) {
-                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
                 ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
                 cc = !int128_eq(ov, cv);
             } else {
-- 
2.25.1


