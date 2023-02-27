Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D36A3C51
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWID-0003Lg-Hn; Mon, 27 Feb 2023 00:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI6-00030f-04
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:14 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI3-0004sI-K1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:13 -0500
Received: by mail-pg1-x529.google.com with SMTP id d10so2827469pgt.12
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mERf7MKXZT5xGumbcdn7TizHZXgv59+znRwTwlxucPE=;
 b=r1ifEh3KG71FigZ6/loi9WkzqdcvRgmE61jOctOKVy8A5w+JKHw7b0eqUCiv//lp2y
 2rFR8qU8Pce4JOQ8cSHmnmfMN1BPSmd+zI3yBnwBCXa4X43lVb41DaX/+cGh+EQ95aFZ
 LVqwhRKPmxjwKsq+gGyNtReCyri2Q0SNufabTbE29MzEmX7jwMYserDDeFpJ4tv5/u2d
 cEdUD0fi8IEAY27iLAWQZJjxbo3l0PKX2iO/GN+maKfPzL7qrsO0VmPENsprYE46HWHz
 1Vkpnxvvvsx32aHP9sHMa9IK3B3/s9i2eTcxyIW83BJ2WrCK3xS7+X/1N6UhQbacG4pE
 CHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mERf7MKXZT5xGumbcdn7TizHZXgv59+znRwTwlxucPE=;
 b=koZC3siXEivj2DyJIROFL/Img4jqdYLJlCaTHmjDUG5L3E7yty7g6EPjogBcArv+DG
 7qsv+piLJo8JGvZ+TWKeuBfD6Eb9tw0BBBB+4xFq94AwftfRBlIVjBHlx9tWLZnuuccM
 Oe8JA5hK9S0DXzYT39y7HVhkuar3MrPqI7PIdjlf9aVw1pXPqcTXNmykUx4/Itff4Rnl
 YUhBl97HGisG3vxBV8pxVSU7QOxQVxzXUeEp+r+Lw4iX/CKH6EE1t2kSm5rbRk/BteQp
 EJjyl/KAwpcwBwG8IQo+n43ZHmVTE2sBVzSM2v1n7lvKqOAvMyyr3NZ9hyaXpbQ6z6Kd
 VH3w==
X-Gm-Message-State: AO0yUKV5w4CujiuFZHEJapaOg5/zrSEInlVjWaj+9IdtcDZL551N17jB
 t4f78CwqfKA3o3MIjHtAiZgQGBv05U4xW+ovPIw=
X-Google-Smtp-Source: AK7set83tZFzwJmyo+AcXC1g8MjKmU8WC2z+pKCoxft7bOo9txoaQz78WiWoRpJxQ/qhjnpFknPYcg==
X-Received: by 2002:a05:6a00:15cc:b0:5a8:51a3:7f69 with SMTP id
 o12-20020a056a0015cc00b005a851a37f69mr8331100pfu.2.1677476590507; 
 Sun, 26 Feb 2023 21:43:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 10/70] target/arm: Avoid tcg_const_ptr in
 handle_vec_simd_sqshrn
Date: Sun, 26 Feb 2023 19:41:33 -1000
Message-Id: <20230227054233.390271-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
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

It is easy enough to use mov instead of or-with-zero
and relying on the optimizer to fold away the or.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1726ec622d..16aa71451c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8459,7 +8459,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_rn = tcg_temp_new_i64();
     tcg_rd = tcg_temp_new_i64();
     tcg_rd_narrowed = tcg_temp_new_i32();
-    tcg_final = tcg_const_i64(0);
+    tcg_final = tcg_temp_new_i64();
 
     if (round) {
         tcg_round = tcg_constant_i64(1ULL << (shift - 1));
@@ -8473,7 +8473,11 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
                                 false, is_u_shift, size+1, shift);
         narrowfn(tcg_rd_narrowed, cpu_env, tcg_rd);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd_narrowed);
-        tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        if (i == 0) {
+            tcg_gen_mov_i64(tcg_final, tcg_rd);
+        } else {
+            tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        }
     }
 
     if (!is_q) {
-- 
2.34.1


