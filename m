Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC9364CA3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:56:37 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYawe-0000rV-49
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQz-00080f-3k
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:53 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:33666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQw-0002mv-Vy
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:52 -0400
Received: by mail-qk1-x734.google.com with SMTP id o5so37220690qkb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
 b=Mjx779oAWvfRSXJrzmuq8nqVo/hKE25YcYWJFs+i27LkD4GipLA3c0exd22mk9/Sp2
 pZhkOI4/Xz4sR20pOcWHh6rgrhOF1gRt0yz6Wz3+QVHM8K8enmtaz5cyE0SH02Ahr9Fc
 OCfpCd0qv32Zf/0MQwsofp/lMTvYlnV07m6MhAveP5tO/AkjN2GZYDc96RmCIfP0Wcfb
 PB4c4BBBP78gP9bmmYOaud5lFEYXbtGUhG0lXzki7sFar7yPnxgVe9xK10jB2jx1h5mh
 W1nYzkoBkH8GB1/Up+o4uvafnvJRj3vm5DPiKyMgRCoNon/ignvpvDLv/JRSQ9FS/umS
 6I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
 b=dgSqe3kS6nq2lRus69XcwYfBjFchgE3otq1rLeXpCyfwxBK/xdRAyuQer2BqXFw/IZ
 2+Gn9Nb9Q5RjyIf0rFeq5GJV7k2/2ARi6a80M2LJSlMuOiI2ZymuwzRRi/g3azC5Lnj+
 M3VqAzFMp0RLftghiDNjKx4GnKFYd2nZV8nJDBlpzJkExYj29S60l9cTv9pSLtxvi8/U
 ypbR0ZIjLW/+rMaGH1GUZnrETcgFYvmTni70MEaivUHyM8PX21D1xF+ADgxRWJ3Zfqwq
 bUsWmlbRaTNRMIDqsf36UYR61j3PgvEMAW2PHGK74Eo+DjKMh1nbVQIVn0/PYhtw20VJ
 koVA==
X-Gm-Message-State: AOAM531cyDOYdt1Y60ccLiFSs/JseLWuyPYeMWbcAmqmBY+etzY3fXh0
 LwtU5JvlxZBAUGrDuJnVTMZ89U5VqMG4RnUi
X-Google-Smtp-Source: ABdhPJzdRoRX/JwJayc6X8y2e6jJCNrDWRaIPQlt8DyKztn8IxZJAO7qWq1aLOqRwEUNb2VHL8hmTw==
X-Received: by 2002:ae9:e015:: with SMTP id m21mr13190492qkk.420.1618863830133; 
 Mon, 19 Apr 2021 13:23:50 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/31] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
Date: Mon, 19 Apr 2021 13:22:54 -0700
Message-Id: <20210419202257.161730-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ac60dcf760..d3bda16ecd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1146,24 +1146,24 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
 
 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    read_vec_element(s, tcg_tmp, srcidx, element, size);
-    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
+    read_vec_element(s, tcg_tmp, srcidx, element, mop & MO_SIZE);
+    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
 
     tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Load from memory to vector register */
 static void do_vec_ld(DisasContext *s, int destidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
-    write_vec_element(s, tcg_tmp, destidx, element, size);
+    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
+    write_vec_element(s, tcg_tmp, destidx, element, mop & MO_SIZE);
 
     tcg_temp_free_i64(tcg_tmp);
 }
@@ -3734,9 +3734,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size, endian);
+                    do_vec_st(s, tt, e, clean_addr, size | endian);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size, endian);
+                    do_vec_ld(s, tt, e, clean_addr, size | endian);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
@@ -3885,9 +3885,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1


