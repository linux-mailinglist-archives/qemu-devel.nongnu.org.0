Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D3370887
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:53:39 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcukE-0000FU-IK
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaV-0008Aa-52
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:35 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-0008Um-1x
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:34 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so3485360pjz.0
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhStDMuAAq22D0KTN861hUrYomJPu6B6dNcr8mKWQIs=;
 b=owtqfc7nUd+VJtrGrgo1olue5B09cfjQVTtDmHOCmMU6vuai0vaWe3zn0f92IgTagU
 J0RF3wXeh+FSXX1NmVV8Yr7yiXIqOBaY68mtIpLB59Xdn6IhW7c7N6R4KdQTrUM69Pp+
 Fc+7iWShkkUzS0TDaIB81RCMWbwATDX6A/2Hk/2kKe4VeYYn5Q2YQX//pT9MmNK3/n18
 mXOB2QxCtwUTE77Atit5nWhO5Xd/j5BFCHDdM/EtN4X61CpJCbVa3QYlUm5z+ujzqlPc
 Qr8CYGw75wp1m0Mnvpa5L0cjDq5Gk/DCjRrfwqI0NQC958gHFYUn4ShrtneOi4p1icMs
 vGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhStDMuAAq22D0KTN861hUrYomJPu6B6dNcr8mKWQIs=;
 b=oYY+IbtWGtuhuW1ELdLUQsXMHuCMnQ1USHcRKUHpv8WVfHYsVm4JSbSfZdwFLgnK0U
 JycMNLHi3a2uBG6RZHvx8BXkn/lriEO8qrjM+QguiJh3LollNfFI48aG6uQxKAFPlT0K
 20rGi1u6f1KrIl5ISHFCujQSiL+yyvKTR18HCW+6BAijEPxekLa+SiIMKZt/oMyQDdkY
 rUVDRRBjgY9nNNGH8cNrDjASQ5+oK94cHCzMm3ha3UYNqBNh2kX3B/XNcy8NQgIxSO20
 iauB3B0a+kIeBCrmFvnGCehoTCjAR+J3JtXir8TQTJ4roQixxJiTd1rIQFJzv9fgAftW
 fofA==
X-Gm-Message-State: AOAM530OQyhGu0yjUu9fSvJlGkaVod1QSX/gEajCb4aYCgnH5hP2p2ps
 FBKr0UKaBnPiClNGlZln2W53LEinLeNT+g==
X-Google-Smtp-Source: ABdhPJwf5ydhIq10wxpCOEfmhLHvQFp2eHnuQNouj9skdS3nHy0KIr0sM2XChk/+caVotW+lXTbuAQ==
X-Received: by 2002:a17:90a:4a0e:: with SMTP id
 e14mr22133456pjh.209.1619894609471; 
 Sat, 01 May 2021 11:43:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/31] Hexagon (target/hexagon) TCG generation cleanup
Date: Sat,  1 May 2021 11:42:59 -0700
Message-Id: <20210501184324.1338186-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Simplify TCG generation of hex_reg_written

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-2-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 7481f4c1dd..87f5d92994 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -35,7 +35,6 @@ static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
 
 static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
 {
-    TCGv one = tcg_const_tl(1);
     TCGv zero = tcg_const_tl(0);
     TCGv slot_mask = tcg_temp_new();
 
@@ -43,12 +42,17 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
                            val, hex_new_value[rnum]);
 #if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum], slot_mask, zero,
-                       one, hex_reg_written[rnum]);
+    /*
+     * Do this so HELPER(debug_commit_end) will know
+     *
+     * Note that slot_mask indicates the value is not written
+     * (i.e., slot was cancelled), so we create a true/false value before
+     * or'ing with hex_reg_written[rnum].
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
+    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
 #endif
 
-    tcg_temp_free(one);
     tcg_temp_free(zero);
     tcg_temp_free(slot_mask);
 }
-- 
2.25.1


