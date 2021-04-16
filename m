Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D60362895
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:25:52 +0200 (CEST)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXU6B-0004RE-VV
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTiF-00047v-OG
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThc-0004Tk-Th
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:01:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so16896732pjb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
 b=nHrXZFf1gghtBb9qtMWpo63WL8owrcPR5+vouErtFy9wQMzWy77IrXrwuWlT3YnErg
 95VOFeQBa0wVZT+b4SiUxp9+x3seqP1jOcLggxHSCDpYUGjuc0oc94qDvZmVKsYvXBXi
 qyDKfQ2+mpTi2vyb/b9dvJExQaH3LOjHDtunlnn4dbdaR6L90GQ9eEkoJ2H55NbTWmpb
 CvguinCNcSlFwdZweuU76WLU0UfF60D+KZ0csHtBIA5Lc+x3zJUKXDGQhfSAWDMQgY/6
 vMcCujie7cK9OjynbhVIssT+1N8uB7v8r7PBORANy+8EwVR/PzfMMoG/AHq5J0us/Kvr
 ahiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
 b=IOv78nLYzmLqkDkaUzS31Ry9zm6wSgEfO+ZDyOsIZRdw9KuRhhMvH8dZtfKC1Riaqs
 9t+r1pvtXBG0Ly/lngT5f6n9dcyC0bC0mIMwSun6OJc4/lVl4oE9qhp7d0yowBLlviE/
 tQgHv2dmGvWYHekpH4TXeFpxBNS3u7BMcn4Olb/pvCc2EawfrrbH6VWpvQyc82uDDWnm
 pQsDuqQhS7paaisogMUfKmI7djHLhrt6Qsczr/4MnOqOkI9C2vWPykTw/xo9XrsnaEQI
 WaywHPLohVXmAhLW8Tav9pY5WX0Wb8Tc7SMRbgxWSzrbSmC4vqZDDJ1HNylW/OkXaLwH
 y58w==
X-Gm-Message-State: AOAM530iholGkewew5WdEmwUqGAZfEhx6fkV6/0kO52gXMUa6lA3IEmq
 DtqQHj5md9m8mO4njBz4ZP/5axorFOJtPQ==
X-Google-Smtp-Source: ABdhPJxxAyRpXmX2yvrc5F8tBVJsvXfUWpnlxAM9kgp4d1sl0TUwGP+MZzO40rFCYIXhjgPxQ0qhwg==
X-Received: by 2002:a17:90a:4381:: with SMTP id
 r1mr11700641pjg.214.1618599627423; 
 Fri, 16 Apr 2021 12:00:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/30] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
Date: Fri, 16 Apr 2021 11:59:56 -0700
Message-Id: <20210416185959.1520974-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


