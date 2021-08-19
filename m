Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298073F15CD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:09:15 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGe30-0005dz-8N
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz6-0005c7-Lq
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz4-0008Tv-Bo
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:12 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 7so4887704pfl.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/63oJLjnGVxxWtejcKt+rZtNVmHP/z1h+jjj/mNESK4=;
 b=tL4649Dj5mqEKHIziD+6qEiPI+yh7+YavnC0sYa0vRK6MgEUw8avajcbe8PZ35IjAw
 rA5/+Q/nASqx44zs6sOVGvlhz7DuGyKMiAuJVZASXpk3IzBJqYzQ0qA2UFQYWypAFICW
 lJcDmijEXJMUG9L8lfPUgdYFjiyMTp46eCJUQ7z2RSFS9DwIiBKhmsgI1sFnAO5PMOfq
 OHIl/EfIRYchk5Qc+tFhFya6uvaRwOimTw+JPm4Gag3AUVV/2sC3H5BpT79gWzUKZWYv
 R4xQTkvcxbSu0VI0uSmMuQzgPhxAD6UMUC3GXDLZdGTn/xJmCaZI/ecsMfXzGpbexzd9
 KVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/63oJLjnGVxxWtejcKt+rZtNVmHP/z1h+jjj/mNESK4=;
 b=StxpLhg2c3YeRqNLHw/nEFoyUCkTE/Gr0zeX1paiZJNscDD0eqTCQtOl05cvVzy8tO
 aOksCcJE/2oWWI/OcMyqWeXEA2fOiV24NOrpPgmuCSqnnyxMtpl1+DTWpmZKvyGipdoW
 LSl+T5NBzYxhQlNnT7qr3BHM98/PiQ4P3OLjJHQG7qOtbOlkEf+Q7AwaDerQp52ouJz+
 JOowjVsyrbXaFsG0fMxH0KbkhyfjuZz3rSNL+SH5NyGihFX+SK0DxIw3An9aeBV/atMM
 L2QqK5HqJpFEnpIQqkX2KrFvrLQRicphkIRA/zohFAqdJFx7anGIpRKokDq/cfm+pSZK
 rE8Q==
X-Gm-Message-State: AOAM531pGzY/nisyqsXlAtIe7xzbSBUXpsSthOpdktYhc4yUz450OTUs
 oGTv3NZ1IamWuf5GDzQZk8alIxSAyyciiQ==
X-Google-Smtp-Source: ABdhPJxLfh0EXN9gvIo88TnYgxahev847ow/vBBRrjXvR6g04F4HzjsUqBKnRPNhurbP7mQTovh5aA==
X-Received: by 2002:aa7:8d0c:0:b029:3e0:2e32:3148 with SMTP id
 j12-20020aa78d0c0000b02903e02e323148mr13664160pfe.23.1629363909031; 
 Thu, 19 Aug 2021 02:05:09 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/21] target/riscv: Clean up division helpers
Date: Wed, 18 Aug 2021 23:04:43 -1000
Message-Id: <20210819090502.428068-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Utilize the condition in the movcond more; this allows some of
the setcond that were feeding into movcond to be removed.
Do not write into source1 and source2.  Re-name "condN" to "tempN"
and use the temporaries for more than holding conditions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 146 +++++++++++++++++++--------------------
 1 file changed, 71 insertions(+), 75 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 20a55c92fb..b52181538f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -213,106 +213,102 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv temp1, temp2, zero, one, mone, min;
+
     /*
      * Handle by altering args to tcg_gen_div to produce req'd results:
-     * For overflow: want source1 in source1 and 1 in source2
-     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
+     * For overflow: want source1 in temp1 and 1 in temp2
+     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
      */
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
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    /* if div by zero, set temp1 to -1, else source1. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
+
+    /* if overflow or div by zero, set temp2 to 1, else source2 */
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
+
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
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    /*
+     * if overflow or div by zero, set temp2 to 1, else source2
+     * this automatically takes care of returning the original
+     * dividend for div by zero.
+     */
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
+
+    tcg_gen_rem_tl(ret, source1, temp2);
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
+    TCGv temp2, zero, one;
 
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_remu_tl(resultopt1, source1, source2);
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    /*
+     * if div by zero, set temp2 to 1, else source2
+     * this automatically takes care of returning the original dividend.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_remu_tl(ret, source1, temp2);
+
+    tcg_temp_free(temp2);
 }
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
-- 
2.25.1


