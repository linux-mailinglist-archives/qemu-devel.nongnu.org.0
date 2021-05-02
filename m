Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32D9370D85
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:01:01 +0200 (CEST)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDae-0000Gc-S4
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKj-0001Nm-3q
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKc-0005BD-H8
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id m37so1907492pgb.8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhStDMuAAq22D0KTN861hUrYomJPu6B6dNcr8mKWQIs=;
 b=fOMExgKvVk67cxEbEROIEIltCSQiZ3U7jrkxewue/gpPN8APeDBEWP/Gkd6F2vE0Qj
 bpQw/jcpCskf6uVWzzp6rkW+NWv6Qs1M/BcD7qnN05Fb5hgczk23HqAUImlE9FuSDZYd
 VliuYeasq0Wypo17vWwyYt+/bmJO7plgxn+rRvlIu3DogWzdXFnjXMmD/v3xT8D5/4D5
 pm7p2+h/bijFB47BLBn8kstm1baHkkZxh7l++4paq+wp2nnhjQ5so3biPLCqoCqiKpMx
 T7IhGeRdQMcBhjUMbDOASl32euX9kH6v3zOGXsRuR7ZHpEiawzXF4LFq0f2aQZzHwjLY
 UxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhStDMuAAq22D0KTN861hUrYomJPu6B6dNcr8mKWQIs=;
 b=W2jHwmUFJpmv4SZL186kVFAAONc9hITk9AYvfHDgXxRPk5AE2RZDIEzDb/ydn7e1Fk
 wbFPtRGxgax5YlRJI/M5GyFiymxHxRaCmPwtW7O/hh7mVNfkLq2A/xTJ+GXOVyVPhvjV
 6fA+gTFEezH9H597lWt4IoygeuAq+Gp4xYAE4HM6bm4jYIk4OMN/NETJtr4+1dl0thnO
 aECBh0gtHcN15koW68ajbyAUQeuS+7rRXj0zcuKnT5/+uEDaWcpMrbgtCYeEqmt8kKF5
 qS3PdutF+QpYq1x97q+0nbtQ4E6gSC8oirUdZbate4jkhdimZOUzLOvgUUporKEsZGeg
 a6HQ==
X-Gm-Message-State: AOAM530AsujV7EHvSdCi2xl4cQcz2ioZ1spV3VGlaCYpbTgqMo4/x00a
 AKK3euDMbCDLZ3Mha5I0J451vrWQ0Ez0Kw==
X-Google-Smtp-Source: ABdhPJyxu9kvFf30zb6Eeg0kEwzqufbHB8ZbPkkD40vdIJ07wAn/Wg1O2aEfSQzvZyD690KhFISzKw==
X-Received: by 2002:aa7:8001:0:b029:272:7347:9b58 with SMTP id
 j1-20020aa780010000b029027273479b58mr14665185pfi.1.1619966664769; 
 Sun, 02 May 2021 07:44:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/31] Hexagon (target/hexagon) TCG generation cleanup
Date: Sun,  2 May 2021 07:43:54 -0700
Message-Id: <20210502144419.1659844-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


