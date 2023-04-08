Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC106DB875
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysM-0004Aq-6F; Fri, 07 Apr 2023 23:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys8-00046w-OZ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys6-0004XV-UQ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:12 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a52667955dso568995ad.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXbf2aRMCTtBppHDpY9IM0kHjyXVcQd7tAf8ZqkWMDo=;
 b=FTXCgVP/95HEFIspOLfZ136qECwjSGJQUvczi/SbQeHnx+gOnaVOXZveNJxqncUL4U
 Jk9MrOR86i36mPOQsvyXh63NrUCXoWzJ+dBKcS5DnfhQ8+Ngqfi2ID7q5QjiJyaKqMtF
 pU02bOELa6OmdJgBa0zfLvlgN6f67kaZ4WXbW2Fm8b/FXgBO1Suc4HjoX8jGGEshsZXH
 Zz6T60PwEfq3tW5+lcHnLquv9K7VCHLwfpT/VGRkxh2Z2kMpK4tuwukfdeTcRUigQAd3
 xKlN6U/EJ+Iv2il2tyArOHbAqec+CsJ0ZbEVlcKeswGv+eSdhvAyoi/K5+Vx3dqHMHco
 3yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXbf2aRMCTtBppHDpY9IM0kHjyXVcQd7tAf8ZqkWMDo=;
 b=LL8lRelLXS6mRD07e4TjsdLlb6nUwvQHYfQ0e5HsDcq+3czESCNCqdbp1FN/NIls6V
 xngYsxaI5dxOzaIXAwUkFuDBWXZKj2c3+leT9hFNFTIhBjIBBcOTvz4BkP99zt3oi2y2
 C1Ku8CYX24OGUtH9T2eR0Um35nqgRUqYg7lAvbn6JleyuP/DWFWyngQmDwh5Z/HSei9N
 xpXII56DxO0FMXk2YplvBvB8DfTOtDNBIk132MGXcwhP/0VwWwl5MYJwL05YkRKHZJsn
 1321njZQZdqnIYLQL5Na/etN1Xf7q1zMsc9XLSi2k/oN8xWk29Y/mkFMyuUsSKVjLU32
 Pg+g==
X-Gm-Message-State: AAQBX9doE68hm7aCyJ+AvmkRO/dD0JNI0gT3I+aWoCGNtum+YO7+nloj
 WEPkpkYtbfZi4Gr3qn7PcNSF16FIMHT7yXaOqsI=
X-Google-Smtp-Source: AKy350b3kfsPRqOzISAGU5Piki4vKfvTiJzxRLep+i8IuBrFgikSS48kloIrtHgrr63bWbsifHRnWg==
X-Received: by 2002:aa7:94b8:0:b0:62d:b7ad:8071 with SMTP id
 a24-20020aa794b8000000b0062db7ad8071mr4589155pfl.15.1680923049084; 
 Fri, 07 Apr 2023 20:04:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 10/12] tcg/mips: Try three insns with shift and add in
 tcg_out_movi
Date: Fri,  7 Apr 2023 20:03:57 -0700
Message-Id: <20230408030359.3368868-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

These sequences are inexpensive to test.  Maxing out at three insns
results in the same space as a load plus the constant pool entry.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 8c9a4cba9b..e7930963fc 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -573,6 +573,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, TCGReg tbreg)
 {
     tcg_target_long tmp;
+    int sh, lo;
 
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
@@ -595,6 +596,49 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
+    /*
+     * Load bitmasks with a right-shift.  This is good for things
+     * like 0x0fff_ffff_ffff_fff0: ADDUI r,0,0xff00 + DSRL r,r,4.
+     * or similarly using LUI.  For this to work, bit 31 must be set.
+     */
+    if (arg > 0 && (int32_t)arg < 0) {
+        sh = clz64(arg);
+        if (tcg_out_movi_one(s, ret, arg << sh)) {
+            tcg_out_dsrl(s, ret, ret, sh);
+            return;
+        }
+    }
+
+    /*
+     * Load slightly larger constants using left-shift.
+     * Limit this sequence to 3 insns to avoid too much expansion.
+     */
+    sh = ctz64(arg);
+    if (sh && tcg_out_movi_two(s, ret, arg >> sh)) {
+        tcg_out_dsll(s, ret, ret, sh);
+        return;
+    }
+
+    /*
+     * Load slightly larger constants using left-shift and add/or.
+     * Prefer addi with a negative immediate when that would produce
+     * a larger shift.  For this to work, bits 15 and 16 must be set.
+     */
+    lo = arg & 0xffff;
+    if (lo) {
+        if ((arg & 0x18000) == 0x18000) {
+            lo = (int16_t)arg;
+        }
+        tmp = arg - lo;
+        sh = ctz64(tmp);
+        tmp >>= sh;
+        if (tcg_out_movi_one(s, ret, tmp)) {
+            tcg_out_dsll(s, ret, ret, sh);
+            tcg_out_opc_imm(s, lo < 0 ? OPC_DADDIU : OPC_ORI, ret, ret, lo);
+            return;
+        }
+    }
+
     /* Otherwise, put 64-bit constants into the constant pool. */
     tcg_out_movi_pool(s, ret, arg, tbreg);
 }
-- 
2.34.1


