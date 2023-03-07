Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3606AF0C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9d-0003cy-RM; Tue, 07 Mar 2023 13:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9b-0003bZ-Ks
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:15 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9a-0007kV-2X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:15 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y2so14128837pjg.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldBuLbcQb0n6Aye54OPPs45YCet33rD06BKJ9Zw2Tyk=;
 b=x4CbDx9e3bwqq5dgzKAMKuwnpKEblf0SM+wLi9Nj79OGd55r1r+/qta8as3XLEMsfs
 jXS3WjpT+00q0S7oPchyLYe4SMukUVINh7gI+5ALqkRj54142O3koo2qAcv2cghIvsrN
 KnZKCshF2CGyT+0N/476LSrFOCmLMQH+rsGfwx6HVI4lZlByb4Ld+okpWg4YEJQkMj/k
 NwP32wj8vZiEDaMOxmJ5jiLab9hToFNO0HZI3MjcC/+edxC+mbKyhGyOgkST3J+r67FB
 BIjSTbA9ZmVjm2tnwYlrQKa+VrxSnqI8H77Fa5aFH94w/wWEUkkV5muK3xSfeZZ1qdqs
 /VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldBuLbcQb0n6Aye54OPPs45YCet33rD06BKJ9Zw2Tyk=;
 b=c7NqFh5Lf+O/YKd/+Gh2p4uyy2oktuTe+EZAEbuAlSmgcN87lkhh2sQO5gGkqCg539
 JzbUjDw9rQCblquL1hujTMkHfZaJAGqF1p57rTSnjh2I045qLzUmc56ja5dOBlKl0aEg
 zXyxBtgwHuOKLgW+4xpBXgh6p8hl0UcuYk1MnZgJFfcBcw8B14IN0ytf4ItomzQlIUzK
 7qHDCasFMjktjK2vsd53rrCo0he1EtmdZhqNJhAKWjX9zkDstEiHrFNRb6pOBRRyvF2I
 yjSFaIr8wrI5U7WQrbs7VbYAWGJXTD7QwsZmbs5kH6JYZ8O1zuzPVwgbnzaulvmLD9Ep
 uN7w==
X-Gm-Message-State: AO0yUKVrlGNSOBe+0F893Yf+85SctU4pBnOFM0CuPQJShL+JlMME6uFG
 r9Xb6UL4ao447fLCrJjQCzqNyUGHPRJNhkq8pWo=
X-Google-Smtp-Source: AK7set9NZTiU+woSuOgh/oKAEAQwZiHCnmgNIGsfJZimEB2QjjzhKbQ5o2vVRu/jNENRrFaBUehwHw==
X-Received: by 2002:a17:90b:4b41:b0:234:f4a:8985 with SMTP id
 mi1-20020a17090b4b4100b002340f4a8985mr16506764pjb.15.1678214112817; 
 Tue, 07 Mar 2023 10:35:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/25] target/arm: Avoid tcg_const_ptr in handle_rev
Date: Tue,  7 Mar 2023 10:34:49 -0800
Message-Id: <20230307183503.2512684-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Here it is not trivial to notice first initialization, so explicitly
zero the temps.  Use an array for the output, rather than separate
tcg_rd/tcg_rd_hi variables.

Fixes a bug by adding a missing clear_vec_high.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 082a8b82dd..dff391bfe2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -12003,22 +12003,26 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
         int esize = 8 << size;
         int elements = dsize / esize;
         TCGv_i64 tcg_rn = tcg_temp_new_i64();
-        TCGv_i64 tcg_rd = tcg_const_i64(0);
-        TCGv_i64 tcg_rd_hi = tcg_const_i64(0);
+        TCGv_i64 tcg_rd[2];
+
+        for (i = 0; i < 2; i++) {
+            tcg_rd[i] = tcg_temp_new_i64();
+            tcg_gen_movi_i64(tcg_rd[i], 0);
+        }
 
         for (i = 0; i < elements; i++) {
             int e_rev = (i & 0xf) ^ revmask;
-            int off = e_rev * esize;
+            int w = (e_rev * esize) / 64;
+            int o = (e_rev * esize) % 64;
+
             read_vec_element(s, tcg_rn, rn, i, size);
-            if (off >= 64) {
-                tcg_gen_deposit_i64(tcg_rd_hi, tcg_rd_hi,
-                                    tcg_rn, off - 64, esize);
-            } else {
-                tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, off, esize);
-            }
+            tcg_gen_deposit_i64(tcg_rd[w], tcg_rd[w], tcg_rn, o, esize);
         }
-        write_vec_element(s, tcg_rd, rd, 0, MO_64);
-        write_vec_element(s, tcg_rd_hi, rd, 1, MO_64);
+
+        for (i = 0; i < 2; i++) {
+            write_vec_element(s, tcg_rd[i], rd, i, MO_64);
+        }
+        clear_vec_high(s, true, rd);
     }
 }
 
-- 
2.34.1


