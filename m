Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9053F5196
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:57:27 +0200 (CEST)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIG4U-0000hB-5Z
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2j-0005kD-RG
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:37 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2h-00032o-3u
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so232081pjr.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DH1ys+YbMn+uPWhHhG/2K2qpSjaR8ssoARkvv625wKY=;
 b=yg6Sqys20ZQFp93f8/8EuPlMhOwR72aF3Ivcc4QF2qyyIszF/9pQgm+X5qLUr9NJuE
 azcVH9Q2NNz3Y/sHQqJ2zpTLSqbNe/sXqBVooIktnG4bk5OIeIDndFrhv2Rw+dnvgBd2
 4+k34CKQ0twMOaki9HvUqHQxygDQkdzzacVFPsrpR3nk2ae9UO6YZ07yip+8isV2ZMiz
 2kMVoUSgh79bmDtpYTBPCYBaH4HoOU9e5VjuOjRZEJ40GcXISaOt6Xrivjpi+iPO/M6v
 AuFUND8aMMbHPnCmCgNheu1OIrj6tg+IX78Es7T0MrtR0YBozSN4SyFB8dkFmqSC2zhf
 1f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DH1ys+YbMn+uPWhHhG/2K2qpSjaR8ssoARkvv625wKY=;
 b=lii3D8AWYc6dUpoZsWDrknDH/ukS8JZiVglaF5fK0KFBpXqkurAOqWJ0t6rPLhmSjZ
 F6dp3MbWxl69/TMdjAIPd//j5d+YI0r+12v1nbaVMNFWLR6ZE3XFuhsfYi5uv3fuUL4+
 tXqbOW1JFsbfj8789tnipPH8cy6erElUuLxJGLJ4hTkoydEh4w7xzWMEVNwOgQcsigNz
 rGgSCcr66J02CTpOhrj0lriSXMV4oEFTVJ8wVACnJ14UPvi/4ont2iHHoRBpmhc95Uss
 Y+kBxHoTn4n+8/vDVL4JyY+vjABV+4mlxMG5Phv9UNuJrv1BaV+HRZXrUW0ulYfWdUsz
 xrKw==
X-Gm-Message-State: AOAM5311ONf+wdQIEuHoRvLXGNNSYPG6JiyjrQuuSpxYzi8+86R0eFCn
 vvWsadfkPu9p3mw35IYTPiyZZMO09CjQfQ==
X-Google-Smtp-Source: ABdhPJxCyc2YxNVrUSVcX49owPrumHc9MX8QFNjI0tOdnn4II7Cs/Sf0LMVTeyh0mK9c+MG/vSWfJQ==
X-Received: by 2002:a17:90b:1041:: with SMTP id
 gq1mr277221pjb.36.1629748533681; 
 Mon, 23 Aug 2021 12:55:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/24] target/riscv: Clean up division helpers
Date: Mon, 23 Aug 2021 12:55:08 -0700
Message-Id: <20210823195529.560295-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Utilize the condition in the movcond more; this allows some of
the setcond that were feeding into movcond to be removed.
Do not write into source1 and source2.  Re-name "condN" to "tempN"
and use the temporaries for more than holding conditions.

Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 160 ++++++++++++++++++++-------------------
 1 file changed, 84 insertions(+), 76 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 20a55c92fb..147b9c2f68 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -213,106 +213,114 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
     /*
-     * Handle by altering args to tcg_gen_div to produce req'd results:
-     * For overflow: want source1 in source1 and 1 in source2
-     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
      */
-    cond1 = tcg_temp_new();
-    cond2 = tcg_temp_new();
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
 
-    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
-    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
-    /* if div by zero, set source1 to -1, otherwise don't change */
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
-            resultopt1);
-    /* if overflow or div by zero, set source2 to 1, else don't change */
-    tcg_gen_or_tl(cond1, cond1, cond2);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_div_tl(ret, source1, source2);
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
-    cond1 = tcg_temp_new();
+    TCGv temp1, temp2, zero, one, max;
 
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    max = tcg_constant_tl(~0);
 
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
-            resultopt1);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_divu_tl(ret, source1, source2);
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_divu_tl(ret, temp1, temp2);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv temp1, temp2, zero, one, mone, min;
 
-    cond1 = tcg_temp_new();
-    cond2 = tcg_temp_new();
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
 
-    tcg_gen_movi_tl(resultopt1, 1L);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
-    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
-    /* if overflow or div by zero, set source2 to 1, else don't change */
-    tcg_gen_or_tl(cond2, cond1, cond2);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
-            resultopt1);
-    tcg_gen_rem_tl(resultopt1, source1, source2);
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
+    /*
+     * If overflow, set temp1 to 0, else source1.
+     * This avoids a possible host trap, and produces the required result of 0.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    /*
+     * If div by zero, set temp2 to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect result.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+
+    tcg_gen_rem_tl(temp1, temp1, temp2);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
-    cond1 = tcg_temp_new();
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    TCGv temp, zero, one;
 
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_remu_tl(resultopt1, source1, source2);
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
+    temp = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    /*
+     * If div by zero, set temp to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect result.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
+
+    tcg_gen_remu_tl(temp, source1, temp);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
+
+    tcg_temp_free(temp);
 }
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
-- 
2.25.1


