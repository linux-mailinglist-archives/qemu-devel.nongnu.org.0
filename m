Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF26370D7C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:58:20 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDY3-0006Jy-Su
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKg-0001JC-S0
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKd-0005Bx-Ed
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:30 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so4271380pjn.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kR3P2xiX5PJwZxtiIf6JxRJdWTUQ+DfdDMSonfEfAUg=;
 b=MX0Zv/f7IamdUVDEBnJvwDR0xFXbdVNlex7n6TbBpdKUzeJkV3NNYfsqsrisGEn5bb
 GgTL+VUbkLc1z+JId1UxCtk67jzNRkm7Gg/Iwz19dnFQeH3nxBHkdYpT/QYPm+p/xN+C
 NCL7V0Zn8mg6/eyvJIUUVa77/2A9pfAm+1SrHqMB6CCqdi7f7CjPLGUQcKqD6DdD4gC7
 gzFPpCpvRgeGNgYI1sicAINHwa/YG61InDbzUWMWA8Y17wBrbdHhnPziUVUL8VNTNy6A
 FfQzKjrYyuBAUHMdzTlQIwDsdxeaPxcmOoFNJ/cKC347hOHokRA5x6b3okpktVcSAp7J
 ktDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kR3P2xiX5PJwZxtiIf6JxRJdWTUQ+DfdDMSonfEfAUg=;
 b=AfMb67j9au3aHf7z8q6Ha9P9cANKiqXhajKtKtsOox1nLHy8tOuteIaTUYaznPLZb1
 WL4Z4/ZIvQWU/OJwUIiRswjaxk6B+t4QfaDi2R9+2uxhQ1WkDsCNWQCBzBGJCwDKEacG
 T3K5Mb7yjOqcWr/TNzAwntqs3n+vMQhC0Q4q5vYOu4TrbvsPh+UzCnfmQgiyhkMtY9Sb
 0zdzjyjq0iPTDuLH+WlF5eJyn5CVL+pnPYa+mQ9z2snzoCZEpfZr36ZcwGeEo/IyE+iF
 cgKm/3qPZdPrbVVEdG1Wbg1MZRiM6pLbVCAyqHBBc6v0zco/NnEnfD7WRoRoIPSHoSqU
 6MOw==
X-Gm-Message-State: AOAM532lFPNX2reOIdI7jyjQ475Cjju/sWg4aVpY4VicrTrGbiLL3IPF
 psCRsTWVr6GRZj0qro6mPEZ2YJrCY4JSjg==
X-Google-Smtp-Source: ABdhPJyWzLCJm8qWW2XUNBBPlRzrYXJwYkZRfWF+dsLCJ6a46r51zTyDq4zW3MeC644U5ayOAS0DNg==
X-Received: by 2002:a17:902:edd5:b029:e9:7477:5f0a with SMTP id
 q21-20020a170902edd5b02900e974775f0amr15191535plk.81.1619966665275; 
 Sun, 02 May 2021 07:44:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/31] Hexagon (target/hexagon) cleanup
 gen_log_predicated_reg_write_pair
Date: Sun,  2 May 2021 07:43:55 -0700
Message-Id: <20210502144419.1659844-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Similar to previous cleanup of gen_log_predicated_reg_write

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-3-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 87f5d92994..07d970fc6c 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -69,36 +69,35 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
 static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
 {
     TCGv val32 = tcg_temp_new();
-    TCGv one = tcg_const_tl(1);
     TCGv zero = tcg_const_tl(0);
     TCGv slot_mask = tcg_temp_new();
 
     tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
     /* Low word */
     tcg_gen_extrl_i64_i32(val32, val);
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
-                       val32, hex_new_value[rnum]);
-#if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum],
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum],
                        slot_mask, zero,
-                       one, hex_reg_written[rnum]);
-#endif
-
+                       val32, hex_new_value[rnum]);
     /* High word */
     tcg_gen_extrh_i64_i32(val32, val);
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum + 1],
                        slot_mask, zero,
                        val32, hex_new_value[rnum + 1]);
 #if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum + 1],
-                       slot_mask, zero,
-                       one, hex_reg_written[rnum + 1]);
+    /*
+     * Do this so HELPER(debug_commit_end) will know
+     *
+     * Note that slot_mask indicates the value is not written
+     * (i.e., slot was cancelled), so we create a true/false value before
+     * or'ing with hex_reg_written[rnum].
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
+    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
+    tcg_gen_or_tl(hex_reg_written[rnum + 1], hex_reg_written[rnum + 1],
+                  slot_mask);
 #endif
 
     tcg_temp_free(val32);
-    tcg_temp_free(one);
     tcg_temp_free(zero);
     tcg_temp_free(slot_mask);
 }
-- 
2.25.1


