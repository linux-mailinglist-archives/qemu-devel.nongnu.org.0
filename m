Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0D4B1BFC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:12:14 +0100 (CET)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILPx-0006Bd-AN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:12:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo8-0005eL-Jq
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:08 -0500
Received: from [2607:f8b0:4864:20::434] (port=39462
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo0-0007T6-Bg
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:08 -0500
Received: by mail-pf1-x434.google.com with SMTP id r19so13491444pfh.6
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rj8W15BjEs983VZ+OaZ4835OoWsx8SmAf3ewHrqpkEo=;
 b=TYGBkuTpEYJeli4FLcOtfJkSRpNdSPHecF57q5No1deUH2XbzYRNhglHazkJm+0BAZ
 wSHa1sqOmv/of+zg8/5ZY2Mz/xs29rZ75vOYu8yMpO9SfQE6ENO4e+ZMkAXkwGRKkVrb
 TksolYlWJOjuRONHh4X0Rx3pWkaL/ad9w0vhb/oK5ug650y1AuQPyxJItmqFY9iAysHS
 Hypg6jMY22SkhqyXCtRKm6eXe9p9lNKyd8qRkT3hnsFOYCF/0st2Xudi3Rl5SD/O4RQd
 vaPyfjA+rA33wGN0PgUFgXxmFh5BeubeN602IeDkE4f6LGxcarDsgBfln+G8z+ouf2/z
 GqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rj8W15BjEs983VZ+OaZ4835OoWsx8SmAf3ewHrqpkEo=;
 b=MvHbi8C7BLjNL6zAA3FEVnzfsKGTGC/wvdK+6aChzN72NSwC5n7EEgmpLdolsocc6R
 /tjLYQ50t7nZsJn4wTBg+3XFcjkNTvQkY6vIUiTeeUAjoETTkxQFAY2YVDIPSI2JStbQ
 vBhMXrTxcHbxlUKbX4Ipn3nM1x/OL3vvJ/ehwylfBKoVfkASC1dHxMhnbKpfM1ZbJFn8
 ESdhxBzrPw9zE2ggerLxYA6vw2YnPXCdktmL1OmyoWsnkp2w3wFC8HAUahdlGn0ck7an
 UUpD67ZG8/XXJiNEOdMyWbXmS7JfWyz0hcGtlEaAq0FJ1Pl8qlX6IKwzQVetBnIm8+5x
 OHcA==
X-Gm-Message-State: AOAM5325eK7Fuin9XRyUqNrBaCtvFTqCg73Cz+Gh6XBPHLZ8LlKxHmle
 UlUdbag86ANzG0wRn+zQcZK7qyPB9OHEISJZ
X-Google-Smtp-Source: ABdhPJxL3rXi0+ZtDjCfp9Z0hTvJ7jlhiwy4Me0GI2Q8FYqbL76pwzJ3n0bKBZ3tJ5xW07zS0VUGGw==
X-Received: by 2002:a05:6a00:130a:: with SMTP id
 j10mr10176584pfu.32.1644543160704; 
 Thu, 10 Feb 2022 17:32:40 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/34] tcg/sparc: Use tcg_out_movi_imm13 in tcg_out_addsub2_i64
Date: Fri, 11 Feb 2022 12:30:51 +1100
Message-Id: <20220211013059.17994-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When BH is constant, it is constrained to 11 bits for use in MOVCC.
For the cases in which we must load the constant BH into a register,
we do not need the full logic of tcg_out_movi; we can use the simpler
function for emitting a 13 bit constant.

This eliminates the only case in which TCG_REG_T2 was passed to
tcg_out_movi, which will shortly become invalid.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 0c062c60eb..8d5992ef29 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -795,7 +795,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     if (use_vis3_instructions && !is_sub) {
         /* Note that ADDXC doesn't accept immediates.  */
         if (bhconst && bh != 0) {
-           tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh);
+           tcg_out_movi_imm13(s, TCG_REG_T2, bh);
            bh = TCG_REG_T2;
         }
         tcg_out_arith(s, rh, ah, bh, ARITH_ADDXC);
@@ -811,9 +811,13 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
 	    tcg_out_movcc(s, TCG_COND_GEU, MOVCC_XCC, rh, ah, 0);
 	}
     } else {
-        /* Otherwise adjust BH as if there is carry into T2 ... */
+        /*
+         * Otherwise adjust BH as if there is carry into T2.
+         * Note that constant BH is constrained to 11 bits for the MOVCC,
+         * so the adjustment fits 12 bits.
+         */
         if (bhconst) {
-            tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh + (is_sub ? -1 : 1));
+            tcg_out_movi_imm13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
         } else {
             tcg_out_arithi(s, TCG_REG_T2, bh, 1,
                            is_sub ? ARITH_SUB : ARITH_ADD);
-- 
2.25.1


