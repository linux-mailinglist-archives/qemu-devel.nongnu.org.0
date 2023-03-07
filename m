Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEC6AF0D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9c-0003bc-9a; Tue, 07 Mar 2023 13:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Y-0003Z7-OT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:12 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9W-0007jJ-Us
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:12 -0500
Received: by mail-pj1-x1029.google.com with SMTP id oj5so14116940pjb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBhN8QlUZ4nucIQSZUIgNxSQjC7OQ+YVg5SJgGHSvZs=;
 b=FNqYGCT694FjqclTICyJ8wdpIIai8xJg9D7/fmxJO7pauqGgZCb3v2rtfc85rMUjJX
 SOex4xQ9xidAXx9pWm27QH3m46DAgS/l9fW+504Ki/cpPpMkBmvkQ+VMncIF57b1gOfG
 OBlxnbHLAXL+p+ChVijVXdiNhVSz4GBTbcIky6KcWaRkSTKErMS08LV4Zp5OD8bad0dv
 KOOc1YEFU+0hSn1oz5Jbqe9/tjiFl15BN9+6A2Xq2YhLB4gdfjGCuBbAvfaPz9HAMG8v
 9Zow8MtL0Wvf+CqVZEdey5N9QmIXW8HoJMwpg0xyls8ZkzB+QQ+JYAdpb4iRDTXOvF5i
 /A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBhN8QlUZ4nucIQSZUIgNxSQjC7OQ+YVg5SJgGHSvZs=;
 b=zsskN1QEak5KsANXXG6I5KVCZdUYuWFLSnbVnW+oN4/COp6iHrXQMxMwWo0sssRNKr
 SGO8eGMaxLyB74PLOgqgcoLAmtaaC3F87Cev05gRAVifLO0TvUMEHQ9MasMp4U3E3Pwo
 mxKKFQ1XRUEs3JHO3XrORS+IWnFwi4kI2iSUhR4SbRslamSIlGFDS91scGLJIDipZr4D
 YVxJ3KQi0dVubnjCrAcEltvGe+FQqsY6UzCW8tkcc3aDNMLefN8XYTUDfgycIJW3N9CN
 mCG1JM/WnIA7Cbryz5lQg6k9NCR83IY+mQY7RVipV9BZzUgu2Pi6fby4tjHmGvxG3FVB
 6qJA==
X-Gm-Message-State: AO0yUKUIddGsYCVxABzkirYU+l4KjxVPfATpoiaY77s1jTDSyVa7tbe0
 YnbGjqnxJBJd3UGw/HYll7s9DZEK8BayNGRltwQ=
X-Google-Smtp-Source: AK7set+1nqfZjWfopgj3B+0Ev6vUoBWI7sXEWjFXj5Yq20+yu7Mgbg5eD0UE8IUegV4rOBMs3cQ8fA==
X-Received: by 2002:a17:90b:3885:b0:234:409:9754 with SMTP id
 mu5-20020a17090b388500b0023404099754mr16066674pjb.45.1678214109604; 
 Tue, 07 Mar 2023 10:35:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/25] target/arm: Avoid tcg_const_ptr in gen_sve_{ldr, str}
Date: Tue,  7 Mar 2023 10:34:45 -0800
Message-Id: <20230307183503.2512684-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

This hides the implicit initialization of a variable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 3ca60fb36b..92ab290106 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4206,8 +4206,9 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4284,8 +4285,9 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
-- 
2.34.1


