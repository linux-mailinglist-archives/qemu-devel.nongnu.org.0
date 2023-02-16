Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F08698AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUdw-0007HD-GJ; Wed, 15 Feb 2023 22:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUds-0007Fv-9E
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:04 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdq-00005K-8C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:03 -0500
Received: by mail-pg1-x529.google.com with SMTP id z6so458068pgk.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a88LQ5xXE27mwhJIuM1/tb25IT852LOJBFHH8gvWTUs=;
 b=xaKJ47OkBZJssOQ7fMuQRBeDYOYDxKtYo/5Rxta9Ik2UPzwWj0HqO+6N8usyFZwea+
 4RxsoOGQD+ase/DrWKsWO/4abOtAPAon+P1I8pQeWpX0PutqMAU8Lqn7xINJyYtoyRCN
 Mxvt4TXr1bk7aGdx2YUSAnWmiY7rWmw7csht91yG6SzBQniixebIUpkSF5AA7qTt/Ntl
 t+DsMdUc8H4UtAWYgoJRQXIPhCyOyyWdtgtnKdDqDG8hF+TbRjMS+QYYsRJDaNh6zsvB
 BaVEq/rKCXAYCpBaGCPRzXhUJZ8l7YObWrXA9WYYcEhkFCAH36evTy7XzhtjamPIUrJ1
 6Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a88LQ5xXE27mwhJIuM1/tb25IT852LOJBFHH8gvWTUs=;
 b=kwIlvkRv4gzkXlfwUjnWoUiEkpZwdg3dxlFFG1hF8qvlARWbZ4NkdsnD+rZsE3RrG+
 GBMUrg6LIEHc1gfvW7AlQKcqsg55USFB7DvoyTV8CZtf5pfGnmq2B9ihx7cB+nNSKGm1
 rRs1xoAY20Jq9+y9sHkAZKahMpqRnMNuj1nuKckOXVT8RL9/N6fgRCz5sxl41DSyxEI/
 0M3LUGwh/5/rnhjtcN0ybXW3IZ2pvbLrSWoW0jlGFRmOs8O+YKHrpq3eH2nmdLhbt4SD
 9f6jP/s56GzAeLvq1HyJFQ81GB2fKLM+PMmU+DZVhaXEf4kDJ3ZGcY+bQBI2TIZSMUtD
 m7kw==
X-Gm-Message-State: AO0yUKX75W1tfFVCYvWZkgG4K13K9nk/964I1TcYPwKgEfLklifWV+y3
 2ZTTzwJubyhGkSNQNdb2ToVU4KJ8QQz0w+665FY=
X-Google-Smtp-Source: AK7set9VeMVYBfTCAADL4XBz8DI66aGDR56d4XOvDLhWOm6M8FUDWAqOdPmDJZK/J1+as4nvcfhqXg==
X-Received: by 2002:a62:1888:0:b0:5a8:d502:51ce with SMTP id
 130-20020a621888000000b005a8d50251cemr3157141pfy.5.1676516940866; 
 Wed, 15 Feb 2023 19:09:00 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 02/19] target/arm: Use tcg_gen_qemu_ld_i128 for LDXP
Date: Wed, 15 Feb 2023 17:08:37 -1000
Message-Id: <20230216030854.1212208-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

While we don't require 16-byte atomicity here, using
a single larger load simplifies the code, and makes it
a closer match to STXP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 78a2141224..d7d4b68328 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2545,30 +2545,27 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
             }
         } else {
-            /* The pair must be single-copy atomic for *each* doubleword, not
-               the entire quadword, however it must be quadword aligned.  */
-            TCGv_i64 t0 = tcg_temp_new_i64();
-            TCGv_i64 t1 = tcg_temp_new_i64();
+            /*
+             * The pair must be single-copy atomic for *each* doubleword, not
+             * the entire quadword, however it must be quadword aligned.
+             * Expose the complete load to tcg, for ease of tlb lookup,
+             * but indicate that only 8-byte atomicity is required.
+             */
+            TCGv_i128 t16 = tcg_temp_new_i128();
 
-            memop |= MO_64;
-            tcg_gen_qemu_ld_i64(t0, addr, idx, memop | MO_ALIGN_16);
+            memop |= MO_128 | MO_ALIGN_16 | MO_ATMAX_8;
+            tcg_gen_qemu_ld_i128(t16, addr, idx, memop);
 
-            tcg_gen_addi_i64(t1, addr, 8);
-            tcg_gen_qemu_ld_i64(t1, t1, idx, memop);
+            tcg_gen_extr_i128_i64(cpu_exclusive_val, cpu_exclusive_high, t16);
+            tcg_temp_free_i128(t16);
 
             if (s->be_data == MO_LE) {
-                tcg_gen_mov_i64(cpu_exclusive_val, t0);
-                tcg_gen_mov_i64(cpu_exclusive_high, t1);
+                tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
+                tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
             } else {
-                tcg_gen_mov_i64(cpu_exclusive_high, t0);
-                tcg_gen_mov_i64(cpu_exclusive_val, t1);
+                tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_high);
+                tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_val);
             }
-
-            tcg_gen_mov_i64(cpu_reg(s, rt), t0);
-            tcg_gen_mov_i64(cpu_reg(s, rt2), t1);
-
-            tcg_temp_free_i64(t0);
-            tcg_temp_free_i64(t1);
         }
     } else {
         memop |= size | MO_ALIGN;
-- 
2.34.1


