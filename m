Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627236F8AF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:51:32 +0200 (CEST)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQk7-0001nY-GN
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU7-0007hW-GC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU5-0001Kx-Kr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id k128so37547668wmk.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qJ11aC8SWlzdnuc2gbrgeue1Xt+Ln546lI5n8RTAtlM=;
 b=oiCKCQEgJ7XmaPld1k4qjXBBwJ+VAWA2T9CKOabUPIz1lv/FF0edJnqDRLO49rR6ET
 Pw8GqaJyXux+YuSZxBStSzRTaYjFv/DgpHHVbMi6yVtPmgd09iKnFftqepAq4JT5Me4e
 WnX6SGWjT1/xN9w2uTrJAPgGThpAjH4ytA8c0bnEL44HK+ojfm4fhEQwqIXXT7wMIGNB
 Jyf9qw98kfo2lPxir/sLSOER98LZVuojtTxnBnuFhD1ulD36IMMVBUNe9+zvnumfZMnn
 yqgnEOuTQWTHFvh9iVMVrdNKAlX4G4mu8vlIbZYifn7KCt58vouVxzEFp/e6lrxZ4XSE
 EOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJ11aC8SWlzdnuc2gbrgeue1Xt+Ln546lI5n8RTAtlM=;
 b=QQjn/l0OPUaY7wskP7QbpiCkO/HKEPkijbPtgXBl+JojXIYvdNSSSug4SIH0C1iMAZ
 V8H2zi0IPjICJvr2dS3/Kc9Zehm0BwN3VP9pLEU3eq8AMrIsJdWtUd99kJXSmXhViRLe
 fVxcZKAafGdicazVAVpNsaoSQMdS6Z3W+Ed9mhubXZp3EV3sE/wH/PGERMdZ2ptE1HWO
 zMtYtlyOrZ0ZQ3bYZFpvjrR103MsFI2ZIwphCW3En/cbktxuoU+6l8edMwlyT/VGfB+p
 kr9MkikFVNBemoM3YM/qOlfkDdpPwjhYKPrvB05X7IetLl4q4G/bg9HVJe1s9MbyjNBF
 kJAw==
X-Gm-Message-State: AOAM531s5m+ZA4972I/m2EYIQ3/qNxvpGiYaBP/yIIfeUSHePQD5dosq
 bBxVT0y+OzgByFV6sBGuc9Tz+hE9Rirm9UKW
X-Google-Smtp-Source: ABdhPJxA+8fA8nzVaHriukTIyXHK/DOgvRVBWyVD4Q59U398gkBH9bNsYvtOrXx1wGdWchT+fym4NQ==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr5313441wms.83.1619778896345; 
 Fri, 30 Apr 2021 03:34:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/43] target/arm: Merge gen_aa32_frob64 into gen_aa32_ld_i64
Date: Fri, 30 Apr 2021 11:34:16 +0100
Message-Id: <20210430103437.4140-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5bf68b782a1..2f2a6d76b40 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -975,20 +975,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4987,16 +4984,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -5056,14 +5050,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.20.1


