Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA154411769
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:45:49 +0200 (CEST)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKYG-0007YX-Qn
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9n-0002t6-5J
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9T-0000yc-QM
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so28467395wrg.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bWJT4VavETMSn3tO8N65JKH7HaA8XtvAyrZew1h01+c=;
 b=Lf6w/GQA4WWcbUCoWwoMR+TZ8F0sl91NAeIrPU7fOKmhnOaw6qZxohxXYvSuCiFDpn
 J08LIuT8rTD+elQOn8PxebeNfAiYQsWDDhW4MsvqzZQnf+OE8GAFfYLJXmh7FPhnXBEV
 UP6V5Nl9906jrpfP3vngzq/gnn2/Xp1MIlC1GdHSt+e90qpwQP0vDvtw5w1Hhfib2bsj
 6KlE/h6fhfnyj0TB3TtSDpMIqAUYRD4vXkDhDSr66jy6/3fSsnaiVeqtxKOB6i01ydMD
 +4ecDSlo0dfCDCymDHViuGUpsppsY4feMGJd83CdspDA8M87TE3c5vJkhejD4Vv8QaeK
 zptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWJT4VavETMSn3tO8N65JKH7HaA8XtvAyrZew1h01+c=;
 b=LbEhwoNG58baOsZCw2xOo/jjW/uU5kehw9Pvw+J1qFSFb3Rg8hd7paEXQQQ8aE89f+
 tLcg6FByjvNTWAHua3SMQpDFqbiUVvvuZCJEVOj6UVjjZ8h0V1vlu6HzyFhDMzEOy6iq
 yrfhdqPliOKLulkCwlXQhwbGROQydnS4KydYsOUf0xy7iqN8Q2fkLSqd1sDvTQs/v1+Z
 OWjyuVYQ7gZApGFEv1QybaKpg0/bztAeMi9jT/t+KwDjUwlAc0jCgRjkdVqjl1fB7pMa
 KESodHgCnpJPdm09HuAfw++Pe6QaHwn9HqEySdS9MzYpFPbeKWBdzFjt3mZtHLfLXtFo
 k6mQ==
X-Gm-Message-State: AOAM530jppCOykz8m1/KR5DXzJ/+ycXysTvPBPUIVG5b1JYFA/DgHpmR
 ny+NLdmghOE3vtX8Jwn13fJjM5fF7D81rA==
X-Google-Smtp-Source: ABdhPJxiY25rPOyrGRR4rwCcJx9P/SEQFvDhl/H9nbxaEfBdjg+Z37Od4rs9qQSEP+90HmbGq0vlLQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr8803512wri.150.1632147607969; 
 Mon, 20 Sep 2021 07:20:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/27] target/arm: Optimize MVE VSHLL and VMOVL
Date: Mon, 20 Sep 2021 15:19:45 +0100
Message-Id: <20210920141947.5537-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Optimize the MVE VSHLL insns by using TCG vector ops when possible.
This includes the VMOVL insn, which we handle in mve.decode as "VSHLL
with zero shift count".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-11-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 67 +++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 00fa4379a74..5d66f70657e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1735,16 +1735,67 @@ DO_2SHIFT_SCALAR(VQSHL_U_scalar, vqshli_u)
 DO_2SHIFT_SCALAR(VQRSHL_S_scalar, vqrshli_s)
 DO_2SHIFT_SCALAR(VQRSHL_U_scalar, vqrshli_u)
 
-#define DO_VSHLL(INSN, FN)                                      \
-    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-    {                                                           \
-        static MVEGenTwoOpShiftFn * const fns[] = {             \
-            gen_helper_mve_##FN##b,                             \
-            gen_helper_mve_##FN##h,                             \
-        };                                                      \
-        return do_2shift(s, a, fns[a->size], false);            \
+#define DO_VSHLL(INSN, FN)                                              \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)            \
+    {                                                                   \
+        static MVEGenTwoOpShiftFn * const fns[] = {                     \
+            gen_helper_mve_##FN##b,                                     \
+            gen_helper_mve_##FN##h,                                     \
+        };                                                              \
+        return do_2shift_vec(s, a, fns[a->size], false, do_gvec_##FN);  \
     }
 
+/*
+ * For the VSHLL vector helpers, the vece is the size of the input
+ * (ie MO_8 or MO_16); the helpers want to work in the output size.
+ * The shift count can be 0..<input size>, inclusive. (0 is VMOVL.)
+ */
+static void do_gvec_vshllbs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    unsigned ibits = vece == MO_8 ? 8 : 16;
+    tcg_gen_gvec_shli(ovece, dofs, aofs, ibits, oprsz, maxsz);
+    tcg_gen_gvec_sari(ovece, dofs, dofs, ibits - shift, oprsz, maxsz);
+}
+
+static void do_gvec_vshllbu(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    tcg_gen_gvec_andi(ovece, dofs, aofs,
+                      ovece == MO_16 ? 0xff : 0xffff, oprsz, maxsz);
+    tcg_gen_gvec_shli(ovece, dofs, dofs, shift, oprsz, maxsz);
+}
+
+static void do_gvec_vshllts(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    unsigned ibits = vece == MO_8 ? 8 : 16;
+    if (shift == 0) {
+        tcg_gen_gvec_sari(ovece, dofs, aofs, ibits, oprsz, maxsz);
+    } else {
+        tcg_gen_gvec_andi(ovece, dofs, aofs,
+                          ovece == MO_16 ? 0xff00 : 0xffff0000, oprsz, maxsz);
+        tcg_gen_gvec_sari(ovece, dofs, dofs, ibits - shift, oprsz, maxsz);
+    }
+}
+
+static void do_gvec_vshlltu(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    unsigned ibits = vece == MO_8 ? 8 : 16;
+    if (shift == 0) {
+        tcg_gen_gvec_shri(ovece, dofs, aofs, ibits, oprsz, maxsz);
+    } else {
+        tcg_gen_gvec_andi(ovece, dofs, aofs,
+                          ovece == MO_16 ? 0xff00 : 0xffff0000, oprsz, maxsz);
+        tcg_gen_gvec_shri(ovece, dofs, dofs, ibits - shift, oprsz, maxsz);
+    }
+}
+
 DO_VSHLL(VSHLL_BS, vshllbs)
 DO_VSHLL(VSHLL_BU, vshllbu)
 DO_VSHLL(VSHLL_TS, vshllts)
-- 
2.20.1


