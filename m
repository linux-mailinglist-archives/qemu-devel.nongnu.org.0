Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D8678DE7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gY-0008NU-Nl; Mon, 23 Jan 2023 21:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gV-0008Mx-V2
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:15 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gU-0003mC-5N
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:15 -0500
Received: by mail-pl1-x634.google.com with SMTP id d3so13324236plr.10
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9vjpxFE1AEIlgkthxEfz8zh3TVx+kl7oOc+q8wWGhQ=;
 b=CRIAj2FyiN/mdJPd0XgC9uAKSugvVSw3c/p6X7+jOGRJeypSCtTwv102R/pRFRjdUO
 46fdVIVZDLaPlShg1zdNwBsOZ5cwCoTw8uDdiKhkfQ7EL+ofShGl61q4v99cKD+Q27YI
 SrYxMZTaaSfW0NVtH5SIG5u9+wpi34TiQmgAXYzV/g69Ag+ViYUll3Q1fW+/c+smokpu
 B/3o4qTjOhAqHVtDwLp87Up4aXWTTtPJjpe5q3Au8gFF530mz2b3kuHvjBOfT6RJsDtg
 lHGXUapyhp6TDBpHiuRCye5Y8/UzeZ8Ecii9rviuzEnb+dkhi3SDj0EX045AXSoO0vhJ
 GPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9vjpxFE1AEIlgkthxEfz8zh3TVx+kl7oOc+q8wWGhQ=;
 b=IKs4bRXCMArV3Z9LBZ39rp/6tcSXn4UnafPKk8psDmReL1HYJHCFIWBuA4zp48U9Hh
 sOzvxw2eOPanUrWoHDkVdVxvvCAg5+m7pcEzT0tUkLMaofU6U3m7RLblSLscLzy3RIO7
 ocwEJYrQNJnYnxRkCevbZ4dzGp1McSUOYIbOEZccfT/NUZ7pbH07VMRVp5LmnGFRxPl0
 Y/DzMhQgQyQDoPGXxlCpkernzx7gorhhb8KDt4wA6Zm07HxWOGZWbf8AaDr9atWA8XVr
 Ya2UG0fuIQQ20mcpsB7iA3fDgiAYGIvSHjFqjnzH5txjM9UsA+n4h4obTpnbJ0kVipDc
 6uug==
X-Gm-Message-State: AFqh2krHQtmFISMzP2qMY+cDpxnlSJpvPMmLP0sgKtA33d3hESbjq1hB
 qtcWGj34CU8kopeV2QY0la8kyVxRm67ALV6L
X-Google-Smtp-Source: AMrXdXtmK6BgDkWd7QY97ndptLfMvqsXXNeJaHkYL4RWe3iSE2P5Eme6zu3gU8BpzHa2WOzhoUfK2Q==
X-Received: by 2002:a05:6a21:910a:b0:b9:46a1:7f14 with SMTP id
 tn10-20020a056a21910a00b000b946a17f14mr15480317pzb.56.1674525912397; 
 Mon, 23 Jan 2023 18:05:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 01/15] tcg: Avoid recursion in tcg_gen_mulu2_i32
Date: Mon, 23 Jan 2023 16:04:53 -1000
Message-Id: <20230124020507.3732200-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have a test for one of TCG_TARGET_HAS_mulu2_i32 or
TCG_TARGET_HAS_muluh_i32 being defined, but the test
became non-functional when we changed to always define
all of these macros.

Replace this with a build-time test in tcg_gen_mulu2_i32.

Fixes: 25c4d9cc845 ("tcg: Always define all of the TCGOpcode enum members.")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1435
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 7 -------
 tcg/tcg-op.c      | 4 +++-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6f497172f8..9a0ae7d20b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -155,13 +155,6 @@ typedef uint64_t TCGRegSet;
 #define TCG_TARGET_HAS_rem_i64          0
 #endif
 
-/* For 32-bit targets, some sort of unsigned widening multiply is required.  */
-#if TCG_TARGET_REG_BITS == 32 \
-    && !(defined(TCG_TARGET_HAS_mulu2_i32) \
-         || defined(TCG_TARGET_HAS_muluh_i32))
-# error "Missing unsigned widening multiply"
-#endif
-
 #if !defined(TCG_TARGET_HAS_v64) \
     && !defined(TCG_TARGET_HAS_v128) \
     && !defined(TCG_TARGET_HAS_v256)
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 9fa9f1b0fd..326a9180ef 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -874,7 +874,7 @@ void tcg_gen_mulu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
         tcg_gen_op3_i32(INDEX_op_muluh_i32, rh, arg1, arg2);
         tcg_gen_mov_i32(rl, t);
         tcg_temp_free_i32(t);
-    } else {
+    } else if (TCG_TARGET_REG_BITS == 64) {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
         tcg_gen_extu_i32_i64(t0, arg1);
@@ -883,6 +883,8 @@ void tcg_gen_mulu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
         tcg_gen_extr_i64_i32(rl, rh, t0);
         tcg_temp_free_i64(t0);
         tcg_temp_free_i64(t1);
+    } else {
+        qemu_build_not_reached();
     }
 }
 
-- 
2.34.1


