Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E650362888
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:21:16 +0200 (CEST)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXU1i-0006p9-LQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi6-000441-UR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThb-0004TK-VW
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id 20so10524590pll.7
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
 b=yFUMFO9xoRJ83pGRrwjhUbC3pZHO4Lc4Z6IZI7XqTZhoqpWMUVcUpLy9Q9UbXTihuz
 HDNQJeuJFTNwU6vNPbe8WI1/ZXYgJ68jspnz8r+wOae4qNMiJ9MKPCtMGHJpNyW0CjyB
 ZSLESLcQAuD6ykfybyS1Ll6OapdAclWQ8oRA2+6zKFx5oXyfzdCDPjR3k4odubUPc1aF
 bJkE/ZmLIv41Hryj0MeBec2D7UKQKWiVnnXU/CABxMTQPv7kC7YHGpXkyr7cYQJMCFbI
 bq4H2VrahfFeajoFS7mU1ni9ctIoVVrdqocEjfyj/2e6VFDN4CRNnz1w320WeauC1uU9
 XSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
 b=dOm7lfKxT4aAPPw8N1DDanDd90Xl0LGvfyfdt8+xzE9njnWPBt/Np35uwwsPpSA9cM
 otG/ePIAi257sfzuMDVg69lVGV45E1/OPAUfwV69vZsOcLthPQVD8+XFglhfL7GoQeVc
 IqvtyJJAan0fEmZZijPQKGEwDY9U9kim3pEfVeSG8QemFn1bJV+fGgaYi5bzlKgIWxES
 EebtAKBzQyHw1awXQCInAtEgFEMQsB1OL9hn+uriCCsfhkPSmGYMoSV8ceVPN63rsdW/
 xPtQzM/phGSPxMgVw3ZAz3FLC3YmGTnBaO+dpqusVEMeLdhGLqh8DW3oe83JRadUpJ+z
 h80w==
X-Gm-Message-State: AOAM532cCvf5Ad07ptxbnuZa52Z8dFCLdLr6lzhW4nvtBwKKQ9DqzzSD
 GKTwBQT4+/uemZgoJzSl2EqfkA5S82ayHQ==
X-Google-Smtp-Source: ABdhPJyG/6lqWVh3aDTNlv+CncBemGmgDhFIFWGZsZk8jiTmWjxHejWCGUCkKGLYrjEia5XU8l8oMQ==
X-Received: by 2002:a17:90b:2291:: with SMTP id
 kx17mr10970936pjb.79.1618599625568; 
 Fri, 16 Apr 2021 12:00:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/30] target/arm: Use finalize_memop for aa64 fpr
 load/store
Date: Fri, 16 Apr 2021 11:59:54 -0700
Message-Id: <20210416185959.1520974-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For 128-bit load/store, use 16-byte alignment.  This
requires that we perform the two operations in the
correct order so that we generate the alignment fault
before modifying memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f2995d2b74..b90d6880e7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -963,25 +963,33 @@ static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
 static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 {
     /* This writes the bottom N bits of a 128 bit wide vector to memory */
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    tcg_gen_ld_i64(tmp, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+    TCGv_i64 tmplo = tcg_temp_new_i64();
+    MemOp mop;
+
+    tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+
     if (size < 4) {
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s),
-                            s->be_data + size);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
+        TCGv_i64 tmphi = tcg_temp_new_i64();
 
+        tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
+
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
+
         tcg_temp_free_i64(tcg_hiaddr);
+        tcg_temp_free_i64(tmphi);
     }
 
-    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(tmplo);
 }
 
 /*
@@ -992,10 +1000,11 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     /* This always zero-extends and writes to a full 128 bit wide vector */
     TCGv_i64 tmplo = tcg_temp_new_i64();
     TCGv_i64 tmphi = NULL;
+    MemOp mop;
 
     if (size < 4) {
-        MemOp memop = s->be_data + size;
-        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr;
@@ -1003,11 +1012,12 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(tmplo, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_qemu_ld_i64(tmphi, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
-- 
2.25.1


