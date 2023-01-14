Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3C66A884
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 03:06:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGVuA-0005Jw-Bk; Fri, 13 Jan 2023 21:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGVu9-0005Jn-7v
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:04:21 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGVu6-0003cF-Nf
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:04:20 -0500
Received: by mail-pj1-x102c.google.com with SMTP id bj3so20899322pjb.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 18:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=M3DcAkNdtcPsJzTckL53caY5u9NfdF8hEKyd5Zm5cog=;
 b=rowkM0xo8vBoq0lpassLg3MwaG8Gqo0UfwjycxaoJyfDGWXbSyABb22DBmydjE43vk
 4nIOSLa9gl1fXJCAyMpRsCskf7X3l0a0L6erZ2pf0eJkLXIESvZKE5OXcVyUczoKu/OK
 9totJu+dWTFEAS4zLSb1U/ykStuQcMJGXDkIGX4PngpntEkI3PpI3bf+A2iyizaaHhwO
 W5S8Gc6oo6U8UejAb1EULrwBo/XUFS54A7cDYN8v/15bPW3KbVcoiLy56LSxZDCCa0iN
 D6Z6KYe6hdY7Z0EI1uhEJsw4REUv8Le//SOKzzBJ1beLEwktsPyzndkdYJiS3YHgzw37
 7nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3DcAkNdtcPsJzTckL53caY5u9NfdF8hEKyd5Zm5cog=;
 b=Ou0GNnTpCj9TPiETsK1hRLgIIrve3m6CWBeLAPd6rCSN/KJVQ/msnWrB0OX4fiw3eB
 j8l6IHgCxguRzY7BYqKrUIwd2vjFKEKVDFCHiRG2XkmshOgu9XpcXNEWAdxDevK44oP2
 oL7ZF26RPyyemA2pyWRL2DyVjJFHoWqCBbzfRc/3hQ3UQvfuXDGmEMaeY+AAcIh0rsuv
 27sQ0oWcZLDhVXNYR4VINi9pdktHxpnZS5pOsR6HLE2wFMiI7DxchBE8BrZdtJb2Y92F
 W9LyQbNHire+ZWhQeYuTA7c7ZYPqL6NvGaR8QBCAxEe9vcb+/RKYhnCb7wmotnMsU/w4
 Nhfw==
X-Gm-Message-State: AFqh2krrIipxAQCLPq9UQs4zoWu3QWFT7fu14NsSfiYU2Agppr/PeIOS
 VX0Vjgy1Iy21eq4GoeERgNhi2Itcbe6A2IEU
X-Google-Smtp-Source: AMrXdXsOGphn4Ji+aHV3D8NIoG5iL8ySfAri7oEO1ld2xY57/ow3Nb9sDs3qqWhn9xA4Xb+v4SHajg==
X-Received: by 2002:a17:90a:5904:b0:227:e10:9a93 with SMTP id
 k4-20020a17090a590400b002270e109a93mr22108234pji.20.1673661857156; 
 Fri, 13 Jan 2023 18:04:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a17090aec0e00b0022908f1398dsm3460327pjy.32.2023.01.13.18.04.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 18:04:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Avoid recursion in tcg_gen_mulu2_i32
Date: Fri, 13 Jan 2023 16:04:14 -1000
Message-Id: <20230114020414.2839748-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index b949d75fdd..97429bdb89 100644
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
index cd1cd4e736..d7e556fe0c 100644
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


