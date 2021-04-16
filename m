Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF91C36287B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:17:12 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTxn-0007yq-QH
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThi-0003hW-Ar
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:34 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThR-0004KF-Rl
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:33 -0400
Received: by mail-pf1-x431.google.com with SMTP id d124so18912077pfa.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FqQpeZX2hPehb5y76ZqDzt7hc+HNgslVIaYOGp2C88=;
 b=VYMlRlb9R+lOpaDUhAl9oTRyFpcqb9ok7Ddxa7eEr4DRVjxjskH/dA7evgvGytDWml
 6D6F2WqNSjK6MDxh6jIkXdncxg3SbI+/UUCEq2Gwa85Cmm3bTQ3Il6MdVTutLrH6xQHO
 OU2VhmO0ef5/DWehCPF8VDkAHbhpDloKt95iSebHL4L+IHPqywdmLEV76PbM1ZRn/Sf5
 YAW8e5mzmr1xaaBAFirmwMKGBM8AAOoQnxEz8pyB/ZY3o6RoYOGmS5dfg1BWsgF3PYWr
 ydTo49zGEsY3Xp6/XKsEGRl0vguR0eAuVzoA3Slspb6/Er9TU0AZ65nexFp+tF54frm6
 ByrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FqQpeZX2hPehb5y76ZqDzt7hc+HNgslVIaYOGp2C88=;
 b=qNvmc/qzAyJwxSsBTWhh92laRvJfJnVwf+SHcO2+oZli5Xxne5C+UcEauhkKuBpqmz
 x0Mk5vxbhjzg3q2Qzu9GFAVX2KQ9u4t2AxfsI2RX2dbixRhdSRmObtyubJhMghiMN2Nv
 UNHq6DC6PfGUfyjcSrooHItllSxq8CQBGdG2lXJpyiXRTByIr+8V2XSM/xKTJXdLjNmy
 uUQlWbSqMpIZSynbxRRZGeYmdJhyZEvAz71Ab3GZrNxO5/jLvj/ac4jRFfjTGTCi4ipF
 jsb78jcooW7g4dmzS6hF9hZk1NxRY/Ns3zsuO+2K/xw8l+jfFwsITRc/779fsFJcyE7E
 Jyxw==
X-Gm-Message-State: AOAM530NMAywUX54GcRauO+/cZVSHieZP7D+/Dpv0AMncknLKjwLHhxH
 1Q+nnrYgG/iwT+sNwG7Mm/11qMd+5kwTOA==
X-Google-Smtp-Source: ABdhPJw6o+yT6dVgaxnFJiJTeMxLviG7Y/kl6QxFi0P3KuCJ7yqOveStjt5bYufPAcThqYlDQ591hg==
X-Received: by 2002:a63:f715:: with SMTP id x21mr440994pgh.399.1618599612108; 
 Fri, 16 Apr 2021 12:00:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/30] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Fri, 16 Apr 2021 11:59:41 -0700
Message-Id: <20210416185959.1520974-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

This bug is not currently visible because all current
users of these two functions always pass MO_64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 91a19bc4f4..52b9ca502e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,7 +982,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -1001,7 +1001,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1


