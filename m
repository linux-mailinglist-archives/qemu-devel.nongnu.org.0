Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFED3B78C9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:40:05 +0200 (CEST)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJaW-00084P-Ti
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItO-0008Qt-KV
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000uO-4L
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g192so99734pfb.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkdZtWwj/8ggy1eq6EhClTwBg3K4IFRXh2vcItTXzCk=;
 b=Wxqldrguoqye5KOvfRW41fpSOsAovJ01QJAqjLSQ5W0o1NuHSVGGl2gMOoqvaXfmbE
 euQlIXEnJe5zvpewgWDA+gXI8SPVAdSeOaQY+5EQ9vETrmaazH8AXrDjMc52cwNdmkCN
 vlW/AbHrE2pqR6YSrpgd/FaNY90HQQ1jk15d4hiRuYR5giuVnDt8T+dMlPYsEcwgcweI
 j3q4IW4fTN14eL5mza7STLTlzw62TC1For/M75QFjLx4+EtzFZz1EUpscR6oA5s0Fj7G
 jXogDk8O1KUWzUVItZwBtVNw5XjsTmEc5zuGl9CcYjg9k9FGSQ3oX4urKh0RyIs+BN8A
 TXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkdZtWwj/8ggy1eq6EhClTwBg3K4IFRXh2vcItTXzCk=;
 b=a7jfmcPT2Zlia4UdzZNeihAGSsijqT97peSngneqjr9nJLEWQyo386NjUCJBYJRLLi
 Z5vQg0oYaj32uICNI255RVvn4czNpsKTcpLfp/tZujArD3kxqocov2LCcjOCmD5iD07N
 Cy6aUWZ4aHQNLUybBqgHIHqfzMeIjD6uCZA5RgcDGjzFIY6hp4YiKR3TTysBgWqb2y7l
 gMYhuwOsPXXHd8lBa/Mzy6mdN6aJ/imVfduv6L+PFp1TeB9iFeBbYoqYaaVtZqd5mOWY
 ZSudQVmD0oM5G2K4KAjtg3zX8DmRTIsqjk8N3/Hb+pXgNFyTzzSXJaIFKQPhq3YvRjoo
 z7pw==
X-Gm-Message-State: AOAM532U4+yix6p8iMNRvm/YhzYCtnHi/teIzvjrx+LuUaCjFx0PkJHa
 cIhnzwnYOWHYPT0kmoxnsftPjz9XPqFrww==
X-Google-Smtp-Source: ABdhPJyNpp+GLvXEGN3FM3WkA2vLcP4dwgu3H2wdo7OUypMgEqM2MeJ961VfzvworW5UdstjLDiKTg==
X-Received: by 2002:a63:fd0c:: with SMTP id d12mr22841592pgh.119.1624992913491; 
 Tue, 29 Jun 2021 11:55:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/63] tcg: Add tcg_gen_vec_add{sub}8_i32
Date: Tue, 29 Jun 2021 11:54:22 -0700
Message-Id: <20210629185455.3131172-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Implement tcg_gen_vec_add{sub}8_tl by adding corresponging i32 OP.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20210624105023.3852-3-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h |  6 ++++++
 tcg/tcg-op-gvec.c         | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 9b67822f54..2d5ad6ce12 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -402,14 +402,20 @@ void tcg_gen_vec_rotl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 
 /* 32-bit vector operations. */
+void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
+void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
 #if TARGET_LONG_BITS == 64
+#define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i64
+#define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
 #else
+#define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
+#define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
 #endif
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 7ddd56c0e6..6d9a0aed62 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1736,6 +1736,25 @@ void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_addv_mask(d, a, b, m);
 }
 
+void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+
+    tcg_gen_andc_i32(t1, a, m);
+    tcg_gen_andc_i32(t2, b, m);
+    tcg_gen_xor_i32(t3, a, b);
+    tcg_gen_add_i32(d, t1, t2);
+    tcg_gen_and_i32(t3, t3, m);
+    tcg_gen_xor_i32(d, d, t3);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
 void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
@@ -1900,6 +1919,25 @@ void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_subv_mask(d, a, b, m);
 }
 
+void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+
+    tcg_gen_or_i32(t1, a, m);
+    tcg_gen_andc_i32(t2, b, m);
+    tcg_gen_eqv_i32(t3, a, b);
+    tcg_gen_sub_i32(d, t1, t2);
+    tcg_gen_and_i32(t3, t3, m);
+    tcg_gen_xor_i32(d, d, t3);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
 void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
-- 
2.25.1


