Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C636370875
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:48:03 +0200 (CEST)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcueo-0001du-4h
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaX-0008Dj-Eu
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:37 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-0008Up-2p
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:37 -0400
Received: by mail-pf1-x429.google.com with SMTP id i13so1346802pfu.2
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kR3P2xiX5PJwZxtiIf6JxRJdWTUQ+DfdDMSonfEfAUg=;
 b=wbSLpiTY3QN2z05ySxIf5Zm+pppkC+x/eqrV4GpXlcamrv7wCuW3NIP+RRndqncGq7
 yTsdaX6/mAzoYCxXKj75a3N4yrO+n1lueUkkwp3hPHxg80UVI0cTIQZQ4+YYcIuaYSwr
 hXoZ78nQ8R0TVqFWI7JR/zsRog/pu9380cdvaVaLBs1s7me5HosSwU6XtVg6VGzgX0Fn
 d9Gpe92/74+3g4iO4yn5DXVhCm68J+vcAkZoDCregUxrQSWVvJnDVr5dMzDSESD8c1Kt
 ak0I9iCMpZWJVq5QuXCxqCPALf3v2yyLb5q8gZQ9DxOAH7vHIbMAXwYBBSxxrNRXfOoK
 /Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kR3P2xiX5PJwZxtiIf6JxRJdWTUQ+DfdDMSonfEfAUg=;
 b=KCVBsiNmD3q8rdwHss8IYMr0YI1wmTBjgbU8dvdxmxDaD1S1Mgr9LJ+uuD3G2IO0Xn
 3/x6s2Q5TCA+npPbFNqgvcb6pHQi3oO8DcImv2gn3MNe169wk+6vIjuPkuiWsVR1WZ3X
 Q6xXPVpLX+PofWCoNOiDlh9N1d4zjFCSRNf5cMIx01nZe5t/IMe2DAN7/9N6FGxHR2lZ
 5ivTv0qgdNjrkZZwRtPI20xox2OtGAGIN4olbgRopQECcrHxvCiIXt58QvvbbxgRfXZT
 SEcfR0+Nf9KFWwR8KeeS9PG6+TEmvlCPYl7wnHSFa2GlBhEenRdYm7KsOPecwg0MQ5co
 x4JQ==
X-Gm-Message-State: AOAM530l6C7w7OzPB0N0a+ZV0nosiA9Igk7v1AgcVfi4zyqwhcLxb8zF
 k5Z1qsc9ENwf3HS3UsuzWJayNWFsgDTgbQ==
X-Google-Smtp-Source: ABdhPJyN+PlRIo0Na/mSGH518hoH948BWGoUkLVkigrVJ3XeltWHgETgiKDVSxFHeagpNHtMDoL9rA==
X-Received: by 2002:a63:5458:: with SMTP id e24mr10420077pgm.170.1619894610080; 
 Sat, 01 May 2021 11:43:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/31] Hexagon (target/hexagon) cleanup
 gen_log_predicated_reg_write_pair
Date: Sat,  1 May 2021 11:43:00 -0700
Message-Id: <20210501184324.1338186-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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


