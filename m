Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C689D6A3A86
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW1o-0007wC-O0; Mon, 27 Feb 2023 00:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1c-0007RS-Ej
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:13 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1Z-0007BQ-3j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:12 -0500
Received: by mail-pl1-x629.google.com with SMTP id i3so5530358plg.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
 b=vLpTW+Z3xIg9Y8wuea4FJMzYg3oHr8RhFVobl3FUCuao6MdWt9CvXZL35xGbZXfRtG
 XyCRu2XoDYHp6rJveu9zlvRMfRwwZrBGOa6wLHChUDwgAxbsQTBN8nK1yKNnZDU/EUWS
 uYl6k3B62XQHYc5S/UHiAyc2cvKmOX9R+q6TI1EZmPcrMnE0oRY80QoYGvmSJa/dE7EG
 U7HaNBblbcPEBK1OxW/Toseu7IKQv7lMFAvbmj4QbxFOVzrMnz2rC3+cOCGL7eJOhHri
 9IYRLWibibBZ92i1HOG1fPb6TwL03kjSi+HqLEtlypFBSf+j31PEjHJZ067zYmYPke8k
 O7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TToqxygHAy4B0miglawoSDtyexliIjv3wj5R/FRq4Q4=;
 b=dhM4O8Y+PpaBBXTaHydiA0UV0USMfA0uvN4sVJ9R1pqbd7Bjy2v60E577M+uTroqpD
 YF2PXNs+0njfMRDM3Xq9PLeuwgSnY85LVaMamsRuN7CVM6FYZ2YSrlEJ3cj7ghNTHzas
 6VfAnYqb6weEsdOgFA7pgTDcQzPuqCkDe9jjqnBM5xux04van2kGgrRnOuvn6x4UKOA9
 YWlx/hteNZlbTbKdxsO6trIkWdB5/fY0OXWFpFzbXLHZI4HhKLaHaxArh1MGC4QR1PmC
 szfn6Zf05FaoDg7Ckg30gZo1yHWjZfSQJzh6fwAh/noBLudbktcKMc3G33dlfLrXRjhy
 UXWQ==
X-Gm-Message-State: AO0yUKVBP4oxOef9uKlvKdNTwoxt3jIgQMGKXMJWuJpGS10MESxisUc1
 TPr4D3lWArMr6TqIJ0evqFjUtPzGh2eb5YMAGgM=
X-Google-Smtp-Source: AK7set8HaAGUv7NPNvvq/6Vi7id6S4EqUGqOmBbYLkWuh35OChUyCrSJf153WmxiF8KL8oZb/bvfRw==
X-Received: by 2002:a17:902:ec8f:b0:19c:171a:d346 with SMTP id
 x15-20020a170902ec8f00b0019c171ad346mr27849452plg.44.1677475568208; 
 Sun, 26 Feb 2023 21:26:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 21/76] target/cris: Drop cris_alu_free_temps
Date: Sun, 26 Feb 2023 19:24:10 -1000
Message-Id: <20230227052505.352889-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a959b27373..76db745fe2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1467,14 +1467,6 @@ static inline void cris_alu_alloc_temps(DisasContext *dc, int size, TCGv *t)
     }
 }
 
-static inline void cris_alu_free_temps(DisasContext *dc, int size, TCGv *t)
-{
-    if (size != 4) {
-        tcg_temp_free(t[0]);
-        tcg_temp_free(t[1]);
-    }
-}
-
 static int dec_and_r(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -1488,7 +1480,6 @@ static int dec_and_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1518,7 +1509,6 @@ static int dec_lsl_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSL, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1535,7 +1525,6 @@ static int dec_lsr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1552,7 +1541,6 @@ static int dec_asr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_ASR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1568,7 +1556,6 @@ static int dec_muls_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULS, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1584,7 +1571,6 @@ static int dec_mulu_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULU, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1610,7 +1596,6 @@ static int dec_xor_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_XOR, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1639,7 +1624,6 @@ static int dec_cmp_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1666,7 +1650,6 @@ static int dec_add_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1755,7 +1738,6 @@ static int dec_or_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_OR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1796,7 +1778,6 @@ static int dec_neg_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_NEG, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1825,7 +1806,6 @@ static int dec_sub_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
-- 
2.34.1


