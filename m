Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E5364CF5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:19:24 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbIh-0004H5-BG
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR2-00088f-Ck
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:56 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR0-0002pI-MP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:56 -0400
Received: by mail-qk1-x72d.google.com with SMTP id h13so18508849qka.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=VgSQCETwH1hPhJrsiqoBUf834UQ4mGnh3h8me3d+Y3CM/3XekpbRiX2i3/QBHENlAN
 NVXKjpRO/SBpEFFk/2e+sUji0hbNnWwM649Rig7oqXURNW5EhYOXUSCywWDpsarQFsyJ
 /Dxs5cLw3NG+hWY+W/Jc+7LY0xlLFIm35DeMh4CoiBKysRCGk8PFF5LRx8zCSR3URSpb
 tFu+mT3bSnmRKpG7rPzG4tLYFFhPlb7AsS/SMI6FairLFhueHC3S95yrlQ+jR4HoXiJ7
 tV8G3FPAtWeSsfVRWy8Gxhf1y+HnZ0s0jnjk4KavLwDW5sqrei5GH+0J7KklnxsZ2gLV
 kMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=Rpjb3kcvgQ4ox1cHn+yt+Xb8XYNcyW0bQQXSw+XbSlk4jABhlhIdGsFnbqZ+8bbTNe
 UDyuMNUmxb7uuITXuPzXUnxC41HE30wEP4j8DpFe+QZbpauNZt3Y0v4oDmJpu6S/AQ4x
 jmJXvuMHKNstmWHzBjh0MrJGyd3sQxEsaPK6NF9Zilus6a/2ng5/QAiJw2Z8+UKiQY6W
 5SvcL9ijFT6GEccbeAN5BLgVPOoFPACjMq2+/gU8rJwr5T7wp0h6CHTzDhWioxehf+SR
 FHSLsQhxMekV/fg8ui73m8LyhfOW7uIO8EUsBYMNuN4N0T9fwl09SI7Iyx30VBf49F0j
 OK8Q==
X-Gm-Message-State: AOAM530RVzEe/2nUfn/WKQUnozOrlhv3lb4PBmXwnU3LnK7aEiicUK4/
 8lShmL+tuUvrnazg958T/sLNd9stdwA63y8U
X-Google-Smtp-Source: ABdhPJyvKc6pp1ALz5YkQeHgaWMg+sficNisAWm3/POAWJuFKysE/xYmUzjeMLdeUqp5dVJOuyKe1Q==
X-Received: by 2002:a37:9607:: with SMTP id y7mr14026801qkd.25.1618863833808; 
 Mon, 19 Apr 2021 13:23:53 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/31] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Mon, 19 Apr 2021 13:22:56 -0700
Message-Id: <20210419202257.161730-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a82dbbd6d..95897e63af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3815,6 +3815,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3876,6 +3877,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3883,8 +3885,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3892,9 +3893,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1


