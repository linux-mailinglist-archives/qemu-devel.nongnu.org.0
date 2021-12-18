Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48458479C7C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 21:02:29 +0100 (CET)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfuW-0006fN-Ds
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 15:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbn-00011P-8Q
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:07 -0500
Received: from [2607:f8b0:4864:20::42e] (port=40827
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbl-0003V0-H0
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:06 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z6so5122913pfe.7
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sZ9K7tJZ0dbIFsAXLmbrvSrGl7nkW2G5YKXIJR+v6Hk=;
 b=pM/U19VnWDw/owYGiw2IPyhljV9HK25YkuKQ048x+MUlzX9bw4wgm8B+re/ezV/iMj
 toLdD1jiMomj8I5+iNAVi9OopqkpmfD1Z0ICno3il8JaNCZH2WPBnUcrTtTn4VuSlc2Q
 /jYygIWkbo86gWzW7ljDdg+o6+GdUH8DDSauqv3beJ0hqrIDJC3I9IrKa/EYw2AuVPlH
 KLEcADgssCCJqHndPD+i3AcMjQyK5m+mqJzNOB5W7B+WUg2/3xGQQHC1NwauwHuxa0YJ
 ZW/2rLlBTBTQF9yPHL8X+CozwGdL/PCXVlkzE0e02qeE30p5AcSCNHnmhONg5lLy7nhw
 djJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZ9K7tJZ0dbIFsAXLmbrvSrGl7nkW2G5YKXIJR+v6Hk=;
 b=eOquJAyKTpXvS6CPI8rSvzYih82Lymm8xPOxOYldNTAwxeatGbU5XB1qISZAzxBEdu
 3zG0eMp+WihBlpRQXzi+/pGAJ2iEKrvnfFS5rsMcgFpaUE5NRNk986k4YIi91swx0lo1
 14ix0J2ICZko/IlVXgywdyMftPXH1z+5rWgkbTMoWY1S43MIWQylbFHK8tI8X6oF425G
 RUi2YFp+LAvo5LunlC6yEdqXVI425T7tjiPsFzW7ritmYqJ/96qR2WTXc+ir2wIC0czD
 2gpMx5HBi1HJLamti06vS+dcSAdXOA0yNSFyOA/beLHprOeBW/BRdFXoEzO39zojBfYQ
 h1hw==
X-Gm-Message-State: AOAM532OK2XxwXJuQQ8gYSvtpP8KD5uzhwW8SpTU4YkOP9kH9EPSocCy
 vaa9kuhWfuLuIgT7kS+ZWuq/9CQBQajSnQ==
X-Google-Smtp-Source: ABdhPJxk4sXq2VQwKY2i7J+1J3OsH3vAr5Bz+k6biWtFwtD2GnhRl9s2j5VL72oMf9ECbfKQu3pGtA==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr8682285pfl.51.1639856584251; 
 Sat, 18 Dec 2021 11:43:04 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/20] tcg/i386: Implement bitsel for avx512
Date: Sat, 18 Dec 2021 11:42:50 -0800
Message-Id: <20211218194250.247633-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The general ternary logic operation can implement BITSEL.
Funnel the 4-operand operation into three variants of the
3-operand instruction, depending on input operand overlap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 433a632d6a..ae3612d745 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -204,7 +204,7 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
-#define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_bitsel_vec       have_avx512vl
 #define TCG_TARGET_HAS_cmpsel_vec       -1
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) \
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 86c66f9522..be88ccae4d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2805,7 +2805,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 
     TCGType type = vecl + TCG_TYPE_V64;
     int insn, sub;
-    TCGArg a0, a1, a2;
+    TCGArg a0, a1, a2, a3;
 
     a0 = args[0];
     a1 = args[1];
@@ -3028,6 +3028,22 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         sub = 0xdd; /* orB!C */
         goto gen_simd_imm8;
 
+    case INDEX_op_bitsel_vec:
+        insn = OPC_VPTERNLOGQ;
+        a3 = args[3];
+        if (a0 == a1) {
+            a1 = a2;
+            a2 = a3;
+            sub = 0xca; /* A?B:C */
+        } else if (a0 == a2) {
+            a2 = a3;
+            sub = 0xe2; /* B?A:C */
+        } else {
+            tcg_out_mov(s, type, a0, a3);
+            sub = 0xb8; /* B?C:A */
+        }
+        goto gen_simd_imm8;
+
     gen_simd_imm8:
         tcg_debug_assert(insn != OPC_UD2);
         if (type == TCG_TYPE_V256) {
@@ -3296,6 +3312,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_x86_vpshrdv_vec:
         return C_O1_I3(x, 0, x, x);
 
+    case INDEX_op_bitsel_vec:
     case INDEX_op_x86_vpblendvb_vec:
         return C_O1_I3(x, x, x, x);
 
@@ -3318,6 +3335,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_nor_vec:
     case INDEX_op_eqv_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_bitsel_vec:
         return 1;
     case INDEX_op_cmp_vec:
     case INDEX_op_cmpsel_vec:
-- 
2.25.1


